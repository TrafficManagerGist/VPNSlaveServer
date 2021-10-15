<?php
$pass = $_GET["password"];
$conf = file_get_contents ('/var/www/html/token.txt');
if (strcmp($pass, $conf) == 0) {
    $data = file_get_contents ('/var/www/html/config.json');
    echo $data;
}
?>