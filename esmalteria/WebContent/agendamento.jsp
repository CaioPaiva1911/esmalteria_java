<%@page import="java.sql.*"%>
<%@page import="model.Agendar"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- calendario -->


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="css/estilologin.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	
<!------ Include the above in your HEAD tag ---------->
<title>Agendar</title>
</head>
<body>

 <%
 	String idAgendamento         = request.getParameter("idAgendamento");
 	String nomeCliente           = request.getParameter("nomeCliente");
 	String teleCliente           = request.getParameter("teleCliente");
 	String tipoServico           = request.getParameter("tipoServico");
 //	String dtAgendamento         = request.getParameter("dtAgendamento");
 
 	String acao                  = request.getParameter("acao");
 	
 	if((acao != null) && (idAgendamento != null)){
 		Agendar agendar = new Agendar(idAgendamento, nomeCliente, teleCliente, tipoServico);
 	
 		if(Integer.valueOf(acao) == 1){
 			agendar.save();
 		} else if(Integer.valueOf(acao) == 2){
 			agendar.delete();
 		}
 	}
 	
    String saida = new Agendar().listAll();
	response.getWriter().write(saida);
 %>

<div class="">
	<div id="formContent">
		<!-- Tabs Titles -->

		<!-- Icon -->
		<div class="fadeIn first">
			<!-- <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" /> -->
			<h3 class="fadeIn fourth">Agendar horário</h3>
		</div>

		<!-- Login Form -->
		<form method="post" action="agendamento.jsp">
			<input type="text" id="nomeCliente" class="fadeIn second" name="txtnomeCliente" placeholder="Nome completo" required> 
			<input type="text" id="teleCliente" class="fadeIn second" name="txtteleCliente" placeholder="Telefone" maxlength="11" required>
			<select class="form-control" id="tipoServico" required>
				<option selected disabled>Escolher...</option>
  				<option>Manicure</option>
  				<option>Pedicure</option>
  				<option>Manicure e Pedicure</option>
  				
			</select>
			 
			<p>Data</p>
			<input type="datetime-local" id="dtAgendamento"  name="cadtAgendamentolendario" max=""/>
			<br>
			<br>			
				
			<input type="submit" class="fadeIn fourth" value="Confirmar">
		</form>
		

	</div>
</div>



</body>
</html>