<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Envio de Documentos</title>
		<style>
			body { font-family: Arial, Helvetica, sans-serif; }
			h4 { text-align: center; }
		
			input[type=file] {
  				border: 1px solid #ccc;
  				box-sizing: border-box;
  				display: inline-block;
  				margin: 8px 0;
  				padding: 12px 20px;
  				width: 100%;
			}
		
        	button {
  				border: none;
  				cursor: pointer;
  				margin: 8px 0;
  				padding: 14px 20px;
  				width: 100%;
			}

			button:hover { opacity: 0.8; }
			.btn-enviar { background-color: #04AA6D; color: white; padding: 10px 18px; }
			.container { padding: 16px; border: 3px solid #f1f1f1; }
    	</style>
	</head>
	<body>
		<h4>Controle de Trabalhos de Conclusão de Curso</h4>
		<br />
		<form action="ServletCadastro" method="post" enctype="multipart/form-data">
			<div class="container">
				<input type="hidden" name="cmd" value="enviarArquivo">
				<label><b>Selecione um arquivo:</b></label>
				<br />
    			<input type="file" id="myFile" />
    			<br />
    			<br />
    			<button type="submit" class="btn-enviar"><b>Enviar</b></button>
			</div>
		</form>
	</body>
</html>