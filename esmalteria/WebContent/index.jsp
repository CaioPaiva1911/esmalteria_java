<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
Esta é a página home do sistema
 <div>Implementação do Projeto com Desing Patterns MVC</div>
 <a href="UsuarioCtrl?flag=adicionar"></a>

<div class="container">
	<form method="post" action="index.jsp">	
		<div class="form-group">
			<label for="txtnome">Nome</label>
			<input type="text" class="form-control" name="txtnome" id="txtnome" aria-describedby="Name">
			<label for="txtidade">Idade</label>
			<input type="text" class="form-control" name="txtidade" id="txtidade" aria-describedby="Idade">
		</div>
		<button type="submit" class="btn btn-primary">Enviar </button>
	</form>
	<p class="text-muted mt-4">	
	<%
		String nome = request.getParameter("txtnome");
		String idade = request.getParameter("txtidade");		
		out.println(nome + " " + idade);
	%>
	</p>	
</div>

</body>
</html>