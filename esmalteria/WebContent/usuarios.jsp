<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Usuários</title>
</head>
<body>
	<h1>Usuários</h1>
<%
	String nomeUsuario = (String) session.getAttribute("nomeUsuario");
	out.print(nomeUsuario);
	
	if(nomeUsuario == null){
		response.sendRedirect("login.jsp");
	}

	
%>

	<a href="logout.jsp">Sair</a>
	
</body>
</html>