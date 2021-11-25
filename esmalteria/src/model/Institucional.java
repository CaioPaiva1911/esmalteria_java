package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Institucional {

	private int idInstituicao;
	private String nome;
	private String cpf_cnpj;
	private String tipoPessoa;
	private String endereco;
	private String bairro;
	private String cidade;
	private String uf;
	private String cep;
	private String telefone;
	private String email;
	private String logo;
	
	private String tableName = "lojinha.institucional";
	private String fieldsName = "idInstituicao, nome, cpf_cnpj, tipoPessoa, endereco, bairro, cidade, uf, cep, telefone, email, logo";
	private String keyField = "idInstitucional";
	
	private DBQuery dbQuery = null;
	
	public Institucional(){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}

	public Institucional(int idInstituicao, String nome, String cpf_cnpj, String tipoPessoa, String endereco, String bairro, String cidade, String uf, String cep, String telefone, String email, String logo){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdInstituicao( idInstituicao );
		this.setNome( nome );
		this.setCpf_cnpj( cpf_cnpj );
		this.setTipoPessoa( tipoPessoa );
		this.setEndereco( endereco );
		this.setBairro( bairro );
		this.setCidade( cidade );
		this.setUf( uf );
		this.setCep( cep );
		this.setTelefone( telefone );
		this.setEmail( email );
		this.setLogo( logo );
		
	}
	
	public Institucional(String idInstituicao, String nome, String cpf_cnpj, String tipoPessoa, String endereco, String bairro, String cidade, String uf, String cep, String telefone, String email, String logo){
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdInstituicao(((idInstituicao==null)?0:Integer.valueOf(idInstituicao)));
		this.setNome( nome );
		this.setCpf_cnpj( cpf_cnpj );
		this.setTipoPessoa( tipoPessoa );
		this.setEndereco( endereco );
		this.setBairro( bairro );
		this.setCidade( cidade );
		this.setUf( uf );
		this.setCep( cep );
		this.setTelefone( telefone );
		this.setEmail( email );
		this.setLogo( logo );
		
	}
	
	public String[] toArray() {
		return(
				new String[] {
					""+this.getIdInstituicao(),
					""+this.getNome(),
					""+this.getCpf_cnpj(),
					""+this.getTipoPessoa(),
					""+this.getEndereco(),
					""+this.getBairro(),
					""+this.getCidade(),
					""+this.getUf(),
					""+this.getCep(),
					""+this.getTelefone(),
					""+this.getEmail(),
					""+this.getLogo()
				}
				
		);
	}
	
	public void save() {
		if((this.getIdInstituicao() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if (this.getIdInstituicao() > 0) {
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
				saida += "<td>" + rs.getString("idInstituicao") + "</td>";
				saida += "<td>" + rs.getString("nome") + "</td>";
				saida += "<td>" + rs.getString("cpf_cnpj") + "</td>";
				saida += "<td>" + rs.getString("tipoPessoa") + "</td>";
				saida += "<td>" + rs.getString("endereco") + "</td>";
				saida += "<td>" + rs.getString("bairro") + "</td>";
				saida += "<td>" + rs.getString("cidade") + "</td>";
				saida += "<td>" + rs.getString("uf") + "</td>";
				saida += "<td>" + rs.getString("cep") + "</td>";
				saida += "<td>" + rs.getString("telefone") + "</td>";
				saida += "<td>" + rs.getString("email") + "</td>";
				saida += "<td>" + rs.getString("logo") + "</td>";
				saida += "</tr><br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	
	public int getIdInstituicao() {
		return idInstituicao;
	}

	public void setIdInstituicao(int idInstituicao) {
		this.idInstituicao = idInstituicao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf_cnpj() {
		return cpf_cnpj;
	}

	public void setCpf_cnpj(String cpf_cnpj) {
		this.cpf_cnpj = cpf_cnpj;
	}

	public String getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(String tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
	

}
