package Modele;

import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import Traitement.Duree;
import Traitement.ExerciceEntier;

	@Entity(name="Epreuve")
	public class Epreuve{
		

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY) 
		private int id;
		
		@Column(name="titre")
		private String titre;
		

		@Column(name="matiere")
		private String matiere;
		
		
		@Column(name="indicative")
		private String indicative;

		@Transient
		private ArrayList<ExerciceEntier> exercice=new ArrayList<ExerciceEntier>();

		@OneToOne(cascade = CascadeType.ALL)
		private Point point;
		
		@OneToOne(cascade = CascadeType.ALL)
		private Duree duree;
		
		
		public Epreuve(){
			
		}
		
		
		public Duree getDuree() {
			return duree;
		}


		public void setDuree(Duree duree) {
			this.duree = duree;
		}


		public Point getPoint() {
			return point;
		}



		public String getMatiere() {
			return matiere;
		}


		public void setMatiere(String matiere) {
			this.matiere = matiere;
		}


		public void setPoint(Point point) {
			this.point = point;
		}



		public String getIndicative() {
			return indicative;
		}



		public void setIndicative(String indicative) {
			this.indicative = indicative;
		}



		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public Epreuve(String titre){
			this.titre=titre;
		}

		public String getTitre() {
			return titre;
		}

		public void setTitre(String titre) {
			this.titre = titre;
		}

		public ArrayList<ExerciceEntier> getExercice() {
			return exercice;
		}

		public void setExercice(ArrayList<ExerciceEntier> exercice) {
			this.exercice = exercice;
		}
		
}
