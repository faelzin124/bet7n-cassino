<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Controller;
use App\Models\AffiliateWithdraw;
use App\Models\SuitPayPayment;
use App\Models\Wallet;
use App\Models\Withdrawal;
use App\Traits\Gateways\SuitpayTrait;
use Filament\Notifications\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
class SuitPayController extends Controller
{
    use SuitpayTrait;


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackMethodPayment(Request $request)
    {
        $data = $request->all();
        \DB::table('debug')->insert(['text' => json_encode($request->all())]);

        return response()->json([], 200);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|void
     */
    public function callbackMethod(Request $request)
{
    $data = $request->all();

    // Log dos dados recebidos
    \Log::info('Callback received', ['data' => $data]);

    try {
        // Verifica se 'transaction_id' e 'status' estão presentes
        if (!isset($data['transaction_id'])) {
            \Log::error('Transaction ID not provided in the request');
            return response()->json(['message' => 'Transaction ID is required'], 400);
        }

        if (!isset($data['status'])) {
            \Log::error('Status not provided in the request');
            return response()->json(['message' => 'Status is required'], 400);
        }

        \Log::info('Transaction ID and status are present', [
            'transaction_id' => $data['transaction_id'],
            'status' => $data['status'],
        ]);

        // Verifica se o status é COMPLETED
        if ($data['status'] === "COMPLETED") {
            \Log::info('Status is COMPLETED', [
                'transaction_id' => $data['transaction_id'],
            ]);

            // Tenta finalizar o pagamento
            if (self::finalizePayment($data['transaction_id'])) {
                \Log::info('Payment finalized successfully', [
                    'transaction_id' => $data['transaction_id'],
                ]);
                return response()->json(['message' => 'Payment completed successfully'], 200);
            } else {
                \Log::warning('Payment finalization failed', [
                    'transaction_id' => $data['transaction_id'],
                ]);
                return response()->json(['message' => 'Failed to finalize payment'], 500);
            }
        } else {
            \Log::warning('Invalid status', [
                'status' => $data['status'],
            ]);
            return response()->json(['message' => 'Invalid status'], 400);
        }
    } catch (\Exception $e) {
        // Log de erro caso algo inesperado aconteça
        \Log::error('Error in callbackMethod', [
            'exception' => $e->getMessage(),
            'trace' => $e->getTraceAsString(),
        ]);
        return response()->json(['message' => 'Internal server error'], 500);
    }
}




    /**
     * @param Request $request
     * @return null
     */
    public function getQRCodePix(Request $request)
    {
        return self::requestQrcode($request);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function consultStatusTransactionPix(Request $request)
    {
        return self::consultStatusTransaction($request);
    }

    /**
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|void
     */
    public function confirmWithdrawalUser($id)
    {
        $withdrawal = Withdrawal::find($id);
        if(!empty($withdrawal)) {
            $suitpayment = SuitPayPayment::create([
                'withdrawal_id' => $withdrawal->id,
                'user_id'       => $withdrawal->user_id,
                'pix_key'       => $withdrawal->pix_key,
                'pix_type'      => $withdrawal->pix_type,
                'amount'        => $withdrawal->amount,
                'observation'   => 'suitpay',
            ]);

            if($suitpayment) {
                $parm = [
                    'pix_key'           => $withdrawal->pix_key,
                    'pix_type'          => $withdrawal->pix_type,
                    'amount'            => $withdrawal->amount,
                    'suitpayment_id'    => $suitpayment->id
                ];

                $resp = self::pixCashOut($parm);

                if($resp) {
                    $withdrawal->update(['status' => 1]);
                    Notification::make()
                        ->title('Saque solicitado')
                        ->body('Saque solicitado com sucesso')
                        ->success()
                        ->send();

                    return back();
                }else{
                    Notification::make()
                        ->title('Erro no saque')
                        ->body('Erro ao solicitar o saque')
                        ->danger()
                        ->send();

                    return back();
                }
            }
        }
    }

    /**
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|void
     */
    public function confirmWithdrawalAffiliate($id)
    {
        $withdrawal = AffiliateWithdraw::find($id);

        if(!empty($withdrawal)) {
            $suitpayment = SuitPayPayment::create([
                'withdrawal_id' => $withdrawal->id,
                'user_id'       => $withdrawal->user_id,
                'pix_key'       => $withdrawal->pix_key,
                'pix_type'      => $withdrawal->pix_type,
                'amount'        => $withdrawal->amount,
                'observation'   => 'suitpay',
            ]);

            if($suitpayment) {
                $parm = [
                    'pix_key'           => $withdrawal->pix_key,
                    'pix_type'          => $withdrawal->pix_type,
                    'amount'            => $withdrawal->amount,
                    'suitpayment_id'    => $suitpayment->id
                ];

                $resp = self::pixCashOut($parm);

                if($resp) {
                    $withdrawal->update(['status' => 1]);
                    Notification::make()
                        ->title('Saque solicitado')
                        ->body('Saque solicitado com sucesso')
                        ->success()
                        ->send();

                    return back();
                }else{
                    Notification::make()
                        ->title('Erro no saque')
                        ->body('Erro ao solicitar o saque')
                        ->danger()
                        ->send();

                    return back();
                }
            }
        }
    }

    /**
     * Display the specified resource.
     */
    public function withdrawalFromModal($id, $action)
    {
        if($action == 'user') {
            return $this->confirmWithdrawalUser($id);
        }

        if($action == 'affiliate') {
            return $this->confirmWithdrawalAffiliate($id);
        }


    }

    /**
     * Cancel Withdrawal
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function cancelWithdrawalFromModal($id, $action)
    {
        if($action == 'user') {
            return $this->cancelWithdrawalUser($id);
        }

        if($action == 'affiliate') {
            return $this->cancelWithdrawalAffiliate($id);
        }
    }

    /**
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    private function cancelWithdrawalAffiliate($id)
    {
        $withdrawal = AffiliateWithdraw::find($id);
        if(!empty($withdrawal)) {
            $wallet = Wallet::where('user_id', $withdrawal->user_id)
                ->where('currency', $withdrawal->currency)
                ->first();

            if(!empty($wallet)) {
                $wallet->increment('refer_rewards', $withdrawal->amount);

                $withdrawal->update(['status' => 2]);
                Notification::make()
                    ->title('Saque cancelado')
                    ->body('Saque cancelado com sucesso')
                    ->success()
                    ->send();

                return back();
            }
            return back();
        }
        return back();
    }

    /**
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    private function cancelWithdrawalUser($id)
    {
        $withdrawal = Withdrawal::find($id);
        if(!empty($withdrawal)) {
            $wallet = Wallet::where('user_id', $withdrawal->user_id)
                ->where('currency', $withdrawal->currency)
                ->first();

            if(!empty($wallet)) {
                $wallet->increment('balance_withdrawal', $withdrawal->amount);

                $withdrawal->update(['status' => 2]);
                Notification::make()
                    ->title('Saque cancelado')
                    ->body('Saque cancelado com sucesso')
                    ->success()
                    ->send();

                return back();
            }
            return back();
        }
        return back();
    }
}
