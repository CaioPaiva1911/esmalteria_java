package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.StatementImpl;

import model.Produtos;

public class ProdutoDAO {
	static String timezone = "&useTimezone=true&serverTimezone=UTC";
	private static String jdbcURL = "jdbc:mysql://localhost:3308/lojinha?"+timezone;
	private static  String jdbcUsername = "root";
	private static  String jdbcPassword = "10172117";
	
//	private static final String DELETE = "DELETE FROM produtos WHERE idProduto = ?;";
	
	public ProdutoDAO() {
	}
	
	protected static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	

	
	public static List<Produtos> ListAllProdutos(){
		List<Produtos> listarproduto = new ArrayList<>();

		try (
			Connection con = getConnection();
			java.sql.PreparedStatement ps = con.prepareStatement("select * from produtos")){
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int idProduto = rs.getInt("idProduto");
				String fabricante = rs.getString("fabricante");
				String nome = rs.getString("nome");
				String marca = rs.getString("marca");
				int idCategoria = rs.getInt("idCategoria");
				String descricao = rs.getString("descricao");
				String unidadeMedida = rs.getString("unidadeMedida");
				double peso = rs.getDouble("peso");
				String cor = rs.getString("cor");
				listarproduto.add(new Produtos(idProduto, fabricante, marca, nome, idCategoria,
						descricao, unidadeMedida, peso, cor));
			}	
		} catch (Exception e) {
			System.out.println(e);
		}
		return listarproduto;
	}
	
	public void inserirProduto(Produtos produto) throws SQLException {

		try (
			Connection con = getConnection();
			java.sql.PreparedStatement ps = con.prepareStatement("INSERT INTO produtos"+"(fabricante, nome, marca, idCategoria, descricao, unidadeMedida, peso, cor) VALUES" 
					+ "(?, ?, ?, ?, ?, ?, ?, ?)")){
			
			ps.setString(1, produto.getFabricante());
			ps.setString(2, produto.getNome());
			ps.setString(3, produto.getMarca());
			ps.setInt(4, produto.getIdCategoria());
			ps.setString(5, produto.getDescricao());
			ps.setString(6, produto.getUnidadeMedida());
			ps.setDouble(7, produto.getPeso());
			ps.setString(8, produto.getCor());	
			System.out.println(ps);
			ps.executeUpdate();
		
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	// Atualizar
	public boolean atualizarProduto(Produtos produto)  throws SQLException {
		boolean linha;
	//	Conexao con = new Conexao();
		try (
			Connection con = getConnection();
			java.sql.PreparedStatement ps =con.prepareStatement("UPDATE produtos SET fabricante = ?,nome = ?, marca = ?, idCategoria = ?, descricao = ?, unidadeMedida = ?, peso = ?, cor = ? WHERE idProduto = ?"))
		{
				
			ps.setInt(1, produto.getIdProduto());
			ps.setString(2, produto.getFabricante());
			ps.setString(3, produto.getNome());
			ps.setString(4, produto.getMarca());
			ps.setInt(5, produto.getIdCategoria());
			ps.setString(6, produto.getDescricao());
			ps.setString(7, produto.getUnidadeMedida());
			ps.setDouble(8, produto.getPeso());
			ps.setString(9, produto.getCor());		
			linha = ps.executeUpdate() > 0;
			
		} 
		return linha;
		
	}
	
	public Produtos selecionarProd(int idProduto) {
		Produtos produto = null;

		try (
			Connection con = getConnection();
			java.sql.PreparedStatement ps =  con.prepareStatement("SELECT idProduto, fabricante, nome, marca, idCategoria, descricao, unidadeMedida, peso, cor FROM produtos WHERE idProduto = ?;"))
		{	
			ps.setInt(1, idProduto);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
		
				String fabricante = rs.getString("fabricante");
				String nome = rs.getString("nome");
				String marca = rs.getString("marca");
				int idCategoria = rs.getInt("idCategoria");
				String descricao = rs.getString("descricao");
				String unidadeMedida = rs.getString("unidadeMedida");
				double peso = rs.getDouble("peso");
				String cor = rs.getString("cor");
				produto = new Produtos(idProduto, fabricante, nome, marca, idCategoria,
						descricao, unidadeMedida, peso, cor);
			}	
		}	catch (Exception e) {
				System.out.println(e);
		} 
		return produto;
		
	}
	
	public boolean deletarProduto(int idProduto)  throws SQLException {
		boolean linha;
		
		try (
		Connection con = getConnection();
		java.sql.PreparedStatement ps = con.prepareStatement("DELETE FROM produtos WHERE idProduto = ?;"))
		{
			ps.setInt(1,  idProduto);
			linha = ps.executeUpdate()>0;
		} 
		return linha;	
	} 
}

