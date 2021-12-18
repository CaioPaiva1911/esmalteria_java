package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import config.Conexao;
import model.Produtos;

public class ProdutoDAO {

	
	public static List<Produtos> ListAllProdutos(){
		List<Produtos> listarproduto = new ArrayList<>();
	//	Produtos produto = null;
		Conexao con = new Conexao();
		try (
			//Conexao con = new Conexao();
			Connection connection = con.getConnection();
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("SELECT * FROM produtos");){
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int idProduto = rs.getInt("idProduto");
				String fabricante = rs.getString("fabricante");
				String marca = rs.getString("marca");
				int idCategoria = rs.getInt("idCategoria");
				String descricao = rs.getString("descricao");
				String unidadeMedida = rs.getString("unidadeMedida");
				double peso = rs.getDouble("peso");
				String cor = rs.getString("cor");
				listarproduto.add(new Produtos(idProduto, fabricante, marca, descricao, idCategoria,
						descricao, unidadeMedida, peso, cor));
			}	
		} catch (Exception e) {
			System.out.println(e);
		}
		return listarproduto;
	}
	
	public void inserirProduto(Produtos produto) throws SQLException {
		Conexao con = new Conexao();
		try (
			Connection connection = con.getConnection();
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("INSERT INTO produtos"+"(idProduto, fabricante, marca, idCategoria, descricao, unidadeMedida, peso, cor) VALUES" 
			+ "(?, ?, ?, ?, ?, ?, ?, ?, ?");){
			
			ps.setInt(1, produto.getIdProduto());
			ps.setString(2, produto.getFabricante());
			ps.setString(3, produto.getMarca());
			ps.setInt(4, produto.getIdCategoria());
			ps.setString(5, produto.getFabricante());
			ps.setString(6, produto.getDescricao());
			ps.setString(7, produto.getUnidadeMedida());
			ps.setDouble(8, produto.getPeso());
			ps.setString(9, produto.getCor());
			ps.executeUpdate();
		
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	// Atualizar
	public boolean atualizarProduto(Produtos produto)  throws SQLException {
		boolean linhaAtualizar = false;
		Conexao con = new Conexao();
		try (
			Connection connection = con.getConnection();
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("UPDATE produtos SET fabricante = ?, marca = ?, idCategoria = ?, descricao = ?, unidadeMedida = ?, peso = ?, cor = ? WHERE idProduto = ?");)
		{
				
			ps.setInt(1, produto.getIdProduto());
			ps.setString(2, produto.getFabricante());
			ps.setString(3, produto.getMarca());
			ps.setInt(4, produto.getIdCategoria());
			ps.setString(5, produto.getFabricante());
			ps.setString(6, produto.getDescricao());
			ps.setString(7, produto.getUnidadeMedida());
			ps.setDouble(8, produto.getPeso());
			ps.setString(9, produto.getCor());	
			linhaAtualizar = ps.executeUpdate() > 0;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return linhaAtualizar;
		
	}
	
	public Produtos selecionarProd(int id) {
		Produtos produto = null;
		Conexao con = new Conexao();
		try (
			Connection connection = con.getConnection();
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("UPDATE produtos SET fabricante = ?, marca = ?, idCategoria = ?, descricao = ?, unidadeMedida = ?, peso = ?, cor = ? WHERE idProduto = ?");)
		{
				
			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
		
			//	int idProduto = rs.getInt("idProduto");
				String fabricante = rs.getString("fabricante");
				String marca = rs.getString("marca");
				int idCategoria = rs.getInt("idCategoria");
				String descricao = rs.getString("descricao");
				String unidadeMedida = rs.getString("unidadeMedida");
				double peso = rs.getDouble("peso");
				String cor = rs.getString("cor");
				produto = new Produtos(fabricante, marca, idCategoria, descricao,
						descricao, unidadeMedida, peso, cor);
			}	
		}	catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
		} 
		return produto;
		
	}
	
	public boolean deletarProduto(int id)  throws SQLException {
		boolean linhaApagar = false;
		Conexao con = new Conexao();
		try (
		Connection connection = con.getConnection();
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement("DELETE FROM produtos WHERE idProduto = ?");){
		{
			ps.setInt(1,  id);
			linhaApagar = ps.executeUpdate()>0;
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
		return linhaApagar;
}
}
