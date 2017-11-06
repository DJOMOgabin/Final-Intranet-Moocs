package controlleur;

<<<<<<< HEAD
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
=======
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
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b

import Modele.DevoirsEtudiant;
import Modele.User;

/**
 * Servlet implementation class Upload
 */
//@WebServlet("/upload")
//@MultipartConfig
<<<<<<< HEAD
@WebServlet("/upload")
public class Upload extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String VUE = "/les_devoirs.jsp";
	public static final String CHAMP_TITRE = "titre";
	public static final String CHAMP_FICHIER = "fichier";
	//public static final String CHEMIN = "chemin";
	public static final int TAILLE_TAMPON = 902400; //~100ko
	public String titre;
=======
@SuppressWarnings("serial")
public class Upload extends HttpServlet {
	public static String VUE = "/les_devoirs.jsp";
	public static final String CHAMP_TITRE = "titre";
	public static final String CHAMP_FICHIER = "fichier";
	public static final String CHEMIN = "chemin";
	public static final int TAILLE_TAMPON = 90240; //10Ko
	public static String titre;
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	public static String chemin;
	public static String WEB_INF = null;
	public static String cheminNew;
	public User user;
	private static boolean Toast=true;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
		//this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
=======
		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
<<<<<<< HEAD
	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String chemin = getServletContext().getRealPath("/")+"cours\\Devoirs\\";
=======
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String chemin = this.getServletConfig().getInitParameter(CHEMIN);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		String titre = request.getParameter(CHAMP_TITRE);
		this.titre = titre;
		request.setAttribute(CHAMP_TITRE, titre);
		
		/**
<<<<<<< HEAD
		 * les données reçues étant multipart, nous utilisons
		 * getPart() pour traiter le champ d'envoi de fichiers.
		 */
		DiskFileUpload upload = new DiskFileUpload();
		List items;
		try {
			items = upload.parseRequest(request);
			Iterator itr=items.iterator();
			while(itr.hasNext()){
					FileItem item = (FileItem)itr.next();
					File savedFile=null,uploadDir=null;
					if(item.isFormField())
					{
						return; 
					}else{
						if(!item.getName().equals("")){
							//File fullFile=new File(item.getName());
							uploadDir = new File(getServletContext().getRealPath("/")+"cours/Devoirs/");
							savedFile = File.createTempFile("devoir",Lecture.LireExtension(item.getName()), uploadDir);
							try {
								item.write(savedFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
							System.out.println(uploadDir+savedFile.getName());
							//chargementBD(uploadDir+savedFile.getName());				
						}
					}
				}
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}		
		System.out.println("le titre : "+request.getParameter("title"));
		/*for(Part part : request.getParts()){
			String nomFichier = getNomFichier(part);
			System.out.println(nomFichier);
=======
		 * les donnï¿½es reï¿½ues ï¿½tant multipart, nous utilisons
		 * getPart() pour traiter le champ d'envoi de fichiers.
		 */
		boolean ancien=false;
		for(Part part : request.getParts()){
			String nomFichier = getNomFichier(part);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			
			if(nomFichier !=null && !nomFichier.isEmpty()){
				String nomChamp = part.getName();
				nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/')+1).substring(nomFichier.lastIndexOf('\\')+1);
<<<<<<< HEAD
				System.out.println(nomFichier);
=======
				
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
				Upload.chemin = chemin + nomFichier;
				Upload.cheminNew = chemin + nomFichier;
				if(request.getParameter("ancien").equals(Upload.cheminNew))ancien=false;
				else ancien=true;
				
<<<<<<< HEAD
				ecrireFichier(part, nomFichier, chemin);				
				request.setAttribute(nomChamp, nomFichier);
			}
		}*/
		/*try {
			if(ServletFileUpload.isMultipartContent(request)){
				//Create a factory for disk-based file items
				final FileItemFactory factory = new DiskFileItemFactory();
				//Create a new file upload handler
				final ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
				//parse the request
				final List fileItemList = servletFileUpload.parseRequest((org.apache.tomcat.util.http.fileupload.RequestContext) request);
				
				final Iterator it = fileItemList.iterator();
				
				while(it.hasNext()){
					final FileItem fileItem = (FileItem)it.next();
					if(!fileItem.isFormField()){
						System.out.println("le nom complet : "+fileItem.getFieldName());
						//On lit le contenu du fichier en memoire
						final String myString = 
					}
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}*/
=======
				ecrireFichier(part, nomFichier, chemin);
				
				request.setAttribute(nomChamp, nomFichier);
			}
		}
		chargementBD(ancien);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		request.setAttribute("title", request.getParameter("title"));
		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		
	}
<<<<<<< HEAD
	/*
=======
	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	private static String getNomFichier(Part part){
		for(String contentDisposition : part.getHeader("content-disposition").split(";")){
			if(contentDisposition.trim().startsWith("filename")){
				return contentDisposition.substring(contentDisposition.indexOf("=")+1).trim().replace("\"", "");
			}
		}
<<<<<<< HEAD
=======

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		return null;
	}
	
	private void ecrireFichier(Part part, String nomFichier, String chemin) throws IOException{
		BufferedInputStream entree = null;
		BufferedOutputStream sortie = null;
		
<<<<<<< HEAD
		/*String className=Upload.class.getName().replaceAll("\\.", "/" )+".class";
=======
		String className=Upload.class.getName().replaceAll("\\.", "/" )+".class";
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		URL classPath=Upload.class.getClassLoader().getResource(className);
		File f=new File(classPath.getPath());
		while(f!=null && !f.getName().equals("WEB-INF")){
		 f=f.getParentFile();
		}
		if(f!=null)
		 WEB_INF=f.getPath().replace('\\', '/');
<<<<<<< HEAD
=======

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		
		try{
			entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
			
			//String path = WEB_INF.substring(0, WEB_INF.indexOf(".metadata")) + "intra/WebContent/cours/Devoirs/";
<<<<<<< HEAD
			//String path =WEB_INF.substring(0, WEB_INF.indexOf("WEB-INF")) + "cours/Devoirs/";
			chemin = chemin.replaceAll("\\", "/");
			Upload.chemin = chemin+nomFichier ;
			//Si le chemin pour arriver dans notre dossier contient des espaces dans le chemin de son nom
=======
			String path =WEB_INF.substring(0, WEB_INF.indexOf("WEB-INF")) + "cours/Devoirs/";
			
			Upload.chemin = path+nomFichier ;
			//Si le chemin pour arriver dans notre dossier contient des espaces dans le son nom
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
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
<<<<<<< HEAD
	public void chargementBD (String chemin){	
			User.getDevoirEtudiant().setCheminDevoir(chemin);
			User.getDevoirEtudiant().setNomDevoir(getTitre());
			DevoirsEtudiant.chargerDevoir(User.getDevoirEtudiant());
	}
	*/
=======
	
	public void chargementBD (boolean ancien){
		
		if(ancien){
			User.getDevoirEtudiant().setCheminDevoir(Upload.cheminNew);
			User.getDevoirEtudiant().setNomDevoir(Upload.titre);
			DevoirsEtudiant.chargerDevoir(User.getDevoirEtudiant());

		}
		
	}
	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
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

<<<<<<< HEAD
	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
=======
	public static String getTitre() {
		return titre;
	}

	public static void setTitre(String titre) {
		Upload.titre = titre;
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
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
<<<<<<< HEAD
/*
	public static String getChemin1() {
		return CHEMIN;
	}
*/
=======

	public static String getChemin1() {
		return CHEMIN;
	}

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
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
