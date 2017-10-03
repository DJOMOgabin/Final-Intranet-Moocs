package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import controlleur.chronoThread;

public class Session {
	private String email;
	private long jour; //nombre de jours restant
	private long heure; 
	private long minute;
	private long seconde;
	private long tempsAlloue;//par jour
	private long dateDebut;
	private long dateFin;
	private long tempsRestant;//pour le jour
	private chronoThread t;
	
	public void vide()
	{
		
		this.setDateDebut(0);
		this.setdateFin(0);
		this.setEmail("");
		this.setHeure(0);
		this.setJour(0);
		this.setMinute(0);
		this.setSeconde(0);
		//this.setT(null);
		this.setTempsAlloue(0);
		this.setTempsRestant(0);
	}
	public chronoThread getT() {
		return t;
	}
	public void setT(chronoThread t) {
		this.t = t;
	}
	public long getTempsRestant() {
		return tempsRestant;
	}
	public void setTempsRestant(long tempsRestant) {
		this.tempsRestant = tempsRestant;
	}
	public void setDateFin(long dateFin) {
		this.dateFin = dateFin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(long dateDebut) {
		this.dateDebut = dateDebut;
	}
	public long getDateFin() {
		return dateFin;
	}
	public void setdateFin(long dateFin) {
		this.dateFin = dateFin;
	}
	public long getJour() {
		return jour;
	}
	public void setJour(long jour) {
		this.jour = jour;
	}
	public long getHeure() {
		return heure;
	}
	public void setHeure(long heure) {
		this.heure = heure;
	}
	public long getMinute() {
		return minute;
	}
	public void setMinute(long minute) {
		this.minute = minute;
	}
	public long getSeconde() {
		return seconde;
	}
	public void setSeconde(long seconde) {
		this.seconde = seconde;
	}
	public long getTempsAlloue() {
		return tempsAlloue;
	}
	public void setTempsAlloue(long tempsAlloue) {
		this.tempsAlloue = tempsAlloue;
	}
	/**
	 * 
	 * @return Connection chaine_connection
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		return Examen.ouvrirBD();
		
	}
	/*
	 * renvoit le temps restant derniere session de connexion pour l'utilisateur d'email email
	 */
	public  Session rechercheDerniereSession(String email)
	{
		Session session = new Session();
		ArrayList<Session> temp=new ArrayList<Session>();
		session.setEmail(email);
		Connection conn;
		try {
			conn = this.ouvrirBD();
		
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery("select * from session natural join etudiant where email='"+email+"';");		
			
		while(rs.next()){
			session=new Session();
			session.setTempsAlloue(rs.getLong(3));
			session.setTempsRestant(rs.getLong(4));
			divisionTemps(session.getTempsRestant());
			session.setSeconde(this.getSeconde());
			session.setMinute(this.getMinute());
			session.setHeure(this.getHeure());
			session.setJour(rs.getLong("nombreJourRestant"));
			try{
			session.setDateFin(rs.getTimestamp(6).getTime());
			session.setDateDebut(rs.getTimestamp(5).getTime());
			}catch(NullPointerException e)
			{
				session.setDateDebut(0);
				session.setdateFin(0);
			}
			
			temp.add(session);
		}
		
		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur : "+e.getMessage()); 
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return temp.get(temp.size()-1);
	
	}
	public String toString()
	{
		return "session "+this.getEmail()+" dateDebut "+this.getDateDebut()+" dateFin "+this.getDateFin()+" "+
				"temps alloue: "+this.getTempsAlloue()+" temps restant: "+this.getTempsRestant();
	}
	/**
	 * fonction de division du temps
	 */
	public void divisionTemps(long tempsAdiviser)
	{
		long temp1, temp2, temp3, temp4;
		temp1=tempsAdiviser/1000;
		
		temp2=temp1/60;
		
		temp3=temp2/60;
		
		temp4=temp3/24;
		
		setSeconde(temp1%60);
		setMinute(temp2%60);
		setHeure(temp3%60);
		/*seconde=temp1%60;
		minute=temp2%60;
		heure=temp3%60;*/
		//jour=(int)temp4%24;
		/*if(heure==24)
		{
			heure=0;
			jour++;
		}*/
		
	}

	public int idEtudiant(String email)
	{
		Connection conn;
		int temp=0;
		try {
			conn = this.ouvrirBD();
		
		Statement stat = conn.createStatement();
		/*
		 * on commence par obtenir l'id de l'etudiant a partir de l'email
		 */
		ResultSet rs = stat.executeQuery("select * from etudiant where email='"+email+"';");		

		while(rs.next()){
			temp=rs.getInt(1);
		}
		rs.close();
		stat.close();
		} catch (SQLException e) {
			System.out.println("Erreur : "+e.getMessage()); 
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
		
	}
	public void enregistrerSession(Session session)
	{
		int idEtd;
		Connection conn;
		try {
			conn = this.ouvrirBD();
		
		/*
		 * on commence par obtenir l'id de l'etudiant a partir de l'email
		 */
		idEtd=idEtudiant(session.getEmail());
		/*
		 * puis on fait l'insertion
		 */
		String requete="insert into session(idEtudiant, tempsAlloue, tempsRestant, dateDebut, dateFin, nombreJourRestant) values(?, ?, ?, ?, ?, ?);";		
		PreparedStatement st = conn.prepareStatement(requete);
		st.setInt(1, idEtd);
		st.setLong(2, session.getTempsAlloue());
		st.setLong(3, session.getTempsRestant());
		st.setTimestamp(4, new Timestamp(session.getDateDebut()));
		st.setTimestamp(5, new Timestamp(session.getDateFin()));
		st.setLong(6, session.getJour());
		st.executeUpdate();
		
		st.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}