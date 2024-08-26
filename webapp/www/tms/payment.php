<?php
define('USERNAME', 'parfimovich-api');
define('PASSWORD', 'usoru-T5');
define('GATEWAY_URL', 'https://abby.rbsuat.com/payment/rest/');
define('RETURN_URL', 'http://tms-apache.by');

if (!function_exists('curl_version')) {
        echo "Curl не установлен в PHP" . "\n";
        die();
};

$data = array(
        'userName' => USERNAME,
        'password' => PASSWORD,
        'orderNumber' => urlencode($_POST['orderNumber']),
        'amount' => urlencode($_POST['amount']),
        'returnUrl' => RETURN_URL
);
//echo http_build_query($data) . "\n";

$ch = curl_init();

$options = array(
        CURLOPT_URL => GATEWAY_URL . "register.do",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => http_build_query($data)
);

curl_setopt_array($ch, $options);


$response = curl_exec($ch);
$response = json_decode($response, true);

curl_close($ch);

if (isset($response['errorCode'])) {
        echo 'Error #' . $response['errorCode'] . ': ' . $response['errorMessage'];
        //header('Location: ' . RETURN_URL);
}
else {
        header('Location: ' . $response['formUrl']);
        die();
}
?>