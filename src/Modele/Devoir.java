package Modele;


public class Devoir {
	private String nomEtudiant;
	private String nomCours;
	private String NoteMoyenne;
	private String matricule;
	private String nombreDevoir;
	
	public Devoir(){
		
	}
	
	public Devoir(String nomEtu,String nomCours, String NoteMoyenne, String matricule, String nombre){
		this.nomEtudiant=nomEtu;
		this.nomCours=nomCours;
		this.NoteMoyenne=NoteMoyenne;
		this.matricule=matricule;
		this.nombreDevoir=nombre;
	}
	
	public String getNomEtudiant() {
		return nomEtudiant;
	}
	public void setNomEtudiant(String nomEtudiant) {
		this.nomEtudiant = nomEtudiant;
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
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getNombreDevoir() {
		return nombreDevoir;
	}
	public void setNombreDevoir(String nombreDevoir) {
		this.nombreDevoir = nombreDevoir;
	}
	
	
	
	
	
}
