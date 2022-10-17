<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Alteração de Senha</title>
		<style>
			body { font-family: Arial, Helvetica, sans-serif; }
			form { border: 3px solid #f1f1f1; }
			h4 { text-align: center; }
			
			input[type=password] {
  				border: 1px solid #ccc;
  				box-sizing: border-box;
  				display: inline-block;
  				margin: 8px 0;
  				padding: 12px 20px;
  				width: 100%;
			}

			button {
  				background-color: #04AA6D;
  				border: none;
  				color: white;
  				cursor: pointer;
  				margin: 8px 0;
  				padding: 14px 20px;
  				width: 100%;
			}

			button:hover { opacity: 0.20; }
			.container { padding: 16px; }
		</style>
	</head>
	<body>
		<h4>Controle de Trabalhos de Conclusão de Curso</h4>
		<br />
		<form action="/action_page.php" method="post">

  			<div class="container">
    			<label for="nsenha"><b>Nova senha:</b></label>
    			<input type="password" placeholder="Digite a nova senha" name="nsenha" required>
				<br />
				<br />
    			<label for="csenha"><b>Confirme sua nova senha:</b></label>
    			<input type="password" placeholder="Digite a confirmação da nova senha" name="csenha" required>
				<br />
				<br />
    			<button type="submit"><b>Alterar Senha</b></button>
  			</div>

  			<div class="container">
    			<button type="button"><b>Cancelar</b></button>
  			</div>
		</form>
	</body>
</html>