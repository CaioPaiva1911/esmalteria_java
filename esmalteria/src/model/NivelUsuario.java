package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class NivelUsuario {
	
	private int idNivelUsuario;
	private String nivel;
	
	private String tableName = "lojinha.nivelusuarios";
	private String fieldsName = "idNivelUsuario, nivel";
	private String keyField = "idNivelUsuario";
	
	private DBQuery dbQuery = null;
	
	public NivelUsuario(){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public NivelUsuario( int idNivelUsuario, String nivel) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdNivelUsuario( idNivelUsuario );
		this.setNivel(nivel);
	}
	
	public NivelUsuario( String idNivelUsuario, String nivel) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdNivelUsuario(((idNivelUsuario==null)?0:Integer.valueOf(idNivelUsuario)));
		this.setNivel(nivel);
	}
	
	public String[] toArray() {
		return(
				new String[] {
					""+this.getIdNivelUsuario(),
					""+this.getNivel()
				}
				
		);
	}
	
	public void save() {
		if((this.getIdNivelUsuario() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if (this.getIdNivelUsuario() > 0) {
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
				saida += "<td>" + rs.getString("idNivelUsuario") + "</td>";
				saida += "<td>" + rs.getString("nivel") + "</td>";
				saida += "</tr><br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}

	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	
	
	
	
}
