package Modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import controlleur.Connecteur;

public class DevoirsEtudiant {
	private ArrayList<String> vue = new ArrayList<String>();
	private ArrayList<String> date = new ArrayList<String>();
	private ArrayList<String> note = new ArrayList<String>();
	private ArrayList<String> lienDevoir = new ArrayList<String>();
	private ArrayList<String> devoirs = new ArrayList<String>();
	private ArrayList<String> matricules = new ArrayList<String>();
	private ArrayList<String> etudiants = new ArrayList<String>();
	private ArrayList<Integer> idDevoirs = new ArrayList<Integer>();

	private static String nomCours = "";
	private String nomEtudiant = "";
	private int idCours;
	private static String matriculeEtudiant;
	private int idEtudiant;
	private static String nomDevoir;
	private static String cheminDevoir;
	
	public ArrayList<String> getMatricules() {
		return matricules;
	}

	public void setMatricules(ArrayList<String> matricules) {
		this.matricules = matricules;
	}

	public ArrayList<String> getEtudiants() {
		return etudiants;
	}

	public void setEtudiants(ArrayList<String> etudiants) {
		this.etudiants = etudiants;
	}
	public String getNomDevoir() {
		return nomDevoir;
	}

	@SuppressWarnings("static-access")
	public void setNomDevoir(String nomDevoir) {
		this.nomDevoir=nomDevoir;
	}

	public String getCheminDevoir() {
		return cheminDevoir;
	}

	@SuppressWarnings("static-access")
	public void setCheminDevoir(String chemin) {
		this.cheminDevoir = chemin;
	}
	public DevoirsEtudiant(){
		
	}
	
	public DevoirsEtudiant(String nomCours, int idEtudiant){
		DevoirsEtudiant.nomCours = nomCours;
		this.idEtudiant = idEtudiant;
		this.idCours = getIdCours();
		
		initialisation();
	}
	public DevoirsEtudiant(String nomCours, String matricule){
		DevoirsEtudiant.nomCours = nomCours;
		this.idCours = getIdCours();
		initialisation();
	}
	
	public DevoirsEtudiant(String nomCours, int matriculeEtudiant, int idCours, int idEtudiant, String nomDevoir, String chemin){
		this(nomCours, matriculeEtudiant);
		this.idCours = idCours;
		DevoirsEtudiant.nomDevoir = nomDevoir;
		DevoirsEtudiant.cheminDevoir = chemin;
	}
	/**
	 * Connection � la base de donn�es
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		return Connecteur.FaireConn();
		
	}
	
	/**
	 * va nous permettre de lister les �l�ments de la table "devoir"
	 */
	public void initialisation(){
		try{
			 
			ResultSet result;
			Statement prep = ouvrirBD().createStatement();
			String query;
			
			query = "select devoir.nomdevoir nom, devoir.dateenvoie date, devoir.vue seen, devoir.note note,"
					+ "devoir.liendevoir lien from devoir where idetudiant = '"+getIdEtudiant()+"'and etudiant='true' and "
					+ "idcours = (select cours.idcours from cours where titrecours = '"+getNomCours()+"');";
			result = prep.executeQuery(query);
			while(result.next()){
				getDevoirs().add(result.getString("nom"));
				getNote().add(result.getString("note"));
				getDate().add(result.getString("date").toString());
				getVue().add(result.getString("seen").toString());
				getLienDevoir().add(result.getString("lien").toString());
			}
			
			result.close();
			prep.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}

	}
	
	/**
	 * charger le devoir dans la BD
	 * @param devoirEtudiant
	 */
	public static void chargerDevoir(DevoirsEtudiant devoirEtudiant){
		try{
			Statement prep = ouvrirBD().createStatement();
			String query;
			query = "insert into devoir (idcours, idetudiant, nomdevoir, liendevoir) values "
					+ "('"+devoirEtudiant.getIdCours()+"', '"+devoirEtudiant.getIdEtudiant()+"', '"+devoirEtudiant.getNomDevoir()+"', '"+devoirEtudiant.getCheminDevoir()+"');";
			prep.executeUpdate(query);
			prep.close();			
		}catch(SQLException ex){
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public void devoirsEnseignant(int idCours){
		try{
			ResultSet result;
			Statement prep = ouvrirBD().createStatement();
			String query;
			
			query = "select devoir.iddevoir id, devoir.nomdevoir titre, devoir.dateenvoie date, devoir.note note, devoir.liendevoir lien, "
					+ "devoir.vue seen, etudiant.matricule matricule, etudiant.nom nom from devoir join etudiant on "
					+ "devoir.idetudiant = etudiant.idetudiant "
					+ "where devoir.idcours = '"+idCours+"' and enseignant='true';";
			result = prep.executeQuery(query);
			while(result.next()){
				
				getIdDevoirs().add(result.getInt("id"));
				getMatricules().add(result.getString("matricule"));
				getEtudiants().add(result.getString("nom"));
				getDevoirs().add(result.getString("titre"));
				getNote().add(result.getString("note"));
				getDate().add(result.getString("date").toString());
				getVue().add(result.getString("seen").toString());
				getLienDevoir().add(result.getString("lien").toString());
				
			}
			
			result.close();
			prep.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public ArrayList<Integer> getIdDevoirs() {
		return idDevoirs;
	}

	public void setIdDevoirs(ArrayList<Integer> idDevoirs) {
		this.idDevoirs = idDevoirs;
	}

	public void updateVue(int idDevoir, String s){
		try{
			
			Statement prep = ouvrirBD().createStatement();
			String query;
			
			query = "update devoir set vue = '"+s+"' where iddevoir = '"+idDevoir+"';";
			prep.executeUpdate(query);
			
			prep.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public void updateNote(int idDevoir, String note){
		try{
			
			Statement prep = ouvrirBD().createStatement();
			String query;
			
			query = "update devoir set note = '"+note+"' where iddevoir = '"+idDevoir+"';";
			prep.executeUpdate(query);
			
			prep.close();
			
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public ArrayList<String> getVue() {
		return vue;
	}

	public void setVue(ArrayList<String> vue) {
		this.vue = vue;
	}

	public ArrayList<String> getDate() {
		return date;
	}

	public void setDate(ArrayList<String> date) {
		this.date = date;
	}

	public ArrayList<String> getNote() {
		return note;
	}

	public void setNote(ArrayList<String> note) {
		this.note = note;
	}

	public ArrayList<String> getLienDevoir() {
		return lienDevoir;
	}

	public void setLienDevoir(ArrayList<String> lienDevoir) {
		this.lienDevoir = lienDevoir;
	}

	public ArrayList<String> getDevoirs() {
		return devoirs;
	}

	public void setDevoirs(ArrayList<String> devoirs) {
		this.devoirs = devoirs;
	}

	public int getIdCours() {
		try{
			ResultSet result;
			Statement prep = ouvrirBD().createStatement();
			String query;
			
			query ="select cours.idcours from cours where titrecours = '"+getNomCours()+"'";
			result = prep.executeQuery(query);
			while(result.next()){
				this.idCours = Integer.valueOf(result.getString("idcours"));
			}
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex){
			System.out.println(ex.getMessage());
		}
		return this.idCours;
	}

	public void setIdCours(int idCours) {
		this.idCours = idCours;
	}
	
	/**
	 * r�cup�ration de l'Id de l'�tudiant
	 * @return
	 */
	public int getIdEtudiant() {
		
		return this.idEtudiant;
	}
	
	
	public String getNomCours() {
		return nomCours;
	}

	public String getNomEtudiant() {
		return nomEtudiant;
	}

	public void setNomEtudiant(String nomEtudiant) {
		this.nomEtudiant = nomEtudiant;
	}

	public String getMatriculeEtudiant() {
		return matriculeEtudiant;
	}

	public void setIdEtudiant(int idEtudiant) {
		this.idEtudiant = idEtudiant;
	}
	
}
