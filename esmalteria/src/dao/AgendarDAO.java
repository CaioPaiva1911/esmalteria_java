package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import database.DBQuery;
import model.Agendar;
public class AgendarDAO{
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	
	private String tableName = "lojinha.agendar";
	private String fieldsName = "idAgendamento, nomeCliente, telefone, tipoServico";
	private String keyField = "idAgendamento";
	private DBQuery dbQuery = null;
	public AgendarDAO() {
		//	this.tableName = "usuarios";
	    //  this.fieldsName = "idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo";
		//	this.keyField = "idUsuario";
			this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		}
	
/*	public void insert(Agendar ag) {
		String create = "insert into agendar (idAgendamento, nomeCliente, telefone, tipoServico) values (?, ?, ?, ?)";
		try {
			DBConnection co;
			
		} catch (Exception e)
		{
			System.out.println(e);
		}
	}*/
	public String[] toArray(Agendar ag) {
		return (
			
			new String [] {
					""+ag.getIdAgendamento(),
					""+ag.getNomeCliente(),
					""+ag.getTelefone(),
					""+ag.getTipoServico()
				//	""+this.getAtivo()
			}
		);
	}

	
	public void save(Agendar ag) {
		if((ag.getIdAgendamento() == 0)) {
			this.dbQuery.insert(this.toArray(ag));
		}else {
			this.dbQuery.update(this.toArray(ag));
		}
	}
	
	public void delete(Agendar ag) {
		if(ag.getIdAgendamento() > 0) {
			this.dbQuery.delete(this.toArray(ag));
		}
	}

	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idAgendamento") + "</td>";
				saida += "<td>" + rs.getString("nomeCliente") + "</td>";
				saida += "<td>" + rs.getString("telefone") + "</td>";
				saida += "<td>" + rs.getString("tipoServico") + "</td>";
			//	saida += "<td>" + rs.getString("ativo") + "</td>";
				saida += "</tr> <br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
}
