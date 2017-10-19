package Modele;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import Traitement.ReponseQuestion;

@Entity(name="Reponse")
public class Reponse{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int id;
	
	@Column(name="idCopie")
	private int idCopie;

	@Transient
	private ArrayList<ReponseQuestion> suiteReponse=new ArrayList<ReponseQuestion>();
	
	public Reponse(){}

	public ArrayList<ReponseQuestion> getSuiteReponse() {
		return suiteReponse;
	}

	public void setSuiteReponse(ArrayList<ReponseQuestion> suiteReponse) {
		this.suiteReponse = suiteReponse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdCopie() {
		return idCopie;
	}

	public void setIdCopie(int idCopie) {
		this.idCopie = idCopie;
	}
	
}
	
