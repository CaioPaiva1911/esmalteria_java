package model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Agendar extends Cliente{
	private int idAgendamento;
	private String nomeCliente;
	private String teleCliente;
	private String tipoServico;
//	private Datetime dtAgendamento;
	
	private String tableName = "lojinha.agendar";
	private String fieldsName = "idAgendamento, nomeCliente, teleCliente, tipoServico"; //dtAgendamento
	private String keyField = "idAgendamento";
	private DBQuery dbQuery = null;
	
	public Agendar(){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
/**	public Agendar(int idAgendamento, String nomeCliente, String teleCliente, String tipoServico) {
		this.tableName = "agendar";
		this.fieldsName = "idAgendamento, nomeCliente, teleCliente, tipoServico";
		this.keyField = "idAgendamento";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdAgendamento(idAgendamento);
		this.setNomeCliente(nomeCliente);
		this.setTeleCliente(teleCliente);
		this.setTipoSerivo(tipoServico);
	//	this.setDtAgendamento(dtAgendamento);
	}

	public Agendar(String idAgendamento, String nomeCliente, String teleCliente, String tipoServico/** String dtAgendamento**/) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdAgendamento(((idAgendamento==null)?0:Integer.valueOf(idAgendamento)));
		this.setNomeCliente(nomeCliente);
		this.setTeleCliente(teleCliente);
		this.setTipoServico(tipoServico);
	//	this.setDtAgendamento(Date.valueOf(dtAgendamento));
	
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idAgendamento") + "</td>";
				saida += "<td>" + rs.getString("nomeCliente")   + "</td>";
				saida += "<td>" + rs.getString("teleCliente")   + "</td>";
				saida += "<td>" + rs.getString("tipoServico")   + "</td>";
			//	saida += "<td>" + rs.getString("dtAgendamento") + "</td>";
				saida += "</tr> <br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	public String[] toArray() {
		return (
			new String [] {
					""+this.getIdAgendamento(),
					""+this.getNomeCliente(),
					""+this.getTeleCliente(),
					""+this.getTipoServico(),
				//	""+this.getDtAgendamento(),
			}
		);
	}
	
	public void save() {
		if((this.getIdAgendamento() == 0)) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if(this.getIdAgendamento() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	
	public int getIdAgendamento() {
		return idAgendamento;
	}

	public void setIdAgendamento(int idAgendamento) {
		this.idAgendamento = idAgendamento;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public String getTeleCliente() {
		return teleCliente;
	}

	public void setTeleCliente(String teleCliente) {
		this.teleCliente = teleCliente;
	}

/**	public Date getDtAgendamento() {
		return dtAgendamento;
	}

	public void setDtAgendamento(Date dtAgendamento) {
		this.dtAgendamento = dtAgendamento;
	}**/
	
	public String getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(String tipoServico) {
		this.tipoServico = tipoServico;
	}
	
}
