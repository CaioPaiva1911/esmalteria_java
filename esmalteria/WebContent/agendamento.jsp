<%@page import="model.Agendar"%>
<%@page import="dao.AgendarDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device.width, initial.scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Agendamento</title>
</head>
<body>
<style>
	table{
		width: 80%;
		margin-left: 10%;
	}
	h3{
		height: 35px;
		width: 80%;
		margin-left: 10%;
	}
	form{
		width: 80%;
		margin-left: 10%;
		text-align: justify;
	}
</style>

 <%
 	String idAgendamento       = request.getParameter("idAgendamento");
 	String nomeCliente         = request.getParameter("nomeCliente");
 	String telefone            = request.getParameter("telefone");
 	String tipoServico            = request.getParameter("tipoServico");
 	
 	String acao            = request.getParameter("acao");
 	
 /*	if((acao != null) && (idAgendamento != null)){
 		Agendar agendar = new Agendar();
 	
 		if(Integer.valueOf(acao) == 1){
 			agendar.save(agendar.getIdAgendamento);
 		} else if(Integer.valueOf(acao) == 2){
 			agendar.delete();
 		}
 	}*/
 	
    String saida = new AgendarDAO().listAll();
	response.getWriter().write(saida);
 %>
<form action="agendamento" method="post" class="form-horizontal">
 	<div class="form-group">
 		<label for="nomeCliente">Nome:</label>
 		<input type="text" id="nomeCliente" name="nomeCliente" placeholder="Enter nome" class="form-control">
 	</div>
 	<br>
 	<div class="form-group">
 		<label for="telefone">Telefone</label>
 		<input type="text" id="telefone" name="telefone" placeholder="Enter telefone" class="form-control">
 	</div>
 	<div class="form-group">
 		<label for="tipoServico">Serviço</label>
 		<input type="text" id="tipoServico" name="tipoServico" placeholder="Enter servico" class="form-control">
 	</div>
 
 	<button type="button" id="btnEmp" class="btn btn-primary" onclick="acao.value='1': this.form.submit():">Salvar</button> 
 	</form>
 	

</body>
</html>