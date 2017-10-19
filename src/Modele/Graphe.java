package Modele;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import forum.ConnecteurForum;

public class Graphe
{

	public static final String  fichier_cours = "C:\\J2EE\\intranet_moocs\\WebContent\\data.xml";
	public static final String  fichier_cours2 = "C:\\J2EE\\intranet_moocs\\WebContent\\data2.xml";
	public static final String  fichier_cours3 = "C:\\J2EE\\intranet_moocs\\WebContent\\data3.xml";
	
	public void creeDataXML() throws Exception

	{

	        /**Creation de la balise cours**/

	        Element cours = new Element("dataset");
	        cours.setAttribute("type","bar");

	        ConnecteurForum e = new ConnecteurForum();
	        e.setDriver(new constante().driver);
	        e.setChaineConnexion(new constante().chaine_connexion);
	        e.setLogin(new constante().log_bd);
	        e.setPassword(new constante().pass_bd);
	        ArrayList<String> list_nom = e.getListeNom();
	        
	        User s = new User(); 
	        
	        for(int i= 1 ; i<=list_nom.size(); i++)
	        {
	        	s.setNom(list_nom.get(i-1));
	        	cours.addContent(new Element("data").setAttribute("unit",""+(i)).setAttribute("value",""+s.getNombreCours()));
	        	
	        }
	        
	        Element option = new Element("optionset");
	        
	        option.addContent(new Element("option").setAttribute("set","setBarColor").setAttribute("value","'#42aBdB'"))
	        	  .addContent(new Element("option").setAttribute("set","setBarOpacity").setAttribute("value","0.8"))
	        	  .addContent(new Element("option").setAttribute("set","setBarBorderColor").setAttribute("value","'#D9EDF7'"))
	        	  .addContent(new Element("option").setAttribute("set","setBarValues").setAttribute("value","false"))
	        	  .addContent(new Element("option").setAttribute("set","setTitleColor").setAttribute("value","'#8C8383'"))
	        	  .addContent(new Element("option").setAttribute("set","setAxisColor").setAttribute("value","'#777E81'"))
	        	  .addContent(new Element("option").setAttribute("set","setAxisValuesColor").setAttribute("value","'#777E81'"));
	        	  
	        
	        Document document=null;
	        Element root = null;
	        File file = new File(fichier_cours);

	    	if(file.exists())
	    	{
	    		
	    			file.delete();
	    		
	    	}
	    	
	    
	    		
	    		document = new Document();
	    		root = new Element("JSChart");
	    		
	    	root.addContent(cours);
	    	root.addContent(option);
	        //racine=racine.detach();
	        document.setContent(root);
	        enregistre(document,fichier_cours);
	    
	}
	
	   static void enregistre(Document document, String fichier)
       {

                try {
                       FileWriter writer = new FileWriter(fichier,false);
                       XMLOutputter outputter = new XMLOutputter();
                       outputter.setFormat(Format.getPrettyFormat().setEncoding("ISO-8859-1"));
                       outputter.output(document, writer);
                       writer.close(); // close writer
                   }catch(IOException e){
                       System.out.println(" Erreur \n Details -!- "+e.getMessage());
                   }
       }
	   
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
	   
	   public void creeDataXML2() throws Exception
	   {
		   /**Creation de la balise cours**/

	        Element cours = new Element("dataset");
	        cours.setAttribute("type","bar");


	        ConnecteurForum e = new ConnecteurForum();
	        e.setDriver(new constante().driver);
	        e.setChaineConnexion(new constante().chaine_connexion);
	        e.setLogin(new constante().log_bd);
	        e.setPassword(new constante().pass_bd);
	        ArrayList<String> list_nom = e.getListeCours();
	        
	        Cours  c= new Cours(); 
	        
	        for(int i= 0 ; i<list_nom.size(); i++)
	        {
	        	c.setTitreCours(list_nom.get(i));
	        	cours.addContent(new Element("data").setAttribute("unit",""+(i+1)).setAttribute("value",""+c.getNombreCours()));
	        	
	        }
	        
	        Element option = new Element("optionset");
	        
	        option.addContent(new Element("option").setAttribute("set","setBarColor").setAttribute("value","'#42aBdB'"))
	        	  .addContent(new Element("option").setAttribute("set","setBarOpacity").setAttribute("value","0.8"))
	        	  .addContent(new Element("option").setAttribute("set","setBarBorderColor").setAttribute("value","'#D9EDF7'"))
	        	  .addContent(new Element("option").setAttribute("set","setBarValues").setAttribute("value","false"))
	        	  .addContent(new Element("option").setAttribute("set","setTitleColor").setAttribute("value","'#8C8383'"))
	        	  .addContent(new Element("option").setAttribute("set","setAxisColor").setAttribute("value","'#777E81'"))
	        	  .addContent(new Element("option").setAttribute("set","setAxisValuesColor").setAttribute("value","'#777E81'"));
	        	  
	        
	        Document document=null;
	        Element root = null;
	        File file = new File(fichier_cours2);

	    	if(file.exists())
	    	{
	    		
	    			file.delete();
	    		
	    	}
	    	
	    
	    		
	    		document = new Document();
	    		root = new Element("JSChart");
	    		
	    	root.addContent(cours);
	    	root.addContent(option);
	        //racine=racine.detach();
	        document.setContent(root);
	        enregistre(document,fichier_cours2);

	   }
	   
	   
		public void creeDataXML3(String jour) throws Exception

		{

		        /**Creation de la balise cours**/

		        Element cours = new Element("dataset");
		        cours.setAttribute("type","bar");

		  
		        ConnecteurForum e = new ConnecteurForum();
		        e.setDriver(new constante().driver);
		        e.setChaineConnexion(new constante().chaine_connexion);
		        e.setLogin(new constante().log_bd);
		        e.setPassword(new constante().pass_bd);
		        
		        ArrayList<Integer> listeId= new ArrayList<Integer>();
		        ArrayList<Integer> listeTempsMis = new ArrayList<Integer>();
		        
		        
		        try{
		        	
		        
		        Connection conn = e.getConnexion();
		        Statement stat = conn.createStatement();
		        ResultSet rs = stat.executeQuery("select idetudiant, dateDebut, dateFin, timestampdiff(minute,dateDebut,dateFin) as diff from session where datediff('"+jour+" 00:00:00',dateDebut) =0");
		        
		        while(rs.next())
		        {
		        	listeId.add(rs.getInt("idetudiant"));
		        	listeTempsMis.add(rs.getInt("diff"));
		        }
		        
		        rs.close();
		        stat.close();
		        conn.close();
		        
		        }catch(SQLException ex){
		        	System.out.println(ex.getMessage());
		        }
		        
		        
		        
		        User s = new User(); 
		        
		        for(int i= 1 ; i<=listeTempsMis.size(); i++)
		        {
		        	
		        	cours.addContent(new Element("data").setAttribute("unit",""+(i)).setAttribute("value",""+listeTempsMis.get(i-1)));
		        	
		        }
		        
		        Element option = new Element("optionset");
		        
		        option.addContent(new Element("option").setAttribute("set","setBarColor").setAttribute("value","'#42aBdB'"))
		        	  .addContent(new Element("option").setAttribute("set","setBarOpacity").setAttribute("value","0.8"))
		        	  .addContent(new Element("option").setAttribute("set","setBarBorderColor").setAttribute("value","'#D9EDF7'"))
		        	  .addContent(new Element("option").setAttribute("set","setBarValues").setAttribute("value","false"))
		        	  .addContent(new Element("option").setAttribute("set","setTitleColor").setAttribute("value","'#8C8383'"))
		        	  .addContent(new Element("option").setAttribute("set","setAxisColor").setAttribute("value","'#777E81'"))
		        	  .addContent(new Element("option").setAttribute("set","setAxisValuesColor").setAttribute("value","'#777E81'"));
		        	  
		        
		        Document document=null;
		        Element root = null;
		        File file = new File(fichier_cours3);

		    	if(file.exists())
		    	{
		    		
		    			file.delete();
		    		
		    	}
		    	
		    
		    		
		    		document = new Document();
		    		root = new Element("JSChart");
		    		
		    	root.addContent(cours);
		    	root.addContent(option);
		        //racine=racine.detach();
		        document.setContent(root);
		        enregistre(document,fichier_cours3);
		    
		}
	   
	   
	   public static void main(String[] args) throws Exception
	   {
		   Graphe e = new  Graphe();
		   e.creeDataXML();
		   
	   }
}