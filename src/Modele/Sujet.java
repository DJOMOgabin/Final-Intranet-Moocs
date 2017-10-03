package Modele;


/**
 * <h1> Cette classe contient les informations sur un sujet donné </h1>
 * @author djobiii
 *
 */


import java.util.HashMap;
import java.util.Date;
import java.util.ArrayList;

public class Sujet 

{
	/**
	 * Le titre du sujet 
	*/
		private String titreSujet;
	/**
	 * 	La liste des message et les utilisateurs
	 */
		private HashMap<String,String> listeSujet;
	
	/**
	 * Les dates des messages en question
	 */
		private ArrayList<Date> listeDates;
		
	/**
	 * Le constructeur par defaut
	 * @param null 
	 */
		
		public Sujet()
		{
			this.titreSujet="";
			this.listeSujet=new HashMap<String,String>();
			this.listeDates=new ArrayList<Date>();
		}

	/**
	 * @return the titreSujet
	 */
	public String getTitreSujet() {
		return titreSujet;
	}

	/**
	 * @param titreSujet the titreSujet to set
	 */
	public void setTitreSujet(String titreSujet) {
		this.titreSujet = titreSujet;
	}

	/**
	 * @return the listeSujet
	 */
	public HashMap<String, String> getListeSujet() {
		return listeSujet;
	}

	/**
	 * @param listeSujet the listeSujet to set
	 */
	public void setListeSujet(HashMap<String, String> listeSujet) {
		this.listeSujet = listeSujet;
	}

	/**
	 * @return the listeDates
	 */
	public ArrayList<Date> getListeDates() {
		return listeDates;
	}

	/**
	 * @param listeDates the listeDates to set
	 */
	public void setListeDates(ArrayList<Date> listeDates) {
		this.listeDates = listeDates;
	}
		
	/**
	 * Cette methode ajoute un utilisateur et son message
	 * @param  User
	 * @param String message
	 */
	public void ajoutMessage(User user, String message)
	{
		
		this.listeDates.add(new Date());
		this.listeSujet.put(user.getLogin(),message);
		
	}
	
}