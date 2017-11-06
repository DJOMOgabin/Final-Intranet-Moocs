package Modele;
<<<<<<< HEAD
=======

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
import controlleur.Lecture;

public class constante 

{
	/**
	 * Le driver pour jdbc mysql en java
	 */
	protected static String driver;
	/**
	 * Le Login pour la bd en question 
	 */
	protected static String log_bd;
	/**
	 * Le mot de passe de connexion par rapport à la bd
	 */
	protected static String pass_bd;
	/**
	 * Le host\serveur par rapport à la bd
	 */
	protected static String host_bd;
	
	protected static String bd;
	
	/**
	 * La chaine de connexion pour l'instanciation en java
	 */
	 protected static String chaine_connexion;
	
	//public static final String chemin = "/usr/local/apache-tomcat-7.0.54/webapps/intranet_moocs/"; 
	public static String chemin;
	
	public constante(){
		new Lecture();
		setDriver(Lecture.getDriver());
		setLog_bd(Lecture.getUserName());
		setPass_bd(Lecture.getPassword());
		setHost_bd(Lecture.getUrl());
		setBd(Lecture.getBD());
		String chaine="jdbc:mysql://"+getHost_bd()+"/"+getBd()+"?useUnicode=true&;characterEncoding=utf8";
		setChaine_connexion(chaine);
		
	}
	
	public static String getUserBd()
	{	
		
		return log_bd;
	}
	public static String getPassBd()
	{
		
		return pass_bd;
		
	}
	public static String getHostBd()
	{
		
		return host_bd;
	}
<<<<<<< HEAD
	
=======
	/*
	public static String getPathBd()
	{
		String user = "";
		int ligne = 5;
		
		try
		{
		    File f = new File ("/var/lib/tomcat7/webapps/mooc/config.mooc");
		    FileReader fr = new FileReader (f);
		    BufferedReader br = new BufferedReader (fr);
		 
		    try
		    {
		        String line = br.readLine();
		        int compteur = 1;
		 
		        while (line != null)
		        {
		            
		            String[] userBd = line.split(":");
		            user = userBd[1].trim();
		            line = br.readLine();
		            if(compteur==ligne)
		            {
		            	break;
		            }
		            
		            compteur++;
		        }
		 
		        br.close();
		        fr.close();
		    }
		    catch (IOException exception)
		    {
		    }
		}
		catch (FileNotFoundException exception)
		{
		}


		return user;
	}
	*/
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	public static String getPortBd()
	{
		
		return Lecture.getPort();
	}

	public static String getChaine_connexion() {
		return chaine_connexion;
	}

	public static void setChaine_connexion(String chaine_connexion) {
		constante.chaine_connexion = chaine_connexion;
	}

	public static String getDriver() {
		return driver;
	}
	
	public static String getLog_bd() {
		return log_bd;
	}

	public static void setLog_bd(String log_bd) {
		constante.log_bd = log_bd;
	}

	public static String getPass_bd() {
		return pass_bd;
	}

	public static void setPass_bd(String pass_bd) {
		constante.pass_bd = pass_bd;
	}

	public static String getHost_bd() {
		return host_bd;
	}

	public static void setHost_bd(String host_bd) {
		constante.host_bd = host_bd;
	}

	public static void setDriver(String driver) {
		constante.driver = driver;
	}

	public static void setChemin(String chemin) {
		constante.chemin = chemin;
	}

	public static String getLogBd() {
		return log_bd;
	}

	public static String getChemin() {
		return chemin;
	}

	public static String getBd() {
		return bd;
	}

	public static void setBd(String bd) {
		constante.bd = bd;
	}
	
}