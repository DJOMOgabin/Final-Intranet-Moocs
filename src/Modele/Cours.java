package Modele;
/**
 * 
 * @author djobiii
 * <h1> Cette classe permet de créer un cours et de le stocker dans un fichier xml </h1> 
 *<h2> Il sera aussi possible d'integrer des exercices </h2>
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.jdom2.JDOMException;



public class Cours 

{
	final static String fichier_categorie=new constante().chemin+"categorie.xml";

	
/**
 * Le titre du cours 
 */
	
	private String titreCours;
/**
 * La langue du cours
 */
	private String langueCours;
/**
 * La categorie du cours
 */
	private String categorieCours;
/**
 * La description du cours
 */
	private String descriptionCours;
/**
 * La logo du cours
 */
	private int nombreSemainesCours;
/**
 * La liste des videos 
 */
	private HashMap<Integer,video> listeVideo;
/**
 * Le logo du cours
 */
	private String logoCours;
	/**
	 * Le lien d'évaluation du cours en question
	 */
	private String lien; 
/**
 * Le constructeur du cours pour mettre à jour les attribut de ma classe cours 
 */
	
	public Cours()
	{
		this.titreCours="";
		this.langueCours="";
		this.categorieCours="";
		this.descriptionCours="";
		this.nombreSemainesCours=0;
		this.logoCours="logoPo.png";
		this.lien = "";
		this.listeVideo=new HashMap<Integer,video>();
	}
	
/**
 *Constructeur avec paramètres
 *@param String titreCours
 *@param String langueCours
 *@param String categorieCours
 *@param String descriptionCours
 *@param int nombreSemainesCours
 */
	
	public Cours(String titreCours, String langueCours, String categorieCours, String descriptionCours, int nombreSemainesCours)
	
	{
			this.titreCours=titreCours;
			this.langueCours=langueCours;
			this.categorieCours=categorieCours;
			this.descriptionCours=descriptionCours;
			this.nombreSemainesCours=nombreSemainesCours;
			this.listeVideo= new HashMap<Integer,video>();
<<<<<<< HEAD
=======
			this.logoCours=logoCours;
			
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			for(int i=1;i<=nombreSemainesCours;i++)
			
			{
				this.listeVideo.put(i,new video());
			}
			
	}
public Cours(String titreCours, String langueCours, String categorieCours, String descriptionCours, int nombreSemainesCours,String lien)
	
	{
			this.titreCours=titreCours;
			this.langueCours=langueCours;
			this.categorieCours=categorieCours;
			this.descriptionCours=descriptionCours;
			this.nombreSemainesCours=nombreSemainesCours;
			this.listeVideo= new HashMap<Integer,video>();
<<<<<<< HEAD
=======
			this.logoCours=logoCours;
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			this.lien = lien;
			
			for(int i=1;i<=nombreSemainesCours;i++)
			
			{
				this.listeVideo.put(i,new video());
			}
			
	}

/**
 * @return the titreCours
 */
public String getTitreCours() {
	return this.titreCours;
}

/**
 * @param titreCours the titreCours to set
 */
public void setTitreCours(String titreCours) {
	this.titreCours = titreCours;
}

/**
 * @return the langueCours
 */
public String getLangueCours() {
	return this.langueCours;
}

/**
 * @param langueCours the langueCours to set
 */
public void setLangueCours(String langueCours) {
	this.langueCours = langueCours;
}

/**
 * @return the categorieCours
 */
public String getCategorieCours() {
	return this.categorieCours;
}

/**
 * @param categorieCours the categorieCours to set
 */
public void setCategorieCours(String categorieCours) {
	this.categorieCours = categorieCours;
}

/**
 * @return the descriptionCours
 */
public String getDescriptionCours() {
	return this.descriptionCours;
}

/**
 * @param descriptionCours the descriptionCours to set
 */
public void setDescriptionCours(String descriptionCours) {
	this.descriptionCours = descriptionCours;
}

/**
 * @return the nombreSemainesCours
 */
public int getNombreSemainesCours() {
	return this.nombreSemainesCours;
}

/**
 * @param nombreSemainesCours the nombreSemainesCours to set
 */
public void setNombreSemainesCours(int nombreSemainesCours) {
	this.nombreSemainesCours = nombreSemainesCours;
}

/**
 * @return the listeVideo
 */
public HashMap<Integer, video> getListeVideo() {
	return listeVideo;
}

/**
 * @param listeVideo the listeVideo to set
 */
public void setListeVideo(HashMap<Integer, video> listeVideo) {
	this.listeVideo = listeVideo;
}
/**
 * @return String logo du cours 
 */
	public String getLogoCours(){return this.logoCours;}
/**
 * @param String logo
 * @return void
 */
	public void setLogoCours(String logoCours){this.logoCours=logoCours;}
	/*
	 * @param lien : le lien à mettre à jour
	 */
	public void setLien(String lien){this.lien = lien;}
	/**
	 * @return lien: le lien actuel de l'instance de cours selectionner
	 */
	public String getLien(){return this.lien; }
/**
 * @param video 
 */

public void ajoutVideo(String video, int cle)
{
	this.listeVideo.get(cle).ajouterVideo(video);
}
/**
 * @return String description du cours en question 
 */
public String toString()
{
	return "Titre : "+this.getTitreCours()+"\nLangue du Cours: "+this.getLangueCours()+""
			+ "\nCategorie du Cours: "+this.getCategorieCours()+"\nDescription du Cours: "+this.getDescriptionCours()+""
					+ "\nNombre de Semaines : "+this.getNombreSemainesCours()+"\nLogo du Cours : "+this.getLogoCours()+"\nLien d'evaluation : "+this.getLien();
}
       public void enregistreBD() throws SQLException,ClassNotFoundException
   	
   	{
   		try{
   				
   			
   			Connection conn=this.ouvrirBD();
   			
   			PreparedStatement prep= conn.prepareStatement("insert into cours(titrecours, categoriecours,descriptioncours,nombresemainecours,logocours,lien) values (?,?,\"Description par defaut.\",?,?,\"http://www.coursera.org\")");
   			prep.setString(1,this.getTitreCours());
   			prep.setString(2, this.getCategorieCours());
   			prep.setInt(3,this.getNombreSemainesCours());
   			prep.setString(4, this.getLogoCours());
   			
   			
   			prep.executeUpdate();
   			
   			prep.close();
   			conn.close();
   			
   			
   		}catch(SQLException e)
   		{
   		
   			throw new SQLException("Details\n"+e.getMessage());
   		
   		}catch(ClassNotFoundException e)
   		{
   			throw new ClassNotFoundException("Details\n"+e.getMessage());
   		}
   		
   	}
       
       public String getHeureActuelle()
   	{
   		String format = "dd/MM/yy H:mm:ss"; 

   		java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( format ); 
   		java.util.Date date = new java.util.Date(); 

   		return ""+formater.format( date ); 

   	}
       
       public String getEmailEnseignant()
       {
    		String nombre = ""; 
     	   

     	   try{
     		   
     		   Connection conn= this.ouvrirBD(); 
     		   Statement stat = conn.createStatement(); 
     		   
     		   String query = "select distinct(email) as Nom from enseignant e,prof_cours c where (e.idenseignant = c.idpro) and c.id_cours="+this.getId()+"";
     		   
     		   ResultSet rs = stat.executeQuery(query);
     		   
     		   while(rs.next())
     		   {
     			   nombre = rs.getString("Nom");
     		   }
     		   

    		   rs.close();
    		   stat.close();
    		   conn.close();
     		   
     	   }catch(SQLException ex)
     	   {
     		   System.out.println(ex.getMessage());
     	   }catch(ClassNotFoundException ex)
     	   {
     		   System.out.println(ex.getMessage());
     	   }
     	   
     	   
     	   return nombre; 

 
       }
       
       public String getNomEnseignant()
       {
    	   	String nombre = ""; 
    	   

    	   try{
    		   
    		   Connection conn= this.ouvrirBD(); 
    		   Statement stat = conn.createStatement(); 
    		   
    		   String query = "select distinct(nom) as Nom from enseignant e,prof_cours c where (e.idenseignant = c.idpro) and c.id_cours="+this.getId()+"";
    		   
    		   ResultSet rs = stat.executeQuery(query);
    		   
    		   while(rs.next())
    		   {
    			   nombre = rs.getString("Nom");
    		   }
    		   

    		   rs.close();
    		   stat.close();
    		   conn.close();
    		   
    	   }catch(SQLException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }catch(ClassNotFoundException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }
    	   
    	   
    	   return nombre; 

  }
       
       public void addSemaine(int semaine,int id)
       {
    	   Connection conn; 
    	   
    	  try {
			conn = this.ouvrirBD(); 
			  PreparedStatement stat  = conn.prepareStatement("UPDATE cours SET nombresemainecours = nombresemainecours+"+semaine+" WHERE idcours = ?");
			  stat.setInt(1, id);
			  
			  stat.execute();
			  
			  stat.close(); 
			  conn.close(); 
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	  
       }
       
       public int getNombreVideoBD(int semaine)
       {
    	   Connection conn;
           int nombre=0; 
            	
            	try {
            			conn = this.ouvrirBD();
            	
            		Statement stat = conn.createStatement();
            		
            		ResultSet rs = stat.executeQuery("select count(video) as nombre from video where id_cours like '%"+this.getId()+"%' and semaine="+semaine+" limit 0,1");		
            		
            		
            		
            		while(rs.next())
            		{
            	       nombre= rs.getInt("nombre");
            			break;
            			
            		}
            		

       		   rs.close();
       		   stat.close();
       		   conn.close();
            		 
            		} catch (SQLException e) {
            			System.out.println("Erreur : "+e.getMessage()); 
            		} catch (ClassNotFoundException e) {
            			// TODO Auto-generated catch block
            			e.printStackTrace();
            		}
            		
            		return nombre; 

       }
       
       public int getNombreVideoBD()
       {

   	   	Connection conn;
        int nombre=0; 
         	
         	try {
         			conn = this.ouvrirBD();
         	
         		Statement stat = conn.createStatement();
         		
         		ResultSet rs = stat.executeQuery("select count(video) as nombre from video where id_cours like '%"+this.getId()+"%' limit 0,1");		
         		
         		
         		
         		while(rs.next())
         		{
         	       nombre= rs.getInt("nombre");
         			break;
         			
         		}
         		

    		   rs.close();
    		   stat.close();
    		   conn.close();
         		 
         		} catch (SQLException e) {
         			System.out.println("Erreur : "+e.getMessage()); 
         		} catch (ClassNotFoundException e) {
         			// TODO Auto-generated catch block
         			e.printStackTrace();
         		}
         		
         		return nombre; 

       }
       
       public String getVideoIntroduction()
       {
    	   Connection conn; 
    	   String video  = "";
    	   
    	   	   try {
				conn = this.ouvrirBD();
				   Statement stat =  conn.createStatement(); 
				   ResultSet rs = stat.executeQuery("select introduction from cours where idcours = "+this.getId());
				   
				   while(rs.next())
				   {
					   video = rs.getString("introduction");
				   }

				   rs.close();
				   stat.close();
				   conn.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return video; 
    	   
       }
       
       public String getDescriptionBD()
       {
    	   Connection conn;
        	String logo = "";
        	
        	try {
        			conn = this.ouvrirBD();
        	
        		Statement stat = conn.createStatement();
        		
        		ResultSet rs = stat.executeQuery("select descriptioncours from cours where idcours = "+this.getId());		
        		
        		
        		while(rs.next())
        		{
        	        logo= rs.getString("descriptioncours");
        			break;
        		}
        		
		   		   rs.close();
		   		   stat.close();
		   		   conn.close();
   		   
        		} catch (SQLException e) {
        			System.out.println("Erreur : "+e.getMessage()); 
        		} catch (ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
        		
        		return (logo==null)?"":logo; 
       }
       
       public String getLienCoursBD()
       {
    	   Connection conn;
         	String logo = "";
         	
         	try {
         			conn = this.ouvrirBD();
         	
         		Statement stat = conn.createStatement();
         		
         		ResultSet rs = stat.executeQuery("select lien from cours where idcours = "+this.getId());		
         		
         		
         		while(rs.next())
         		{
         	       logo= rs.getString("lien");
         			break;
         			
         		}
         		

    		   rs.close();
    		   stat.close();
    		   conn.close();
         		 
         		} catch (SQLException e) {
         			System.out.println("Erreur : "+e.getMessage()); 
         		} catch (ClassNotFoundException e) {
         			// TODO Auto-generated catch block
         			e.printStackTrace();
         		}
         		
         		return (logo==null)?"":logo; 

       }
       
       public String getLogoCoursBD()
       {
    	   	Connection conn;
          	String logo = "";
          	
          	try {
          			conn = this.ouvrirBD();
          	
          		Statement stat = conn.createStatement();
          		
          		ResultSet rs = stat.executeQuery("select logocours from cours where idcours = "+this.getId());		
          		
          		
          		
          		while(rs.next())
          		{
          	       logo= rs.getString("logocours");
          			break;
          			
          		}
          		

     		   rs.close();
     		   stat.close();
     		   conn.close();
          		 
          		} catch (SQLException e) {
          			System.out.println("Erreur : "+e.getMessage()); 
          		} catch (ClassNotFoundException e) {
          			// TODO Auto-generated catch block
          			e.printStackTrace();
          		}
          		
          		return logo; 
       }
       
       public String getDescriptionCoursBD()
       {
    	   Connection conn;
         	String logo = "";
         	
         	try {
         			conn = this.ouvrirBD();
         	
         		Statement stat = conn.createStatement();
         		
         		ResultSet rs = stat.executeQuery("select descriptioncours from cours where idcours ="+this.getId());		
         		
         		
         		
         		while(rs.next())
         		{
         	        logo= rs.getString("descriptioncours");
         			break;
         			
         		}
         		

     		   rs.close();
     		   stat.close();
     		   conn.close();
         		 
         		} catch (SQLException e) {
         			System.out.println("Erreur : "+e.getMessage()); 
         		} catch (ClassNotFoundException e) {
         			// TODO Auto-generated catch block
         			e.printStackTrace();
         		}
         		
         		return logo;
       }
       
    
       public String getLangueCoursBD()
       {
    	   Connection conn;
         	String logo = "";
         	
         	try {
         			conn = this.ouvrirBD();
         	
         		Statement stat = conn.createStatement();
         		
         		ResultSet rs = stat.executeQuery("select languecours from cours where idcours = "+this.getId());		
         		
         		
         		
         		while(rs.next())
         		{
         	        logo= rs.getString("languecours");
         			break;
         			
         		}
         		

     		   rs.close();
     		   stat.close();
     		   conn.close();
         		 
         		} catch (SQLException e) {
         			System.out.println("Erreur : "+e.getMessage()); 
         		} catch (ClassNotFoundException e) {
         			// TODO Auto-generated catch block
         			e.printStackTrace();
         		}
         		
         		return logo;
       }
       
    
       
       public ArrayList<String> getListeCours(int idprof)
       {
    	   ArrayList<String> listeCours = new ArrayList<String>();
    	   
    	   try{
    		   
    		   Connection conn= this.ouvrirBD(); 
    		   Statement stat = conn.createStatement(); 
    		   
    		   String query = "select titrecours from cours where idcours in (select id_cours from prof_cours c,enseignant e where  e.idenseignant = "+idprof+" and c.idpro = e.idenseignant )";
    		   
    		   ResultSet rs = stat.executeQuery(query);
    		   
    		   while(rs.next())
    		   {
    			   listeCours.add(rs.getString("titrecours"));
    		   }
    		   

    		   rs.close();
    		   stat.close();
    		   conn.close();
    		   
    	   }catch(SQLException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }catch(ClassNotFoundException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }
    	   
    	   return listeCours; 
       }
       
       public int getNombreCours()
       {
    	   int nombre = 0; 
    	   

    	   try{
    		   
    		   Connection conn= this.ouvrirBD(); 
    		   Statement stat = conn.createStatement(); 
    		   
    		   String query = "select count(idetudiant) as nombreCours from etd_cours where idcours = "+this.getId()+"";
    		   
    		   ResultSet rs = stat.executeQuery(query);
    		   
    		   while(rs.next())
    		   {
    			   nombre = rs.getInt("nombreCours");
    		   }
    		   

    		   rs.close();
    		   stat.close();
    		   conn.close();
    		   
    	   }catch(SQLException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }catch(ClassNotFoundException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }
    	   
    	   
    	   return nombre; 
       }
       
       public String getCategorieBD()
       {

      	Connection conn;
      	String titre = "";
      	
      	try {
      			conn = this.ouvrirBD();
      	
      		Statement stat = conn.createStatement();
      		
      		ResultSet rs = stat.executeQuery("select categoriecours from cours where titrecours like \"%"+this.getTitreCours()+"%\" limit 0,1");		
      		
      		
      		
      		while(rs.next())
      		{
      	        titre = rs.getString("categoriecours");
      			break;
      			
      		}
      		

 		   rs.close();
 		   stat.close();
 		   conn.close();
      		 
      		} catch (SQLException e) {
      			System.out.println("Erreur : "+e.getMessage()); 
      		} catch (ClassNotFoundException e) {
      			// TODO Auto-generated catch block
      			e.printStackTrace();
      		}
      		
      		return titre; 
       }
       
       public int getNombreSemainesCoursBD()
       {
    		Connection conn;
    	   	   int id=0;
    	   		try {
    	   			conn = this.ouvrirBD();
    	   	
    	   		Statement stat = conn.createStatement();
    	   		
    	   		ResultSet rs = stat.executeQuery("select nombresemainecours from cours where titrecours like \"%"+this.getTitreCours()+"%\" limit 0,1");		
    	   		
    	   		
    	   		
    	   		while(rs.next())
    	   		{
    	   			id= rs.getInt("nombresemainecours");
    	   			break;
    	   			
    	   		}

     		   rs.close();
     		   stat.close();
     		   conn.close();
    	   		} catch (SQLException e) {
    	   			System.out.println("Erreur : "+e.getMessage()); 
    	   		} catch (ClassNotFoundException e) {
    	   			// TODO Auto-generated catch block
    	   			e.printStackTrace();
    	   		}
    	   		
    	   		return id;
       }
       
       public ArrayList<String> getListeCoursSemaine(int semaine)
       {
    	   ArrayList<String> listecours = new ArrayList<String>();
    	   
    	   try{
    		   
    		   Connection conn = this.ouvrirBD();
    		   Statement stat = conn.createStatement(); 
    		   
    		   ResultSet rs = stat.executeQuery("select video from video where id_cours="+this.getId()+" and semaine ="+semaine);
    		   
    		   while(rs.next())
    		   {
    			   listecours.add(rs.getString("video")); 
    		   }
    		   
    		   rs.close();
    		   stat.close();
    		   conn.close();
    		   
    	   }catch(SQLException e)
    	   {
    		   System.out.println("Erreur : "+e.getMessage()); 
    	   }catch(ClassNotFoundException e)
    	   {
    		   e.printStackTrace();
    	   }
    	   
    	   return listecours; 
       }
       
       public String getTitreCoursID(int idcours)
       
       {
    	   Connection conn;
      		String titre="";
      		try {
      			conn = this.ouvrirBD();
      	
      		Statement stat = conn.createStatement();
      		PreparedStatement prep = conn.prepareStatement("select titrecours from cours where idcours = ?");
      		
      		prep.setInt(1, idcours);
      		ResultSet rs = prep.executeQuery();		
      		
      		
      		
      		while(rs.next())
      		{
      			titre= rs.getString("titrecours");
      			break;
      			
      		}
      		
      		rs.close();
      		stat.close();
      		conn.close(); 
      		
      		} catch (SQLException e) {
      			System.out.println("Erreur : "+e.getMessage()); 
      		} catch (ClassNotFoundException e) {
      			// TODO Auto-generated catch block
      			e.printStackTrace();
      		}
      		
      		return titre;
       }
       
       public ArrayList<String> getListeExo(int semaine)
       {
    	   ArrayList<String> listeExo= new ArrayList<String>();
    	   
    	   try{
    		   
    		   Connection conn = this.ouvrirBD();
    		   Statement stat = conn.createStatement();
    		   
    		   ResultSet rs = stat.executeQuery("select nomquiz from quiz where idcours = "+this.getId()+" and numeroSemaine = "+semaine);
    		   
    		   while(rs.next())
    		   {
    			   listeExo.add(rs.getString("nomquiz"));
    		   }
    		   
    		   rs.close();stat.close(); conn.close();
    		   
    	   }catch(SQLException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }catch(ClassNotFoundException ex)
    	   {
    		   System.out.println(ex.getMessage());
    	   }
    	   
    	   return listeExo; 
       }
        
    public int getId()
       {

   		Connection conn;
   		int id=0;
   		try {
   			conn = this.ouvrirBD();
   	
   		Statement stat = conn.createStatement();
   		PreparedStatement prep = conn.prepareStatement("select idcours from cours where titrecours = ?");
   		
   		prep.setString(1, this.getTitreCours());
   		ResultSet rs = prep.executeQuery();		
   		
   		
   		
   		while(rs.next())
   		{
   			id= rs.getInt("idcours");
   			break;
   			
   		}
   		
   		rs.close();
   		stat.close();
   		conn.close(); 
   		
   		} catch (SQLException e) {
   			System.out.println("Erreur : "+e.getMessage()); 
   		} catch (ClassNotFoundException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}
   		
   		return id;
   	
       }
    
    public int getId(String titreCours)
    {

		Connection conn;
		int id=0;
		try {
			conn = this.ouvrirBD();
	
		Statement stat = conn.createStatement();
		PreparedStatement prep = conn.prepareStatement("select idcours from cours where titrecours = ?");
		
		prep.setString(1, titreCours);
		ResultSet rs = prep.executeQuery();		
		
		
		
		while(rs.next())
		{
			id= rs.getInt("idcours");
			break;
			
		}
		
		rs.close();
		stat.close();
		conn.close(); 
		
		} catch (SQLException e) {
			System.out.println("Erreur : "+e.getMessage()); 
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id;
	
    }
   	/**
   	 * 
   	 * @return Connection chaine_connection
   	 * @throws SQLException
   	 * @throws ClassNotFoundException
   	 */
   	public Connection ouvrirBD() throws SQLException,ClassNotFoundException
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
}


