package Modele;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Point")
public class Point implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="juste")
	private float juste;

	@Column(name="mauvais")
	private float mauvais;

	@Column(name="aucun")
	private float aucun;
	
	public Point(float juste,float mauvais,float aucun){
		this.juste=juste;
		this.mauvais=mauvais;
		this.aucun=aucun;
	}
	
	public Point(){}
	
	public float getJuste() {
		return juste;
	}
	public void setJuste(float juste) {
		this.juste = juste;
	}
	public float getMauvais() {
		return mauvais;
	}
	public void setMauvais(float mauvais) {
		this.mauvais = mauvais;
	}
	public float getAucun() {
		return aucun;
	}
	public void setAucun(float aucun) {
		this.aucun = aucun;
	}
	
	
}