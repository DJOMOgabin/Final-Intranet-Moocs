package Traitement;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="ReponseQuestion")
public class ReponseQuestion{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="idCopie")
	private int idCopie;
	
	@Column(name="idReponse")
	private int idReponse;
	
	@Column(name="reponse")
	private int reponse;
	
	@Column(name="proposition")
	private int proposition;

	public int getIdCopie() {
		return idCopie;
	}

	public void setIdCopie(int idCopie) {
		this.idCopie = idCopie;
	}

	public int getIdReponse() {
		return idReponse;
	}

	public void setIdReponse(int idReponse) {
		this.idReponse = idReponse;
	}

	public int getReponse() {
		return reponse;
	}

	public void setReponse(int reponse) {
		this.reponse = reponse;
	}

	public int getProposition() {
		return proposition;
	}

	public void setProposition(int proposition) {
		this.proposition = proposition;
	}
		
}
