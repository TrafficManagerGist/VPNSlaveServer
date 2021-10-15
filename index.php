<?php
$pass = preg_replace('/\s+/', '', $_GET["password"]);
$conf = preg_replace('/\s+/', '', file_get_contents ('/var/www/html/token.txt'));
if ($pass == $conf) {
    $data = file_get_contents ('/var/www/html/config.json');
    echo $data;
}
?>