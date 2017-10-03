package Traitement;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Duree")
public class Duree{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="jour") 
	private int jour;

	@Column(name="heure")
	private int heure;
	
	@Column(name="minute")
	private int minute;

	@Column(name="duree")
	private int duree;
	
	@Column(name="tentative")
	private int tentative;
	
	public Duree(int jour,int heure,int minute,int duree,int tentative){
		this.jour=jour;
		this.heure=heure;
		this.minute=minute;
		this.duree=duree;
		this.tentative=tentative;
	}
	
	public Duree(){}

	public int getJour() {
		return jour;
	}

	public void setJour(int jour) {
		this.jour = jour;
	}

	public int getHeure() {
		return heure;
	}

	public void setHeure(int heure) {
		this.heure = heure;
	}

	public int getMinute() {
		return minute;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}

	public int getDuree() {
		return duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public int getTentative() {
		return tentative;
	}

	public void setTentative(int tentative) {
		this.tentative = tentative;
	}
	
	
}
