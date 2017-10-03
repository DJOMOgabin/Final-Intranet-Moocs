package Modele;

import java.sql.Time;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.sun.jmx.snmp.Timestamp;

@Entity(name="copie")
public class CopieEtudiant {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int id;
	
	@Column(name="duree")
	private double duree;
	
	@Column(name="Max")
	private double Max=0.0;

	@Transient
	private ArrayList<Reponse> reponseExercice = null;
	
	@Column(name="total")
	private int totalTentative;

	@Column(name="tentative")
	private int nombreTentative;

	@Column(name="possible")
	private boolean possible;

	@Column(name="note")
	private double note;

	@Column(name="idEtudiant")
	private String idEtudiant;
	
	@Column(name="createTime")
	private java.sql.Timestamp date = new java.sql.Timestamp(new Timestamp().getDateTime());
	
	@Column(name="hour")
	private Time time = new Time(new Timestamp().getDateTime());
	
	@Column(name="cours")
	private String nomCours;
	
	@Column(name="epreuve")
	private String nomEpreuve;
	
	public int getNombreTentative() {
		return nombreTentative;
	}
	public void setNombreTentative(int nombreTentative) {
		this.nombreTentative = nombreTentative;
	}
	public double getNote() {
		return note;
	}
	public void setNote(double note) {
		this.note = note;
	}
	public String getIdEtudiant() {
		return idEtudiant;
	}
	public void setIdEtudiant(String idEtudiant) {
		this.idEtudiant = idEtudiant;
	}
	public boolean isPossible() {
		return possible;
	}
	public void setPossible(boolean possible) {
		this.possible = possible;
	}
	public void dispo(){
		if(getTotalTentative()-getNombreTentative()>0 && reste()>0) setPossible(true);
		else setPossible(false);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ArrayList<Reponse> getReponse() {
		return reponseExercice;
	}
	public void setReponse(ArrayList<Reponse> reponse) {
		this.reponseExercice = reponse;
	}
	public int getTotalTentative() {
		return totalTentative;
	}
	public void setTotalTentative(int totalTentative) {
		this.totalTentative = totalTentative;
	}
	public String getNomCours() {
		return nomCours;
	}
	public void setNomCours(String nomCours) {
		this.nomCours = nomCours;
	}
	public String getNomEpreuve() {
		return nomEpreuve;
	}
	public void setNomEpreuve(String nomEpreuve) {
		this.nomEpreuve = nomEpreuve;
	}
	public double getDuree() {
		return duree;
	}
	public void setDuree(double duree) {
		this.duree = duree;
	}
	public ArrayList<Reponse> getReponseExercice() {
		return reponseExercice;
	}
	public void setReponseExercice(ArrayList<Reponse> reponseExercice) {
		this.reponseExercice = reponseExercice;
	}
	public java.sql.Timestamp getDate() {
		return date;
	}
	public void setDate(java.sql.Timestamp date) {
		this.date = date;
	}
	
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public double getMax() {
		return Max;
	}
	public void setMax(double max) {
		Max = max;
	}
	@SuppressWarnings("deprecation")
	public double reste(){
		double time = getDuree();
		getDate().setHours(getTime().getHours());
		getDate().setMinutes(getTime().getMinutes());
		getDate().setSeconds(getTime().getSeconds());
		if(time==0) return 0.0;
		else{
			int t = (int)(time*60*60);
			double d=0;
			java.sql.Timestamp date = new java.sql.Timestamp(new Timestamp().getDateTime());
			int h = t%60;
			getDate().setSeconds(getDate().getSeconds()+h);
			t -=h;
			t /=60;
			h = t%60;
			getDate().setMinutes(getDate().getMinutes()+h);
			h = t/60;
			getDate().setHours(getDate().getHours()+h);			
			
			d += getDate().getHours()-date.getHours();
			d +=  (getDate().getMinutes()-date.getMinutes())/60.0;
			d += ((getDate().getSeconds()-date.getSeconds())/60.0)/60.0;			
			if(getDate().after(date)){
				if(d<0)d+=24;
			}else {
				if(d>0) d-=24;
			}
			return d;
		}
	}
	
	
}
