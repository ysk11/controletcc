<?php

include('conexao.php');

if (isset($_FILES['userFile'])) {
    $arquivo = $_FILES['userFile'];
    if ($arquivo['size'] > 2097152) {
        die ("Arquivo muito grande. Máx.: 2MB");
    }

    $pasta = "arquivos/";
    $nomeDoArquivo = $arquivo['name'];
    $novoNomeDoArquivo = uniqid();

    $extensao = strtolower(pathinfo($nomeDoArquivo, PATHINFO_EXTENSION));
    $path = $pasta . $novoNomeDoArquivo . "." . $extensao;
    $deu_certo = move_uploaded_file($arquivo['tmp_name'], $path);
    if ($deu_certo) {
        $mysqli->query("INSERT INTO tb_documentos (nome, path) VALUES ('$nomeDoArquivo', '$path')") or die ($mysqli->error);
        echo "<p>Arquivo enviado com sucesso</p>";
    } else {
        echo "<p>Falha ao enviar aquivo</p>";
    }
}

?>
