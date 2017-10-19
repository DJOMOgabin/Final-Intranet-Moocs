package Traitement;

public class ObjetDevoir {

	private String nom,devoir,date,code;
	public ObjetDevoir(String code,String nom,String devoir,String date){
		this.nom=nom;
		this.code=code;
		this.date=date;
		this.devoir=devoir;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDevoir() {
		return devoir;
	}
	public void setDevoir(String devoir) {
		this.devoir = devoir;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
