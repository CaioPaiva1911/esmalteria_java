<%
	//Finaliza sessão do usuário
	session.invalidate();
	response.sendRedirect("login.jsp"); 
%>