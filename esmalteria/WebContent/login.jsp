<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/estilo.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <!-- <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" /> -->
    	<h3 class="fadeIn fourth">Acessar área do Usuário</h3>
    </div>

    <!-- Login Form -->
    <form method="post">
       <input type="text" id="login" class="fadeIn second" name="txtusuario" placeholder="login" required> 
      <input type="text" id="password" class="fadeIn third" name="txtsenha" placeholder="senha" required>
      <input type="submit" class="fadeIn fourth" value="Acessar">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover text-left" href="#">Esqueceu sua senha?</a>
      <a class="underlineHover text-info text-right" href="#">Cadastra-se</a>
    </div>
    <p align="center" class="text-light mt-2">
    	<%
    		String usuario = request.getParameter("txtusuario");
			String senha = request.getParameter("txtsenha");
    		
			out.println("Senha");
    	%>
    </p>
  </div>
</div>