<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
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
		<div class="container">
			<table border="1">
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th>Data</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>documento_1</td>
						<td>03/10/2022 23:22:15</td>
						<td><button type="button" class="btn-baixar"><b>Baixar</b></button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>documento_2</td>
						<td>10/10/2022 16:35:49</td>
						<td><button type="button" class="btn-baixar"><b>Baixar</b></button></td>
					</tr>
					<tr>
						<td>3</td>
						<td>documento_3</td>
						<td>17/10/2022 10:55:36</td>
						<td><button type="button" class="btn-baixar"><b>Baixar</b></button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>