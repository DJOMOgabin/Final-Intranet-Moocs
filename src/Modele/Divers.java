package Modele;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Divers {
public long tempsAlloueGeneral;
public long joursAlloueGeneral;
public boolean ischrono;
public int iddivers;

public void setTempsAlloueGeneral(long tempsAlloueGeneral) {
	this.tempsAlloueGeneral = tempsAlloueGeneral;
}
public Divers()
{
	
}

/**
	 * 
	 * @return Connection chaine_connection
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Connection ouvrirBD() throws SQLException,ClassNotFoundException
	{
		Connection conn=null;
		
		try{
			
			Class.forName(new constante().driver);
			conn=DriverManager.getConnection(new constante().chaine_connexion,new constante().log_bd,new constante().pass_bd);
			
			
		}catch(SQLException e)
		{
			
			throw new SQLException("Erreur\nDetails "+e.getMessage());
			
		}catch(ClassNotFoundException e)
		{
			throw new ClassNotFoundException("Erreur\nDetails "+e.getMessage());
		}
		
		return conn;
		
	}
/**
 * methode permettant de changer le temps d'un etudiant
 */
public void updateTempsEtudiant(Long temps, int idetudiant){
	//on commence par recuperer l'iddivers correspondant a cet etudiant
	Divers div=new Divers();
	div=div.getDiversFromEtudiant(idetudiant);
	int iddivers=div.iddivers;
	if(iddivers<=1)
	{
		//temps*=60000;
		
		//c'est un nouvel etudaint
		iddivers=this.ajoutTempsAlloue(temps, div.joursAlloueGeneral, div.ischrono);
		//ensuite on insere la correspondance
		this.insertCorrespEtudiantDivers(iddivers, idetudiant);
	}else
	{
		try{
			Connection conn=this.ouvrirBD();
			String query="UPDATE divers SET tempsAlloueGeneral=? WHERE iddivers=?";
			temps*=60000;
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, temps);
			st.setInt(2, iddivers);
			int n = st.executeUpdate();
			
			st.close();
			conn.close();	

		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
/**
 * methode permettant de changer le nombre de jouirs d'un etudiant
 */
public void updateJoursEtudiant(Long jours, int idetudiant)
{
	//on commence par recuperer l'iddivers correspondant  cet etudiant
	Divers div=new Divers();
	div=div.getDiversFromEtudiant(idetudiant);
	int iddivers=div.iddivers;
	if(iddivers<=1)
	{
		//c'est un nouvel etudaint
		iddivers=this.ajoutTempsAlloue(div.tempsAlloueGeneral, jours, div.ischrono);
		//ensuite on insere la correspondance
		this.insertCorrespEtudiantDivers(iddivers, idetudiant);
	}else
	{
		try{
			Connection conn=this.ouvrirBD();
			String query="UPDATE divers SET jourAlloueGeneral=? WHERE iddivers=?";

			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, jours);
			st.setInt(2, iddivers);
			int n = st.executeUpdate();
			
			st.close();
			conn.close();	

		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
/**
 * methode permettant d'activer ou de desactiver le chrono d'un etudiant
 */
public void activationChronoEtudiant(boolean ischrono, int idetudiant)
{
	//on commence par recuperer l'iddivers correspondant a cet etudiant
	Divers div=new Divers();
	div=div.getDiversFromEtudiant(idetudiant);
	int iddivers=div.iddivers;
	//puis on va dans la bd mettre an jour la valeur du chrono avec la nouvelle valeur
	Connection conn;
	try{
		conn=this.ouvrirBD();
		
		if(iddivers<=1)
		{
			//c'est un nouvel etudiant
			//div.tempsAlloueGeneral/=60000;
			
			iddivers=this.ajoutTempsAlloue(div.tempsAlloueGeneral, div.joursAlloueGeneral, ischrono);
			//ensuite on insere la correspondance
			this.insertCorrespEtudiantDivers(iddivers, idetudiant);
		}else{
			String query="UPDATE divers SET ischrono=? WHERE iddivers=?";

			PreparedStatement st = conn.prepareStatement(query);
			st.setBoolean(1, ischrono);
			st.setInt(2, iddivers);
			int n = st.executeUpdate();
			
			st.close();
			conn.close();	
		}
			
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
/***
 * methode d'insertion d'un nouveau temps, jours, ischrono=false
 * @param temps
 * @param jours
 * @return
 */
public int ajoutTempsAlloue(long temps, long jours, boolean ischrono)
{
	int id=0;
	Connection conn;
	try {
		conn = this.ouvrirBD();
	Statement instruction=conn.createStatement();
	
	//si le temps est null
	
	//si le nombre de jours est null
	
	
	temps=temps*60000;
	String requete="insert into divers(tempsAlloueGeneral, jourAlloueGeneral, ischrono) values("+temps+", "+jours+", "+ischrono+")";
	instruction.execute(requete);
	
	//on commence par recuperer l'iddivers
	requete="SELECT max(iddivers) FROM divers";
	
	Statement stat = conn.createStatement();
	
	ResultSet rs = stat.executeQuery(requete);		
	
	while(rs.next()){
		id=rs.getInt("max(iddivers)");
		break;
	}
	
	rs.close();
	stat.close();
	instruction.close();
	conn.close();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return id;
}
/**
 * methode permettant de modifier le temps alloue a un etudiant
 */

/*
 * cette methode permet de mettre a jour le temps alloue general
 * avec un seul parametre permet de mettre a jours les temps alloues de tout le monde
 * tout en recalculant le temps restant
 
public void updateTempsAlloue(long temps)
{
	//temps est le temps en minutes, faut le convertir en ms
	this.ajoutTempsAlloue(temps);
	/*puis on met a jour les temps alloue et restant de tous les users
	try {
		this.updateTempsAlloueUser(temps*60000);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}*/
//}

/**
 * Il se charge de mettre a jour les temps alloue de tous
 * @throws SQLException 
 */
public void updateTempsAlloueUser(long temps) throws SQLException
{
	try{
		
		Connection conn=this.ouvrirBD();
		
		String query="update session set tempsAlloue=? ";
		
		PreparedStatement st = conn.prepareStatement(query);
		st.setLong(1, temps);
		st.executeUpdate();
		
		st.close();
		conn.close();
	}catch(SQLException e)
	{
	
		throw new SQLException("Details\n"+e.getMessage());
	
	}catch(ClassNotFoundException e)
	{
		try {
			throw new ClassNotFoundException("Details\n"+e.getMessage());
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
/**
 * methode permettant d'enregistrer la correspondance entre 
 * un groupe d'etudiant et un divers
 */
public void insertCorrespEtudiantDivers(int iddivers, int idetudiant)
{
	Connection conn;
	try {
		conn = this.ouvrirBD();
	Statement instruction=conn.createStatement();
	String requete="insert into corresp_divers_etudiant(iddivers, idetudiant) values("+iddivers+", "+idetudiant+")";
	instruction.execute(requete);
	
	instruction.close();
	conn.close();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
/**
 * methode permettant de changer le temps alloue general de tout le monde
 */
public void ajoutTempsAlloueTous(long temps)
{
	try{
		
		temps=temps*60000;
			
		Connection conn=this.ouvrirBD();
		
		String query="update divers set tempsAlloueGeneral=?";
		
		PreparedStatement st = conn.prepareStatement(query);
		st.setLong(1, temps);
		st.executeUpdate();
		
		st.close();
		conn.close();
		
		}catch(Exception e)
		{
			
		}

}
/**
 * methode permettant de changer le temps alloue general de tout le monde
 */
public void ajoutJoursAlloueTous(long jours)
{
	try{
		
		
			
		Connection conn=this.ouvrirBD();
		
		String query="update divers set jourAlloueGeneral=?";
		
		PreparedStatement st = conn.prepareStatement(query);
		st.setLong(1, jours);
		st.executeUpdate();
		
		st.close();
		conn.close();
		
		}catch(Exception e)
		{
			
		}

}
/**
 * methode permettant de changer le ischrono general de tout le monde
 */
public void ajoutChronoTous(boolean ischrono)
{
	try{
		
		Connection conn=this.ouvrirBD();
		
		String query="update divers set ischrono=?";
		
		PreparedStatement st = conn.prepareStatement(query);
		st.setBoolean(1, ischrono);
		st.executeUpdate();
		
		st.close();
		conn.close();
		
		}catch(Exception e)
		{
			
		}

}

/**
 * methode permettant de changer les configurations de tout le monde
 */
public  void ajoutConfigTous(long temps, long jours, boolean ischrono)
{
	try{
		
		temps=temps*60000;
		
			
		Connection conn=this.ouvrirBD();
		
		String query="update divers set tempsAlloueGeneral=?, jourAlloueGeneral=?, ischrono=?";
		
		PreparedStatement st = conn.prepareStatement(query);
		st.setLong(1, temps);
		st.setLong(2, jours);
		st.setBoolean(3, ischrono);
		st.executeUpdate();
		
		st.close();
		conn.close();
		}catch(Exception e)
		{
			
		}
}
/**
 * methode permettant de recuperer le divers correspondant a un etudiant
 **
 */
public Divers getDiversFromEtudiant(int idetudiant)
{
	Divers temp=new Divers();
	try {
		Connection conn=this.ouvrirBD();
		//debut de la transaction
		
		//on commence par recuperer l'iddivers
		String requete="SELECT max(iddivers) FROM corresp_divers_etudiant WHERE idetudiant="+idetudiant+"";
		
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery(requete);		
		int id=0;
		while(rs.next()){
			id=rs.getInt("max(iddivers)");
			break;
		}
		
		//puis on recherche cet id pour recuperer le divers correspondant
		requete="SELECT * FROM divers WHERE iddivers="+id+"";
		rs=stat.executeQuery(requete);
		
		while(rs.next())
		{
			temp.ischrono=rs.getBoolean("ischrono");
			temp.joursAlloueGeneral=rs.getLong("jourAlloueGeneral");
			temp.tempsAlloueGeneral=rs.getLong("tempsAlloueGeneral");
			temp.iddivers=rs.getInt("iddivers");
			break;
		}
		
		if(temp.iddivers==0)
		{
			//alors l'etudiant ne fait partir d'aucun groupe
			//on l'affecte les infos du divers 1
			requete="SELECT * FROM divers WHERE iddivers=1";
			rs=stat.executeQuery(requete);
			
			while(rs.next())
			{
				temp.ischrono=rs.getBoolean("ischrono");
				temp.joursAlloueGeneral=rs.getLong("jourAlloueGeneral");
				temp.tempsAlloueGeneral=rs.getLong("tempsAlloueGeneral");
				temp.iddivers=rs.getInt("iddivers");
				break;
			}
			
		}
		
		rs.close();
		stat.close();
		conn.close();
			
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	return temp;
}
}