<?php

include('conexao.php');

$sql_query = $mysqli->query("SELECT * FROM tb_documentos") or die ($mysqli->error);

?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Seleção de Documentos</title>
		<style>
			body { font-family: Arial, Helvetica, sans-serif; }
			h4 { text-align: center; }
			
			table {
				margin-left: auto;
				margin-right: auto;
				width: 100%;
			}
			
			td, th { padding: 10px; text-align: center; }
			
			button {
  				border: none;
  				cursor: pointer;
  				margin: 8px 0;
  				padding: 14px 20px;
  				width: 100%;
			}

			button:hover { opacity: 0.8; }
			.btn-baixar { background-color: #04AA6D; color: white; padding: 10px 18px; }
			.container { padding: 16px; border: 3px solid #f1f1f1; }
    	</style>
	</head>
	<body>
		<h4>Controle de Trabalhos de Conclusão de Curso</h4>
		<br />
		<form action="" method="post">
			<div class="container">
				<table border="1" cellpadding="10">
					<thead>
						<tr>
							<th>#</th>
							<th>Nome</th>
							<th>Data</th>
						</tr>
					</thead>
					<tbody>
					<?php
					while ($arquivo = $sql_query->fetch_assoc()) {
        			?>
        			<tr>
            			<td><?php echo $arquivo['id']; ?></td>
            			<td><?php echo $arquivo['nome']; ?></td>
            			<td><?php echo $arquivo['data_inclusao']; ?></td>
            			<td><a href="<?php echo $arquivo['path']; ?>">Baixar</a></td>
        			</tr>
					<?php
					}
					?>
					</tbody>
				</table>
			</div>
		</form>
	</body>
</html>