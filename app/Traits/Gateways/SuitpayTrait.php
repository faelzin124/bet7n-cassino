<?php

namespace App\Traits\Gateways;

use App\Models\AffiliateHistory;
use App\Models\Deposit;
use App\Models\GamesKey;
use App\Models\Gateway;
use App\Models\Setting;
use App\Models\SuitPayPayment;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Notifications\NewDepositNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Core as Helper;

trait SuitpayTrait
{
    /**
     * @var $uri
     * @var $clienteId
     * @var $clienteSecret
     */
    protected static string $uri;
    protected static string $clienteId;
    protected static string $clienteSecret;

    /**
     * Generate Credentials
     * Metodo para gerar credenciais
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return void
     */
    private static function generateCredentials()
    {
        $setting = Gateway::first();
        if(!empty($setting)) {
            self::$uri = $setting->getAttributes()['suitpay_uri'] ?? '';
            self::$clienteId = $setting->getAttributes()['suitpay_cliente_id'] ?? '';
            self::$clienteSecret = $setting->getAttributes()['suitpay_cliente_secret'] ?? '';
        }
    }
    private static function generateAccessToken()
    {
        self::generateCredentials();

        $response = Http::post(self::$uri . '/api/auth/login', [
            'client_id' => self::$clienteId,
            'client_secret' => self::$clienteSecret,
        ]);

        if ($response->successful()) {
            $responseData = $response->json();
            \Log::info('Token gerado com sucesso: ' . $responseData['token']);
            return $responseData['token'];
        }

        \Log::error('Falha ao gerar o token: ' . $response->body());
        return null;
    }

    public static function requestQrcode($request)
    {
        $token = self::generateAccessToken();
        if (!$token) {
            return ['status' => false, 'message' => 'Falha ao gerar token de acesso'];
        }

        $rules = [
            'amount' => ['required'],
            'cpf'    => ['required', 'max:255'],
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $token,
            'Content-Type' => 'application/json',
        ])->post(self::$uri . '/api/payments/deposit', [
            'amount' => $request->amount,
            'external_id' => uniqid(),
            'clientCallbackUrl' => url('/suitpay/callback'),
            'payer' => [
                'name' => auth('api')->user()->name,
                'email' => auth('api')->user()->email,
                'document' => $request->cpf,
            ],
        ]);

        if ($response->successful()) {
            $responseData = $response->json();
            \Log::info('QRCode gerado com sucesso: ' . json_encode($responseData));

            self::generateTransaction($responseData['qrCodeResponse']['transactionId'], $request->amount, $request->accept_bonus);
            self::generateDeposit($responseData['qrCodeResponse']['transactionId'], $request->amount);

            return [
                'status' => true,
                'qrcode' => $responseData['qrCodeResponse']['qrcode'], // Base64 QR Code
            ];
        }

        \Log::error('Falha ao gerar QRCode: ' . $response->body());
        return ['status' => false];
    }


    /**
     * Consult Status Transaction
     * Consultar o status da transação
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     *
     * @param $request
     * @return \Illuminate\Http\JsonResponse
     */
    public static function consultStatusTransaction($request)
    {
        // Verifique se o campo 'idTransaction' está presente no request
        if (!isset($request->idTransaction) || empty($request->idTransaction)) {
            \Log::error('ID da transação não fornecido no request.');
            return response()->json([
                'status' => 'ERROR',
                'message' => 'ID da transação não fornecido'
            ], 400);
        }
    
        $idTransaction = $request->idTransaction;
    
        // Log para depuração
        \Log::info('Consultando status da transação:', ['idTransaction' => $idTransaction]);
    
        // Simule a consulta ao status da transação através da API externa
        // Dependendo da API usada, este código pode variar
        try {
            $apiResponse = self::callSuitpayApiToCheckTransactionStatus($idTransaction);
    
            if ($apiResponse['status'] === 'SUCCESS') {
                \Log::info('Transação encontrada e processada com sucesso:', ['idTransaction' => $idTransaction]);
    
                // Atualize o status da transação no banco de dados, por exemplo:
                // Supondo que você tenha uma tabela `transactions` para armazenar o status
                SuitPayPayment::where('transaction_id', $idTransaction)->update([
                    'status' => 1, // Transação bem-sucedida
                    'updated_at' => now()
                ]);
    
                return response()->json([
                    'status' => 'SUCCESS',
                    'message' => 'Transação processada com sucesso'
                ], 200);
            } elseif ($apiResponse['status'] === 'PENDING') {
                \Log::info('Transação ainda pendente:', ['idTransaction' => $idTransaction]);
    
                return response()->json([
                    'status' => 'PENDING',
                    'message' => 'Transação ainda pendente'
                ], 200);
            } else {
                \Log::error('Erro ao processar a transação:', ['idTransaction' => $idTransaction]);
    
                return response()->json([
                    'status' => 'ERROR',
                    'message' => 'Erro ao processar a transação'
                ], 400);
            }
        } catch (\Exception $e) {
            \Log::error('Erro ao consultar o status da transação:', [
                'idTransaction' => $idTransaction,
                'error' => $e->getMessage()
            ]);
    
            return response()->json([
                'status' => 'ERROR',
                'message' => 'Erro interno ao processar a transação'
            ], 500);
        }
    }
    
    /**
     * Método para simular a chamada à API externa que verifica o status da transação
     * Dependendo da sua integração, este método pode variar.
     */
    private static function callSuitpayApiToCheckTransactionStatus($idTransaction)
    {
        // Simule uma resposta da API com base no ID da transação
        // Isso é apenas um exemplo. Em um sistema real, você faria uma requisição HTTP para a API da SuitPay
        $apiResponse = [
            'idTransaction' => $idTransaction,
            'status' => 'SUCCESS' // ou 'PENDING', ou 'ERROR', dependendo do status real da transação
        ];
    
        return $apiResponse;
    }

    /**
     * @param $idTransaction
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return bool
     */
    public static function finalizePayment($idTransaction) : bool
    {
        $transaction = Transaction::where('payment_id', $idTransaction)->where('status', 0)->first();
        $setting = \Helper::getSetting();

        if(!empty($transaction)) {
            $user = User::find($transaction->user_id);

            $wallet = Wallet::where('user_id', $transaction->user_id)->first();
            if(!empty($wallet)) {

                /// verifica se é o primeiro deposito, verifica as transações, somente se for transações concluidas
                $checkTransactions = Transaction::where('user_id', $transaction->user_id)
                    ->where('status', 1)
                    ->count();

                if($checkTransactions == 0 || empty($checkTransactions)) {
                    if($transaction->accept_bonus) {
                        /// pagar o bonus
                        $bonus = Helper::porcentagem_xn($setting->initial_bonus, $transaction->price);
                        $wallet->increment('balance_bonus', $bonus);

                        if(!$setting->disable_rollover) {
                            $wallet->update(['balance_bonus_rollover' => $bonus * $setting->rollover]);
                        }
                    }
                }

                /// rollover deposito
                if($setting->disable_rollover == false) {
                    $wallet->increment('balance_deposit_rollover', ($transaction->price * intval($setting->rollover_deposit)));
                }

                /// acumular bonus
                Helper::payBonusVip($wallet, $transaction->price);

                /// quando tiver desativado o rollover, ele manda o dinheiro depositado direto pra carteira de saque
                if($setting->disable_rollover) {
                    $wallet->increment('balance_withdrawal', $transaction->price); /// carteira de saque
                }else{
                    $wallet->increment('balance', $transaction->price); /// carteira de jogos, não permite sacar
                }

                if($transaction->update(['status' => 1])) {
                    $deposit = Deposit::where('payment_id', $idTransaction)->where('status', 0)->first();
                    if(!empty($deposit)) {

                        /// fazer o deposito em cpa
                        $affHistoryCPA = AffiliateHistory::where('user_id', $user->id)
                            ->where('commission_type', 'cpa')
                            ->first();

                        \Log::info(json_encode($affHistoryCPA));
                        if(!empty($affHistoryCPA)) {
                            /// faz uma soma de depositos feitos pelo indicado
                            $affHistoryCPA->increment('deposited_amount', $transaction->price);

                            /// verifcia se já pode receber o cpa
                            $sponsorCpa = User::find($user->inviter);

                            \Log::info(json_encode($sponsorCpa));
                            /// verifica se foi pago ou não
                            if(!empty($sponsorCpa) && $affHistoryCPA->status == 'pendente') {
                                \Log::info('Deposited Amount: '.$affHistoryCPA->deposited_amount);
                                \Log::info('Affiliate Baseline: '.$sponsorCpa->affiliate_baseline);
                                \Log::info('Amount: '.$deposit->amount);

                                if($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_percentage_baseline || $deposit->amount >= $sponsorCpa->affiliate_percentage_baseline) {
                                    /// paga a % do valor depositado
                                    $commissionPercentage = ($transaction->price * $sponsorCpa->affiliate_percentage_cpa) / 100;
                                    $walletCpa = Wallet::where('user_id', $affHistoryCPA->inviter)->first();
                                    if(!empty($walletCpa)) {
                                        $walletCpa->increment('refer_rewards', $commissionPercentage); /// coloca a comissão
                                        $affHistoryCPA->update(['status' => 1, 'commission_paid' => $commissionPercentage]); /// desativa cpa
                                    }
                                } else if($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_baseline || $deposit->amount >= $sponsorCpa->affiliate_baseline) {
                                    /// paga o valor de CPA
                                    $walletCpa = Wallet::where('user_id', $affHistoryCPA->inviter)->first();
                                    if(!empty($walletCpa)) {
                                        $walletCpa->increment('refer_rewards', $sponsorCpa->affiliate_cpa); /// coloca a comissão
                                        $affHistoryCPA->update(['status' => 1, 'commission_paid' => $sponsorCpa->affiliate_cpa]); /// desativa cpa
                                    }
                                }
                            }
                        }

                        if($deposit->update(['status' => 1])) {
                            $admins = User::where('role_id', 0)->get();
                            foreach ($admins as $admin) {
                                $admin->notify(new NewDepositNotification($user->name, $transaction->price));
                            }

                            return true;
                        }
                        return false;
                    }
                    return false;
                }

                return false;
            }
            return false;
        }
        return false;
    }

    /**
     * @param $idTransaction
     * @param $amount
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return void
     */
    private static function generateDeposit($idTransaction, $amount)
    {
        $userId = auth('api')->user()->id;
        $wallet = Wallet::where('user_id', $userId)->first();

        Deposit::create([
            'payment_id'=> $idTransaction,
            'user_id'   => $userId,
            'amount'    => $amount,
            'type'      => 'pix',
            'currency'  => $wallet->currency,
            'symbol'    => $wallet->symbol,
            'status'    => 0
        ]);
    }

    /**
     * @param $idTransaction
     * @param $amount
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return void
     */
    private static function generateTransaction($idTransaction, $amount, $accept_bonus)
    {
        $setting = \Helper::getSetting();
    
        $transaction = Transaction::create([
            'payment_id' => $idTransaction,
            'user_id' => auth('api')->user()->id,
            'payment_method' => 'pix',
            'price' => $amount,
            'currency' => $setting->currency_code,
            'accept_bonus' => $accept_bonus,
            'status' => 0
        ]);
    
        \Log::info('Transação gerada: ' . json_encode($transaction));
        return $transaction;
    }


    /**
     * @param $request
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return \Illuminate\Http\JsonResponse|void
     */
    public static function pixCashOut(array $array): bool
    {
        $token = self::generateAccessToken();
        if (!$token) {
            return false;
        }

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $token,
            'Content-Type' => 'application/json',
        ])->post(self::$uri . '/api/withdrawals/withdraw', [
            'amount' => $array['amount'],
            'external_id' => uniqid(),
            'pix_key' => $array['pix_key'],
            'key_type' => self::FormatPixTypeSuitmoney($array['pix_type']),
            'name' => "",
            'taxId' => "",
            'description' => 'Withdrawal request',
            'clientCallbackUrl' => url('/suitpay/payment')
        ]);

        if ($response->successful()) {
            $responseData = $response->json();

            if ($responseData['withdrawal']['status'] === 'COMPLETED') {
                $suitPayPayment = SuitPayPayment::lockForUpdate()->find($array['suitpayment_id']);
                if (!empty($suitPayPayment)) {
                    $suitPayPayment->update([
                        'status' => 1,
                        'payment_id' => $responseData['withdrawal']['transaction_id'],
                    ]);
                    return true;
                }
            }
        }

        \Log::error('Falha no saque PIX: ' . $response->body());
        return false;
    }
    private static function FormatPixTypeSuitmoney($type)
    {
        switch ($type) {
            case 'email':
                return 'EMAIL';
            case 'document':
                return 'CPF';
            case 'document':
                return 'CNPJ';
            case 'randomKey':
                return 'EVP';
            case 'phoneNumber':
                return 'PHONE';
        }
    }
}

