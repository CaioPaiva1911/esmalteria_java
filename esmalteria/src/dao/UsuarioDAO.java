package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonObject;

import database.DB;
import database.DBQuery;
import model.Usuario;

public class UsuarioDAO extends Usuario {
	private String tableName = "lojinha.usuarios";
	private String fieldsName = " idUsuario,  email,  senha,  idNivelUsuario,  nome,  cpf,  endereco, bairro,  cidade, uf,  cep,  telefone, foto, ativo";
	private String keyField = "idUsuario";
	// private String where = "";
	private DBQuery dbQuery;
	
	//@Override;
	public UsuarioDAO(){
		//super();
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
	}
	
	
	public UsuarioDAO(int idUsuario, String email, String senha, int idNivelUsuario, String nome, String cpf,
			String endereco, String bairro, String cidade, String uf, String cep, String telefone, String foto,
			String ativo) {
		/*super(idUsuario,  email,  senha,  idNivelUsuario,  nome,  cpf,
				 endereco,  bairro,  cidade,  uf,  cep,  telefone,  foto,
				 ativo); */
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setCpf(cpf);
		this.setEndereco(endereco);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setUf(uf);
		this.setCep(cep);
		this.setTelefone(telefone);
		this.setFoto(foto);
		this.setAtivo(ativo);
		
	}

	public UsuarioDAO(String idUsuario, String email, String senha, String idNivelUsuario, String nome, String cpf,
			String endereco, String bairro, String cidade, String uf, String cep, String telefone, String foto,
			String ativo) {
		/*super(idUsuario,  email,  senha,  idNivelUsuario,  nome,  cpf,
				 endereco,  bairro,  cidade,  uf,  cep,  telefone,  foto,
				 ativo); */
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdUsuario(((idUsuario == null) ? 0 : Integer.valueOf(idUsuario)));
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(((idNivelUsuario == null) ? 1 : Integer.valueOf(idNivelUsuario)));
		this.setNome(nome);
		this.setCpf(cpf);
		this.setEndereco(endereco);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setUf(uf);
		this.setCep(cep);
		this.setTelefone(telefone);
		this.setFoto(foto);
		this.setAtivo(ativo);
		
	}


	public String[] toArray() {
		return (new String[] { "" + this.getIdUsuario(), "" + this.getEmail(), "" + this.getSenha(),
				"" + this.getIdNivelUsuario(), "" + this.getNome(), "" + this.getCpf(), "" + this.getEndereco(),
				"" + this.getBairro(), "" + this.getCidade(), "" + this.getUf(), "" + this.getCep(),
				"" + this.getTelefone(), "" + this.getFoto(), "" + this.getAtivo() });
	}

	public void save() {
		if ((this.getIdUsuario() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}

	public void delete() {
		if (this.getIdUsuario() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}

	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";

		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idUsuario") + "</td>";
				saida += "<td>" + rs.getString("email") + "</td>";
				saida += "<td>" + rs.getString("senha") + "</td>";
				saida += "<td>" + rs.getString("idNivelUsuario") + "</td>";
				saida += "<td>" + rs.getString("nome") + "</td>";
				saida += "<td>" + rs.getString("cpf") + "</td>";
				saida += "<td>" + rs.getString("endereco") + "</td>";
				saida += "<td>" + rs.getString("bairro") + "</td>";
				saida += "<td>" + rs.getString("cidade") + "</td>";
				saida += "<td>" + rs.getString("uf") + "</td>";
				saida += "<td>" + rs.getString("cep") + "</td>";
				saida += "<td>" + rs.getString("telefone") + "</td>";
				saida += "<td>" + rs.getString("foto") + "</td>";
				saida += "<td>" + rs.getString("ativo") + "</td>";
				saida += "</tr><br>";

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	public ResultSet login(String email, String senha)
	{
		
		try {
			ResultSet rs = DB.executarQuery("SELECT idUsuario, email, senha, idNivelUsuario, nome FROM usuarios where email = '" + email + "' AND senha = '" + senha + "'");
			String sql = "SELECT idUsuario, email, senha, idNivelUsuario, nome FROM usuarios where email = '" + email + "' AND senha = '" + senha + "'";
			System.out.println(sql);
			if(rs != null){
				return rs;
			}
		} catch (Exception e) {
			System.out.print(e);
		}
		return null;
				/*
				if (usuario == null || senha == null) {
					out.println("Preencha os dados.");
				} else {
					if (i > 0) {
						session.setAttribute("nomeUsuario", nomeUsuario);
						//out.println(usuario);
						response.sendRedirect("usuarios.jsp");
					} else {
						out.println("Dados incorretos!");
					}
				}
				*/
	}
	
	
	
	
}
