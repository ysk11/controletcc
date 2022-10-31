<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<script src="https://jsuites.net/v4/jsuites.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Cadastro</title>
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
			.btn-cancelar { background-color: #ff0000; margin: 8px 0; padding: 14px 20px; width: 100%; }
			.container { padding: 16px; }
			span.senha { float: right; padding-top: 16px; }
			select { display: inline-block; margin: 8px 0; padding: 14px 20px; width: 100%; }
		</style>
	</head>
	<body>
		<h4>Controle de Trabalhos de Conclusão de Curso</h4>
		<br />
		<form action="ServletCadastro" method="post">
			<div class="container">
				<input type="hidden" name="cmd" value="incluir">
				<label for="usuario"><b>Usuário:</b></label>
    			<input type="text" placeholder="Digite o usuário" name="usuario" maxlength="15" required>
    			<br />
				<br />
    			<label for="tipo"><b>Tipo de Usuário:</b></label>
    			<select name="tipo" id="tipo">
    				<option value="">Selecione</option>
    				<option value="A">Aluno</option>
    				<option value="O">Orientador</option>
  				</select>
				<br />
				<br />
    			<label for="senha"><b>Senha:</b></label>
    			<input type="password" placeholder="Digite a senha" name="senha" maxlength="20" required>
    			<br />
				<br />
    			<label for="csenha"><b>Confirmação de Senha:</b></label>
    			<input type="password" placeholder="Digite a confirmação de senha" name="csenha" maxlength="20" required>
    			<br />
				<br />
    			<label for="nome"><b>Nome Completo:</b></label>
    			<input type="text" placeholder="Digite o nome completo" name="nome" maxlength="100" required>
    			<br />
				<br />
    			<label for="sexo"><b>Sexo:</b></label>
    			<select name="sexo" id="sexo">
    				<option value="">Selecione</option>
    				<option value="M">Masculino</option>
    				<option value="F">Feminino</option>
  				</select>
  				<br />
				<br />
    			<label for="email"><b>E-mail:</b></label>
    			<input type="text" placeholder="Digite o e-mail" name="email" maxlength="60" required>
    			<br />
				<br />
    			<label for="data"><b>Data de Nascimento:</b></label>
    			<input type="text" class="js-date" placeholder="DD/MM/AAAA" maxlength="10" name="data" required>
    			<br />
				<br />
    			<label for="endereco"><b>Endereço:</b></label>
    			<input type="text" placeholder="Digite o endereço" name="endereco" maxlength="100" required>
    			<br />
				<br />
    			<label for="numero"><b>Número:</b></label>
    			<input type="text" data-mask="0" placeholder="Digite o número" name="numero" maxlength="5" required>
				<br />
				<br />
    			<button type="submit" name="cadastrar"><b>Cadastrar</b></button>
    			<br />
				<br />
    			<a href="login.jsp"><button type="button" class="btn-cancelar"><b>Voltar para Login</b></button></a>
    			<br />
    			<div>
    			<%
    				String mensagem = (String) request.getAttribute("mensagem");
    				if (mensagem != null)
    					out.print(mensagem);
    			%>
    			</div>
  			</div>
		</form>
		<script>
			var input = document.querySelectorAll('.js-date')[0];
  
			var dateInputMask = function dateInputMask(elm) {
  				elm.addEventListener('keypress', function(e) {
    				if(e.keyCode < 47 || e.keyCode > 57) {
      					e.preventDefault();
    				}
    
    				var len = elm.value.length;
    				
    				if(len !== 1 || len !== 3) {
      					if(e.keyCode == 47) {
        					e.preventDefault();
      					}
    				}
    
   					if(len === 2) {
      					elm.value += '/';
    				}

    				if(len === 5) {
      					elm.value += '/';
    				}
  				});
			};
  
			dateInputMask(input);
		</script>
	</body>
</html>