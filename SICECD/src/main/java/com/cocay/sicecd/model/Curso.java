package com.cocay.sicecd.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Curso")
public class Curso {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_id_curso")
	int pk_id_curso;
	
	@Column(name = "clave", nullable = false, length=8, unique=true)
	String clave;
	
	@Column(name = "nombre", nullable = false, length=150)
	String nombre;

	@Column(name = "horas", nullable = true)
	int horas;
	
	@Column(name = "f_inicio", nullable = true)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date fInicio;
	
	@Column(name = "f_termino", nullable = true)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date fTermino;

	@Column(name = "temp", nullable = true)
	public Integer temp;
	
	@Column(name = "stTabla", nullable = true)
	Integer stTabla;

	@ManyToOne(targetEntity=Grupo.class)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "fk_id_grupo",referencedColumnName="pk_id_grupo",insertable = true, updatable = true)
	Grupo fk_id_grupo;
	
	
	@ManyToOne(targetEntity=Tipo_curso.class)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "fk_id_tipo_curso", referencedColumnName="pk_id_tipo_curso")
	Tipo_curso fk_id_tipo_curso;
	
	@OneToMany(mappedBy = "fk_id_curso",targetEntity=Grupo.class)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Grupo> grupos = new ArrayList<>();

	@OneToMany(mappedBy = "fk_id_curso",targetEntity=Certificado.class)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Certificado> certificados = new ArrayList<>();
	
	public Curso(){}
	
	public Curso(String clave, String nombre, int horas) {
		super();
		this.clave = clave;
		this.nombre = nombre;
		this.horas = horas;
	}
	
	public int getPk_id_curso() {
		return pk_id_curso;
	}

	public void setPk_id_curso(int pk_id_curso) {
		this.pk_id_curso = pk_id_curso;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Tipo_curso getFk_id_tipo_curso() {
		return fk_id_tipo_curso;
	}

	public void setFk_id_tipo_curso(Tipo_curso fk_id_tipo_curso) {
		this.fk_id_tipo_curso = fk_id_tipo_curso;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

	public List<Grupo> getGrupos() {
		return grupos;
	}

	public void setGrupos(List<Grupo> grupos) {
		this.grupos = grupos;
	}

	public List<Certificado> getCertificados() {
		return certificados;
	}

	public void setCertificados(List<Certificado> certificados) {
		this.certificados = certificados;
	}

	public Date getfInicio() {
		return fInicio;
	}

	public void setfInicio(Date fInicio) {
		this.fInicio = fInicio;
	}

	public Date getfTermino() {
		return fTermino;
	}

	public void setfTermino(Date fTermino) {
		this.fTermino = fTermino;
	}

	public Integer getTemp() {
		return temp;
	}

	public void setTemp(Integer temp) {
		this.temp = temp;
	}

	public Integer getStTabla() {
		return stTabla;
	}

	public void setStTabla(Integer stTabla) {
		this.stTabla = stTabla;
	}
	
}