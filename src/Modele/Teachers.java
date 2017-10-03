/**
 * 
 * @author GI 2017
 *
 */

package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



/**
 * cette classe va contenir les objets permettant
 * de manipuler les enseignants
 *
 */
public class Teachers {
	

	private String name;
	private String surname;
	private String UE;
	private String login;
	private String password;
	private String sexe;
	private String question;
	private String answer;
	private String email;
	private String status; 
	private Connection conn;
	/*
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}




	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}




	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}




	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	public static  ArrayList<Teachers> list = new ArrayList<Teachers>();
	
	
	
	/**
	 *  le constructeur de cette classe a pour paramètres:
	 * @param name
	 * @param surname
	 * @param uE
	 * @param login
	 * @param password
	 */
	
	public Teachers()
	{
		this.name= "";
		this.surname="";
		this.login = "";
		this.password = "";
		this.email = "";
		this.sexe = "";
		this.question = "";
		this.answer = "";
		this.status = "";
		connection();
	}
	
	public Teachers(String name, String surname, String uE, String login,String password) {
		this.name = name;
		this.surname = surname;
		this.UE = uE;
		this.login = login;
		this.password = password;
		connection();
	}
	
	public void connection(){
		try {
			this.conn=this.ouvrirBD();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Teachers(String[] donnee) {
		
		this.name = donnee[2];
		this.surname = donnee[3];
		UE = donnee[4];
		this.login = donnee[0];
		this.password = donnee[1];
		this.sexe = donnee[5];
		this.question = donnee[6];
		this.answer = donnee[7];
		connection();
	}




	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the surname
	 */
	public String getSurname() {
		return surname;
	}

	/**
	 * @param surname the surname to set
	 */
	public void setSurname(String surname) {
		this.surname = surname;
	}

	/**
	 * @return the uE
	 */
	public String getUE() {
		return UE;
	}

	/**
	 * @param uE the uE to set
	 */
	public void setUE(String uE) {
		UE = uE;
	}

	/**
	 * @return the login
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * @param login the login to set
	 */
	public void setLogin(String login) {
		this.login = login;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the sexe
	 */
	public String getSexe() {
		return sexe;
	}

	/**
	 * @param sexe the sexe to set
	 */
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	/**
	 * @return the question
	 */
	public String getQuestion() {
		return question;
	}

	/**
	 * @param question the question to set
	 */
	public void setQuestion(String question) {
		this.question = question;
	}

	/**
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}

	/**
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	/**
	 * @return the list
	 */
	public ArrayList<Teachers> getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	public void setList(ArrayList<Teachers> list) {
		Teachers.list = list;
	}
	
	/**
	 * Permet d'ajouter un enseignant à la liste des enseignants
	 */
	public void add()
	{
		Teachers.list.add(this);
	}

/**
 * Cette méthode ajoute un cours au  prof 
 * dans un fichier XML
 */
	
	/**
	 * Il se charge d'enregistrer l'utilisateur User 
	 * @see User 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	
	public String[] remplirtabcours(String categorie)
	{
		ArrayList<String> tab = new ArrayList<String>();
		String[] tabcategorie= null;
		
		try{
			Statement stat = conn.createStatement();
			
			String query = "select distinct(titrecours) as titrecours from cours where idcours in (select id_cours from prof_cours where idpro="+this.getId()+") and categoriecours like '%"+categorie+"%'";
			
			
			ResultSet rs = stat.executeQuery(query);
			
			
			while(rs.next())
			{
				tab.add(rs.getString("titrecours"));
			}
			rs.close();
			stat.close();
			
		}catch(SQLException ex)
		
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}
		
		tabcategorie = new String[tab.size()];
		
		for(int i = 0; i<tab.size(); i++)
		{
			tabcategorie[i]= tab.get(i); 
		}
		
		return tabcategorie;
	}
	
	public void enregistreBD() throws SQLException,ClassNotFoundException
	
	{
		try{
			String query="insert into enseignant(nom,code,status,prenom,email,sexe,question,reponse) values ";
			String insert="('"+this.getName()+"','"+this.getPassword()+"','"+this.getStatus()+"','"+this.getSurname()+"','"+this.getEmail()+"','"+this.getSexe()+"','"+this.getQuestion()+"','"+this.getAnswer()+"')";
			String requete=query+" "+insert;
			
			PreparedStatement prep = conn.prepareStatement("insert into enseignant(nom,code,status,prenom,email,sexe) values (?,?,?,?,?,?)");
			prep.setString(1, this.getName());
			prep.setString(2, this.getPassword());
			prep.setString(3,this.getStatus());
			prep.setString(4, this.getSurname());
			prep.setString(5, this.getEmail());
			prep.setString(6, this.getSexe());
			prep.executeUpdate(requete);
			
			prep.close();
		}catch(SQLException e)
		{
		
			throw new SQLException("Details\n"+e.getMessage());
		
		}
		
	}
	/**
	 * 
	 * @return Connection chaine_connection
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		return Examen.ouvrirBD();
	}
	/**Elle vérifie si l'objet correspond belle et bien à un objet dans la bd
	 * @return boolean : Vrai si la valeur est bonne dans la bd, faux si la valeur ne correspond pas dans la bd
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	
	public void creeForum(String titreCours) throws ClassNotFoundException
	{
		try{
			Statement stat  = conn.createStatement();
			PreparedStatement prep = conn.prepareStatement("insert into message(auteur,datecreation,sujet,texte) values (?,?,?,?)");
			
			prep.setString(1, this.getName());
			prep.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));			
			prep.setString(3, titreCours);
			String sujet = "Bienvenue au forum sur "+titreCours;
			prep.setString(4,sujet);
			
			prep.executeUpdate();
			prep.close();
			stat.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}
		
	}
	
	public boolean verfier() throws ClassNotFoundException 
	{
		boolean valide = false; 
		try {
			connection();
		Statement stat = conn.createStatement();
		
		if(this.getStatus().equals("Enseignant")){		
			ResultSet rs = stat.executeQuery("select * from enseignant where email like '%"+this.getEmail()+"%'");		
			
			while(rs.next()){		
				if(rs.getString("code").equals(this.getPassword())){
					 valide = true; 
					 this.setLogin(rs.getString("nom"));
					 this.setName(rs.getString("nom"));
					 this.setStatus(rs.getString("status"));
					 break;
				}
			
			}
			rs.close();			
		}
		stat.close();
		 
		} catch (SQLException e) {
			System.out.println("Erreur1 : "+e.getMessage()); 
		}
		
		return valide; 
	}
	
	public int getNombreTotalCours() throws ClassNotFoundException
	{
		int id = 0; 
		
		try{ 
			connection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select count(id_cours) as nb from prof_cours");
			
			while(rs.next())
			{
				id = rs.getInt("nb");
				break;
			}
			rs.close();
			stat.close();			
		}catch(SQLException ex)
		{
			System.out.println("Erreur2 : "+ex.getMessage());
		}
		
		return id; 
	}
	
	public int getNombreCours() throws ClassNotFoundException
	{
		int id=0; 
			try{
				connection();
				Statement stat = conn.createStatement();
				ResultSet  rs = stat.executeQuery("select count(id_cours) as nb from prof_cours where idpro = "+this.getId());
				
				while(rs.next())
				{
					id = rs.getInt("nb");
					break;
				}
				rs.close();
				stat.close(); 
			}catch(SQLException ex)
			{
				System.out.println("Erreur3 : "+ex.getMessage());
			}
		
		return id; 
	}
	
	public int getNombreTotalEtd() throws ClassNotFoundException
	{
		int id = 0; 
		try{
			connection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select count(idetudiant) as nb from etudiant ");
			
			while(rs.next())
			{
				id = rs.getInt("nb");
				break;
			}
			rs.close();
			stat.close();
		}catch(SQLException ex)
		{
			System.out.println("Erreur4 : "+ex.getMessage());
		}
		
		return id; 
	}
	
	public int getNombreEtdIns() throws ClassNotFoundException
	{
		int id = 0; 
		
		try{
			connection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select count(idetudiant) as nb from etd_cours where idcours in (select id_cours from prof_cours where idpro = "+this.getId()+")");
			
			while(rs.next())
			{
				id = rs.getInt("nb");
				break;
			}
			
			rs.close(); 
			stat.close();
			
		}catch(SQLException ex)
		{
			System.out.println("Erreur5 : "+ex.getMessage());
		}
		
		return id;
	}
	
	public int getNombreEtdIns(int idCours) throws ClassNotFoundException
	{
		int id = 0; 
		try{ 
			connection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select count(idetudiant) as nb from etd_cours where idcours = '"+idCours+"'");
			
			while(rs.next())
			{
				id = rs.getInt("nb");
				break;
			}
			
			rs.close(); 
			stat.close();
			
		}catch(SQLException ex)
		{
			System.out.println("Erreur6 : "+ex.getMessage());
		}
		
		return id;
	}
	
	public int isOuvert(String titrecours) throws ClassNotFoundException
	{
		   int id=0;
			try {
				connection();
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery("select ouvert from cours where titrecours like '%"+titrecours+"%'");		
			
		
			while(rs.next())
			{
				
				id= rs.getInt("ouvert");
				break;
				
			}
			
			rs.close();
			stat.close();
			} catch (SQLException e) {
				System.out.println("Erreur7 : "+e.getMessage()); 
			}
			
			return id;
		
	}
	
	public int getId() throws ClassNotFoundException
	{
	   int id=0;
		try {
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select idenseignant from enseignant where email like '%"+this.getEmail()+"%'");		
		
	
		while(rs.next())
		{
			
			id= rs.getInt("idenseignant");
			break;
			
		}
		
		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur8 : "+e.getMessage()); 
		}
		
		return id;
	
	}
	
	public ArrayList<String> getListeCours(String categorie)
	{
		 ArrayList<String> listeCours = new ArrayList<String>();
	 	   
	 	   try{
	 		   Statement stat = conn.createStatement(); 
	 		   
	 		   String query = "select titrecours from cours where categoriecours like '%"+categorie+"%' and idcours in (select id_cours from prof_cours c,enseignant e where  e.idenseignant = "+this.getId()+" and c.idpro = e.idenseignant )";
	 		   
	 		   
	 		   ResultSet rs = stat.executeQuery(query);
	 		   
	 		   while(rs.next())
	 		   {
	 			   listeCours.add(rs.getString("titrecours"));
	 		   }
	 		  rs.close();
	 		  stat.close();
	 			   
	 	   }catch(SQLException ex)
	 	   {
	 		   System.out.println(ex.getMessage());
	 	   }catch(ClassNotFoundException ex)
	 	   {
	 		   System.out.println(ex.getMessage());
	 	   }
	 	   
	 	   return listeCours; 
	}
	
	
	  
    public ArrayList<String> getListeCours() throws ClassNotFoundException
    {
 	   ArrayList<String> listeCours = new ArrayList<String>();
 	   
 	   try{
 		   
 		   Statement stat = conn.createStatement(); 
 		   
 		   String query = "select titrecours from cours where idcours in (select id_cours from prof_cours c,enseignant e where  e.idenseignant = "+this.getId()+" and c.idpro = e.idenseignant )";
 		   
 		   ResultSet rs = stat.executeQuery(query);
 		   
 		   while(rs.next())
 		   {
 			   listeCours.add(rs.getString("titrecours"));
 		   }
 		  rs.close();
 		  stat.close();
 			   
 	   }catch(SQLException ex)
 	   {
 		   System.out.println(ex.getMessage());
 	   }
 	   
 	   return listeCours; 
    }
    
    public ArrayList<String> listeComplement(String video) throws ClassNotFoundException 
    {
    	ArrayList<String> listeComplement = new ArrayList<String>();
    	String complement = "";
    	
    	try{
			connection();    		
    		Statement stat = conn.createStatement();
    		ResultSet rs = stat.executeQuery("select complement from complement_video where video = '"+video+"'");
    		while(rs.next())
    		{
    			complement = rs.getString("complement");
    			listeComplement.add(complement);
    		}
    		
    		rs.close();
    		stat.close();
    		
    	}catch(SQLException ex)
    	{
    		System.out.println("Error1  : "+ex.getMessage());
    	}
    	return listeComplement; 
    }
    
    public void ajouterComplement(String complement, String video) throws ClassNotFoundException
    {
    	try{
    		Statement stat = conn.createStatement();
    		
    		stat.executeUpdate("insert into complement_video(video,complement) values ('"+video+"','"+complement+"')");
    		stat.close();
    		
    	}catch(SQLException ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
	@Override
	public String toString() {
		return "Teachers [name=" + name + ", surname=" + surname + ", UE=" + UE
				+ ", login=" + login + ", password=" + password + ", sexe="
				+ sexe + ", question=" + question + ", answer=" + answer
				+ ", email=" + email + ", status=" + status + ", getEmail()="
				+ getEmail() + ", getStatus()=" + getStatus() + ", getName()="
				+ getName() + ", getSurname()=" + getSurname() + ", getUE()="
				+ getUE() + ", getLogin()=" + getLogin() + ", getPassword()="
				+ getPassword() + ", getSexe()=" + getSexe()
				+ ", getQuestion()=" + getQuestion() + ", getAnswer()="
				+ getAnswer() + ", getList()=" + getList() + 
				 "]";
	}
	
	public String getHeureActuelle()
	{
		String format = "dd/MM/yy H:mm:ss"; 

		java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( format ); 
		java.util.Date date = new java.util.Date(); 

		return ""+formater.format( date ); 

	}
	
	public ArrayList<Integer> getListeInscrit(String nomcours) throws ClassNotFoundException
	{
		ArrayList<Integer> listeInscrit = new ArrayList<Integer>(); 
		
			try{
				
				String query = "select idetudiant from etudiant where idetudiant in (select idetudiant from etd_cours where idcours = (select idcours from cours where titrecours = trim(\""+nomcours+"\")))";
				connection();
				Statement stat = conn.createStatement(); 
				ResultSet rs = stat.executeQuery(query);
				
				while(rs.next())
					
				{
					listeInscrit.add(rs.getInt("idetudiant"));
				}
				
			}catch(SQLException ex)
			{
				System.out.println("Erreur9 : "+ex.getMessage());
			}
		return listeInscrit; 
	}

	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}

}