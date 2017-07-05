package br.edu.ifc.concordia.inf.conanimal.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import br.edu.ifc.concordia.inf.permission.UserRoles;

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
	@Column(unique=true)
	private String email;
	private String senha;
	private String municipio;
	private String bairro;
	private String rua;
	private String complemento;
	private String uf;
	private String data_cadastro;
	private Long contribuicao;
	private String cpf;
	private String rg;
	private String profissao;
	private String razao_social;
	private String cnpj;
	private String nome_representante;
	private String cpf_representante;
	private String rg_representante;
	private Boolean autoriza_divulgar_nome;
	private int acesso = UserRoles.NORMAL.getAccessLevel();
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
	public String getData_cadastro() {
		return data_cadastro;
	}
	public void setData_cadastro(String data_cadastro) {
		this.data_cadastro = data_cadastro;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getProfissao() {
		return profissao;
	}
	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}
	public String getRazao_social() {
		return razao_social;
	}
	public void setRazao_social(String razao_social) {
		this.razao_social = razao_social;
	}
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	public String getNome_representante() {
		return nome_representante;
	}
	public void setNome_representante(String nome_representante) {
		this.nome_representante = nome_representante;
	}
	public String getCpf_representante() {
		return cpf_representante;
	}
	public void setCpf_representante(String cpf_representante) {
		this.cpf_representante = cpf_representante;
	}
	public String getRg_representante() {
		return rg_representante;
	}
	public void setRg_representante(String rg_representante) {
		this.rg_representante = rg_representante;
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
	public int getAcesso() {
		return acesso;
	}
	public void setAcesso(int acesso) {
		this.acesso = acesso;
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
