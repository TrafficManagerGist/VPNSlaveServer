<?php
$data = file_get_contents ('/var/www/html/config.json');
$json = json_decode($data, true);
foreach ($json as $key => $value) {
    if (!is_array($value)) {
        echo $key . '=>' . $value . '<br/>';
    } else {
        foreach ($value as $key => $val) {
            echo $key . '=>' . $val . '<br/>';
        }
    }
}
?>