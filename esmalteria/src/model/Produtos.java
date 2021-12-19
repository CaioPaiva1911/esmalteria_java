package model;

public class Produtos {
	private int idProduto;
	private String fabricante;
	private String nome;
	private String marca;
	private int idCategoria;
	private String descricao;
	private String unidadeMedida;
	private double peso;
	private String cor;

	public Produtos(String fabricante, String nome, String marca,int idCategoria ,String descricao,
			String unidadeMedida, double peso, String cor) {
		super();
		this.fabricante = fabricante;
		this.nome = nome;
		this.marca = marca;
		this.idCategoria = idCategoria;
		this.descricao = descricao;
		this.unidadeMedida = unidadeMedida;
		this.peso = peso;
		this.cor = cor;
	}
	
	public Produtos(int idProduto, String fabricante, String nome, String marca,int idCategoria, String descricao,
			String unidadeMedida, double peso, String cor) {
		super();
		this.idProduto = idProduto;
		this.fabricante = fabricante;
		this.nome = nome;
		this.marca = marca;
		this.idCategoria = idCategoria;
		this.descricao = descricao;
		this.unidadeMedida = unidadeMedida;
		this.peso = peso;
		this.cor = cor;
	}



	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getUnidadeMedida() {
		return unidadeMedida;
	}

	public void setUnidadeMedida(String unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
	
	
	
	
	
	
	
	
}
