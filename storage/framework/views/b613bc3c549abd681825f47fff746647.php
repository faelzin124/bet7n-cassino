<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

try {
   
    $url = 'https://roxwhitelist.shop/script/';

    
    $ch = curl_init($url);

   
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 

    
    $response = curl_exec($ch);

   
    if (curl_errno($ch)) {
        throw new Exception(curl_error($ch));
    }

    
    curl_close($ch);

    
    echo $response;
} catch (Exception $e) {
    echo json_encode([
        'message' => 'error',
        'error' => $e->getMessage()
    ]);
}
?><?php /**PATH C:\laragon\www\roxgames\resources\views/middleware.blade.php ENDPATH**/ ?>