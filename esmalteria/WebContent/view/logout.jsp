<%
	//Finaliza sess�o do usu�rio
	session.invalidate();
	response.sendRedirect("Index.jsp"); 
%>