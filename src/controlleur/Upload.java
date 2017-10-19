package controlleur;

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

import Modele.DevoirsEtudiant;
import Modele.User;

/**
 * Servlet implementation class Upload
 */
//@WebServlet("/upload")
//@MultipartConfig
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
	public static String chemin;
	public static String WEB_INF = null;
	public static String cheminNew;
	public User user;
	private static boolean Toast=true;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String chemin = getServletContext().getRealPath("/")+"cours\\Devoirs\\";
		String titre = request.getParameter(CHAMP_TITRE);
		this.titre = titre;
		request.setAttribute(CHAMP_TITRE, titre);
		
		/**
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
			
			if(nomFichier !=null && !nomFichier.isEmpty()){
				String nomChamp = part.getName();
				nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/')+1).substring(nomFichier.lastIndexOf('\\')+1);
				System.out.println(nomFichier);
				Upload.chemin = chemin + nomFichier;
				Upload.cheminNew = chemin + nomFichier;
				if(request.getParameter("ancien").equals(Upload.cheminNew))ancien=false;
				else ancien=true;
				
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
		request.setAttribute("title", request.getParameter("title"));
		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		
	}
	/*
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
		
		/*String className=Upload.class.getName().replaceAll("\\.", "/" )+".class";
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
			//String path =WEB_INF.substring(0, WEB_INF.indexOf("WEB-INF")) + "cours/Devoirs/";
			chemin = chemin.replaceAll("\\", "/");
			Upload.chemin = chemin+nomFichier ;
			//Si le chemin pour arriver dans notre dossier contient des espaces dans le chemin de son nom
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
	public void chargementBD (String chemin){	
			User.getDevoirEtudiant().setCheminDevoir(chemin);
			User.getDevoirEtudiant().setNomDevoir(getTitre());
			DevoirsEtudiant.chargerDevoir(User.getDevoirEtudiant());
	}
	*/
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

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
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
/*
	public static String getChemin1() {
		return CHEMIN;
	}
*/
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
