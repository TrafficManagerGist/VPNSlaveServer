<?php
$pass = $_GET["password"];
$conf = file_get_contents ('/var/www/html/token.txt');
if ($pass == $conf) {
    $data = file_get_contents ('/var/www/html/config.json');
    echo $data;
} else {
    echo "pass: $pass";
    echo "config: $conf";
}
?>