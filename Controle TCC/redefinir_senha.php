<?php

session_start();

include('conexao.php');

$nsenha = $mysqli->real_escape_string($_POST['nsenha']);
$usuario = $_SESSION['usuario'];

$sql_code = "UPDATE tb_usuarios SET senha = '$nsenha' WHERE usuario = '$usuario'";
$sql_query = $mysqli->query($sql_code) or die("Falha na execução do código SQL: ".$mysqli->error);

echo "Senha atualizada com sucesso!";

?>
