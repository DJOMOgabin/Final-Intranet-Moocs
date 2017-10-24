package controlleur;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.Scanner;

public class Lecture{

	private Scanner clavier,clavier2;
	private static String userName;
	private static String password;
	private static  String port;
	private static String serverPort;
	private static  String url;
	private static String error;
	private static String BD;
	private static String driver;
	private static String WEB_INF;
	private static boolean effectuer=true;
	
	 public Lecture() {
		lecture();		
	}
	
	public static String Fichier(String nom){
		 String className=Upload.class.getName().replaceAll("\\.", "/" )+".class";
			URL classPath=Upload.class.getClassLoader().getResource(className);
			File f=new File(classPath.getPath());
			while(f!=null && !f.getName().equals("WEB-INF")){
			 f=f.getParentFile();
			}
			if(f!=null)
			 WEB_INF=f.getPath().replace('\\', '/');
			String Path1 = WEB_INF.substring(0, WEB_INF.indexOf("WEB-INF")) + nom;
			Path1 = Path1.replaceAll("%20", " ");
			if(nom.equalsIgnoreCase("hibernate.cfg.xml")){
				System.out.println("le chemin : "+Path1);
				return Path1;
			}
			else {
				return Path1;
			}
	 }
	 
	//La fonction permet de lire dans le fichier config.djo, qui est le fichier de configuration de notre 
	//base de données
	 public void lecture(){
		try {
			String line,mot,value;
			String Path1 = Fichier("config.djo");
			 clavier = new Scanner(new FileInputStream(Path1));			
			while(clavier.hasNext()){
				line = clavier.nextLine();
				clavier2 = new Scanner(line);
				mot = clavier2.next();
				value = clavier2.next();
				if(mot.equalsIgnoreCase("user:")){
					setUserName(value);
				}else if(mot.equalsIgnoreCase("password:")){
					setPassword(value);
				}else if(mot.equalsIgnoreCase("port:")){
					setPort(value);
				}else if(mot.equalsIgnoreCase("url:")){
					setUrl(value);
				}else if(mot.equalsIgnoreCase("BD:")){
					setBD(value);
				}else if(mot.equalsIgnoreCase("driver:")){
					setDriver(value);
				}else if(mot.equalsIgnoreCase("serveur:")){
					setServerPort(value);
				}
			}
			setEffectuer(true);
			clavier.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			setEffectuer(false);
			setError("fichier introuvable, veuiller à ce qu'il soit là. Merci");			
		}		
	}
	 
	public static String LireExtension(String nom){
		String list = "";
		list = nom.substring(nom.indexOf("."));
		return list;
	}
	
	 public static String getUserName() {
		return userName;
	}

	 public static void setUserName(String userName) {
		Lecture.userName = userName;
	}

	 public static String getPassword() {
		return password;
	}

	 public static  void setPassword(String password) {
		Lecture.password = password;
	}

	 public static String getPort() {
		return port;
	}

	 public static  void setPort(String port) {
		Lecture.port = port;
	}

	 public static  String getUrl() {
		return url;
	}

	 public static  void setUrl(String url) {
		Lecture.url = url;
	}

	 public static String getError() {
		return error;
	}

	 public static void setError(String error) {
		Lecture.error = error;
	}

	 public static boolean isEffectuer() {
		return effectuer;
	}

	 public static void setEffectuer(boolean effectuer) {
		Lecture.effectuer = effectuer;
	}

	public static String getBD() {
		return BD;
	}

	public static void setBD(String bD) {
		BD = bD;
	}

	public static String getDriver() {
		return driver;
	}

	public static void setDriver(String driver) {
		Lecture.driver = driver;
	}

	public static String getServerPort() {
		return serverPort;
	}

	public static void setServerPort(String serverPort) {
		Lecture.serverPort = serverPort;
	}

	
	
}
