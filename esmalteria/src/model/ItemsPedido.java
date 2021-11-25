package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class ItemsPedido {
	private int idItemPedido;
	private String ordem;
	private int idPedido;
	private int idEstoque;
	private int qtdItem;
	private String dtDevolucao;
	private String motivoDevolucao;
	
	private String tableName = "lojinha.itemspedido";
	private String fieldsName = "idItemPedido, ordem, idPedido, idEstoque, qtdItem, dtDevolucao, motivoDevolucao";
	private String keyField = "idItemPedido";
	
	private DBQuery dbQuery = null;
	
	public ItemsPedido(){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public ItemsPedido(int idItemPedido, String ordem, int idPedido, int idEstoque, int qtdItem, String dtDevolucao, String motivoDevolucao) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdItemPedido( idItemPedido );
		this.setOrdem( ordem );
		this.setIdPedido( idPedido );
		this.setIdEstoque( idEstoque );
		this.setQtdItem( qtdItem );
		this.setDtDevolucao( dtDevolucao );
		this.setMotivoDevolucao( motivoDevolucao );
		
	}
	
	public ItemsPedido(String idItemPedido, String ordem, String idPedido, String idEstoque, String qtdItem, String dtDevolucao, String motivoDevolucao) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdItemPedido(((idItemPedido==null)?0:Integer.valueOf(idItemPedido)));
		this.setOrdem( ordem );
		this.setIdPedido(((idPedido==null)?0:Integer.valueOf(idPedido)));
		this.setIdEstoque(((idEstoque==null)?0:Integer.valueOf(idEstoque)));
		this.setQtdItem(((qtdItem==null)?0:Integer.valueOf(qtdItem)));
		this.setDtDevolucao( dtDevolucao );
		this.setMotivoDevolucao( motivoDevolucao );
		
	}
	
	public String[] toArray() {
		return(
				new String[] {
					""+this.getIdItemPedido(),
					""+this.getOrdem(),
					""+this.getIdPedido(),
					""+this.getIdEstoque(),
					""+this.getQtdItem(),
					""+this.getDtDevolucao(),
					""+this.getMotivoDevolucao()
				}
				
		);
	}
	
	public void save() {
		if((this.getIdItemPedido() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if (this.getIdItemPedido() > 0) {
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
				saida += "<td>" + rs.getString("idItemPedido") + "</td>";
				saida += "<td>" + rs.getString("ordem") + "</td>";
				saida += "<td>" + rs.getString("idPedido") + "</td>";
				saida += "<td>" + rs.getString("idEstoque") + "</td>";
				saida += "<td>" + rs.getString("qtdItem") + "</td>";
				saida += "<td>" + rs.getString("dtDevolucao") + "</td>";
				saida += "<td>" + rs.getString("motivoDevolucao") + "</td>";
				saida += "</tr><br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	

	public int getIdItemPedido() {
		return idItemPedido;
	}

	public void setIdItemPedido(int idItemPedido) {
		this.idItemPedido = idItemPedido;
	}

	public String getOrdem() {
		return ordem;
	}

	public void setOrdem(String ordem) {
		this.ordem = ordem;
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public int getIdEstoque() {
		return idEstoque;
	}

	public void setIdEstoque(int idEstoque) {
		this.idEstoque = idEstoque;
	}

	public int getQtdItem() {
		return qtdItem;
	}

	public void setQtdItem(int qtdItem) {
		this.qtdItem = qtdItem;
	}

	public String getDtDevolucao() {
		return dtDevolucao;
	}

	public void setDtDevolucao(String dtDevolucao) {
		this.dtDevolucao = dtDevolucao;
	}

	public String getMotivoDevolucao() {
		return motivoDevolucao;
	}

	public void setMotivoDevolucao(String motivoDevolucao) {
		this.motivoDevolucao = motivoDevolucao;
	}
	
	
	


}
