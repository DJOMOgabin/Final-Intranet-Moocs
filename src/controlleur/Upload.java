package controlleur;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Modele.DevoirsEtudiant;
import Modele.User;

/**
 * Servlet implementation class Upload
 */
//@WebServlet("/upload")
//@MultipartConfig
@SuppressWarnings("serial")
public class Upload extends HttpServlet {
	public static String VUE = "/les_devoirs.jsp";
	public static final String CHAMP_TITRE = "titre";
	public static final String CHAMP_FICHIER = "fichier";
	public static final String CHEMIN = "chemin";
	public static final int TAILLE_TAMPON = 90240; //10Ko
	public static String titre;
	public static String chemin;
	public static String WEB_INF = null;
	public static String cheminNew;
	public User user;
	private static boolean Toast=true;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String chemin = this.getServletConfig().getInitParameter(CHEMIN);
		String titre = request.getParameter(CHAMP_TITRE);
		this.titre = titre;
		request.setAttribute(CHAMP_TITRE, titre);
		
		/**
		 * les donn�es re�ues �tant multipart, nous utilisons
		 * getPart() pour traiter le champ d'envoi de fichiers.
		 */
		boolean ancien=false;
		for(Part part : request.getParts()){
			String nomFichier = getNomFichier(part);
			
			if(nomFichier !=null && !nomFichier.isEmpty()){
				String nomChamp = part.getName();
				nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/')+1).substring(nomFichier.lastIndexOf('\\')+1);
				
				Upload.chemin = chemin + nomFichier;
				Upload.cheminNew = chemin + nomFichier;
				if(request.getParameter("ancien").equals(Upload.cheminNew))ancien=false;
				else ancien=true;
				
				ecrireFichier(part, nomFichier, chemin);
				
				request.setAttribute(nomChamp, nomFichier);
			}
		}
		chargementBD(ancien);
		request.setAttribute("title", request.getParameter("title"));
		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		
	}
	
	private static String getNomFichier(Part part){
		for(String contentDisposition : part.getHeader("content-disposition").split(";")){
			if(contentDisposition.trim().startsWith("filename")){
				return contentDisposition.substring(contentDisposition.indexOf("=")+1).trim().replace("\"", "");
			}
		}

		return null;
	}
	
	private void ecrireFichier(Part part, String nomFichier, String chemin) throws IOException{
		BufferedInputStream entree = null;
		BufferedOutputStream sortie = null;
		
		String className=Upload.class.getName().replaceAll("\\.", "/" )+".class";
		URL classPath=Upload.class.getClassLoader().getResource(className);
		File f=new File(classPath.getPath());
		while(f!=null && !f.getName().equals("WEB-INF")){
		 f=f.getParentFile();
		}
		if(f!=null)
		 WEB_INF=f.getPath().replace('\\', '/');

		
		try{
			entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
			
			//String path = WEB_INF.substring(0, WEB_INF.indexOf(".metadata")) + "intra/WebContent/cours/Devoirs/";
			String path =WEB_INF.substring(0, WEB_INF.indexOf("WEB-INF")) + "cours/Devoirs/";
			
			Upload.chemin = path+nomFichier ;
			//Si le chemin pour arriver dans notre dossier contient des espaces dans le son nom
			Upload.chemin = Upload.chemin.replaceAll("%20", " ");
			
			sortie = new BufferedOutputStream(new FileOutputStream(new File(Upload.chemin)), TAILLE_TAMPON);
		
			
			byte[] tampon = new byte[TAILLE_TAMPON];
			int longueur;
			while((longueur=entree.read(tampon))>0){
				sortie.write(tampon, 0, longueur);
			}
		
		}catch(IOException e){
			e.printStackTrace();
		}
		finally{
			sortie.close();
			entree.close();
		}
		
	}
	
	public void chargementBD (boolean ancien){
		
		if(ancien){
			User.getDevoirEtudiant().setCheminDevoir(Upload.cheminNew);
			User.getDevoirEtudiant().setNomDevoir(Upload.titre);
			DevoirsEtudiant.chargerDevoir(User.getDevoirEtudiant());

		}
		
	}
	
	@SuppressWarnings("unused")
	private String cloneString (String s){
		String result = "";
		for(int i=0; i<s.length(); i++){
			result += s.charAt(i);
		}
		return result;
	}

	public static String getVUE() {
		return VUE;
	}

	public static void setVUE(String vUE) {
		VUE = vUE;
	}

	public static String getTitre() {
		return titre;
	}

	public static void setTitre(String titre) {
		Upload.titre = titre;
	}

	public static String getChemin() {
		return chemin;
	}

	public static void setChemin(String chemin) {
		Upload.chemin = chemin;
	}

	public static String getWEB_INF() {
		return WEB_INF;
	}

	public static void setWEB_INF(String wEB_INF) {
		WEB_INF = wEB_INF;
	}

	public static String getCheminNew() {
		return cheminNew;
	}

	public static void setCheminNew(String cheminNew) {
		Upload.cheminNew = cheminNew;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static String getChampTitre() {
		return CHAMP_TITRE;
	}

	public static String getChampFichier() {
		return CHAMP_FICHIER;
	}

	public static String getChemin1() {
		return CHEMIN;
	}

	public static int getTailleTampon() {
		return TAILLE_TAMPON;
	}
	public static boolean isToast(){
		return Upload.Toast;
	}
	public static void setToast(boolean toast){
		Upload.Toast=toast;
	}
}
