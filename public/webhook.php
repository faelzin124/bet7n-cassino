<?php
// Define o arquivo de log onde os dados do webhook serão salvos (para fins de depuração)
$logFile = 'webhook.log';

// Verifica se a requisição é do tipo POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtém os dados JSON enviados pelo webhook
    $input = file_get_contents('php://input');
    
    // Tenta decodificar os dados JSON recebidos
    $data = json_decode($input, true);
    
    // Verifica se os dados foram decodificados corretamente
    if (json_last_error() === JSON_ERROR_NONE) {
        // Exemplo de como salvar o log (pode ser substituído pelo processamento real dos dados)
        file_put_contents($logFile, date('Y-m-d H:i:s') . " - Recebido: " . print_r($data, true) . "\n", FILE_APPEND);
        
        // Resposta ao webhook (pode ser personalizada conforme o serviço de origem)
        http_response_code(200);
        echo json_encode(['status' => 'success', 'message' => 'Dados recebidos com sucesso.']);
    } else {
        // Erro ao processar o JSON recebido
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'JSON inválido.']);
    }
} else {
    // Caso não seja uma requisição POST, retorna erro 405 (Método não permitido)
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Método não permitido. Apenas POST é aceito.']);
}
?>
