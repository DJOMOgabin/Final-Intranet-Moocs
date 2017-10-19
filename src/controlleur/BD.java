package controlleur;

import Modele.User;
import Modele.Sujet;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;



/**
 * <h1> Il est chargé d'ecrire dans un fichier xml les informations contenues de mes utilisateurs </h1>
 *
 * @author djobiii
 *
 */
public class BD 

{
	/**
	 * Le nom du fichier contenant les utilisateurs en xml
	 */
	private final static String fichier_utilisateur="utilisateur.xml";
	/**
	 * Le nom du fichier contenant les informations sur un sujet 
	 */
	private final static String fichier_sujet="sujet.xml";
	/**
	 * Le builderFactory de la classe 
	 */
	private DocumentBuilderFactory factory;
	/**
	 * Le builder de la classe
	 */
	private DocumentBuilder builder;
	/**
	 * Le document parsers de la classe 
	 */
	private Document document; 
	
	/**
	 * Le constructeur par defaut 
	 * @param null
	 */
	
	public  BD()
	{
		
		this.factory=DocumentBuilderFactory.newInstance();
		try {
			this.builder=this.factory.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * <p> Cette methode ecrit les informations sur l'utilisateur </p>
	 * @param user
	 */
	
	public void ajouterUtilisateur(User user)
	{
		
	}
	/**
	 * <p> Cette methode permet d'enregistrer les informations sur un sujet donne </p>
	 * @param sujet
	 */
	
	public void ajouterSujet(Sujet sujet)
	{
		
	}
	/**
	 * <p> Cette methode verfie si l'utilisateur user est present dans le fichier </p>
	 * @param user
	 * @return {true,false}
	 */
	
	public boolean verifierUtilisateur(User user)
	{
		return false;
	}
	/**
	 * <p> Cette methode recupere les informations sur un fichier xml concernant un certains sujet </p>
	 * @param sujet
	 */
	public void recuperSujet(Sujet sujet)
	{
		
	}
	
}