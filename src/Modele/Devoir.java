package Modele;


public class Devoir {
	private String nomCours;
	private String NoteMoyenne;
	private String nombreDevoir;
	
	public Devoir(){
		
	}
	
	public Devoir(String nomCours, String NoteMoyenne, String nombre){
		this.nomCours=nomCours;
		this.NoteMoyenne=NoteMoyenne;
		this.nombreDevoir=nombre;
	}
	
	public String getNomCours() {
		return nomCours;
	}
	public void setNomCours(String nomCours) {
		this.nomCours = nomCours;
	}
	public String getNoteMoyenne() {
		return NoteMoyenne;
	}
	public void setNoteMoyenne(String noteMoyenne) {
		NoteMoyenne = noteMoyenne;
	}
	public String getNombreDevoir() {
		return nombreDevoir;
	}
	public void setNombreDevoir(String nombreDevoir) {
		this.nombreDevoir = nombreDevoir;
	}
	
	
	
	
	
}
