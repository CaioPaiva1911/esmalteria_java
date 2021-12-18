package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdutoDAO;
import model.Produtos;

/**
 * Servlet implementation class ProdutoController
 */
@WebServlet("/ProdutoController")
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProdutoDAO produtoDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdutoController() {
        this.produtoDAO = new ProdutoDAO();
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getServletPath();
		
		switch(acao) {
		case "/inserirProduto":
			inserirProduto(request, response);
			break;
		case "/deletarProduto":
			
			try {
				deletarProduto(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
		case "/atualizarProduto":
			atualizarProduto(request, response);
			break;
		case "/listarproduto":
			ListProdutos(request, response);
			break;
		}
	}
	private void ListProdutos (HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		List<Produtos> listarproduto = ProdutoDAO.ListAllProdutos();
		request.setAttribute("listarproduto", listarproduto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("listaProdutos.jsp");
		dispatcher.forward(request, response);
	}

	private void inserirProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		int idProduto = Integer.parseInt(request.getParameter("idProduto"));
		String fabricante = request.getParameter("fabricante");
		String nome = request.getParameter("nome");
		String marca = request.getParameter("marca");
		int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
		String descricao = request.getParameter("descricao");
		String unidadeMedida = request.getParameter("unidadeMedida");
		double peso = Double.parseDouble(request.getParameter("peso"));
		String cor = request.getParameter("cor");
		Produtos novoProd = new Produtos(idProduto, fabricante, nome, marca, idCategoria,
				descricao, unidadeMedida, peso, cor);	
	}
	private void deletarProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("idProduto"));
		produtoDAO.deletarProduto(id);
		response.sendRedirect("listarproduto");
	}
/*	private void editarProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idProduto"));
		Produtos existeProd = produtoDAO.selecionarProd("idProduto");
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroProduto.jps");
		request.setAttribute("produto", existeProd);
		dispatcher.forward(request, response);
	}*/
	private void atualizarProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idProduto"));
		//String idProduto = request.getParameter("idProduto");
		String fabricante = request.getParameter("fabricante");
		String nome = request.getParameter("nome");
		String marca = request.getParameter("marca");
		int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
		String descricao = request.getParameter("descricao");
		String unidadeMedida = request.getParameter("unidadeMedida");
		double peso = Double.parseDouble(request.getParameter("peso"));
		String cor = request.getParameter("cor");
		Produtos produto = new Produtos(fabricante, nome, idCategoria, marca,
				descricao, unidadeMedida, peso, cor);
		response.sendRedirect("listarproduto");
	}
}
	



