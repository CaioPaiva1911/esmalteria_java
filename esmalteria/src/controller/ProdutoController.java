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


@WebServlet("/")
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProdutoDAO produtoDAO;
	
    public void init() {
    	this.produtoDAO = new ProdutoDAO();
	}
        
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getServletPath();

		
		switch(acao) {
		case "/novo":
			formNovoProduto(request, response);
			break;
		case "/inserirProduto":
			try {
				inserirProduto(request, response);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			break;
		case "/deletar":
			try {
				deletarProduto(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/atualizar":
			atualizarProduto(request, response);
			break;
		case "/editar":
			editarProduto(request, response);
			break;
		case "/listarproduto":
			ListProdutos(request, response);
			break;
		}
	}
	private void ListProdutos (HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		List<Produtos> listarproduto = ProdutoDAO.ListAllProdutos();
		request.setAttribute("listarProduto", listarproduto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("listarProdutos.jsp");
		dispatcher.forward(request, response);
	}

	private void inserirProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException, SQLException {
	
		String fabricante = request.getParameter("fabricante");
		String nome = request.getParameter("nome");
		String marca = request.getParameter("marca");
		int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
		String descricao = request.getParameter("descricao");
		String unidadeMedida = request.getParameter("unidadeMedida");
		double peso = Double.parseDouble(request.getParameter("peso"));
		String cor = request.getParameter("cor");
		Produtos novoProd = new Produtos(fabricante, nome, marca,idCategoria,
				descricao, unidadeMedida, peso, cor);	
		produtoDAO.inserirProduto(novoProd);
		response.sendRedirect("listarproduto");
	}
	private void deletarProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException, SQLException {
		int idProduto = Integer.parseInt(request.getParameter("idProduto"));
		produtoDAO.deletarProduto(idProduto);
		response.sendRedirect("listarproduto");
	}
	private void formNovoProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroProduto.jsp");
		dispatcher.forward(request, response);
	}
	
	private void editarProduto(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idProduto"));
		Produtos existeProd = produtoDAO.selecionarProd(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroProduto.jsp");
		request.setAttribute("produto", existeProd);
		dispatcher.forward(request, response);
	}
	private void atualizarProduto(HttpServletRequest request, HttpServletResponse response)
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
		Produtos produto = new Produtos(idProduto, fabricante, nome, marca,idCategoria,
				descricao, unidadeMedida, peso, cor);
		try {
			produtoDAO.atualizarProduto(produto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listarProdutos");
	}
}
	



