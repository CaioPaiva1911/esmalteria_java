<%@page import="model.Produtos"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.sql.*, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Lista de Produtos</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: gray">

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/listarproduto"
					class="nav-link">Produtos</a></li>
			</ul>
		</nav>
	</header>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Lista de Produtos</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/novo" class="btn btn-success">Adicionar novo produto
					</a>
			</div>
			<br>
			<table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">Código</th>
			      <th scope="col">Fabricante</th>
			      <th scope="col">Nome</th>
			      <th scope="col">Marca</th>
			      <th scope="col">Id Categoria</th>
			      <th scope="col">Descrição</th>
			      <th scope="col">Unidade medida</th>
			      <th scope="col">Peso</th>
			      <th scope="col">Cor</th>
			    </tr>
			  </thead>

				<tbody>
				
					<c:forEach var="produto" items="${listarProduto}">
						<tr>
							<td scope="row"><c:out value="${produto.idProduto}" /></td>
							<td scope="row"><c:out value="${produto.fabricante}" /></td>
							<td scope="row"><c:out value="${produto.nome}" /></td>
							<td scope="row"><c:out value="${produto.marca}" /></td>
							<td scope="row"><c:out value="${produto.idCategoria}" /></td>
							<td scope="row"><c:out value="${produto.descricao} " /></td>
							<td scope="row"><c:out value="${produto.unidadeMedida}" /></td>
							<td scope="row"><c:out value="${produto.peso}" /></td>
							<td scope="row"><c:out value="${produto.cor}" /></td>
							<td scope="row"><a href="editar?idProduto=<c:out value='${produto.idProduto}' />">Editar</a>
								 <a
								href="deletar?idProduto=<c:out value='${produto.idProduto}' />">Deletar</a></td>
						</tr>
					</c:forEach>
			
				</tbody>


			</table>
		</div>
	</div>

</body>
</html>