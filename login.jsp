<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<style>
			body { font-family: Arial, Helvetica, sans-serif; }
			form { border: 3px solid #f1f1f1; }
			h4 { text-align: center; }

			input[type=text], input[type=password] {
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

			button:hover { opacity: 0.8; }

			.btn-cadastro {
  				background-color: #3366ff;
  				padding: 10px 18px;
  				width: auto;
			}

			.container { padding: 16px; }

			span.senha {
  				float: right;
  				padding-top: 16px;
			}
		</style>
	</head>
	<body>
		<h4>Controle de Trabalhos de Conclusão de Curso</h4>
		<br />
		<form action="/action_page.php" method="post">
			<div class="container">
				<label for="usuario"><b>Usuário:</b></label>
    			<input type="text" placeholder="Digite o usuário" name="usuario" required>
				<br />
				<br />
    			<label for="senha"><b>Senha:</b></label>
    			<input type="password" placeholder="Digite a senha" name="senha" required>
				<br />
				<br />
    			<button type="submit"><b>Login</b></button>
  			</div>
  		
  			<div class="container" style="background-color:#f1f1f1">
    			<button type="button" class="btn-cadastro"><b>Cadastre-se</b></button>
    			<span class="senha"><a href="#">Esqueceu a senha?</a></span>
  			</div>
		</form>
	</body>
</html>