package controlleur;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import Modele.constante;

public class Connecteur {

	private static Connection connexion=null;
	
<<<<<<< HEAD
	//On d�finit une connexion singleton (constructeur private) pour ne pas devoir cr�er la connexion � tout moment
	private Connecteur(){
		try {
			new constante();
			System.out.println("je cr�e la connexion");
			Class.forName(constante.getDriver());
			setConnexion(DriverManager.getConnection(constante.getChaine_connexion(),constante.getUserBd(),constante.getPassBd()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("erreur de connexion : ");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection FaireConn(){
		try {
			if(getConnexion()==null || getConnexion().isClosed()){
				new Connecteur();
			}
		}catch (SQLException e){
=======
	public static Connection FaireConn(){
		try {
			if(getConnexion()==null || getConnexion().isClosed()){
				try {
					new constante();
					System.out.println("je cr�e une connexion");
					Class.forName(constante.getDriver());
					setConnexion(DriverManager.getConnection(constante.getChaine_connexion(),constante.getUserBd(),constante.getPassBd()));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println("erreur de connexion : ");
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
			}
		} catch (SQLException e) {
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			try {
				getConnexion().close();				
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			setConnexion(null);
			e.printStackTrace();
		}
		
		return getConnexion();
	}
	
	public static Connection getConnexion() {
		return connexion;
	}

	public static void setConnexion(Connection connexion) {
		Connecteur.connexion = connexion;
	}
	
	
	
}
