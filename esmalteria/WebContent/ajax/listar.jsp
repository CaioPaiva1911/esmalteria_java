<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%	
	String pag = "usuarios.jsp";
	String buscar = request.getParameter("txtbuscar");
	Statement st = null;
	ResultSet rs = null;
%>

<% out.print("<table class='table table-sm table-striped'>"
		+"<thead>"
+"<tr>"
	+"<th scope='col'>C�digo</th>"
	+"<th scope='col'>Nome</th>"
	+"<th scope='col'>Email</th>"
	+"<th scope='col'>Senha</th>"
	+"<th class='d-none d-md-block' scope='col'>N�vel Usu�rio</th>"
	+"<th scope='col'>A��es</th>"
+"</tr>"
+"</thead>"
+"<tbody>");

	try {

			st = new Conexao().conectar().createStatement();
			if(buscar != null ){
				
				 buscar = '%' + buscar + '%';
				
				rs = st.executeQuery("SELECT idUsuario, nome, email, senha, idNivelUsuario FROM usuarios WHERE nome LIKE '" + buscar + "' ORDER BY nome;");
			
			}else{
				rs = st.executeQuery("SELECT idUsuario, nome, email, senha, idNivelUsuario FROM usuarios ORDER BY nome");
			}
	
			while (rs.next()) {
	
			out.print("<tr><td>" + rs.getString(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td style='text-security: disc !important;' id='senha'>" + rs.getString(3) + "</td>");
			out.print("<td>" + rs.getString(4) + "</td>");
			out.print("<td class='d-none d-md-block'>"+(rs.getString(5).equals("1") ? "Admin" : "Comum") + "</td>");
			out.print("<td><a href='" + pag + "?funcao=editar&id=" + rs.getString(1) + "' class='text-info mr-1'><i class='far fa-edit'></i></a>"); 
			out.print("<a href='" + pag + "?funcao=excluir&id=" + rs.getString(1) + "' class='text-danger'><i class='far fa-trash-alt'></i></a></td></tr>");
			
			}

		} catch (Exception e) {
			out.print(e);
		}
		
		out.print("</tbody></table>");
%>
