<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        'api/*',
        'digitopay',
        'digitopay/*',
        'suitpay/*',
        'vgames/*',
        'webhooks/*',
        'gitslotpark/*',
        'bspay',
        'bspay/*',
        'wizzepro/gold_api',
        'wizzepro/gold_api/*',
        'gold_api',
        'gold_api/*',
        'cron/*',
        'mercadopago/*',
        'mercadopago',
        'callback',
		'callback/*',
    ];
}
