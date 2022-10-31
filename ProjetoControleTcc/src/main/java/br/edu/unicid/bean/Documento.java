package br.edu.unicid.bean;

import java.util.Date;

public class Documento {
	private int id;
	private String nome;
	private Date dataDocumento;
	
	public Documento (int id, String nome, Date dataDocumento) {
		this.id = id;
		this.nome = nome;
		this.dataDocumento = dataDocumento;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataDocumento() {
		return dataDocumento;
	}

	public void setDataDocumento(Date dataDocumento) {
		this.dataDocumento = dataDocumento;
	}
}
