package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ha.backend.Sender;

import dao.UsuarioDAO;
import model.Usuario;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet("/usuarios/*")
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
		String url = request.getRequestURI();
		String acao = url.substring(url.lastIndexOf("/") + 1);
		//Request Dispatcher
		RequestDispatcher disp;
		
		
		switch(acao)
		{
		case "listar":
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			Usuario usuario = new Usuario();
			String result = usuario.listarJSON();
			System.out.println(result);
			response.getWriter().write(result);
		break;
		default:
		break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String acao = url.substring(url.lastIndexOf("/") + 1);
		//Request Dispatcher
		RequestDispatcher disp;
		
		switch(acao)
		{
		case "listar":
		case "logar":
			ResultSet rsLogin;
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			System.out.println(email);
			System.out.println(senha);
			String nomeUsuario = "";
			String idUsuario = "";
		
			UsuarioDAO logar = new UsuarioDAO();
			rsLogin = logar.login(email, senha);
			try {
				if(rsLogin.next()){
					HttpSession session = request.getSession();
					email = rsLogin.getString("email");
					idUsuario = rsLogin.getString("idUsuario");
					nomeUsuario = rsLogin.getString("nome");
					
					
					session.setAttribute("nomeUsuario", nomeUsuario);
					session.setAttribute("idUsuario", idUsuario);
					session.setAttribute("email", email);
			
				
					disp = request.getRequestDispatcher("usuarios.jsp");
					disp.forward(request, response);
					//response.sendRedirect("usuarios.jsp");
				}else{
					System.out.println("Dados incorretos!");
					response.sendRedirect("login.jsp");
				}
			} catch (Exception e) {
				System.out.print(e);
			}
		break;
		
		case "create":
			 idUsuario = request.getParameter("idUsuario");
			 email 	= request.getParameter("email");
			 senha 	= request.getParameter("senha");
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
			acao 	= request.getParameter("acao");
			System.out.println(acao);
			if ((acao != null ) && (idUsuario != null)){
				UsuarioDAO usuario = new UsuarioDAO(idUsuario,  email,  senha,  idNivelUsuario,  nome,  cpf,  endereco, bairro,  cidade, uf,  cep,  telefone, foto, ativo);
				
				if (Integer.valueOf(acao) == 1){
					
					usuario.save();
					response.sendRedirect("login.jsp");
			
				} else if (Integer.valueOf(acao) == 2){
					usuario.delete();
					disp = request.getRequestDispatcher("usuarios.jsp");
					disp.forward(request, response);
				} 
			}
			
			String saida = new UsuarioDAO(idUsuario,  email,  senha,  idNivelUsuario,  nome,  cpf,  endereco, bairro,  cidade, uf,  cep,  telefone, foto, ativo).listAll();
			response.getWriter().write(saida);
		break;
		default:
		break;
		}			
	}

}
