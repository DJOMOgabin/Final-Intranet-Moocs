package forum;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import Modele.Examen;
import Traitement.PaireString;

public class Forum {
	private String nomUser;
	private String date;
	private String text;
	
	
	public Forum(String line){
		construction(line);
	}
	
	public void construction(String line){
		Scanner clavier = new Scanner(line);
		String value = clavier.next();
		String id = clavier.next();
		String date1 = clavier.next();
				
		date1 += " "+ clavier.next();
		value = clavier.next();
		value = "";
		while(clavier.hasNext()){
			value += " "+clavier.next();
		}
		setText(value);
		setNomUser(getId(id));
		setDate(LectEcriForum.CreateTime(date1));
		clavier.close();
	}

	public static String getId(String id){
		if(id.equals("*")) return "Teacher";
		else {
			String result="";
			ArrayList<String> string=new ArrayList<>();
			ArrayList<PaireString> paire=new ArrayList<PaireString>();
			string.add("nom");
			paire.add(new PaireString("idetudiant", id));
			ResultSet set = Examen.totalQuery(string, "etudiant", paire);
			try {
				while(set.next())result=set.getString("nom");
				set.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
	}
	
	public String getNomUser() {
		return nomUser;
	}

	public void setNomUser(String nomUser) {
		this.nomUser = nomUser;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
}
