<?php
if (strcmp($_GET["password"], file_get_contents ('/var/www/html/pass.txt'))) {
    $data = file_get_contents ('/var/www/html/config.json');
    echo $data;
}
?>