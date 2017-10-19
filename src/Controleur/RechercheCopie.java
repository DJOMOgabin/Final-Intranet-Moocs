package Controleur;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;

import Modele.CopieEtudiant;
import Modele.Examen;

public class RechercheCopie {
	
	public static Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		return Examen.ouvrirBD();
		
	}
	
	public static CopieEtudiant charger(String nomEpreuve,String nomCours, String idEtudiant)
	{
		CopieEtudiant copie=null;
		ResultSet result;
		java.sql.PreparedStatement prep;
		Connection conn ;
		try{			
			conn= ouvrirBD(); 
			String query = "select * from copie where cours=? and idEtudiant=? and epreuve=?;";
			prep = conn.prepareStatement(query);
			prep.setString(1, nomCours);
			prep.setString(2, idEtudiant);
			prep.setString(3, nomEpreuve);
			result = prep.executeQuery();
			while(result.next()){	
				copie = new CopieEtudiant();
				copie.setNomCours(result.getString("cours"));
				copie.setIdEtudiant(result.getString("idEtudiant"));
				copie.setNomEpreuve(result.getString("epreuve"));
				copie.setNombreTentative(Integer.parseInt(result.getString("tentative")));
				copie.setDuree(Double.parseDouble(result.getString("duree")));
				copie.setNote(Double.parseDouble(result.getString("note")));
				copie.setDate(concatTime(result.getString("createTime")));
				copie.setTime(concatHour(result.getString("hour")));
			}
			
			result.close();
			prep.close();
		}catch(SQLException ex)
		{
			System.out.println(ex.getMessage());
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex.getMessage());
		}finally{
			
		}
		return copie;
	}
	
	@SuppressWarnings("deprecation")
	private static Timestamp concatTime(String time){
		Timestamp tamp=null;
		int an,mois,jour,heure,min,sec,tier;
		an = Integer.parseInt(time.substring(0, 4));
		mois = Integer.parseInt(time.substring(5, 7));
		jour = Integer.parseInt(time.substring(8, 10));
		heure = Integer.parseInt(time.substring(11, 13));
		min = Integer.parseInt(time.substring(14, 16));
		sec = Integer.parseInt(time.substring(17, 19));
		tier= Integer.parseInt(time.substring(20));
		tamp = new Timestamp(an-1900, mois, jour, heure, min, sec, tier);
		return tamp;
	}
	
	@SuppressWarnings("deprecation")
	private static Time concatHour(String time){
		Time tamp=null;
		int heure,min,sec;
		heure = Integer.parseInt(time.substring(0, 2));
		min = Integer.parseInt(time.substring(3, 5));
		sec = Integer.parseInt(time.substring(6, 8));
		tamp = new Time(heure, min, sec);
		return tamp;
	}
	
}
