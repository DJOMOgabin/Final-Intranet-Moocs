package Modele;

<<<<<<< HEAD
=======
import java.sql.Connection;
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.jmx.snmp.Timestamp;

import Traitement.ObjetDevoir;




public class Devoirs {

	private ArrayList<ObjetDevoir> list = new ArrayList<ObjetDevoir>();
	private String nomCours;
	private int nombre;
	
	
	public Devoirs (String nomCours,boolean bol,boolean enseignant){
		this.nomCours=nomCours;
		charger(bol,enseignant);
	}

	/**
	 * 
	 * @return Connection chaine_connection
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
<<<<<<< HEAD
=======
	public static Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		return Examen.ouvrirBD();		
	}
	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	public void charger(boolean bol,boolean enseignant)
	{
		try{
			
<<<<<<< HEAD
			Examen.connexion(); 
			ResultSet result;
			Statement prep = Examen.getConn().createStatement();
=======
			Connection conn = ouvrirBD(); 
			ResultSet result;
			Statement prep = conn.createStatement();
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			String query;
			String status;
			if(enseignant) status="enseignant";
			else status="etudiant";
			
			if(bol){
				query ="select devoir.dateEnvoie date, devoir.iddevoir id, devoir.nomdevoir devoir, etudiant.nom nom from cours, devoir, etudiant "+
					"where cours.idcours=devoir.idcours and etudiant.idetudiant = devoir.idetudiant and "+
					"cours.titrecours='"+this.getNomCours()+"' and "+ status+"='true';";
				result = prep.executeQuery(query);
				ArrayList<String> id = new ArrayList<String>();
				while(result.next()){
					id.add(result.getString("id"));
					getList().add(new ObjetDevoir(result.getString("id"),result.getString("nom"), 
							result.getString("devoir"),result.getString("date")));
				}
				if(enseignant){
					for(int i=0;i<id.size();i++){
						query="Update devoir set vue='true' where iddevoir="+id.get(i)+";";
						prep.executeUpdate(query);
					}
					
				}
				result.close();
			}else{
				query = "select count(iddevoir) nombre from devoir, cours where vue='false' and devoir.idcours=cours.idcours "
						+ "and titrecours='"+this.getNomCours()+"' and "+ status+"='true';";
				result = prep.executeQuery(query);
				while(result.next()){
					
					setNombre(Integer.parseInt(result.getString("nombre")));
				}
				result.close();
			}
<<<<<<< HEAD
			prep.close();			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
=======
			prep.close();
			conn.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		}
		
	}
	
	public static void decharger(String nomCours,String devoir, String etudiant){
		try{
<<<<<<< HEAD

			Examen.connexion();
=======
			
			Connection conn = ouvrirBD(); 
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			ResultSet result;
			java.sql.PreparedStatement prep;
			String query,id1="",id2="";
			
			query ="select idetudiant id from etudiant where nom=?;";
<<<<<<< HEAD
			prep = Examen.getConn().prepareStatement(query);
=======
			prep = conn.prepareStatement(query);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			prep.setString(1, etudiant);
			result = prep.executeQuery();
			while(result.next()){
				id1=result.getString("id");
			}
			
			query ="select idcours id from cours where titrecours=?;";
<<<<<<< HEAD
			prep = Examen.getConn().prepareStatement(query);
=======
			prep = conn.prepareStatement(query);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			prep.setString(1, nomCours);
			result = prep.executeQuery();
			while(result.next()){
				id2=result.getString("id");
			}
			
			query = "insert into devoir(idcours,idetudiant,nomDevoir,dateEnvoie) value (?,?,?,?);";
<<<<<<< HEAD
			prep = Examen.getConn().prepareStatement(query);
=======
			prep = conn.prepareStatement(query);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			prep.setString(1, id2);
			prep.setString(2, id1);
			prep.setString(3, devoir);
			prep.setString(4, new Timestamp(new Timestamp().getDateTime()).toString());
			prep.executeUpdate();
			result.close();
<<<<<<< HEAD
			prep.close();			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}		
	}
	public static boolean EffacerDevoir(String nomCours,boolean enseignant){
		try{
			Examen.connexion(); 
			ResultSet result;
			Statement prep= Examen.getConn().createStatement();
=======
			prep.close();
			conn.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}
		
	}
	public static boolean EffacerDevoir(String nomCours,boolean enseignant){
		try{
			
			Connection conn = ouvrirBD(); 
			ResultSet result;
			Statement prep= conn.createStatement();
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			String query,id="";
			
			query ="select idcours id from cours where titrecours='"+nomCours+"';";
			result = prep.executeQuery(query);
			while(result.next()){
				id=result.getString("id");
			}
			String status;
			if(enseignant) status="enseignant";
			else status="etudiant";
			
			query ="Update devoir set "+status+"='false' WHERE idcours="+id+";";
			prep.executeUpdate(query);
			result.close();
			prep.close();
<<<<<<< HEAD
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
=======
			conn.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		}
		return true;
		
	}
	
	public ArrayList<ObjetDevoir> getList() {
		return list;
	}

	public void setList(ArrayList<ObjetDevoir> list) {
		this.list = list;
	}

	public String getNomCours() {
		return nomCours;
	}

	public int getNombre() {
		return nombre;
	}

	public void setNombre(int nombre) {
		this.nombre = nombre;
	}

	public void setNomCours(String nomCours) {
		this.nomCours = nomCours;
	}
}
