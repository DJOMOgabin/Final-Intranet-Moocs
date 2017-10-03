package forum;

import java.util.Scanner;

public class JSON {

	private String chaine;
	
	public JSON(String chaine){
		this.chaine=chaine;
	}

	public String getChaine() {
		return chaine;
	}

	public void setChaine(String chaine) {
		this.chaine = chaine;
	}
	
	public String Parse(int id){
		String value="";
		int taille=id;
		Scanner clavier = new Scanner(chaine);
		while(clavier.hasNext()&&id>0){
			value = clavier.nextLine();
			id--;
		}
		if(id>0)value="null";
		if(taille>=4){
			while(clavier.hasNext()){
				value +="\n"+clavier.nextLine();
			}
		}
		clavier.close();
		return value;
	}
}
