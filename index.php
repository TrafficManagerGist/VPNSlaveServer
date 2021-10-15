<?php
$pass = str_replace(' ', $_GET["password"]);
$conf = str_replace(' ', file_get_contents ('/var/www/html/token.txt'));
if ($pass == $conf) {
    $data = file_get_contents ('/var/www/html/config.json');
    echo $data;
}
?>