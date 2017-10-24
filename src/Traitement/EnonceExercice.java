package Traitement;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="EnonceExercice")
public class EnonceExercice implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="titre")
	private String titre;

	@Column(name="enonce")
	private String enonce;
	
	public EnonceExercice(String titreExercice, String enonce){
		this.titre=titreExercice;
		this.enonce=enonce;
	}
	
	public EnonceExercice(){}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getEnonce() {
		return enonce;
	}

	public void setEnonce(String enonce) {
		this.enonce = enonce;
	}
	
	
}
