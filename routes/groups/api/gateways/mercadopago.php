<?php

use App\Http\Controllers\Gateway\MercadoPagoController;
use Illuminate\Support\Facades\Route;

Route::prefix('mercadopago')
    ->group(function () {
        Route::post('qrcode-pix', [MercadoPagoController::class, 'getQRCodePix']);
        Route::post('consult-status-transaction', [MercadoPagoController::class, 'consultStatusTransactionPix']);
    });



