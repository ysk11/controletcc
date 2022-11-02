<?php

$login = 'root';
$senha = '';
$database = 'db_controletcc';
$host = 'localhost';

$mysqli = new mysqli($host, $login, $senha, $database);

if ($mysqli->error) {
    die ("Falha ao conectar ao banco de dados: ".$mysqli->error);
}

?>