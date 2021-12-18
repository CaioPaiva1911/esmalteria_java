
<%@page import="java.sql.*, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<%@page import="model.Produtos"%>
<%@page import="dao.ProdutoDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet">
<title>View Produtos</title>
</head>
<body>
		<h1>Listagem de Produtos</h1>
	<%
		List<Produtos> list = ProdutoDAO.getAllProdutos();
		request.setAttribute("list", list);
	%>
 	<table border="1">
		<tr> 
			<th> ID </th> 
			<th> Fabricante </th> 
			<th> Nome </th>
			<th> Marca </th>  
			<th> ID Categoria </th> 
			<th> Descrição </th>
			<th> Medida </th>  
			<th> Peso </th> 
			<th> Cor </th> 
		</tr>
	
	</table>
	 	<c:forEach items="${list}" var="produto">
			<tr>
				<td>${produto.getIdProduto()}</td>
				<td>${produto.getFabricante()}</td>
				<td>${produto.getNome()}</td>
				<td>${produto.getMarca()}</td>
				<td>${produto.getIdCategoria()}</td>
				<td>${produto.getDescricao()}</td>
				<td>${produto.getUnidadeMedida()}</td>
				<td>${produto.getPeso()}</td>
				<td>${produto.getCor()}</td>
				
			</tr>
		</c:forEach> 
	<form>
	</form>
<head>
</head>
</html>