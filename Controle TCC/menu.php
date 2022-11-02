<?php

session_start();

if ($_SESSION['tipo_usuario'] == 'A') {
	header("Location: upload.html");
} else if ($_SESSION['tipo_usuario'] == 'O') {
	header("Location: download.php");
}

?>
