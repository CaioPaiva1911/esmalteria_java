<%
	//Finaliza sess�o do usu�rio
	session.invalidate();
	response.sendRedirect("login.jsp"); 
%>