package Modele;

import java.io.File;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class LocalSearch implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private static final String fichier_cours = "‪cours.xml";
	private String[] categories;
	private String[] languages;
	private String keyword;
	private boolean foundInLocal = true;
	private Set<String> resultList = new TreeSet<String>();
	/**
	 * <p> L'autorisation de l'utilisateur par rapport au site </p>
	 * <p> Elle prend deux valeurs V,F </p>
	 * <p> Si elle vaut V alors il est valide au site </p>
	 * <p> Sinon il n'est pas valide pour le site </p> 
	 */
	private char autorisation;
	/**
	 * Le login par rapport � la connexion � la bd
	 */
	final static String log_bd="root";
	/**
	 * Le mot de passe de connexion par rapport � la bd
	 */
	final static String pass_bd="root@sql";
	/**
	 * Le host\serveur par rapport � la bd
	 */
	final String host_bd="192.168.1.119";
	/**
	 * La chaine de connexion pour l'instanciation en java
	 */
	final static String chaine_connexion="jdbc:mysql://127.0.0.1/intranet_mooc";
	
	final static String driver="com.mysql.jdbc.Driver";

	public LocalSearch(String string, String[] strings, String[] strings2) {
		this.keyword = string;
		this.categories = strings;
		this.languages = strings2;
	}

	public LocalSearch() {
		keyword = " ";
		categories = new String[] { "Artificial Intelligence", "Enginnering",
				"Tech and Design", "Software Enginneering", "TechDesign" };
		languages = new String[] { "Anglais", "Francais" };
		foundInLocal = true;
	}

	public String[] getCategories() {
		return categories;
	}

	public void setCategories(String[] categories) {
		this.categories = categories;
	}

	public String[] getLanguages() {
		return languages;
	}

	public void setLanguages(String[] languages) {
		this.languages = languages;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public boolean isFoundInLocal() {
		return foundInLocal;
	}

	public void setFoundInLocal(boolean foundInLocal) {
		this.foundInLocal = foundInLocal;
	}

	public Set<String> getResultList() {
		return resultList;
	}

	public void setResultList(Set<String> resultList) {
		this.resultList = resultList;
	}

	static Element lireFichier(Document document, String fichier)
			throws Exception {
			/*
			 * Etape 1 : récupération d'une instance de la classe
		"DocumentBuilderFactory"
			 */
			final DocumentBuilderFactory factory =
					DocumentBuilderFactory.newInstance();

			/*
			 * Etape 2 : création d'un parseur
			 */
			final DocumentBuilder builder =
					factory.newDocumentBuilder();
			/*
			 * Etape 3 : création d'un Document
			 */
			document= builder.parse(new
					File(fichier_cours));
			/*
			 * Etape 4 : récupération de l'Element racine
			 */
			final Element racine = document.getDocumentElement();
			return racine;
		}

	public Set<String> getCoursesNames(Document document)
			throws Exception {
		/**
		 * Recupération des fils de la racine qui sont des cours
		 */
		Set<String> queryResult=new TreeSet<String>();
		Element racine =lireFichier(document, fichier_cours);
		final NodeList racineNoeuds = racine.getElementsByTagName("cours");
		final int nbRacineNoeuds = racineNoeuds.getLength();
		this.setFoundInLocal(true);
		for(int i=0;i<languages.length;i++){
			for(int r=0;r<categories.length;r++){
				for (int j = 0; j<nbRacineNoeuds; j++) {
					final Element cours = (Element)
							racineNoeuds.item(j);
					final NodeList titreChilds = cours.getElementsByTagName("titre");
					final int nbFilsTitre=titreChilds.getLength();
					for(int k=0;k<nbFilsTitre;++k){
						Node elem=titreChilds.item(k);
						if(elem.getTextContent().toLowerCase().contains(keyword.toLowerCase())){
							if(getChildByTagName("langue",cours).getTextContent().equalsIgnoreCase(languages[i])){
								if(getChildByTagName("categorie",cours).getTextContent().equalsIgnoreCase(categories[r]))
								queryResult.add(elem.getTextContent());
							}
						}
					}
				}
			}
		}
		return queryResult;
	}

	static Element getChildByTagName(String chldName,Element parent){
		Element elem=null;
		NodeList l=parent.getChildNodes();
		for(int i=0;i<l.getLength();i++){
			if(l.item(i).getNodeName().equalsIgnoreCase(chldName)){
				elem=(Element) l.item(i);
			}
		}
		return elem;
	}

	public static Connection ouvrirBD() throws SQLException,ClassNotFoundException
  	{
  		Connection conn=null;
  		
  		try{
  			
  			Class.forName(new constante().driver);
  			conn=DriverManager.getConnection(new constante().chaine_connexion,new constante().log_bd,new constante().pass_bd);
  			
  			
  		}catch(SQLException e)
  		{
  			
  			throw new SQLException("Erreur\nDetails "+e.getMessage());
  			
  		}catch(ClassNotFoundException e)
  		{
  			throw new ClassNotFoundException("Erreur\nDetails "+e.getMessage());
  		}
  		return conn;
  		
  	}
	
	public Set<String> rechercheBD() throws ClassNotFoundException, SQLException{
		ResultSet resultats = null;
		String requete = "SELECT titrecours FROM cours";
		Statement stmt=null;
		Connection con=ouvrirBD();
		for(int i=0;i<this.getCategories().length;i++){
				requete = "SELECT titrecours FROM cours WHERE categoriecours LIKE '%"+this.getCategories()[i]+"%'";
				if(!this.getKeyword().equals(null)){
					requete+="AND titrecours LIKE '%"+this.getKeyword()+"%'";
				}
				try {
					stmt = con.createStatement();
					resultats = stmt.executeQuery(requete);
				} catch (SQLException e) {
					//traitement de l'exception
				}
				String titrecours="";
				while (resultats.next()) {
					titrecours=resultats.getString("titrecours");
					resultList.add(titrecours);
				}
		}
		return resultList;
	}

}