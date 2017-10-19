package Modele;
/**
 * <h1> La classe Video permettant  de créer les videos des semaines </h1>
 * @author djobiii
 * @see Cours 
 */
import java.util.ArrayList;

public class video


{
/**
 * La liste des vidéo correspondant à une semaine
 */
	private ArrayList<String> liste_video;
	
/**
 * Le constructeur par defaut 
 */
	public video()
	{
		this.liste_video=new ArrayList<String>();
	}
/**
 * Le constructeur qui contenait un certain nombre de vidéos
 */
	public video(int nbre_video)
	{
		this.liste_video=new ArrayList<String>(nbre_video);
	}
/**
 * @return arrayList : La liste des videos d'une semaine 
 */
	public ArrayList<String> getListeVideo(){return this.liste_video;}
/**
 * @see video
 * @param ArrayList l
 * @return void
 */
	public void setListeVideo(ArrayList<String> l){this.liste_video=l;}
/**
 * @param String liste
 * @return ArrayList 
 */
	public void ajouterVideo(String lien_video)
	{
		this.liste_video.add(lien_video);
	}
	
	
	
}