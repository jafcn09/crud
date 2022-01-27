package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the aula database table.
 * 
 */
@Entity
@NamedQuery(name="Aula.findAll", query="SELECT a FROM Aula a")
public class Aula implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int numaula;

	private int capacidad;

	@Lob
	private String descripcion;

	private boolean estado;

	private String nombre;


	public Aula() {
	}

	public int getNumaula() {
		return this.numaula;
	}

	public void setNumaula(int numaula) {
		this.numaula = numaula;
	}

	public int getCapacidad() {
		return this.capacidad;
	}

	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public boolean getEstado() {
		return this.estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return "Aula [numaula=" + numaula + ", capacidad=" + capacidad + ", descripcion=" + descripcion + ", estado="
				+ estado + ", nombre=" + nombre + "]";
	}

	



}