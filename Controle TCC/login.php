<?php

include('conexao.php');

$usuario = $mysqli->real_escape_string($_POST['usuario']);
$senha = $mysqli->real_escape_string($_POST['senha']);

$sql_code = "SELECT tipo_usuario FROM tb_usuarios WHERE usuario = '$usuario' LIMIT 1";
$sql_query = $mysqli->query($sql_code) or die("Falha na execução do código SQL: ".$mysqli->error);

$quantidade = $sql_query->num_rows;

if ($quantidade == 1) {
	$row = $sql_query->fetch_assoc();
	$tipo_usuario = $row["tipo_usuario"];

	if (!isset($_SESSION)) {
		session_start();
	}

	$_SESSION['usuario'] = $usuario;
	$_SESSION['tipo_usuario'] = $tipo_usuario;

	header("Location: menu.html");
} else {
	echo "Falha ao logar! Usuário ou senha incorretos";
}

?>
