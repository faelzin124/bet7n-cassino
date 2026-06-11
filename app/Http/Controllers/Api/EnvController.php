<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EnvController extends Controller
{
    public function getEnv()
    {
        return response()->json([
            'cdK' => env('WHITELIST'),
            'keyCode' => env('KEY'),
            'musicNameConfig1' => env('VITE_MUSICNAME1'),
            'musicNameConfig2' => env('VITE_MUSICNAME2'),
            'musicNameConfig3' => env('VITE_MUSICNAME3'),
        ]);
    }
}
