package model;

public class Agendar{
	private int    idAgendamento;
	private String nomeCliente;
	private String telefone;
	private String tipoServico;
	
/*	private String tableName = "lojinha.agendar";
	private String fieldsName = "idAgendamento, nomeCliente, telefone, tipoServico";
	private String keyField = "idAgendamento";*/
	public Agendar() {
		super();
	//new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}

	public Agendar(int idAgendamento, String nomeCliente, String telefone, String tipoServico) {
	//	new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdAgendamento(idAgendamento);
		this.setNomeCliente(nomeCliente);
		this.setTelefone(telefone);
		this.setTipoServico(tipoServico);
		
	}
	
	public Agendar(String idAgendamento, String nomeCliente, String telefone, String tipoServico) {
	//	new DBQuery(this.tableName, this.fieldsName, this.keyField);
		super();
		
		this.setIdAgendamento(((idAgendamento==null)?0:Integer.valueOf(idAgendamento)));
		this.setNomeCliente(nomeCliente);
		this.setTelefone(telefone);
		this.setTipoServico(tipoServico);
		
	
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
	
	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(String tipoServico) {
		this.tipoServico = tipoServico;
	}

	


	
}
