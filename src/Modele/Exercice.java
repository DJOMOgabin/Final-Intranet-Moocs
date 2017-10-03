package Modele;

/**
 * <h1> Cette classe est suppose contenir les informations sur un exercice </h1>
 * @author djobiii
 *
 */

public class Exercice 

{
	/**
	 * L'enonce de l'exercice
	 */
	private String enonce;
	/**
	 * Le tableau de reponse possible pour l'option 
	 */
	private String[] option;
	/**
	 * L'indice de la reponse en question 
	 * @see enonce
	 */
	private int  reponse;
	/**
	 * Le constructeur par defaut de l'exercice 
	 */
	public Exercice()
	{
		this.enonce="";
		this.option= new String[4];
		this.reponse= 0;
	}
	/**
	 * 
	 * @param enonce
	 * @param reponse1
	 * @param reponse2
	 * @param reponse3
	 * @param reponse4
	 * @param reponse
	 * Initialise les parametre de l'exercice par rapport à ces arguments
	 */
	public Exercice(String enonce, String reponse1, String reponse2, String reponse3,String reponse4, int reponse)
	{
		this.enonce= enonce;
		this.option[0]=reponse1;
		this.option[1]=reponse2;
		this.option[2]=reponse3;
		this.option[3]=reponse4;
		this.reponse=reponse;
	}
	/**
	 * @return L'enonce de l'exercice
	 */
	public String getEnonce() {
		return enonce;
	}
	/**
	 * @param enonce the enonce to set
	 */
	public void setEnonce(String enonce) {
		this.enonce = enonce;
	}
	/**
	 * @return le tableau des options
	 */
	public String[] getOption() {
		return option;
	}
	/**
	 * @param option the option to set
	 */
	public void setOption(String[] option) {
		this.option = option;
	}
	/**
	 * @return the reponse
	 */
	public int getReponse() {
		return reponse;
	}
	/**
	 * @param reponse the reponse to set
	 */
	public void setReponse(int reponse) {
		this.reponse = reponse;
	}
	/**
	 * Retourne une description complete de l'exercice par rapport au format suivant 
	 * <ul>
	 * <li> Enonce : </li>
	 * <li> Reponse 1: </li>
	 * <li> Reponse 2: </li>
	 * <li> Reponse 3: </li>
	 * <li> Reponse 4: </li>
	 * <li> Reponse : </li>
	 * </ul>
	 * @return description de l'exercice
	 */
	public String toString()
	{
		return "Enonce: "+this.getEnonce()+"\nReponse 1: "
				+this.getOption()[0]+"\nReponse 2: "+this.getOption()[1]+"\n"
						+ "Reponse 3: "+this.getOption()[2]+"\nReponse 4: "+this.getOption()[3]+""
								+ "\nReponse :"+this.getOption()[this.getReponse()-1];
				
	}
	
	
	
	
}