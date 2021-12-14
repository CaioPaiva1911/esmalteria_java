<%@page import="model.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Testar Usuário I/O</title>
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
</head>
<body>


<%
	String idUsuario = request.getParameter("idUsuario");
	String email 	= request.getParameter("email");
	String senha 	= request.getParameter("senha");
	String idNivelUsuario = "1";
	String nome 	= request.getParameter("nome");
	String cpf 		= request.getParameter("cpf");
	String endereco = request.getParameter("endereco");
	String bairro 	= request.getParameter("bairro");
	String cidade 	= request.getParameter("cidade");
	String uf 		= request.getParameter("uf");
	String cep 		= request.getParameter("cep");
	String telefone = request.getParameter("telefone");
	String foto 	= request.getParameter("foto");
	String ativo 	= "N";
	String acao 	= request.getParameter("acao");

	if ((acao != null ) && (idUsuario != null)){
		UsuarioDAO usuario = new UsuarioDAO(idUsuario,  email,  senha,  idNivelUsuario,  nome,  cpf,  endereco, bairro,  cidade, uf,  cep,  telefone, foto, ativo);
		
		if (Integer.valueOf(acao) == 1){
	usuario.save();
		} else if (Integer.valueOf(acao) == 2){
	usuario.delete();
		} 
	}
	
	String saida = new UsuarioDAO().listAll();
	response.getWriter().write(saida);
%>

<form action="testeUsuarios.jsp" method="POST" class="form-horizontal" id="frmUsuarios">
	<h3>Cadastro de Usuário:</h3>
	<div class="form-group">
		<label for="idUsuario">Identificação do Usuário:</label>
		<input type="text" id="idUsuario" name="idUsuario" placeholder="Enter IdUsuario" class="form-control" value="0">
	</div>
	
	
	<div class="form-group">
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" placeholder="Enter email" class="form-control">
	</div>
	
	<div class="form-group">
		<label for="senha">Senha:</label>
		<input type="password" id="senha" name="senha" placeholder="Enter senha" class="form-control" >
	</div>
	
	<div class="form-group">
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" placeholder="Enter nome" class="form-control">
	</div>
	
	<div class="form-group">
		<label for="cpf">CPF:</label>
		<input type="text" id="cpf" name="cpf" placeholder="Enter CPF" class="form-control" >
	</div>
	
	<div class="form-group">
		<label for="endereco">Endereço:</label>
		<input type="text" id="endereco" name="endereco" placeholder="Enter Endereco" class="form-control" >
	</div>
	
	<div class="form-group">
		<label for="bairro">Bairro:</label>
		<input type="text" id="bairro"  name="bairro" placeholder="Enter Bairro" class="form-control" >
	</div>
	
	<div class="form-group">
		<label for="cidade">Cidade:</label>
		<input type="text" id="cidade"  name="cidade" placeholder="Enter cidade" class="form-control">
	</div>
	
	
	<div class="form-group">
		<label for="uf">UF:</label>
		<select class="form-control" id="uf" name="uf" size="1">
			<option value="AC">Acre</option>
		    <option value="AL">Alagoas</option>
		    <option value="AP">Amapá</option>
		    <option value="AM">Amazonas</option>
		    <option value="BA">Bahia</option>
		    <option value="CE">Ceará</option>
		    <option value="DF">Distrito Federal</option>
		    <option value="ES">Espírito Santo</option>
		    <option value="GO">Goiás</option>
		    <option value="MA">Maranhão</option>
		    <option value="MT">Mato Grosso</option>
		    <option value="MS">Mato Grosso do Sul</option>
		    <option value="MG">Minas Gerais</option>
		    <option value="PA">Pará</option>
		    <option value="PB">Paraíba</option>
		    <option value="PR">Paraná</option>
		    <option value="PE">Pernambuco</option>
		    <option value="PI">Piauí</option>
		    <option value="RJ">Rio de Janeiro</option>
		    <option value="RN">Rio Grande do Norte</option>
		    <option value="RS">Rio Grande do Sul</option>
		    <option value="RO">Rondônia</option>
		    <option value="RR">Roraima</option>
		    <option value="SC">Santa Catarina</option>
		    <option value="SP">São Paulo</option>
		    <option value="SE">Sergipe</option>
		    <option value="TO">Tocantins</option>
		    <option value="EX">Estrangeiro</option>	
		</select>
	</div>
	
	<div class="form-group">
		<label for="cep">CEP:</label>
		<input type="text" id="cep"  name="cep" placeholder="Enter CEP" class="form-control" value="">
	</div>
	
	<div class="form-group">
		<label for="telefone">Telefone:</label>
		<input type="text" id="telefone"  name="telefone" placeholder="Enter Telefone" class="form-control" value="">
	</div>
	
	<div class="form-group">
		<label for="foto">Foto:</label>
		<input type="text" id="foto"  name="foto" placeholder="Enter foto" class="form-control" >
	</div>

	<input type="hidden" name="acao" value="0"> 
	
	<button type="button" id="btnUsuarios" class="btn btn-primary" onclick="acao.value='1' ; this.form.submit();">Salvar</button>	
	<button type="button" id="btnUsuarios" class="btn btn-primary" onclick="acao.value='2' ; this.form.submit();">Excluir</button>	
	
</form>


</body>
</html>