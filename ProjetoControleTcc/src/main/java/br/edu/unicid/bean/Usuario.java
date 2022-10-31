package br.edu.unicid.bean;

import java.util.Date;

public class Usuario {
	private int id;
	private String usuario;
	private String senha;
	private String tipoUsuario;
	private String nome;
	private String sexo;
	private String email;
	private Date dataNascimento;
	private String endereco;
	private int numero;
	
	public Usuario (int id, String usuario, String senha, String tipoUsuario, String nome, String sexo, String email, Date dataNascimento, String endereco, int numero) {
		this.id = id;
		this.usuario = usuario;
		this.senha = senha;
		this.tipoUsuario = tipoUsuario;
		this.nome = nome;
		this.sexo = sexo;
		this.email = email;
		this.dataNascimento = dataNascimento;
		this.endereco = endereco;
		this.numero = numero;
	}

	public Usuario() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) { 
		this.numero = numero;
	}
}
