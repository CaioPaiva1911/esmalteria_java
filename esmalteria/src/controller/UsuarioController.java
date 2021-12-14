package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet("/usuarios")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**   
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//Captura da View 
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
		
		
	}

}
