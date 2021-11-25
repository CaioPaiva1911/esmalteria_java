package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Estoque {
	
	private int idEstoque;
	private int idProduto;
	// Tipo data verificar se ocorrerá algum erro
	private String dtEntrada;
	private int quantidade;
	private String dtFabricacao;
	private String dtVencimento;
	private String nfCompra;
	private double precoCompra;
	private double icmsCompra;
	private float precoVenda;
	private int qtdVendida;
	private int qtdOcorrencia;
	private String ocorrencia;
	
	private String tableName = "lojinha.estoque";
	private String fieldsName = "idEstoque, idProduto, dtEntrada, quantidade, dtFrabricacao, dtVencimento, nfCompra, precoCompra, icmsCompra, precoVenda, qtdVendida, qtdOcorrencia, ocorrencia";
	private String keyField = "idEstoque";
	
	private DBQuery dbQuery = null;
	
	public Estoque(){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Estoque(int idEstoque, int idProduto, String dtEntrada, int quantidade, String dtFrabricacao, String dtVencimento, String nfCompra, double precoCompra, double icmsCompra, float precoVenda, int qtdVendida, int qtdOcorrencia, String ocorrencia) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdEstoque( idEstoque );
		this.setIdProduto( idProduto );
		this.setDtEntrada( dtEntrada );
		this.setQuantidade( quantidade );
		this.setDtFabricacao( dtFabricacao );
		this.setDtVencimento( dtVencimento );
		this.setNfCompra( nfCompra );
		this.setPrecoCompra( precoCompra );
		this.setIcmsCompra( icmsCompra );
		this.setPrecoVenda( precoVenda );
		this.setQtdVendida( qtdVendida );
		this.setQtdOcorrencia( qtdOcorrencia );
		this.setOcorrencia( ocorrencia );

	}
	
	public Estoque(String  idEstoque, String  idProduto, String dtEntrada, String  quantidade, String dtFrabricacao, String dtVencimento, String nfCompra, String  precoCompra, String  icmsCompra, String  precoVenda, String  qtdVendida, String  qtdOcorrencia, String ocorrencia) {
		
		this.setIdEstoque(((idEstoque==null)?0:Integer.valueOf(idEstoque)));
		this.setIdProduto(((idProduto==null)?0:Integer.valueOf(idProduto)));
		this.setDtEntrada( dtEntrada );
		this.setQuantidade(((quantidade==null)?0:Integer.valueOf(quantidade)));
		this.setDtFabricacao( dtFabricacao );
		this.setDtVencimento( dtVencimento );
		this.setNfCompra( nfCompra );
		this.setPrecoCompra(((precoCompra==null)?0:Integer.valueOf(precoCompra)));
		this.setIcmsCompra(((icmsCompra==null)?0:Integer.valueOf(icmsCompra)));
		this.setPrecoVenda(((precoVenda==null)?0:Integer.valueOf(precoVenda)));
		this.setQtdVendida(((qtdVendida==null)?0:Integer.valueOf(qtdVendida)));
		this.setQtdOcorrencia(((qtdOcorrencia==null)?0:Integer.valueOf(qtdOcorrencia)));
		this.setOcorrencia( ocorrencia );
	}
	
	public String[] toArray() {
		return(
				new String[] {
					""+this.getIdEstoque(),
					""+this.getIdProduto(),
					""+this.getDtEntrada(),
					""+this.getQuantidade(),
					""+this.getDtFabricacao(),
					""+this.getDtVencimento(),
					""+this.getNfCompra(),
					""+this.getPrecoCompra(),
					""+this.getQtdVendida(),
					""+this.getQtdOcorrencia(),
					""+this.getOcorrencia()		
				}
		);
	}
	
	public void save() {
		if((this.getIdEstoque() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}

	public void delete() {
		if (this.getIdEstoque() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idEstoque") + "</td>";
				saida += "<td>" + rs.getString("idProduto") + "</td>";
				saida += "<td>" + rs.getString("dtEntrada") + "</td>";
				saida += "<td>" + rs.getString("quantidade") + "</td>";
				saida += "<td>" + rs.getString("dtFabricacao") + "</td>";
				saida += "<td>" + rs.getString("dtVencimento") + "</td>";
				saida += "<td>" + rs.getString("nfCompra") + "</td>";
				saida += "<td>" + rs.getString("precoCompra") + "</td>";
				saida += "<td>" + rs.getString("icmsCompra") + "</td>";
				saida += "<td>" + rs.getString("descricao") + "</td>";
				saida += "<td>" + rs.getString("icmsCompra") + "</td>";
				saida += "<td>" + rs.getString("precoVenda") + "</td>";
				saida += "<td>" + rs.getString("qtdVendida") + "</td>";
				saida += "<td>" + rs.getString("qtdOcorrencia") + "</td>";
				saida += "<td>" + rs.getString("ocorrencia") + "</td>";
				saida += "</tr><br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}

	public int getIdEstoque() {
		return idEstoque;
	}

	public void setIdEstoque(int idEstoque) {
		this.idEstoque = idEstoque;
	}

	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public String getDtEntrada() {
		return dtEntrada;
	}

	public void setDtEntrada(String dtEntrada) {
		this.dtEntrada = dtEntrada;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getDtFabricacao() {
		return dtFabricacao;
	}

	public void setDtFabricacao(String dtFabricacao) {
		this.dtFabricacao = dtFabricacao;
	}

	public String getDtVencimento() {
		return dtVencimento;
	}

	public void setDtVencimento(String dtVencimento) {
		this.dtVencimento = dtVencimento;
	}

	public String getNfCompra() {
		return nfCompra;
	}

	public void setNfCompra(String nfCompra) {
		this.nfCompra = nfCompra;
	}

	public double getPrecoCompra() {
		return precoCompra;
	}

	public void setPrecoCompra(double precoCompra) {
		this.precoCompra = precoCompra;
	}

	public double getIcmsCompra() {
		return icmsCompra;
	}

	public void setIcmsCompra(double icmsCompra) {
		this.icmsCompra = icmsCompra;
	}

	public float getPrecoVenda() {
		return precoVenda;
	}

	public void setPrecoVenda(float precoVenda) {
		this.precoVenda = precoVenda;
	}

	public int getQtdVendida() {
		return qtdVendida;
	}

	public void setQtdVendida(int qtdVendida) {
		this.qtdVendida = qtdVendida;
	}

	public int getQtdOcorrencia() {
		return qtdOcorrencia;
	}

	public void setQtdOcorrencia(int qtdOcorrencia) {
		this.qtdOcorrencia = qtdOcorrencia;
	}

	public String getOcorrencia() {
		return ocorrencia;
	}

	public void setOcorrencia(String ocorrencia) {
		this.ocorrencia = ocorrencia;
	}
	
}
