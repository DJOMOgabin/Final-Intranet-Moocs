package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import Traitement.ObjetExam;
import Traitement.PaireString;
import controlleur.Connecteur;



public class Examen {

	private ArrayList<ObjetExam> list = new ArrayList<ObjetExam>();
	private String nomCours;
	private static Connection conn;
	//private static Connection connexion;	
	
	public Examen (String nomCours){
		this.nomCours=nomCours;
		charger();
		connexion();
	}
	
	public static void connexion(){
		try {
			conn = ouvrirBD();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		return Connecteur.FaireConn();
		
	}
	public void charger()
	{
		try{
			ResultSet result;
			connexion();
			java.sql.Statement prep = conn.createStatement();
			Timestamp time= new Timestamp(new com.sun.jmx.snmp.Timestamp().getDateTime());
			String query = "select *,HOUR(TIMEDIFF(time,'"+time+"')) heure,"
					+ " MINUTE(TIMEDIFF(time,'"+time+"')) minute,"
					+ "substring(TIMEDIFF(time,'"+time+"'),1,1) signe "
					+ "from examen where idcours in(select idcours from cours "
					+ "where titrecours = '"+this.getNomCours()+"');";
			result = prep.executeQuery(query);
			while(result.next()){
				getList().add(new ObjetExam(Integer.parseInt(result.getString("idcours")), 
					result.getString("titreExam"),result.getString("heure"),
				result.getString("minute"),Integer.parseInt(result.getString("duree")),
				Integer.parseInt(result.getString("nombreEssai")),result.getString("signe"),
				Integer.parseInt(result.getString("valeurMax"))));	
				
			}
			
			result.close();
			prep.close();
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}
		
	}
	
	public static void ChangerVue(String id,String nomExam){
		try{
 
			PreparedStatement prep;
			
			String query = "update examen set vue='false' where idcours=? and titreExam=?;";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, id);
			prep.setString(2,nomExam);
			prep.executeUpdate();
			prep.close();
		}
		catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public static void Noter(String devoir,String note){
		try{ 
			PreparedStatement prep;
			String query = "update devoir set note=? where liendevoir=?;";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, note);
			prep.setString(2,devoir);
			prep.executeUpdate();
			prep.close();
		}
		catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}
	}

	public static ArrayList<String> ListEpreuve(String nomCours){
		ArrayList<String> list = new ArrayList<>();
		try{
 
			PreparedStatement prep;
			String query = "select titre from epreuve where matiere=?;";
			connexion();
			prep = Examen.getConn().prepareStatement(query);
			prep.setString(1, nomCours);
			ResultSet result = prep.executeQuery();
			while(result.next()) list.add(result.getString("titre"));
			result.close();
			prep.close();
		}
		catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}
		return list;
	}
	
	public static String ListCopie(String nomCours,String nomCopie){
		String list = "0";
		try{
 
			PreparedStatement prep;
			String query = "select count(cours) nb from copie where cours=? and epreuve=?;";
			connexion();
			prep = Examen.getConn().prepareStatement(query);
			prep.setString(1, nomCours);
			prep.setString(2, nomCopie);
			ResultSet result = prep.executeQuery();
			while(result.next()) list=result.getString("nb");
			System.out.println("le nombre : "+list);
			result.close();
			prep.close();
		}
		catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}
		return list;
	}
	
	public static void supprimer(String nomCours,String nomExam){
		try{
			
			connexion();
			PreparedStatement prep;
			
			String query;

			
			query="delete from examen where titreExam=? and idcours in(Select idcours from cours where titrecours=?);";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nomExam);
			prep.setString(2, nomCours);
			prep.executeUpdate();
			
			prep.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static String EtudiantInscrit(String nomCours){
		try{			
			connexion();
			PreparedStatement prep;
			String query,idcours="";			
			query="select count(idetudiant) nb from etd_cours where idcours in (select idcours from cours where titrecours=?);";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nomCours);
			ResultSet result = prep.executeQuery();
			while(result.next()) idcours = result.getString("nb");
			result.close();
			prep.close();
			return idcours;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean supprimerCours(String nomEnseignant,String nomCours){
		try{			
			connexion();
			PreparedStatement prep;
			String query,idcours="";			
			query="select id_cours from prof_cours where id_cours in(select idcours from cours where titrecours=?) and "
					+ "idpro in(Select idenseignant from enseignant where nom=?);";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nomCours);
			prep.setString(2, nomEnseignant);
			ResultSet result = prep.executeQuery();
			while(result.next()) idcours = result.getString("id_cours");
			query="delete from cours where idcours=?;";
			prep = conn.prepareStatement(query);
			prep.setString(1, idcours);
			prep.executeUpdate();
			result.close();
			prep.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean suppEnseignant(String nomEnseignant){
		try{			
			connexion();
			PreparedStatement prep;
			String query,idprof="";			
			query="select idenseignant from enseignant where nom = ? ;";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nomEnseignant);
			ResultSet result = prep.executeQuery();
			while(result.next()) idprof = result.getString("idenseignant");
			query ="select id_cours from prof_cours where idpro=?;";
			prep = conn.prepareStatement(query);
			prep.setString(1, idprof);
			result = prep.executeQuery();
			while(result.next()){
				query ="delete from cours where idcours=?;";
				prep = conn.prepareStatement(query);
				prep.setString(1, result.getString("id_cours"));
				prep.executeUpdate();
			}			
			query ="delete from enseignant where idenseignant = ?;";
			prep = conn.prepareStatement(query);
			prep.setString(1, idprof);
			prep.executeUpdate();
			result.close();
			prep.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean authentification(String id,String password){
		try{			
			connexion();
			PreparedStatement prep;
			String query,code="";			
			query="select code from enseignant where idenseignant = ?;";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, id);
			ResultSet result = prep.executeQuery();
			while(result.next()) code = result.getString("code");
			result.close();
			prep.close();
			if(code.equals(password)) return true;
			else return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public static ArrayList<String> ListEnseignant(String nom){
		try{			
			connexion();
			PreparedStatement prep;
			String query;
			ArrayList<String> code = new ArrayList<String>();
			query="select nom from enseignant where nom!=? and status!='admin';";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nom);
			ResultSet result = prep.executeQuery();
			while(result.next()) code.add(result.getString("nom"));
			result.close();
			prep.close();
			return code;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static ArrayList<Array> ListEnseignantCours(String nom){
		try{			
			connexion();
			PreparedStatement prep;
			String query;
			ArrayList<Array> code = new ArrayList<Array>();
			query="select titrecours,bloquer from cours where idcours in(select id_cours from prof_cours where idpro"
					+ " in (select idenseignant from enseignant where nom=?));";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nom);
			ResultSet result = prep.executeQuery();
			while(result.next()) code.add(new Array(result.getString("titrecours"), result.getString("bloquer")));
			result.close();
			prep.close();
			return code;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean bloquer(String valeur,String nomcours){
		try{			
			connexion();
			PreparedStatement prep;
			String query;
			query="update cours set bloquer=?, ouvert=? where titrecours=?;";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, valeur);
			prep.setString(2, valeur);
			prep.setString(3, nomcours);
			prep.executeUpdate();
			prep.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static String valeurbloquante(String nomcours){
		try{			
			connexion();
			PreparedStatement prep;
			String query,code="";
			query="select bloquer from cours where titrecours=?;";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, nomcours);
			ResultSet result = prep.executeQuery();
			while(result.next()) code = result.getString("bloquer");
			prep.close();
			return code;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean CreerForum(String idcours,String theme){
		boolean etat=false;
		System.out.println(idcours);
		try {
			connexion();
			PreparedStatement prep;
			String query;
			query = "INSERT INTO forum(idcours,titresujet) VALUE (?,?);";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, idcours);
			prep.setString(2, theme);
			prep.executeUpdate();
			
			prep.close();
			etat=true;			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return etat;
	
	}
	
	//On supprime le forum
	public static boolean SupprimerForum(String idcours,String theme){
		boolean etat=false;
		try {
			connexion();
			PreparedStatement prep;
			String query;
			query = "DELETE FROM forum WHERE idcours=? and titresujet=?";
			connexion();
			prep = conn.prepareStatement(query);
			prep.setString(1, idcours);
			prep.setString(2, theme);
			prep.executeUpdate();
			
			prep.close();
			etat=true;			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return etat;
	
	}
	//Permet de faire les requêtes dans la base de données de type select, de tout genre, 
	//Peut import le parametre d'entré
	public static ResultSet totalQuery(ArrayList<String> element,String nomTable,ArrayList<PaireString> condition){
		connexion();
		ResultSet result=null;
		try {
			PreparedStatement prep;
			String query,ele,condi;
			ele = element.get(0);
			for(int i=1;i<element.size();i++){
				ele+=","+element.get(i);
			}
			condi = condition.get(0).getNom()+"=?";
			for(int i=1;i<condition.size();i++){
				condi+=","+condition.get(i).getNom()+"=?";
			}
			condi+=";";
			//Alors c'est le prof
			
			query = "SELECT "+ele+" FROM "+nomTable+" WHERE "+condi;
			connexion();
			prep = conn.prepareStatement(query);
			for(int i=1;i<=condition.size();i++){
				prep.setString(i, condition.get(i-1).getValeur());
			}
			result = prep.executeQuery();
			//prep.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings({ "resource"})
	public static void Inserer(String nomCours,String nomExam,String dispo,String duree,String essai,String Max)
	{
		try{
			connexion();
			ResultSet result,result2;
			PreparedStatement prep;
			
			String query,id="";

			
			query="Select * from examen where titreExam=? and idcours in(Select idcours from cours where titrecours=?);";
			prep = conn.prepareStatement(query);
			prep.setString(1, nomExam);
			prep.setString(2, nomCours);
			result2=prep.executeQuery();
			
			query="Select idcours from cours where titrecours=?;";
			prep = conn.prepareStatement(query);
			prep.setString(1, nomCours);
			result=prep.executeQuery();
			query="";
			
			while(result.next()) id=result.getString("idcours");
			
			if(!result2.next()){				
				
				query = "insert into examen(idcours,titreExam,time,duree,nombreEssai,valeurMax) value(?,?,?,?,?,?);";
				prep = conn.prepareStatement(query);
				prep.setString(1, id);
				prep.setString(2, nomExam);
				prep.setString(3, dispo);
				prep.setString(4,duree);
				prep.setString(5,essai);
				prep.setString(6,Max);
			}else{
				query = "update examen set vue='true', time=?,duree=?,nombreEssai=?,valeurMax=? where idcours=? and titreExam=?;";
				prep = conn.prepareStatement(query);
				prep.setString(1, dispo);
				prep.setString(2,duree);
				prep.setString(3, essai);
				prep.setString(4, Max);
				prep.setString(5, id);
				prep.setString(6, nomExam);
			}
			prep.executeUpdate();
			
			result.close();
			result2.close();
			prep.close();
		}catch(SQLException ex){
			System.out.println(ex.getMessage());
		}		
	}

	public ArrayList<ObjetExam> getList() {
		return list;
	}

	public void setList(ArrayList<ObjetExam> list) {
		this.list = list;
	}

	public String getNomCours() {
		return nomCours;
	}

	public void setNomCours(String nomCours) {
		this.nomCours = nomCours;
	}
	
	public String StringDuree(int i){
		String string="";
		boolean bool=true;
		
		if(getList().get(i).getJour()>0) {
			string+=getList().get(i).getJour()+" jour(s) ";
			bool=false;
		}
		if(getList().get(i).getHeure()>0) {
			string+=getList().get(i).getHeure()+" heure(s) ";
			bool=false;
		}
		if(getList().get(i).getMinute()>0) {
			string+=getList().get(i).getMinute()+" minute(s) ";
			bool=false;
		}
		if(bool)string+=" l'épreuve n'est plus disponible";
		
		return string;
	}

	public static Connection getConn() {
		return conn;
	}

	public static void setConn(Connection conn) {
		Examen.conn = conn;
	}
	
	
	
}
