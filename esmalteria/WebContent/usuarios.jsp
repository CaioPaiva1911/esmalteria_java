<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

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
<title>Lista de Usuários</title>
</head>
<body>
	<%
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Lista de Usuários</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Dropdown </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<span><small> <%
 	String nomeUsuario = (String) session.getAttribute("nomeUsuario");
 	out.print(nomeUsuario);

 	if (nomeUsuario == null) {
 		response.sendRedirect("login.jsp");
 	}
 %>
					</small></span> <a href="logout.jsp"><i class="fas fa-sign-out-alt ml-1"></i></a>
				</form>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row mt-4 mb-4">
			<button class="btn-info btn-sm ml-3">Novo Usuário</button>
			<form class="form-inline my-2 my-lg-0 direita">
				<input class="form-control form-control-sm mr-sm-2" type="search" name="txtbuscar"
					placeholder="Search" aria-label="Pesquisar">
				<button class="btn btn-outline-info btn-sm my-2 my-sm-0" type="submit">Buscar</button>
			</form>
		</div>
		<table class="table table-sm table-striped">
			<thead>
				<tr>
					<th scope="col">Código</th>
					<th scope="col">Nome</th>
					<th scope="col">Email</th>
					<th scope="col">Senha</th>
					<th scope="col">Nível Usuário</th>
				</tr>
			</thead>
			<tbody>
				<%
					try {

						st = new Conexao().conectar().createStatement();
						rs = st.executeQuery("SELECT nome, email, senha, idNivelUsuario FROM usuarios ORDER BY nome");

						while (rs.next()) {
				%>
				<tr>
					<th scope="row">1</th>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td style="text-security: disc !important;"><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
				</tr>
				<%
					}

					} catch (Exception e) {
						out.print(e);
					}
				%>


			</tbody>
		</table>
	</div>
</body>
</html>