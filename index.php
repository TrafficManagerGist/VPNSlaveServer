<?php
if ($_GET["password"] == "lz9zsh6823tbuhsf7b0235zsd0sevd7") {
    $data = file_get_contents ('/var/www/html/config.json');
    echo $data;
}
?>