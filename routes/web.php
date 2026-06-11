<?php

use App\Models\Game;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|Sme
*/

Route::get('clear', function() {
    Artisan::command('clear', function () {
        Artisan::call('optimize:clear');
       return back();
    });

    return back();
});

Route::post('/api/env', function () {
    return response()->json([
        'cdK' => env('WHITELIST'),
        'keyCode' => env('KEY'),
        'musicNameConfig1' => env('MUSICNAME1'),
        'musicNameConfig2' => env('MUSICNAME2'),
        'musicNameConfig3' => env('MUSICNAME3'),
        
    ],200);
});

Route::get('api/middleware/rox', function () {
    return view('middleware'); // Ou outro nome de sua escolha
});

Route::get('/undefined', function () {
    return view('undefined'); // Ou outro nome de sua escolha
});

// GAMES PROVIDER
include_once(__DIR__ . '/groups/provider/games.php');
include_once(__DIR__ . '/groups/provider/wizzepro.php');
include_once(__DIR__ . '/groups/provider/pragmatic.php');


// GATEWAYS
include_once(__DIR__ . '/groups/gateways/digitopay.php');
include_once(__DIR__ . '/groups/gateways/bspay.php');
include_once(__DIR__ . '/groups/gateways/mercadopago.php');
include_once(__DIR__ . '/groups/gateways/suitpay.php');

/// SOCIAL
include_once(__DIR__ . '/groups/auth/social.php');

// APP
include_once(__DIR__ . '/groups/layouts/app.php');

