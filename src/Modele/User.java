package Modele;
/**
 * @author djobiii
 * @version 1.0
 */

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet; 
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


/**
 * 
 * @author djobiii
 * <h1> La classe User </h1>
 * <p> Elle contients les informations et les methodes sur un utilisateur de l'application </p>
 *
 */

public class User 

{
	/**
	 * Le nom de l'utilisateur 
	 */
	private String nom; 
	/**
	 * Le prenom de l'utilisateur
	 */
	private String prenom; 
	/**
	 * Le mois de naissance de l'utilisateur
	 */
	private String mois;
	/**
	 * La faculte de l'individu 
	 */
	private String faculte;
	/**
	 * Le matricule de l'individu
	 */
	private String matricule;
	/**
	 * Le status de l'individu (etudiant ou enseignant)
	 */
	private String status; 
	/**
	 * Le login de l'individu 
	 */
	private String login;
	/**
	 * Le mot de passe de l'individu
	 */
	private String password;
	/**
	 * L'email de l'individu en question utilisé pour l'envoi des mails
	 */
	private String email;
	/**
	 * Le jour de naissance de l'individu
	 */
	private int jour;
	/**
	 * L'annee de naissance de l'individu
	 */
	private int annee;
	/**
	 * Le niveau de l'individu en question
	 */
	private int niveau; 
	/**
	 * <p> L'autorisation de l'utilisateur par rapport au site </p>
	 * <p> Elle prend deux valeurs V,F </p>
	 * <p> Si elle vaut V alors il est valide au site </p>
	 * <p> Sinon il n'est pas valide pour le site </p> 
	 */
	private char autorisation;
	private int idEtudiant; 
	private static DevoirsEtudiant devoirEtudiant;
	public static DevoirsEtudiant getDevoirEtudiant() {
		return devoirEtudiant;
	}

	public static void setDevoirEtudiant(DevoirsEtudiant devEtudiant) {
		devoirEtudiant = devEtudiant;
	}




	/*
	 * *
	 * Le login par rapport à la connexion à la bd
	 */
	private String log_bd;
	/**
	 * Le mot de passe de connexion par rapport à la bd
	 */
	private String pass_bd;
	/**
	 * Le host\serveur par rapport à la bd
	 */
	private String host_bd;
	/**
	 * La chaine de connexion pour l'instanciation en java
	 */
	private String chaine_connexion;
	/**
	 * La chaine du driver
	 */
	private String driver;
	
	private Connection conn;
	
	
	/**
	 * <h2> Constructeur sans parametres </h2>
	 * @param null
	 * @return null
	 * <p> Cree un utilisateur par defaut moi </p>
	 */
	private void remplissage(){
		new constante();
		log_bd=constante.getLog_bd();
		/**
		 * Le mot de passe de connexion par rapport à la bd
		 */
		pass_bd=constante.getPass_bd();
		/**
		 * Le host\serveur par rapport à la bd
		 */
		host_bd=constante.getHost_bd();
		/**
		 * La chaine de connexion pour l'instanciation en java
		 */
		chaine_connexion=constante.getChaine_connexion();
		/**
		 * La chaine du driver
		 */
		driver=constante.getDriver();
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
	
	public User()
	{
		remplissage();		
		this.idEtudiant= 0;
		this.nom="";
		this.prenom="";
		this.faculte="ENSP";
		this.matricule="";
		this.login="";
		this.password="";
		this.email="";
		this.status="Etudiant";
		
		this.autorisation='F';
		
		this.jour=31;
		this.annee=1998;
		this.niveau= 3;
		connection();
	}
	
	/**
	 * <h2> Constructeur avec parametre </h2>
	 * @param nom
	 * @param prenom
	 * @param mois
	 * @param faculte
	 * @param departement
	 * @param status
	 * @param login
	 * @param password
	 * @param email
	 * @param jour
	 * @param annee
	 * @param niveau
	 * 
	 */
	
	public User(String nom, String prenom, String mois, String faculte, String matricule 
			
			, String status, String login, String password, String email, int jour, int annee, int niveau )
		
	{

		remplissage();
		this.nom=nom;
		this.prenom=prenom;
		this.mois=mois;
		this.faculte=faculte;
		this.matricule=matricule;
		this.status=status;
		this.login=login;
		this.password=password;
		this.email=email;
		
		this.jour= jour;
		this.annee=annee;
		this.niveau=niveau;	
		connection();
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	/**
	 * <h2> La methode toString() </h2>
	 * <p> Elle renvoie la description d'un utilisateur sans son mot de passe </p>
	 * @param null
	 * @return String description
	 */
	public String toString() {
		// TODO Auto-generated method stub
		return "";
	}
	/**
	 * 
	 * @return String nom de l'individu 
	 */
	
	public String getNom() {
		return nom;
	}
	/**
	 * 
	 * @param nom
	 * 
	 */

	public void setNom(String nom) {
		this.nom = nom;
	}
/**
 * 
 * @return
 */
	public String getPrenom() {
		return prenom;
	}
/**
 * 
 * @param prenom
 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
/**
 * 
 * @return
 */
	public String getMois() {
		return mois;
	}
/**
 * 
 * @param mois
 */
	public void setMois(String mois) {
		this.mois = mois;
	}
/**
 * 
 * @return
 */
	public String getFaculte() {
		return faculte;
	}
/**
 * 
 * @param faculte
 */
	public void setFaculte(String faculte) {
		this.faculte = faculte;
	}
/**
 * 
 * @return
 */
	public String getMatricule() {
		return matricule;
	}
/**
 * 
 * @param departement
 */
	public void setMatricule(String matricule) {
		this.matricule= matricule;
	}
/**
 * 
 * @return
 */
	public String getStatus() {
		return status;
	}
/**
 * 
 * @param status
 */
	public void setStatus(String status) {
		this.status = status;
	}
/**
 * 
 * @return
 */
	public String getLogin() {
		return login;
	}
	/**
	 * 
	 * @return autorisation
	 */
	public char getAutorisation() {
	return autorisation;
	}
	/**
	 * Met à jour l'autorisation de l'application
	 * @param autorisation
	 */
	public void setAutorisation(char autorisation) {
	this.autorisation = autorisation;
	}

/**
 * 
 * @param login
 */
	public void setLogin(String login) {
		this.login = login;
	}
/**
 * 
 * @return
 */
	public String getPassword() {
		return password;
	}
/**
 * 
 * @param password
 */
	public void setPassword(String password) {
		this.password = password;
	}
/**
 * 
 * @return
 */
	public String getEmail() {
		return email;
	}
/**
 * 
 * @param email
 */
	public void setEmail(String email) {
		this.email = email;
	}
/**
 * 
 * @return
 */
	public int getJour() {
		return jour;
	}
/**
 * 
 * @param jour
 */
	public void setJour(int jour) {
		this.jour = jour;
	}
/**
 * 
 * @return
 */
	public int getAnnee() {
		return annee;
	}
/**
 * 
 * @param annee
 */
	public void setAnnee(int annee) {
		this.annee = annee;
	}
/**
 * 
 * @return le niveau de l'utilisateur 
 */
	public int getNiveau() {
		return niveau;
	}
/**
 * Se charge d'initialiser le niveau au moyen du paramètre niveau
 * @param niveau
 */
	public void setNiveau(int niveau) {
		this.niveau = niveau;
	}
	public static Date ajouterMinute(Date date, int nbMinute) { 
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(date);
		cal.add(Calendar.MINUTE, nbMinute);
		return cal.getTime();
	}
	public static Date ajouterSeconde(Date date, int nbSeconde) {
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(date);
		cal.add(Calendar.SECOND, nbSeconde); 
		return cal.getTime();
	}
	public static Date ajouterHeure(Date date, int nbHeure) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, nbHeure);
		return cal.getTime();
	}
	
	/**
	 * Il se charge d'enregistrer la trace de l'User
	 * @throws SQLException 
	 */
	public void enregistreHeureFin() throws SQLException, ClassNotFoundException
	{
		try{
				
			java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time time=new java.sql.Time(new java.util.Date().getTime());
			
			String query="update heure_connexion set heure_fin=? where matricule=?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, date+" "+time);
			st.setString(2, this.getMatricule());
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e)
		{
		
			throw new SQLException("Details\n"+e.getMessage());
		
		}
		
	}
	public void enregistreHeureDebut() throws SQLException, ClassNotFoundException
	{
		try{
				
			java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time time=new java.sql.Time(new java.util.Date().getTime());
			
			Statement instruction=conn.createStatement();
			
			String query="insert into heure_connexion(matricule, heure_debut) values ";
			String insert="('"+this.getMatricule()+"',"+"'"+date+" "+time+"'"+")";
			String requete=query+" "+insert;
			instruction.execute(requete);
			instruction.close();
			
		}catch(SQLException e)
		{
		
			throw new SQLException("Details\n"+e.getMessage());
		
		}
		
	}
	
	public void setIdEtudiant(int idEtudiant) {
		this.idEtudiant = idEtudiant;
	}
	
	public int getIdEtudiant() {
		return idEtudiant;
	}

	/**
	 * methode permettant de renvoyer le max d'id detudiants
	 */
	public int getMaxIdUser()
	{
		int temp=0;
		try{
			
			Connection conn = this.ouvrirBD();
			Statement stat = conn.createStatement(); 
			
			String query = "select max(idetudiant) from etudiant"; 
			
			ResultSet rs = stat.executeQuery(query);
			
			
			while(rs.next())
			{
				temp=rs.getInt("max(idetudiant)");
				break;
			}
			

			rs.close();
			stat.close();
		}catch(SQLException ex)
		{
			
		}catch(ClassNotFoundException ex)
		{
			
		}
		return temp;
		
	}

	public ArrayList<User> getEtudiantAll()
	{
		ArrayList<User> temp=new ArrayList<User>();
		try{
			Statement stat = conn.createStatement(); 
			
			String query = "select * from etudiant"; 
			
			ResultSet rs = stat.executeQuery(query);
			
			
			while(rs.next())
			{
				User u=new User();
				u.setAnnee(rs.getInt("anneNaissance"));
				u.setEmail(rs.getString("email"));
				u.setFaculte(rs.getString("faculte"));
				u.setJour(rs.getInt("jourNaissance"));
				u.setLogin(rs.getString("login"));
				u.setMatricule(rs.getString("matricule"));
				u.setMois(rs.getString("moisNaissance"));
				u.setNiveau(rs.getInt("niveau"));
				u.setNom(rs.getString("nom"));
				u.setPrenom(rs.getString("prenom"));
				u.setIdEtudiant(rs.getInt("idEtudiant"));
				temp.add(u);
			}
			

			rs.close();
			stat.close();
		}catch(SQLException ex)
		{
			
		}
		return temp;
	}
	/**
	 * Il se charge d'enregistrer l'utilisateur User 
	 * @see User 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int enregistreBD() throws SQLException,ClassNotFoundException
	
	{
		int temp=0;
		try{
			PreparedStatement prep = conn.prepareStatement("insert into etudiant(nom,matricule,email,password) values (?,?,?,?)");
			prep.setString(1, this.getNom().toUpperCase());
			prep.setString(2,this.getMatricule().toUpperCase());
			prep.setString(3, this.getEmail());
			prep.setString(4, this.getPassword());			

			prep.executeUpdate();
			prep.close(); 				
		}catch(SQLException e)
		{
		
			throw new SQLException("Details\n"+e.getMessage());
		
		}
		return temp;
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
	
	public String getHeureActuelle()
	{
		String format = "dd/MM/yy H:mm:ss"; 

		java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( format ); 
		java.util.Date date = new java.util.Date(); 

		return ""+formater.format( date ); 

	}
	
	
	public boolean verifier() 
	{
		boolean valide = false; 
		try {
			connection();
		Statement stat = conn.createStatement();
		
		if(this.getStatus().equals("Etudiant"))
		{
		
		ResultSet rs = stat.executeQuery("select * from etudiant where email like '%"+this.getEmail()+"%'");		
		
		
		while(rs.next()){
		
			
		if(rs.getString("password").equals(this.password))
		{
			
			 valide = true; 
			 this.setNom(rs.getString("nom"));
			 this.setMatricule(rs.getString("matricule"));
			 break;
		}
		
		else
		{
			valide = false; 
		}
		
		}


		rs.close();
		stat.close();
		
		}
		

		} catch (SQLException e) {
			System.out.println("Erreur11 : "+e.getMessage()); 
		}
		
		return valide ; 
		
	}
	
	public ArrayList<String> getRecherche(String cours,String categorie)
	{
		ArrayList<String> resultats = new ArrayList<String>();
		
			try{
				connection();
				Statement stat = conn.createStatement(); 
				ResultSet rs = stat.executeQuery("select titrecours from cours where ouvert = 1 and titrecours like '%"+cours+"%'  or descriptioncours like '%"+cours+"%'");
				
				while(rs.next())
				{
					resultats.add(rs.getString("titrecours"));
				}
				
				rs.close(); 
				stat.close(); 
				
			}catch(SQLException ex){
				System.out.println("Erreur12 : "+ex.getMessage());
			}
		
		return resultats; 
	}
	
	public void desinscrit(String cours)
	{
		Cours  c = new Cours(); 
		c.setTitreCours(cours);
		
		try{
			Statement stat = conn.createStatement(); 
			
			String query = "delete from etd_cours  where idetudiant =  "+this.getId()+" and idcours ="+c.getId()+"";
			
			stat.executeUpdate(query);

			
			stat.close();
		}catch(SQLException ex)
		{
			
		}

	}
	
	public void inscrit(String cours)
	{
		Cours  c = new Cours(); 
		c.setTitreCours(cours);
		
		try{
			Statement stat = conn.createStatement(); 
			
			String query = "insert into etd_cours(idetudiant,idcours) values ("+this.getId()+","+c.getId()+")";
			
			stat.executeUpdate(query);

			
			stat.close();
		}catch(SQLException ex)
		{
			
		}

	}
	
	public boolean estInscrit(String cours)
	{
		boolean inscrit = false; 
		
		Cours  c = new Cours(); 
		c.setTitreCours(cours);
		
		try{
			
			Statement stat = conn.createStatement(); 
			
			String query = "select idetudiant from etd_cours where idcours="+c.getId(); 
			
			ResultSet rs = stat.executeQuery(query);
			
			while(rs.next())
			{
				if(rs.getInt("idetudiant")==this.getId())
				{
					inscrit = true; 
					break ; 
				}
			}
			

			rs.close();
			stat.close();
		}catch(SQLException ex)
		{
			
		}
		
		return inscrit; 
	}
	

	public int getId()
	{
	   int id=0;
		try {
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select idetudiant from etudiant where nom like '%"+this.getNom()+"%'");		
		
	
		while(rs.next())
		{
			
			id= rs.getInt("idetudiant");
			break;
			
		}
		

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur13 : "+e.getMessage()); 
		}
		
		return id;
	
	}
	

	public String getFaculteBD()
	{
	   	String faculte = "";
	   	
		try {
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select faculte from etudiant where nom like '%"+this.getNom()+"%' limit 1,1");		
		
	
		while(rs.next())
		{
			
			
			faculte = rs.getString("faculte");
			
		}
		

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur14 : "+e.getMessage()); 
		}
		
		return faculte; 
	
	}
	
	public int getNombreCours()
	{
		   int id=0;
			try {
				connection();
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery("select count(idcours) as nombreCours from etd_cours where idetudiant="+this.getId()+"");		
			
		
			while(rs.next())
			{
				
				id= rs.getInt("nombreCours");
				break;
				
			}
			

			rs.close();
			stat.close();
			} catch (SQLException e) {
				System.out.println("Erreur15 : "+e.getMessage()); 
			}
			
			return id;
		

	}
	
	public double getTempsMoyen()
	{
		double id=0.0;
		
			try {
				connection();
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery("select avg(timestampdiff(minute,dateDebut,dateFin)) as tempsMoyen from session where idetudiant = "+this.getId()+"");		
			
		
			while(rs.next())
			{
				
				id= rs.getDouble("tempsMoyen");
				break;
				
			}
			

			rs.close();
			stat.close();
			} catch (SQLException e) {
				System.out.println("Erreur16 : "+e.getMessage()); 
			}
			
			return id;
		

	}
	
	
	
	public String getMatriculeBD()
	{
	   	String matricule = "";
	   	
		try {
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select matricule from etudiant where nom like '%"+this.getNom()+"%' limit 1,1");		
		
	
		while(rs.next())
		{
			
			matricule = rs.getString("matricule");
			break;
			
		}
		

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur17 : "+e.getMessage()); 
		}
		
		return matricule; 
	
	}
	

	public String trouvePassFromEmail(String email)
	{
		String temp="";
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select password from etudiant where email like '%"+email+"%' limit 1,1 ");		
		
	
		while(rs.next())
		{
			
			temp= rs.getString("password");
			break;
			
		}

		rs.close();
		stat.close();		 
		} catch (SQLException e) {
			System.out.println("Erreur18 : "+e.getMessage()); 
		}
		
		return temp;
	
		
	}
	
	public ArrayList<String> getMesCours(String categorie)
	{
ArrayList<String> mescours = new ArrayList<String>();
		
		try{
			
			String requete ="select titrecours from cours where idcours in (select idcours from etd_cours where idetudiant = "+this.getId()+") and categoriecours like '%"+categorie+"%' and ouvert=1";
			Statement stat = conn.createStatement(); 
			ResultSet rs = stat.executeQuery(requete);
			
			while(rs.next())
			{
				mescours.add(rs.getString("titrecours"));
			}

			rs.close();
			stat.close();
		}catch(SQLException ex){
			
		}
		
		return mescours; 
	}
	
	public ArrayList<String> getMesCours() 
	{
		ArrayList<String> mescours = new ArrayList<String>();
		
		try{
			
			String requete ="select titrecours from cours where idcours in (select idcours from etd_cours where idetudiant = "+this.getId()+") and ouvert = 1";
			Statement stat = conn.createStatement(); 
			ResultSet rs = stat.executeQuery(requete);
			
			while(rs.next())
			{
				mescours.add(rs.getString("titrecours"));
			}

			rs.close();
			stat.close();
		}catch(SQLException ex){
			
		}
		
		return mescours; 
	}
	
	
	
	public String getNomId(String id_etudiant)
	{
	   	String nom1="";
	   	
		try {	
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select nom from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                nom1= rs.getString("nom");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur19 : "+e.getMessage()); 
		}
		
		return nom1; 
	
	}
        public String getPrenomId(String id_etudiant)
	{
	   	String prenom1="";
	   	
		try {	
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select prenom from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                    prenom1= rs.getString("prenom");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur20 : "+e.getMessage()); 
		}
		
		return prenom1; 
	
	}
         public String getNiveauId(String id_etudiant)
	{
	   	String niveau1="";
	   	
		try {
			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select niveau from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                    niveau1= rs.getString("niveau");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur21 : "+e.getMessage()); 
		}
		
		return niveau1; 
	
	}
         public String getFaculteId(String id_etudiant)
	{
	   	String faculte1="";
	   	
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select faculte from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                    faculte1= rs.getString("faculte");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur22 : "+e.getMessage()); 
		}
		
		return faculte1; 
	
	}
         
        public String getMatriculeId(String id_etudiant)
	{
	   	String matricule1="";
	   	
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select matricule from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                    matricule1= rs.getString("matricule");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur23 : "+e.getMessage()); 
		}
		
		return matricule1; 
	
	}
        public String getEmailId(String id_etudiant)
	{
	   	String email1="";
	   	
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select email from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                    email1= rs.getString("email");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur24 : "+e.getMessage()); 
		}
		
		return email1; 
	
	}
        public String getLoginId(String id_etudiant)
	{
	   	String login1="";
	   	
		try {

			connection();
		Statement stat = conn.createStatement();
	
		ResultSet rs = stat.executeQuery("select login from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                login1= rs.getString("login");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur25 : "+e.getMessage()); 
		}
		
		return login1; 
	
	}
        public String getPasswordId(String id_etudiant)
	{
	   	String password1="";
	   	
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select password from etudiant where idetudiant ="+id_etudiant);		
		while(rs.next()){
                password1= rs.getString("password");
                break;
                }

		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur26 : "+e.getMessage()); 
		}
		
		return password1; 
	
	}
        public String getDateId(String id_etudiant)
	{
	   	String date="";
	   	int jour1=0;
                String mois1="";
                String annee1="";
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select jourNaissance,moisNaissance,anneNaissance from etudiant where idetudiant ="+id_etudiant);		
		
                while(rs.next())
                {
                
               jour1= rs.getInt("jourNaissance");
               mois1= rs.getString("moisNaissance");
               annee1=rs.getString("anneNaissance");
              break;
                }
                date= " "+jour1+" / "+mois1+" / "+annee1;

        		rs.close();
        		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur27 : "+e.getMessage()); 
		}
		
		return date; 
	
	}
         public String getSexeId(String id_etudiant)
	{
	   	String sexe1="";
	   	
		try {

			connection();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select sexe from etudiant where idetudiant ="+id_etudiant);		
		while (rs.next()){
                    sexe1= rs.getString("sexe");
                break;
                }
		
		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur28 : "+e.getMessage()); 
		}
		
		return sexe1; 
	
	} 
         /**
          * R�cup�ration du matricule avec email et password
          */
         public String getMatricule(String email, String password){
        	 String matricule = "";
        	 
        	 try{ 
     			ResultSet result;
     			Statement prep = conn.createStatement();
     			String query;
     			
     			query ="select matricule from etudiant where email = '"+email+"' and password = '"+password+"'";
     			
     			result = prep.executeQuery(query);
     			while(result.next()){
     				matricule = result.getString("matricule");
     			}
     		}catch(SQLException ex)
     		{
     			System.out.println(ex.getMessage());
     		}
        	 return matricule;
         }


         public ArrayList<String> listeComplement(String video) 
         {
         	ArrayList<String> listeComplement = new ArrayList<String>();
         	String complement = "";
         	
         	try{
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
         		System.out.println("Error  : "+ex.getMessage());
         	}
         	return listeComplement; 
         }
         
	
	 
	
	public static void main(String[] args)
	{
		//--------------------------------------------------------------------------

			//---------------------------------Cas de Test  
		
		//--------------------------------------------------------------------------
		 
		/*	User s = new User(); 
			s.setNom("sanang");
			System.out.println(s.getId());
			*/
		
		new GraphePdf();
		GraphePdf.imprimer();

		 
		 
	}

	public String getLog_bd() {
		return log_bd;
	}

	public void setLog_bd(String log_bd) {
		this.log_bd = log_bd;
	}

	public String getPass_bd() {
		return pass_bd;
	}

	public void setPass_bd(String pass_bd) {
		this.pass_bd = pass_bd;
	}

	public String getHost_bd() {
		return host_bd;
	}

	public void setHost_bd(String host_bd) {
		this.host_bd = host_bd;
	}

	public String getChaine_connexion() {
		return chaine_connexion;
	}

	public void setChaine_connexion(String chaine_connexion) {
		this.chaine_connexion = chaine_connexion;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	
}
