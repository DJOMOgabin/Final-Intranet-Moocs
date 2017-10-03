package forum;

/**
 * Cette Classe est supposé permettre la connexion à 
 * notre base de données pour le forum 
 * @author djobiii
 *
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Modele.Quiz;
import Modele.constante;

public class ConnecteurForum 

{
	private String driver;
	private String chaineConnexion;
	private String login; 
	private String password;
	
	public ConnecteurForum()
	{
		this.driver = null; 
		new constante();
		this.chaineConnexion = constante.getChaine_connexion(); 
		this.login = constante.getUserBd(); 
		this.password = constante.getPassBd(); 
	}
	
	public ConnecteurForum(String driver, String chaineConnexion, String login, String password)
	{
		new constante();
		this.driver = constante.getDriver(); 
		this.chaineConnexion = constante.getChaine_connexion(); 
		this.login = constante.getUserBd(); 
		this.password = constante.getPassBd(); 
	}
	
	private Connection connexion; 
	
	public void setDriver(String driver) throws SQLException
	{
		this.driver = driver ; 
		fermerConnexion();
	}
	
	public void setChaineConnexion(String chaineConnexion) throws SQLException
	{
		this.chaineConnexion = chaineConnexion; 
		fermerConnexion();
	}
	
	public void setLogin(String login) throws SQLException
	{
		this.login = constante.getUserBd(); 
		fermerConnexion();
	}
	
	public void setPassword(String password) throws SQLException
	{
		this.password = constante.getPassBd();  
		fermerConnexion();
		
	}
	
	public void fermerConnexion() throws SQLException
	{
		if(this.connexion != null && !this.connexion.isClosed())
		{
			this.connexion.close();
		}
	}
	
	public Connection getConnexion() throws SQLException
	{
		try{
			
			if(this.connexion== null || this.connexion.isClosed())
			{
				Class.forName(driver);
				
				if(login != null)
				{
					this.connexion = DriverManager.getConnection(this.chaineConnexion, this.login, this.password);
				}
				
				else{
					
					this.connexion= DriverManager.getConnection(this.chaineConnexion);
					
				}
					
				
			}

			return this.connexion; 
		
			
		}catch(ClassNotFoundException ex)
		{
			throw new SQLException("Classe Introuvable "+ex.getMessage());
		}
	}
	
		public String toString(){
			
			return this.chaineConnexion+"\n"+this.driver+"\n"+this.login+"\n"+this.password;
		}
	
		public ArrayList<String> getListeNom() throws SQLException
		{
			ArrayList<String> listeNom = new ArrayList<String>();
				
			try{
				
				Connection conn = this.getConnexion(); 
				Statement stat = conn.createStatement();
				
				ResultSet rs = stat.executeQuery(" select  nom as nom from etudiant ");
				
				while(rs.next())
				{
					listeNom.add(rs.getString("nom"));
				}
				
				rs.close();
				stat.close();
				conn.close();
				
			}catch(SQLException ex)
			{
				throw new SQLException(" Erreur dans commande : "+ex.getMessage());
			}
			
			return listeNom; 
		}
		
		public ArrayList<String> getListeCours(String categorie) throws SQLException{
			
			ArrayList<String> listeNom = new ArrayList<String>();
			
			try{
				
				Connection conn = this.getConnexion(); 
				Statement stat = conn.createStatement();
				
				ResultSet rs = stat.executeQuery(" select  distinct(titrecours) as nom from cours where categoriecours like '%"+categorie+"%'");
				
				while(rs.next())
				{
					listeNom.add(rs.getString("nom"));
				}
				
				rs.close();
				stat.close();
				conn.close();
				
			}catch(SQLException ex)
			{
				throw new SQLException(" Erreur dans commande : "+ex.getMessage());
			}
			
			return listeNom; 
		}
	
		public ArrayList<String> getListeCours() throws SQLException
		{
			ArrayList<String> listeNom = new ArrayList<String>();
				
			try{
				
				Connection conn = this.getConnexion(); 
				Statement stat = conn.createStatement();
				
				ResultSet rs = stat.executeQuery(" select  distinct(titrecours) as nom from cours where  ouvert = 1");
				
				while(rs.next())
				{
					listeNom.add(rs.getString("nom"));
				}
				
				rs.close();
				stat.close();
				conn.close();
				
			}catch(SQLException ex)
			{
				throw new SQLException(" Erreur dans commande : "+ex.getMessage());
			}
			
			return listeNom; 
		}
		
		public void supprimeCours(String titrecours)
		{
			
			try{
			Connection conn = this.getConnexion();
			Statement stat = conn.createStatement();
			
			String query = "update cours set ouvert = 0 where titrecours like '%"+titrecours+"%'";
			
			System.out.println(query);
			stat.executeUpdate(query);
			stat.close();
			conn.close();
			
		}catch(SQLException ex)
		{
			System.out.println("Error : "+ex.getMessage());
		}
			
		}
		
		public void ouvrirCours(String titrecours)
		{
			
			try{
			Connection conn = this.getConnexion();
			Statement stat = conn.createStatement();
			
			String query = "update cours set ouvert = 1 where titrecours like '%"+titrecours+"%'";
			
			System.out.println(query);
			stat.executeUpdate(query);
			stat.close();
			conn.close();
			
		}catch(SQLException ex)
		{
			System.out.println("Error : "+ex.getMessage());
		}
			
		}
		
		public void supprimerComplement(String complement)
		{
			try{
				
				Connection conn = this.getConnexion();
				Statement stat = conn.createStatement();
				
				String query = "delete from complement_video where complement = trim(\""+complement+"\")";
				System.out.println(query);
				stat.executeUpdate(query);
				stat.close();
				conn.close();
				
			}catch(SQLException ex)
			{
				System.out.println("Error : "+ex.getMessage());
			}
		}
		
		public void supprimervideo(String video, int idcours)
		{
			try{
			
				Connection conn = this.getConnexion();
				Statement stat = conn.createStatement();
				
				String query = "delete from video where id_cours = "+idcours+" and video = '"+video+"'";
				System.out.println(query);
				stat.executeUpdate(query);
				stat.close();
				conn.close();
			}catch(SQLException ex){System.out.println(ex.getMessage());
			
	}
		
	
}
		public void supprimerexercice(String exercice, int idcours)
		{
			try{
				
				Connection conn = this.getConnexion();
				Statement stat = conn.createStatement();
				
				String query = "delete from quiz where idcours = "+idcours+" and nomquiz = '"+exercice+"'";
				System.out.println(query);
				stat.executeUpdate(query);
				stat.close();
				conn.close();
				
			}catch(SQLException ex)
			{
				System.out.println("Erreur :"+ex.getMessage());
			}
		}
		
		public void ajouterQuiz(String nom_quiz, int prof, int id_cours,int numeroSemaine)
		{
			try{
				
				Connection conn = this.getConnexion();
				Statement stat =conn.createStatement();
				String query = "insert into quiz(nomquiz,idcours,numeroSemaine) values ('"+nom_quiz+"','"+id_cours+"',"+numeroSemaine+")";
				stat.executeUpdate(query);
				
				Quiz quiz = new Quiz(); 
				quiz.setNomQuiz(nom_quiz);
				query = "insert into quiz_prof values ("+quiz.getId()+","+prof+")";
				stat.executeUpdate(query);
				stat.close();
				conn.close();
				
				
			}catch(SQLException ex){
				System.out.println(ex.getMessage());
			}
		}
		
	
		
		public void ajouterExercice(String exercice, int idprof)
		{
			try{
				
				Connection conn  = this.getConnexion();
				Statement stat = conn.createStatement();
				String query = "insert into exercice(nomexercice,idprof) values ('"+exercice+"',"+idprof+")";
				stat.executeUpdate(query);
				
				stat.close();
				conn.close();
				
			}catch(SQLException ex){
				System.out.println(ex.getMessage());
			}
		}
		
		public String getNomCoursID(int idcours)
		{
			String nom = "";
			try{
				Connection conn= this.getConnexion(); 
				Statement stat = conn.createStatement(); 
				String query = "select trim(titrecours) as titre from cours where idcours = "+idcours; 
				
				ResultSet rs = stat.executeQuery(query);
				while(rs.next())
				{
					nom = rs.getString("titre");
					break; 
				}
				
				rs.close(); stat.close(); conn.close(); 
			}catch(SQLException ex)
			{
				System.out.println("Erreur : "+ex.getMessage());
			}
			
			return nom; 
		}
		
}