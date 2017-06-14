package br.edu.ifc.concordia.inf.conanimal.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="users")
@Table(name="users")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String nome;
	private String telefone;
	private String celular;
	private String email;
	private String senha;
	private String municipio;
	private String bairro;
	private String rua;
	private String complemento;
	private String uf;
	private String data_de_cadastro;
	private Long contribuicao;
	private Boolean autoriza_divulgar_nome;
	private Boolean administrador;
	private Boolean ativo;
	private Boolean empresa;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getData_de_cadastro() {
		return data_de_cadastro;
	}
	public void setData_de_cadastro(String data_de_cadastro) {
		this.data_de_cadastro = data_de_cadastro;
	}
	public Long getContribuicao() {
		return contribuicao;
	}
	public void setContribuicao(Long contribuicao) {
		this.contribuicao = contribuicao;
	}
	public Boolean getAutoriza_divulgar_nome() {
		return autoriza_divulgar_nome;
	}
	public void setAutoriza_divulgar_nome(Boolean autoriza_divulgar_nome) {
		this.autoriza_divulgar_nome = autoriza_divulgar_nome;
	}
	public Boolean getAdministrador() {
		return administrador;
	}
	public void setAdministrador(Boolean administrador) {
		this.administrador = administrador;
	}
	public Boolean getAtivo() {
		return ativo;
	}
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	public Boolean getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Boolean empresa) {
		this.empresa = empresa;
	}
}
