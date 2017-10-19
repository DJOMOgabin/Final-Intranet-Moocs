package forum;
/**
 * Cette Classe est pour les message contenus dans le forum 
 * 
 * @author djobiii
 *
 */

import java.sql.*; 

public class MessageForum extends Message 

{
	//Identifie un message de manière unique 
	
	private int id;
	
	public MessageForum()
	{
		super(null,null,null,null);
	}
	
	public MessageForum(String auteur, String sujet, String texte)
	{
		super(auteur, sujet, texte);
	}
	
	public MessageForum(int id, String auteur, String sujet,Date dateCreation)
	{
		super(auteur, sujet, dateCreation ); 
		this.id = id; 
	}
	
	public MessageForum(int id, String auteur, String sujet)
	{
		super(auteur,sujet); 
		this.id= id; 
	}
	
	public MessageForum(int id, String auteur, String sujet, String texte, Date dateCreation)
	{
		super(auteur, sujet , texte, dateCreation); 
		this.id= id; 
	}
	
	public int getId()
	{
		return this.id; 
	}
	
	public void setId(int id)
	{
		this.id= id; 
	}
	
	public boolean rechercher(ConnecteurForum connecteur) throws SQLException
	{
		
		PreparedStatement rechercheMessage = connecteur.getConnexion().prepareStatement("select * from message where id = ?");
		
		rechercheMessage.setInt(1,this.id);
		ResultSet resultat = rechercheMessage.executeQuery();
		boolean messageExiste = resultat.next(); 
		
		if(messageExiste){
			
			setAuteur(resultat.getString("auteur"));
			setDateCreation(resultat.getTimestamp("datecreation"));
			setSujet(resultat.getString("sujet"));
			setTexte(resultat.getString("texte"));
			
		}
		
		resultat.close();
		rechercheMessage.close(); 
		
		return messageExiste ; 
		
	}
	
	public void ajouter(ConnecteurForum connecteur) throws SQLException
	{
		PreparedStatement prep = connecteur.getConnexion().prepareStatement("insert into message(auteur,datecreation,sujet,texte) values (?,?,?,?)");
		prep.setString(1, this.getAuteur());
		prep.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
		prep.setString(3,OutilsChaine.convertirEnHTML(getSujet()));
		prep.setString(4,this.getTexte());
		prep.executeUpdate();
		prep.close();
		
	}
	
	public void mettreAJour(ConnecteurForum connecteur) throws SQLException
	
	{
		
		PreparedStatement miseAJourMessage = connecteur.getConnexion().prepareStatement("update message set auteur = ? , datecreation = ? , sujet = ?, texte ?  where id = ? "); 
		
		miseAJourMessage.setString(1,getAuteur()); 
		miseAJourMessage.setTimestamp(2, new Timestamp(getDateCreation().getTime()));
		miseAJourMessage.setString(3, getSujet()); 
		miseAJourMessage.setString(4,new OutilsChaine().convertirEnEntites(getTexte())); 
		
		miseAJourMessage.setInt(5,this.id); 
		miseAJourMessage.executeUpdate(); 
		
		miseAJourMessage.close(); 
	}
}