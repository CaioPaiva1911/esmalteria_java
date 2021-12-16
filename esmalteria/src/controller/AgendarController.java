package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AgendarDAO;

@WebServlet(urlPatterns = {"/Controller", "/main", "/insert"})
public class AgendarController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	AgendarDAO ag = new AgendarDAO();
	
	public AgendarController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.println(action);
		if(action.equals("/main")) {
			agenda(request, response);
		}else if(action.equals("/insert")) {
			insert(request, response);
		}
	}
		
	protected void agenda(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("agendamento.jsp");
		
	}
	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//	response.sendRedirect("agendamento.jsp");
		System.out.println(request.getParameter("nomeCliente"));
		System.out.println(request.getParameter("telefone"));
		System.out.println(request.getParameter("tipoServico"));
	}
		

}
