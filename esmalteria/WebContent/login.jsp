
<%@page import="database.DB"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="css/estilologin.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
$('#efetuarLogin').click(function(e) {
			event.preventDefault();
			 const email = $('input[name="txtusuario"]').val();
			 const senha = $('input[name="txtsenha"]').val();
			$.ajax({
				url: "usuarios/logar",
				type: "POST",
				data: { email: email, senha: senha},			
				success: function(response){
					//$('#retorno').html("Logado");
					window.location.href = "usuarios.jsp";
					//console.log(result);
				},
				error: function(xhr, status, error){
					alert(xrh.responseText);
				}
			});
			return false;
		});
	});
</script>

<div class="wrapper fadeInDown">
	<div id="formContent">
		<!-- Tabs Titles -->

		<!-- Icon -->
		<div class="fadeIn first">
			<!-- <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" /> -->
			<h3 class="fadeIn fourth">Acessar área do Usuário</h3>
		</div>

		<!-- Login Form -->
		<!-- method="post" action="login.jsp" -->
		<form id="formulario">
			<input type="text" id="login" class="fadeIn second" name="txtusuario" placeholder="login" required> 
			<input type="password" id="password" class="fadeIn third" name="txtsenha" placeholder="senha" required>
			<input type="submit" class="fadeIn fourth" id="efetuarLogin" value="Acessar">
		</form>

		<!-- Remind Passowrd -->
		<div id="formFooter">
			<a class="underlineHover text-left" href="#">Esqueceu sua senha?</a>
			<a class="underlineHover text-info text-right" href="cadastroUsuario.jsp">Cadastra-se</a>
		</div>
		<p align="center" id="retorno" class="text-alert mt-2">
			<%
				/*
				String usuario = request.getParameter("txtusuario");
				String senha = request.getParameter("txtsenha");
				String nomeUsuario = "";
				String pass = "", idUsuario = "", email = "";
				int i = 0;
				
				try {
					ResultSet rs = DB.executarQuery("SELECT * FROM usuarios where email = '" + usuario + "' AND senha = '" + senha + "'");
							
					while (rs.next()) {
						email = rs.getString(2);
						pass = rs.getString(3);
						nomeUsuario = rs.getString(5);
						rs.last();
						i = rs.getRow();
					}
				} catch (Exception e) {
					out.print(e);
				}
				//out.print(i);
				if (usuario == null || senha == null) {
					out.println("Preencha os dados.");
				} else {
					if (i > 0) {
						session.setAttribute("nomeUsuario", nomeUsuario);
						//out.println(usuario);
						response.sendRedirect("usuarios.jsp");
					} else {
						out.println("Dados incorretos!");
					}
				}
				/*try {

					st = new Conexao().conectar().createStatement();
					rs = st.executeQuery(
						"SELECT idUsuario,email,senha,idNivelUsuario,nome FROM usuarios where email = '" + usuario + "' AND senha = '" + senha + "'");
					if(rs.next()){
						email = rs.getString("email");
						pass = rs.getString("senha");
						idUsuario = rs.getString("idUsuario");
						nomeUsuario = rs.getString("nome");
						
						
						session.setAttribute("nomeUsuario", nomeUsuario);
						session.setAttribute("idUsuario", idUsuario);
						session.setAttribute("email", email);
				
						response.sendRedirect("usuarios.jsp");
					}
					else{
						response.sendRedirect("login.jsp");
						out.println("Dados incorretos!");
					}
				} catch (Exception e) {
					out.print(e);
				}
				/*
				if (usuario == null || senha == null) {
					out.println("Preencha os dados.");
				} else {
					if (i > 0) {
						session.setAttribute("nomeUsuario", nomeUsuario);
						//out.println(usuario);
						response.sendRedirect("usuarios.jsp");
					} else {
						out.println("Dados incorretos!");
					}
				}
				*/
				
			%>
		</p>
	</div>
</div>