<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\WizzePro; // Importar a classe WizzePro corretamente
use App\Models\SpinRuns;
use App\Models\Setting;
use App\Models\Wallet;
use App\Traits\Affiliates\AffiliateHistoryTrait;
use App\Traits\Wizzepro\WizzeProSMSTrait; // Importar o trait para envio de mensagens SMS/WhatsApp
use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Log;
use Telegram;

class AuthController extends Controller
{
    use AffiliateHistoryTrait, WizzeProSMSTrait; 

    public function __construct()
    {
        $this->middleware('auth.jwt', ['except' => ['login', 'register', 'submitForgetPassword', 'submitResetPassword']]);
    }

    public function verify()
    {
        return response()->json(auth('api')->user());
    }

    public function login()
    {
        try {
            $credentials = request(['phone', 'password']);

            if (!$token = auth('api')->attempt($credentials)) {
                return response()->json(['error' => trans('Check credentials')], 400);
            }

            return $this->respondWithToken($token);
        } catch (JWTException $e) {
            return response()->json([
                'error' => 'Could not create token'
            ], 400);
        }
    }

    public function register(Request $request)
    {
        try {
            $setting = \Helper::getSetting();
    
            $rules = [
                'name' => 'required|string',
                'email' => 'required|email|unique:users',
                'password' => ['required', 'confirmed', Rules\Password::min(6)],
                'phone' => 'required',
                'term_a' => 'required',
                'agreement' => 'required',
            ];
    
            $validator = \Validator::make($request->all(), $rules);
    
            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }
    
            // Preparar os dados do usuário para inserção
            $userData = $request->only(['name', 'password', 'email', 'phone', 'cpf']);
            $userData['phone'] = \Helper::soNumero($userData['phone']);
            $userData['affiliate_revenue_share'] = $setting->revshare_percentage;
            $userData['affiliate_cpa'] = $setting->cpa_value;
            $userData['affiliate_baseline'] = $setting->cpa_baseline;
            $userData['affiliate_percentage_cpa'] = $setting->cpa_percentage;
            $userData['affiliate_percentage_baseline'] = $setting->cpa_percentage_baseline;
            $userData['affiliate_bau_baseline'] = $setting->trunk_baseline;
            $userData['affiliate_bau_value'] = $setting->trunk_valor;
            $userData['affiliate_bau_aposta'] = $setting->trunk_aposta;
    
            // Criar o novo usuário
            if ($user = User::create($userData)) {
                // Verificar o código de referência
                if (isset($request->reference_code) && !empty($request->reference_code)) {
                    $checkAffiliate = User::where('inviter_code', $request->reference_code)->first();
                    if (!empty($checkAffiliate)) {
                        if ($checkAffiliate->affiliate_revenue_share > 0 || $checkAffiliate->affiliate_cpa > 0) {
                            $user->update(['inviter' => $checkAffiliate->id]);
                            self::saveAffiliateHistory($user);
                        }
                    }
                }
    
                // Enviar uma mensagem de boas-vindas via WhatsApp
                $this->sendWelcomeMessage($user);
    
                // Se o token de spin estiver presente, aplicar o bônus
                if ($setting->disable_spin && !empty($request->spin_token)) {
                    try {
                        $str = base64_decode($request->spin_token);
                        $obj = json_decode($str);
    
                        $spin_run = SpinRuns::where([
                            'key' => $obj->signature,
                            'nonce' => $obj->nonce
                        ])->first();
    
                        $data = $spin_run->prize;
                        $obj = json_decode($data);
                        $value = $obj->value;
    
                        Wallet::where('user_id', $user->id)->increment('balance_bonus', $value);
                    } catch (\Exception $e) {
                        return response()->json(['error' => $e->getMessage()], 400);
                    }
                }
    
                // Enviar a mensagem para o Telegram
                Telegram::sendFormattedMessage($user->name, $user->email, $user->phone);
    
                // Realizar o login automaticamente
                $credentials = $request->only(['email', 'password']);
                $token = auth('api')->attempt($credentials);
                if (!$token) {
                    return response()->json(['error' => 'Unauthorized'], 401);
                }
    
                return $this->respondWithToken($token);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
    
    /**
     * Enviar uma mensagem de boas-vindas via WhatsApp
     *
     * @param User $user
     * @return void
     */
    protected function sendWelcomeMessage(User $user)
    {
        // Verificar se o número de telefone do usuário está disponível
        if ($user && $user->phone) {
            $phoneNumber = $user->phone;
    
            // Buscar a mensagem de boas-vindas personalizada na coluna message_register da tabela WizzePro
            $wizzePro = WizzePro::first();
            $welcomeMessage = $wizzePro->message_register ?? "Bem-vindo(a) ao nosso sistema, {name}!";
            
            // Substituir o placeholder {name} pelo nome do usuário
            $welcomeMessage = str_replace('{name}', $user->name, $welcomeMessage);
    
            // Enviar a mensagem via WhatsApp
            $this->sendWhatsAppMessage($phoneNumber, $welcomeMessage);
        }
    }

    public function me()
    {
        return response()->json(auth('api')->user());
    }

    public function logout()
    {
        auth('api')->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }

    public function submitForgetPassword(Request $request)
    {
        // Validação para garantir que o e-mail exista
        $request->validate([
            'email' => 'required|email|exists:users',
        ]);
    
        // Gerar um token aleatório de 5 caracteres
        $token = Str::random(5);
    
        // Verificar se já existe um token para este e-mail e removê-lo
        $psr = DB::table('password_reset_tokens')->where('email', $request->email)->first();
        if (!empty($psr)) {
            DB::table('password_reset_tokens')->where('email', $request->email)->delete();
        }
    
        // Inserir o novo token na tabela de redefinição de senha
        DB::table('password_reset_tokens')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now()
        ]);
    
        // Gerar o link de redefinição de senha
        $resetLink = url('/reset-password/' . $token);
    
        // Enviar o e-mail de redefinição de senha com o link gerado
        \Mail::send('emails.forget-password', ['token' => $token, 'resetLink' => $resetLink], function ($message) use ($request) {
            $message->to($request->email);
            $message->subject('Redefinição de Senha');
        });
    
        // Buscar o usuário pelo e-mail
        $user = User::where('email', $request->email)->first();
    
        // Se o usuário tiver um número de telefone, enviar a mensagem via WhatsApp
        if ($user && $user->phone) {
            $phoneNumber = $user->phone;
    
            // Buscar a mensagem personalizada da coluna reset_password na tabela WizzePro
            $wizzePro = WizzePro::first();
            $resetPasswordMessage = $wizzePro->reset_password ?? "Seu código de redefinição de senha é {token}. Acesse o link: {resetLink}.";
    
            // Substituir os placeholders {token} e {resetLink} pelos valores reais
            $resetPasswordMessage = str_replace(['{token}', '{resetLink}'], [$token, $resetLink], $resetPasswordMessage);
    
            // Enviar a mensagem via WhatsApp
            $this->sendWhatsAppMessage($phoneNumber, $resetPasswordMessage);
        }
    
        return response()->json(['status' => true, 'message' => 'Enviamos o link de redefinição de senha para seu e-mail e WhatsApp!'], 200);
    }


    public function submitResetPassword(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email|exists:users',
                'password' => 'required|string|min:6|confirmed',
                'password_confirmation' => 'required',
                'token' => 'required',
            ]);

            $checkToken = DB::table('password_reset_tokens')->where('token', $request->token)->first();
            if (!empty($checkToken)) {
                $user = User::where('email', $request->email)->first();
                if (!empty($user)) {
                    if ($user->update(['password' => $request->password])) {
                        DB::table('password_reset_tokens')->where(['email' => $request->email])->delete();
                        return response()->json(['status' => true, 'message' => 'Your password has been changed!'], 200);
                    } else {
                        return response()->json(['error' => 'Erro ao atualizar senha'], 400);
                    }
                } else {
                    return response()->json(['error' => 'Email não é valido!'], 400);
                }
            }

            return response()->json(['error' => 'Token não é valido!'], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }

    protected function respondWithToken(string $token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'user' => auth('api')->user(),
            'expires_in' => time() + 1
        ]);
    }
}
