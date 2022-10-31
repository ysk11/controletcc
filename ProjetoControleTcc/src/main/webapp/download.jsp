<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.Documento" %>

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
		<form action="ServletCadastro" method="post">
			<div class="container">
				<input type="hidden" name="cmd" value="baixarArquivo">
				<table border="1">
					<thead>
						<tr>
							<th>#</th>
							<th>Nome</th>
							<th>Data</th>
						</tr>
					</thead>
					<tbody>
					<%
          				SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
                		List <Documento> lista = new ArrayList<Documento>();
                		lista = (ArrayList) request.getAttribute("documentosList");
                		for(Documento d: lista) { %>
						<tr>
							<td><%=d.getId()%></td>
							<td><%=d.getNome()%></td>
							<td><%=data.format(d.getDataDocumento())%></td>
							<td><button type="submit" class="btn-baixar"><b>Baixar</b></button></td>
						</tr>
            			<%
                		}
          				%>
					</tbody>
				</table>
			</div>
		</form>
	</body>
</html>