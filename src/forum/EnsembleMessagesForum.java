package forum;

/**
 * Rechercher un ensemble de messages 
 * @author djobiii
 */

import java.sql.*; 
import java.util.*; 

import javax.swing.JOptionPane;

public class EnsembleMessagesForum 

{
		private ArrayList messages = new ArrayList(); 
		
		public EnsembleMessagesForum()
		{	
			this.messages = new ArrayList(); 
		}
		
		public void ajouter(Message message)
		{
			this.messages.add(message); 
		}
		
		public Iterator iterator()
		{
			return this.messages.iterator();
		}
		
		public void rechercherSujets(ConnecteurForum connecteur) throws SQLException
		{
			PreparedStatement rechercheSujets = connecteur.getConnexion().prepareStatement("SELECT id, auteur, max(datecreation) as datecreation, sujet, texte from message group by sujet order by datecreation desc");
			rechercher(rechercheSujets, null);
			rechercheSujets.close();
		}
		
		public void rechercherMessagesSujet(ConnecteurForum connecteur, String sujet) throws SQLException
		{
			PreparedStatement rechercheMessagesSujet = connecteur.getConnexion().prepareStatement("select * from message where sujet = ? order by datecreation asc");
			rechercher(rechercheMessagesSujet, new Object[]{sujet});
			rechercheMessagesSujet.close();
		}
		
		public void rechercher(PreparedStatement instructionRecherche, Object[] parametresInstruction) throws SQLException
		{
			
			if(parametresInstruction != null)
			{
				for(int i = 0 ; i< parametresInstruction.length ; i ++)
				{
					instructionRecherche.setObject(i+1, parametresInstruction[i]);
				}
				
				ResultSet resultat = instructionRecherche.executeQuery();
				
				while(resultat.next())
				{
					MessageForum message = new MessageForum();
					
					message.setId(resultat.getInt("id"));
					message.setAuteur(resultat.getString("auteur"));
					
					message.setDateCreation( resultat.getTimestamp("datecreation"));
					message.setSujet(resultat.getString("sujet"));
					message.setTexte(resultat.getString("texte"));
					
					ajouter(message);
					
				}
				
				resultat.close();
			}
			
		
		}
		}