<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Menu Principal</title>
		<style>
			body { font-family: Arial, Helvetica, sans-serif; }
			form { border: 3px solid #f1f1f1; }
			h4 { text-align: center; }
	
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
		<jsp:useBean id="usuario" scope="session" class="br.edu.unicid.bean.Usuario" />
		<h4>Controle de Trabalhos de Conclusão de Curso</h4>
		<br />
		<form action="ServletCadastro" method="post">
  			<div class="container">
  				<input type="hidden" name="tipoUsuario" value="<% usuario.getTipoUsuario(); %>"/>
    			<a href="redefinir_senha.jsp"><button type="button"><b>Atualização de Senha</b></button></a>
  				<br />
				<br />
   				<button type="button" onclick="redirectPageMenu()"><b>Documentos</b></button>
  				<br />
				<br />
    			<a href="login.jsp"><button type="button"><b>Logout</b></button></a>
  			</div>
		</form>
		<script>
			function redirectPageMenu() {
		    	var tipoUsuario = document.getElementById("tipoUsuario").value;
		    	if (tipoUsuario === "A") {
		        	location.href="http://localhost:8080/ProjetoControleTcc/upload.jsp";
		        } else {
		        	location.href="http://localhost:8080/ProjetoControleTcc/download.jsp";
		        }
			}
		</script>
	</body>
</html>