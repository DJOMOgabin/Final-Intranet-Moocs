package forum;

import Modele.User; 
import java.util.Date; 
import java.text.DateFormat;


public class Message {
	
	private String auteur ; 
	private String sujet; 
	private String texte; 
	private Date dateCreation = new Date(); 
	
	public Message()
	{
		this.auteur = null;
		this.sujet = null; 
		this.texte= null; 
	}
	
	public Message(String auteur, String sujet)
	{
		this.auteur = auteur; 
		this.sujet = sujet; 
	}
	
	public Message(String auteur , String sujet, String texte )
	{
		this.auteur = auteur ; 
		this.sujet = sujet; 
		this.texte = texte; 
	}
	
	public Message(String auteur, String sujet, Date datecreation)
	{
		this.auteur = auteur; 
		this.sujet = sujet ; 
		this.dateCreation = datecreation ; 
	}
	
	public Message(String auteur, String sujet , String texte,Date dateCreation)
	{

		this.auteur = auteur ; 
		this.sujet = sujet; 
		this.texte = texte;
		this.dateCreation= dateCreation ; 
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
	 * @return the auteur
	 */
	public String getAuteur() {
		return auteur;
	}

	/**
	 * @param auteur the auteur to set
	 */
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}

	/**
	 * @return the sujet
	 */
	public String getSujet() {
		return sujet;
	}

	/**
	 * @param sujet the sujet to set
	 */
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}

	/**
	 * @return the texte
	 */
	public String getTexte() {
		return texte;
	}

	/**
	 * @param texte the texte to set
	 */
	public void setTexte(String texte) {
		this.texte = texte;
	}
	
	public  boolean estEcritPar(User auteur)
	{
		return this.auteur.equals(auteur.getLogin()); 
	}
	
	
	private static DateFormat formatDate = DateFormat.getDateInstance(DateFormat.MEDIUM);
	private static DateFormat formatHeure = DateFormat.getTimeInstance(DateFormat.SHORT);
	
	public String toString()
	{
		return "De "+this.auteur+" le "+formatDate.format(this.dateCreation)+"\u00e00"+formatHeure.format(this.dateCreation)+"\nSujet : "+this.sujet+"\n"+this.texte; 
	}
	
	
	
	

}