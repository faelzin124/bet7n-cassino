<?php

namespace App\Traits\Wizzepro;

use App\Models\WizzePro;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

trait WizzeProSMSTrait
{
    /**
     * Envia uma mensagem para um único número de WhatsApp via Wizze Pro SMS.
     *
     * @param string $recipient
     * @param string $message
     * @return array
     */
    public function sendWhatsAppMessage(string $recipient, string $message): array
    {
        // Log de início do envio
        Log::info('Iniciando envio de mensagem para WhatsApp.', [
            'recipient' => $recipient,
            'message' => $message
        ]);

        // Obtendo as credenciais da tabela WizzePro
        $wizzePro = WizzePro::first();

        // Verifica se o envio de mensagens está ativado
        if (!$wizzePro || $wizzePro->status == 0) {
            Log::warning('Envio de mensagens desativado ou credenciais WizzePro não encontradas.');

            return [
                'status' => 400,
                'message' => 'Envio de mensagens desativado!',
            ];
        }

        // Adicionando "+55" ao número de telefone, se necessário
        if (!preg_match('/^\+55/', $recipient)) {
            $recipient = '+55'.$recipient;
        }

        try {
            // Fazendo a requisição para enviar a mensagem via HTTPS
            $response = Http::asForm()->post('https://wizzepro.com.br/api/send/whatsapp', [
                'secret' => $wizzePro->wizzepro_secret,
                'account' => $wizzePro->wizzepro_account,
                'recipient' => $recipient,  // Número de telefone com "+55"
                'type' => 'text',
                'message' => $message,
            ]);

            $responseData = $response->json();

            // Log da resposta do WizzePro
            Log::info('Resposta do WizzePro para o envio da mensagem.', [
                'secret' => $wizzePro->wizzepro_secret,
                'account' => $wizzePro->wizzepro_account,
                'recipient' => $recipient,
                'message' => $message,
                'type' => 'text',
                'response' => $responseData
            ]);

            // Verificando se a resposta foi bem-sucedida
            if (isset($responseData['status']) && $responseData['status'] == 200) {
                return [
                    'status' => 200,
                    'message' => 'Mensagem enviada com sucesso!',
                ];
            } else {
                // Log de falha no envio
                Log::error('Falha no envio da mensagem via WizzePro.', [
                    'recipient' => $recipient,
                    'response' => $responseData
                ]);

                return [
                    'status' => $responseData['status'] ?? 500,
                    'message' => $responseData['message'] ?? 'Erro desconhecido no envio.',
                ];
            }

        } catch (\Exception $e) {
            // Log de erro em caso de falha na requisição
            Log::error('Erro ao tentar enviar mensagem via Wizze Pro.', [
                'error' => $e->getMessage(),
                'recipient' => $recipient
            ]);

            return [
                'status' => 500,
                'message' => 'Erro ao enviar mensagem: ' . $e->getMessage(),
            ];
        }
    }
}
