<%
	//Finaliza sessão do usuário
	session.invalidate();
	response.sendRedirect("Index.jsp"); 
%>