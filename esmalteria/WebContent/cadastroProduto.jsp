
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
<title>Produtos</title>
</head>
<body>
<header>
 <nav class="navbar navbar-expand-lg navbar-dark  border-bottom shadow-sm mb-3" style= "background-color: black;">
		<div class="container">
	  		<a class="navbar-brand" href="">Esmalteria</a>
	 		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse">
	 			<span class="navbar-toggler-icon"></span>
 	</button>
 	
 	<div class="align-self-end">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a href="view/Index.jsp" class="nav-link text-white">Home</a>
						</li>
						<li class="nav-item">
							<a href="../listarProdutos.jsp"class=" nav-link text-white">Listar Produto</a>
						</li>
					</ul>
				</div>
</header>	
		<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${produto != null}">
					<form action="atualizarProduto" method="post">
				</c:if>
				<c:if test="${produto == null}">
					<form action="inserirProduto" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${produto != null}">
            			Editar
            		</c:if>
						<c:if test="${produto == null}">
            			Adicionar
            		</c:if>
					</h2>
				</caption>

				<c:if test="${produto != null}">
					<input type="hidden" name="idProduto" value="<c:out value='${produto.idProduto}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Fabricante</label> <input type="text"
						value="<c:out value='${produto.fabricante}' />" class="form-control"
						name="fabricante" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Nome</label> <input type="text"
						value="<c:out value='${produto.nome}' />" class="form-control"
						name="nome">
				</fieldset>

				<fieldset class="form-group">
					<label>Marca</label> <input type="text"
						value="<c:out value='${produto.marca}' />" class="form-control"
						name="marca">
				</fieldset>
				<fieldset class="form-group">
					<label>Id Categoria</label> <input type="text" 
						value="<c:out value='${produto.idCategoria}' />" class="form-control"
						name="idCategoria">
				</fieldset>
				<fieldset class="form-group">
					<label>Descrição</label> <input type="text"
						value="<c:out value='${produto.descricao}' />" class="form-control"
						name="descricao">
				</fieldset>
				<fieldset class="form-group">
					<label>Unidade medida</label> <input type="text" 
						value="<c:out value='${produto.unidadeMedida}' />" class="form-control"
						name="unidadeMedida">
				</fieldset>
				<fieldset class="form-group">
					<label>Peso</label> <input type="text"
						value="<c:out value='${produto.peso}' />" class="form-control"
						name="peso">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Cor</label> <input type="text"
						value="<c:out value='${produto.cor}' />" class="form-control"
						name="cor">
				</fieldset>

				<button type="submit" class="btn btn-success">Salvar</button>
				</form>
			</div>
		</div>
	</div>
	
<footer class="text-muted bg-light">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link href="css/footer.css" rel="stylesheet">	 
		<hr class="mt-6">
		<div class="row pb-2">
			<div class="col-12"></div>
		 
				<div class="container">
					<div class="row py-1">
						<div class=" col-md-4 text-center">&copy; 2021 -
							Esmalteria PWE</div>
						<div class="row py-1  col-md-4 text-center">Caio Soares Paiva GU3011143<br>  
							Josefa	Gidaiane Santana De Jesus GU3011976 <br>
							 Mayara Sarmento Paes GU3012654</div>
					</div>
				</div> 
			</div>
	</footer>
</html>