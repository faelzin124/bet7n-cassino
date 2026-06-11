<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WizzePro extends Model
{
    use HasFactory;

    // Definindo a tabela associada ao modelo
    protected $table = 'wizzepro';

    // Definindo os campos que podem ser preenchidos
    protected $fillable = [
        'wizzepro_account',
        'wizzepro_secret',
        'status',
        'qrcode_message',
        'payment_message',
        'reset_password',
        'message_register',
    ];

    // Definindo valores padrão para alguns campos, se necessário
    protected $attributes = [
        'status' => 1, // Ativa por padrão
    ];

    // Se precisar de casts, adicione-os aqui
    protected $casts = [
        'status' => 'boolean',
    ];
}
