package Traitement;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;





@Entity(name="ExerciceEntier")
public class ExerciceEntier  implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne(cascade = CascadeType.ALL)
	private EnonceExercice enonceExercice;

	@Column(name="idEpreuve")
	private int idEpreuve;
	
	@Transient
	private ArrayList<Question> question;
	
	public ExerciceEntier(){}

	public EnonceExercice getExercice() {
		return enonceExercice;
	}

	public void setExercice(EnonceExercice exercice) {
		this.enonceExercice = exercice;
	}
	

	public int getIdEpreuve() {
		return idEpreuve;
	}

	public void setIdEpreuve(int idEpreuve) {
		this.idEpreuve = idEpreuve;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getId(){
		return this.id;
	}


	public ArrayList<Question> getQuestion() {
		return question;
	}

	public void setQuestion(ArrayList<Question> question) {
		this.question = question;
	}
	
}
