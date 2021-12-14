<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%	
String pag = "usuarios.jsp";
	Statement st = null;
	ResultSet rs = null;
%>

<% out.print("<table class='table table-sm table-striped'>"
		+"<thead>"
+"<tr>"
	+"<th scope='col'>Código</th>"
	+"<th scope='col'>Nome</th>"
	+"<th scope='col'>Email</th>"
	+"<th scope='col'>Senha</th>"
	+"<th scope='col'>Nível Usuário</th>"
	+"<th scope='col'>Ações</th>"
+"</tr>"
+"</thead>"
+"<tbody>");

	try {

			st = new Conexao().conectar().createStatement();
			if(request.getParameter("btn-buscar") != null){
				
				String busca = '%' + request.getParameter("txtbuscar") + '%';
				
				rs = st.executeQuery("SELECT idUsuario, nome, email, senha, idNivelUsuario FROM usuarios WHERE nome LIKE '" + busca + "' ORDER BY nome;");
			
			}else{
				rs = st.executeQuery("SELECT idUsuario, nome, email, senha, idNivelUsuario FROM usuarios ORDER BY nome");
			}
	
			while (rs.next()) {
	
			out.print("<tr><td>" + rs.getString(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td id='senha'>" + rs.getString(3) + "</td>");
			out.print("<td>" + rs.getString(4) + "</td>");
			out.print("<td>"+(rs.getString(5).equals("1") ? "Admin" : "Comum") + "</td>");
			out.print("<td><a href='" + pag + "?funcao=editar&id=" + rs.getString(1) + " class='text-info'><i class='far fa-edit'></i></a>"); 
			out.print("<a href='" + pag + "?funcao=excluir&id=" + rs.getString(1) + " class='text-danger'><i class='far fa-trash-alt'></i></a></td></tr>");
			
			}

		} catch (Exception e) {
			out.print(e);
		}
		
		out.print("</tbody></table>");
%>
