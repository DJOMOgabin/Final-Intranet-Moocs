package forum;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Scanner;

import Modele.Examen;
import Traitement.PaireString;
import controlleur.Lecture;

public class LectEcriForum {
	private static String chemin = "Forum/";
	private static String extension = ".forum";
	public LectEcriForum(){
		
	}
	
	public static boolean Creation(String nomCours, String theme,boolean create){
		//nomCours = getCours(nomCours);
		boolean etat=false;
		File dossier = new File(Lecture.Fichier(chemin+nomCours));
		if(!dossier.exists())dossier.mkdirs();
		dossier = new File(Lecture.Fichier(chemin+nomCours+"/"+theme.hashCode()+extension));
		try {
			if(create){
				dossier.createNewFile();
				System.out.println("nom du cours : "+nomCours);
				etat = Examen.CreerForum(nomCours, theme);
			}else {
				dossier.delete();
				etat=Examen.SupprimerForum(nomCours,theme);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return etat;
	}
	
	
	public static boolean Ecriture(String id, String nomCours, String theme,String text){
		boolean etat=false;
		nomCours = getCours(nomCours);
			try {
				PrintWriter clavier = new PrintWriter(new FileOutputStream(Lecture.Fichier(chemin+nomCours+"/"+theme.hashCode()+extension),true));
				Timestamp time = new Timestamp(new com.sun.jmx.snmp.Timestamp().getDateTime());
				clavier.println("[ "+id+" "+time+" ] "+text+"\n]");
				clavier.close();
				etat=true;
			} catch (FileNotFoundException e) {
				etat=false;
			}
		return etat;
	}
	
	//Permet d'avoir l'id d'un cours
	@SuppressWarnings("finally")
	public static String getCours(String nom){
		String result="";
		ArrayList<String> string=new ArrayList<String>();
		ArrayList<PaireString> paire=new ArrayList<PaireString>();
		string.add("idcours");
		paire.add(new PaireString("titrecours", nom));
		
		try {
			ResultSet set = Examen.totalQuery(string, "cours", paire);
			while(set.next()){
				result=set.getString("idcours");
			}
			set.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			return result;
		}
	}
	
	public static ArrayList<Forum> Lecture(String nomCours, String theme){
		ArrayList<Forum> text= new ArrayList<>();
		nomCours = getCours(nomCours);
		try {
			Scanner clavier = new Scanner(new FileInputStream(Lecture.Fichier(chemin+nomCours+"/"+theme.hashCode()+extension)));
			String value="",reste;
			while(clavier.hasNext()){
				value=clavier.nextLine();
				while(clavier.hasNext()){
					reste = clavier.nextLine();
					if(!reste.equals("]")){
						value +="\n"+reste;
					}else{
						break;
					}
				}
				value = value.replaceAll("\n","<br>");			
				text.add(new Forum(value));
			}
			clavier.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return text;
	}
	
	public static String CreateTime(String date){
		String newDate="",an,moi,jour,heure,min,sec;
		an = " "+date.substring(0, 4)+", ";
		moi =  date.substring(5, 7);
		jour = date.substring(8, 10)+" ";
		heure = date.substring(11, 13)+":";
		min = date.substring(14, 16)+":";
		sec = date.substring(17, 19);
		String[] mois ={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Set","Oct","Nov","Dec"};
		newDate = jour+mois[Integer.parseInt(moi)-1]+an+heure+min+sec;
		return newDate;
	}
	
	public static void main(String[] args){
	}
	
}
