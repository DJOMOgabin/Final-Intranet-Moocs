package Modele;

<<<<<<< HEAD

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
	
	
	
	
	
=======
import java.util.Date;

public class Devoir {
private  Integer  idCours;
private String typeDevoir;
private Integer idDevoir;
private Boolean fichierAttache;
private Date dateEcheance;
private Date dateCreation;
private String commentaire;
private String etat;
/**
 * @return the idCours
 */
public Integer getIdCours() {
	return idCours;
}

/**
 * @param idCours the idCours to set
 */
public void setIdCours(Integer idCours) {
	this.idCours = idCours;
}

/**
 * @return the typeDevoir
 */
public String getTypeDevoir() {
	return typeDevoir;
}

/**
 * @param typeDevoir the typeDevoir to set
 */
public void setTypeDevoir(String typeDevoir) {
	this.typeDevoir = typeDevoir;
}

/**
 * @return the idDevoir
 */
public Integer getIdDevoir() {
	return idDevoir;
}

/**
 * @param idDevoir the idDevoir to set
 */
public void setIdDevoir(Integer idDevoir) {
	this.idDevoir = idDevoir;
}

/**
 * @return the fichierAttache
 */
public Boolean getFichierAttache() {
	return fichierAttache;
}

/**
 * @param fichierAttache the fichierAttache to set
 */
public void setFichierAttache(Boolean fichierAttache) {
	this.fichierAttache = fichierAttache;
}

/**
 * @return the dateEcheance
 */
public Date getDateEcheance() {
	return dateEcheance;
}

/**
 * @param dateEcheance the dateEcheance to set
 */
public void setDateEcheance(Date dateEcheance) {
	this.dateEcheance = dateEcheance;
}

/**
 * @return the dateCreation
 */
public Date getDateCreation() {
	return dateCreation;
}

/**
 * @param dateCreation the dateCreation to set
 */
public void setDateCreation(Date dateCreation) {
	this.dateCreation = dateCreation;
}

/**
 * @return the commentaire
 */
public String getCommentaire() {
	return commentaire;
}

/**
 * @return the etat
 */
public String getEtat() {
	return etat;
}

/**
 * @param etat the etat to set
 */
public void setEtat(String etat) {
	this.etat = etat;
}

/**
 * @param commentaire the commentaire to set
 */
public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
}

    @Override
    public String toString() {
        return "Devoir{" + "idCours=" + idCours + ", typeDevoir=" + typeDevoir + ", idDevoir=" + idDevoir + ", fichierAttache=" + fichierAttache + ", dateEcheance=" + dateEcheance + ", dateCreation=" + dateCreation + ", commentaire=" + commentaire + ", etat=" + etat + '}';
    }


>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
}
