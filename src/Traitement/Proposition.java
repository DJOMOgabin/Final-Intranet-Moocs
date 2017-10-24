package Traitement;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Proposition")
public class Proposition implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="propo1")
	String propo1;

	@Column(name="propo2")
	String propo2;
	
	@Column(name="propo3")
	String propo3;

	@Column(name="propo4")
	String propo4;
	
	public Proposition(String propo1,String propo2,String propo3,String propo4){
		this.propo1=propo1;
		this.propo2=propo2;
		this.propo3=propo3;
		this.propo4=propo4;
	}
	
	public Proposition(){}

	public String getPropo1() {
		return propo1;
	}

	public void setPropo1(String propo1) {
		this.propo1 = propo1;
	}

	public String getPropo2() {
		return propo2;
	}

	public void setPropo2(String propo2) {
		this.propo2 = propo2;
	}

	public String getPropo3() {
		return propo3;
	}

	public void setPropo3(String propo3) {
		this.propo3 = propo3;
	}

	public String getPropo4() {
		return propo4;
	}

	public void setPropo4(String propo4) {
		this.propo4 = propo4;
	}
	
	
}
