<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String pag = "usuarios.jsp";
%>	
<!DOCTYPE html>
<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous">
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous">
	</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous">
</script>



<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet">
<title>Lista de Usuários</title>
</head>
<body>
	<%
		Statement st = null;
		ResultSet rs = null;
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Lista de Usuários</a>
			<button class="navbar-toggler" type="button"
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
				<form class="form-inline my-2 my-lg-0 direita">
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
			<a type="button" class="btn-info btn-sm ml-3"
				href="usuarios.jsp?funcao=novo">Novo Usuário</a>
			<form class="form-inline my-2 my-lg-0 direita" method="GET">
				<input class="form-control form-control-sm mr-sm-2" type="search"  
					name="txtbuscar" id="txtbuscar" placeholder="Buscar pelo nome" aria-label="Search">
				<button class="btn btn-outline-info btn-sm my-2 my-sm-0 d-none d-md-block" type="submit" id="btn-buscar" name="btn-buscar">Buscar</button>
			</form>
		</div>
		<div id="listar">
			
		</div>
	</div>
</body>
</html>

<!-- AJAX BUSCAR DADOS-->
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url: "ajax/listar.jsp",
			type: "GET",	
			data: $('#frm').serialize(),
			dataType: "html",
			success: function(result){
				$('#listar').html(result);
				//console.log(response);
			}
		})	
	})
</script>


<!-- AJAX BUSCAR DADOS-->
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn-buscar").click(function(event){
			event.preventDefault();
			$.ajax({
				url: "ajax/listar.jsp",
				method: "post",	
				data: $('form').serialize(),
				dataType: "html",
				success: function(result){
					$('#listar').html(result);
					//console.log(response);
				}
			})	
		})
			
	})
</script>

<!-- AJAX PARA BUSCAR DADOS PELA TXT -->
<script type="text/javascript">
	$("#txtbuscar").keyup(function(){
		$('#btn-buscar').click();
	})		
</script>

<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<%
					String titulo = "";
					String btn = "";
					String xid = "";
					String xnome = "";
					String xemail = "";
					String xsenha = "";
					String xnivel = "";
					if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar"))
					{
						titulo = "Editar Usuário";
						btn = "btn-editar";
						xid = request.getParameter("id");
						
						try{
							st = new Conexao().conectar().createStatement();
							rs = st.executeQuery(
									"SELECT * FROM usuarios where idUsuario = '" + xid + "'");
							
							while (rs.next()) {
								xnome = rs.getString(5);
								xemail  = rs.getString(2);
								xsenha = rs.getString(3);
								xnivel = rs.getString(4);
							}
	
						} catch (Exception e) {
							out.print(e);
						}	
						
					} else{
						
						titulo = "Inserir Usuário";
						btn = "btn-salvar";
					}
				%>
				<h5 class="modal-title" id="exampleModalLabel"><%=titulo %></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" action="">
				<div class="modal-body">
					<input type="hidden" value="<%=xemail %>" name="txtantigo" id="txtantigo">
					<div class="form-group">
						<label for="txtemail" class="text-info">Email</label> 
						<input type="text" value="<%=xemail %>" name="txtemail" id="txtemail" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="txtnome" class="text-info">Nome</label> 
						<input value="<%=xnome %>" type="text" name="txtnome" id="txtnome" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="txtsenha" class="text-info">Senha</label> 
						<input value="<%=xsenha %>" type="text" name="txtsenha" id="txtsenha" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="txtnivel">Nível Usuário</label> <select
							class="form-control" name="txtnivel" id="txtnivel" required>
							<option value="<%=xnivel %>"><%= xnivel.equals("1") ? "Admin" : "Comum"%></option> 
							<%
								if(xnivel.equals("1")){
									out.print("<option value='2'>Comum</option>");
								} else{
									out.print("<option value='1'>Admin</option>");
								}	
							%>
							
							
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
					<button type="submit" name="<%=btn %>" class="btn btn-primary"><%= titulo %></button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Save User-->
<%
	if(request.getParameter("btn-salvar") != null ){
		String senha = request.getParameter("txtsenha");
		String email = request.getParameter("txtemail");
		String nome = request.getParameter("txtnome");
		String nivel = request.getParameter("txtnivel");
		
		try {
	
	st = new Conexao().conectar().createStatement();
			rs = st.executeQuery("SELECT * FROM usuarios where email = '" + email + "';");
			while (rs.next()) {
				rs.getRow();

				if (rs.getRow() > 0) {
					out.print("<script>alert('Usuário já cadastrado!');</script>");
					return;
				}
			}

			st.executeUpdate("INSERT INTO usuarios (email, senha, idNivelUsuario, nome) VALUES ('" + email
					+ "','" + senha + "','" + nivel + "','" + nome + "')");
			response.sendRedirect(pag);
		} catch (Exception e) {
			out.print(e);
		}

	}
%>


<%

	if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")){
		String id = request.getParameter("id");
		
		
		try {
			
			st = new Conexao().conectar().createStatement();
			st.executeUpdate("DELETE FROM usuarios WHERE idUsuario = '" + id + "';");
			response.sendRedirect(pag);
		} catch (Exception e) {
			out.print(e);
		}	
	}
		
%>


<%
	if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")){
		out.print("<script>$('#modal').modal('show');</script>");	
	}
		
%>


<%
	if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("novo")){
		out.print("<script>$('#modal').modal('show');</script>");	
	}
		
%>


<%
	if(request.getParameter("btn-editar") != null ){
		String senha = request.getParameter("txtsenha");
		String email = request.getParameter("txtemail");
		String nome = request.getParameter("txtnome");
		String nivel = request.getParameter("txtnivel");
		String id = request.getParameter("id");
		String antigo = request.getParameter("txtantigo");
		
		try {
	
			st = new Conexao().conectar().createStatement();
			
			if(!antigo.equals(email)){
				rs = st.executeQuery("SELECT * FROM usuarios where email = '" + email + "';");
				while (rs.next()) {
					rs.getRow();

					if (rs.getRow() > 0) {
						out.print("<script>alert('Usuário já cadastrado!');</script>");
						return;
					}
				}
			}
			
			st.executeUpdate("UPDATE usuarios SET nome ='" + nome +"', senha = '"+ senha +"', email = '" + email + "', idNivelUsuario = '"+ nivel +"' WHERE idUsuario = '"+ id + "';");
			out.print(st);	
			response.sendRedirect(pag);
		} catch (Exception e) {
			out.print(e);
		}

	}
%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>



