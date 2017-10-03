package Traitement;

import Modele.Examen;

public class ObjetExam {

	private int id;
	private String nomExam;
	private int jour,heure,duree,minute;
	private boolean vue=true;
	private int essai;
	private int max;
	
	public ObjetExam(int id,String nomExam,String heure,String minute,int duree,int essai,String signe,int Max){
		this.id=id;
		this.nomExam=nomExam;
		this.duree=duree;
		this.essai = essai;
		this.max=Max;
		if(signe.charAt(0)!='-'){
			if(Integer.parseInt(heure)>=0&&Integer.parseInt(minute)>=0){
				this.jour=Integer.parseInt(heure)/24;
				this.heure=Integer.parseInt(heure)%24;
				this.minute=Integer.parseInt(minute);
			}else{
				this.jour=0;
				this.heure=0;
				this.minute=0;
			}
		}else{
			this.jour=0;
			this.heure=0;
			this.minute=0;
		}
		
		
		if(this.jour==0 && this.heure==0 && this.minute==0){
			Examen.ChangerVue(id+"", nomExam);
			setVue(false);
		}
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	public int getDuree() {
		return duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public int getMinute() {
		return minute;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}

	public String getNomExam() {
		return nomExam;
	}

	public void setNomExam(String nomExam) {
		this.nomExam = nomExam;
	}
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

	public boolean isVue() {
		return vue;
	}

	public void setVue(boolean vue) {
		this.vue = vue;
	}

	public int getEssai() {
		return essai;
	}

	public void setEssai(int essai) {
		this.essai = essai;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	
}
