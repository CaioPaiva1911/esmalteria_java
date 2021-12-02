
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
<!------ Include the above in your HEAD tag ---------->

<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
%>


<div class="wrapper fadeInDown">
	<div id="formContent">
		<!-- Tabs Titles -->

		<!-- Icon -->
		<div class="fadeIn first">
			<!-- <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" /> -->
			<h3 class="fadeIn fourth">Acessar área do Usuário</h3>
		</div>

		<!-- Login Form -->
		<form method="post" action="login.jsp">
			<input type="text" id="login" class="fadeIn second" name="txtusuario"
				placeholder="login" required> <input type="password"
				id="password" class="fadeIn third" name="txtsenha"
				placeholder="senha" required> <input type="submit"
				class="fadeIn fourth" value="Acessar">
		</form>

		<!-- Remind Passowrd -->
		<div id="formFooter">
			<a class="underlineHover text-left" href="#">Esqueceu sua senha?</a>
			<a class="underlineHover text-info text-right" href="#">Cadastra-se</a>
		</div>
		<p align="center" class="text-alert mt-2">
			<%
				String usuario = request.getParameter("txtusuario");
				String senha = request.getParameter("txtsenha");
				String nomeUsuario = "";
				String user = "", pass = "";
				int i = 0;

				try {

					st = new Conexao().conectar().createStatement();
					rs = st.executeQuery(
							"SELECT * FROM usuarios where email = '" + usuario + "' AND senha = '" + senha + "'");

					while (rs.next()) {
						user = rs.getString(2);
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
			%>
		</p>
	</div>
</div>