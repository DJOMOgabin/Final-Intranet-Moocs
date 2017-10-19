package Modele;
/**
 * <h1> Le Quiz qui contient un nombre d'exercies <=10 </h1>
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class Quiz 

{
	/**
	 * Le nom du questionnaire  
	 */
	private String nomQuiz;
	/**
	 * Le nombre d'exercices du quiz 
	 */
	private int nombreExo;
	/**
	 * La liste d'exercices 
	 * @see Exercice
	 */
	private ArrayList<Exercice> listeExercices;
	
	/**
	 * Le constructeur par defaut du quiz 
	 */
	
	final String fichier_xml = "C:\\J2EE\\intranet_moocs\\questionnaire.xml";
	
	public Quiz()
	{
		this.nomQuiz="";
		this.nombreExo=0;
		this.listeExercices=new ArrayList<Exercice>();
	}
	/**
	 * Le constructeur qui prend en parametre les arguments du quiz
	 * @param nomQuiz
	 * @param nombreExo
	 * @param exercice
	 */
	public Quiz(String nomQuiz, int nombreExo, Exercice exercice)
	{
		this.nomQuiz=nomQuiz;
		this.nombreExo=nombreExo;
		this.listeExercices.add(exercice);
	}
	/**
	 * @return the nomQuiz
	 */
	public String getNomQuiz() {
		return nomQuiz;
	}
	/**
	 * @param nomQuiz the nomQuiz to set
	 */
	public void setNomQuiz(String nomQuiz) {
		this.nomQuiz = nomQuiz;
	}
	/**
	 * @return the nombreExo
	 */
	public int getNombreExo() {
		return nombreExo;
	}
	/**
	 * @param nombreExo the nombreExo to set
	 */
	public void setNombreExo(int nombreExo) {
		this.nombreExo = nombreExo;
	}
	/**
	 * @return the listeExercices
	 */
	public ArrayList<Exercice> getListeExercices() {
		return listeExercices;
	}
	/**
	 * @param listeExercices the listeExercices to set
	 */
	public void setListeExercices(ArrayList<Exercice> listeExercices) {
		this.listeExercices = listeExercices;
	}
	/**
	 * @param Exercice l'exercices à ajouter dans ma liste
	 */
	public void ajouterExo(Exercice exo)
	{
		this.listeExercices.add(exo);
	}
	/**
	 * @return String la description de l'exercices par rapport au format suivant
	 * 
	 */
	public String toString()
	{
		String val ="";
		
		for(int i=0; i<this.getNombreExo();i++)
		{
			val = val +"\n"+"Exercice  "+(i+1)+"\n"+this.getListeExercices().toString();
		}
		
		return val;
	}
	/**
	 * Ajoute dans le fichier xml les coordonnés du questionnaire
	 */
	public void ajouteXML()
	{
		Element quiz=new Element("quiz");
		quiz.addContent(new Element("nom").setText(this.getNomQuiz()))
		     .addContent(new Element("nombreExo").setText(""+this.getNombreExo()));
		
		Element exercices = new Element("exercices");
	
		for(int i = 0; i<this.getNombreExo(); i++)
		{
			Element exercice = new Element("exercice");
			exercice.setAttribute("id",""+(i+1));
			exercice.addContent(new Element("enonce").setText(this.getListeExercices().get(i).getEnonce()))
					.addContent(new Element("option1").setText(this.getListeExercices().get(i).getOption()[0]))
					.addContent(new Element("option2").setText(this.getListeExercices().get(i).getOption()[1]))
					.addContent(new Element("option3").setText(this.getListeExercices().get(i).getOption()[2]))
					.addContent(new Element("option4").setText(this.getListeExercices().get(i).getOption()[3]))
					.addContent(new Element("reponse").setText(""+this.getListeExercices().get(i).getReponse()));
			exercices.addContent(exercice);
		}
		quiz.addContent(exercices); 
		
		  	Document document=null;
	        Element root = null;
	        File file = new File(fichier_xml);

	    	if(file.exists())
	    	{
	    		try {
	    			FileInputStream fis= new FileInputStream(file);
	    			SAXBuilder sb= new SAXBuilder();
	    			document = sb.build(fis);
	    			root = document.getRootElement();
	    			fis.close();
	    		} catch (FileNotFoundException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		} catch (JDOMException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		} catch (IOException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	    	}
	    	
	    	else{
	    		
	    		document = new Document();
	    		root = new Element("quizzes");
	    	}
	    	root.addContent(quiz);
	        //racine=racine.detach();
	        document.setContent(root);
	        enregistre(document,fichier_xml);
	        affiche(document);

		
	}
	

    static void affiche(Document document)
    {
            try{

                    XMLOutputter sortie= new XMLOutputter(Format.getPrettyFormat());
                    sortie.output(document, System.out);

            }catch(IOException e){
                    System.out.println(" Erreur \n Details -!- "+e.getMessage());
            }
    }

    static void enregistre(Document document, String fichier)
    {

             try {
                    FileWriter writer = new FileWriter(fichier);
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
    
    public int getId()

    {
    	int id=0; 
    	
    	try{
    		
    		Connection conn = this.ouvrirBD(); 
    		Statement stat = conn.createStatement(); 
    		
    		String query = "select idquiz from quiz where nomquiz like '%"+this.getNomQuiz()+"%'";
    		
    		ResultSet rs = stat.executeQuery(query);
    		
    		while(rs.next())
    		{
    			id = rs.getInt("idquiz");
    			break;
    		}
    		
    		rs.close();
    		stat.close();
    		conn.close();
    		
    	}catch(SQLException ex){System.out.println(ex.getMessage());} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return id; 
    }
} 