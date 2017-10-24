package Traitement;

import javax.servlet.http.HttpServletRequest;

import Modele.Epreuve;

public class Remplissage {

	private HttpServletRequest request;
	private Nombre nombre = new Nombre();
	
	public Remplissage(){
		
	}
	
	public Remplissage(HttpServletRequest request){
		this.request=request;
		calcul();
	}
	
	private void  calcul(){
		int i=1,j;
		
		while(request.getParameter("exercice"+i)!=null&&request.getParameter("exercice"+i).length()!=0){
			j=1;
			while(request.getParameter("question"+i+j)!=null&&request.getParameter("question"+i+j).length()!=0){
				j++;
			}
			nombre.getNombreExercice().add(j-1);
			i++;
		}
	}
	
	public void setAttribut(){
		request.setAttribute("titre",request.getParameter("titre"));
		for(int i=1;i<=nombre.getNombreExercice().size();i++){
			request.setAttribute("exercice"+i,request.getParameter("exercice"+i));
			request.setAttribute("enonce"+i,request.getParameter("enonce"+i));
			for(int j=1;j<=nombre.getNombreExercice().get(i-1);j++){
				request.setAttribute("question"+i+j, request.getParameter("question"+i+j));
				request.setAttribute("propositionText"+i+j+"1", request.getParameter("propositionText"+i+j+"1"));
				request.setAttribute("propositionText"+i+j+"2", request.getParameter("propositionText"+i+j+"2"));
				request.setAttribute("propositionText"+i+j+"3", request.getParameter("propositionText"+i+j+"3"));
				request.setAttribute("propositionText"+i+j+"4", request.getParameter("propositionText"+i+j+"4"));
			}
		}
	}
	
	public String repeteurQuestion(int i,int j,int reponse){
		String string="",propo1,propo2,propo3,propo4,quest,check1="",check4="",check3="",check2="";
		
		quest=(String)request.getParameter("question"+i+j);
		propo1=(String)request.getParameter("propositionText"+i+j+"1");
		propo2=(String)request.getParameter("propositionText"+i+j+"2");
		propo3=(String)request.getParameter("propositionText"+i+j+"3");
		propo4=(String)request.getParameter("propositionText"+i+j+"4");
		
		if(reponse==1) check1+=" checked='checked' ";
		if(reponse==2) check2+=" checked='checked' ";
		if(reponse==3) check3+=" checked='checked' ";
		if(reponse==4) check4+=" checked='checked' ";
		
		string+="<label for='question'><b>"+j+") </b></label>"+
		"<textarea rows='1' cols='100' class='question  form-control' name='question"+i+j+"' placeholder='Entrer la question'>"+quest+"</textarea>"+
		"<br> <label for = 'commentaire' class='comment'>(Sélectionner la bonne réponse)</label><div id='propo"+i+j+"'>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' "+check1+" type='radio' name='proposition"+i+j+"' value='1'/>"+
		"<label class='lettre' for='lettre'><b><i>A ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"1' placeholder='Première proposition'>"+propo1+"</textarea>"+
		"</div></div><p>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' "+check2+" type='radio' name='proposition"+i+j+"' value='2'/>"+
		"<label class='lettre' for='lettre'><b><i>B ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"2' placeholder='Deuxième proposition'>"+propo2+"</textarea>"+
		"</div></div><p>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' "+check3+" type='radio' name='proposition"+i+j+"' value='3'/>"+
		"<label class='lettre' for='lettre'><b><i>C ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"3' placeholder='Troisième proposition'>"+propo3+"</textarea>"+
		"</div></div><p>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' "+check4+" type='radio' name='proposition"+i+j+"' value='4'/>"+
		"<label class='lettre' for='lettre'><b><i>D ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"4' placeholder='Quatrième proposition'>"+propo4+"</textarea>"+
			"</div></div><p>"+
		"</div>";
		return string;
	}
	
	public String repeteurExercice(int i){
		String string ="",exer,area;
		
		exer = (String)request.getParameter("exercice"+i);
		area = (String)request.getParameter("enonce"+i);
		
		string +="<div id='div"+i+"'><label for='exercice'><u><b>Exercice "+i+": </b></u></label>"
				+ "<input class='form-control exercice' type='text' name='exercice"+i+"' value='"+exer+"' placeholder=\"Titre de l'exercice\" size='100' maxlength='100'";
		if(i==1)string+= " required='required'/>";
		else string+="/>";
		string+= "<br><p><br><br>"
				+ "<textarea rows='7' cols='150' class='form-control enonce' name='enonce"+i+"'  placeholder=\"Veuillez entrer l'enoncé de votre exercice\">"+area+"</textarea>"
				+ "<br><p>";
		
		return string;
	}
	
	public static String Objet(Epreuve epreuve){
		String string="";
		for(int i=0;i<epreuve.getExercice().size();i++){
			string += exercice(i,epreuve);
			for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){
				string += Question(i, j, epreuve);
			}
			string+="</div>";
		}
		return string;
	}
	
	private static String exercice(int i,Epreuve epreuve){
String string ="",exer,area;
		
		exer = epreuve.getExercice().get(i).getExercice().getTitre();
		area = epreuve.getExercice().get(i).getExercice().getEnonce();
		
		string +="<div id='div"+(i+1)+"'><label for='exercice'><u><b>Exercice "+(i+1)+": </b></u></label>"
				+ "<input class='form-control exercice' type='text' name='exercice"+(i+1)+"' value='"+exer+"' placeholder=\"Titre de l'exercice\" size='100' maxlength='100'";
		if(i==0)string+= " required='required'/>";
		else string+="/>";
		string+= "<br><p><br><br>"
				+ "<textarea rows='7' cols='150' class='form-control enonce' name='enonce"+(i+1)+"'  placeholder=\"Veuillez entrer l'enoncé de votre exercice\">"+area+"</textarea>"
				+ "<br><p>";
		
		return string;
	}
	
	private static String Question(int i,int j,Epreuve epreuve){
		String string="",propo1,propo2,propo3,propo4,quest,
				check1="",check4="",check3="",check2="";
		
		quest=epreuve.getExercice().get(i).getQuestion().get(j).getQuestion();
		propo1=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo1();
		propo2=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo2();
		propo3=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo3();
		propo4=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo4();
		
		if(epreuve.getExercice().get(i).getQuestion().get(j).getReponse()==1) 
			check1+=" checked='checked' ";
		if(epreuve.getExercice().get(i).getQuestion().get(j).getReponse()==2) 
			check2+=" checked='checked' ";
		if(epreuve.getExercice().get(i).getQuestion().get(j).getReponse()==3) 
			check3+=" checked='checked' ";
		if(epreuve.getExercice().get(i).getQuestion().get(j).getReponse()==4) 
			check4+=" checked='checked' ";
		
		i++;
		j++;
		string+="<label for='question'><b>"+j+") </b></label>"+
				"<textarea rows='1' cols='100' class='question  form-control' name='question"+i+j+"' placeholder='Entrer la question'>"+quest+"</textarea>"+
				"<br> <label for = 'commentaire' class='comment'>(Sélectionner la bonne réponse)</label><div id='propo"+i+j+"'>"+
				"<div class='row'><div class='col-md-1'>"+
				"<input class='proposition' "+check1+" type='radio' name='proposition"+i+j+"' value='1'/>"+
				"<label class='lettre' for='lettre'><b><i>A ) </i></b></label>"+
					"</div><div class='col-md-11'>"+
				"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"1' placeholder='Première proposition'>"+propo1+"</textarea>"+
				"</div></div><p>"+
				"<div class='row'><div class='col-md-1'>"+
				"<input class='proposition' "+check2+" type='radio' name='proposition"+i+j+"' value='2'/>"+
				"<label class='lettre' for='lettre'><b><i>B ) </i></b></label>"+
					"</div><div class='col-md-11'>"+
				"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"2' placeholder='Deuxième proposition'>"+propo2+"</textarea>"+
				"</div></div><p>"+
				"<div class='row'><div class='col-md-1'>"+
				"<input class='proposition' "+check3+" type='radio' name='proposition"+i+j+"' value='3'/>"+
				"<label class='lettre' for='lettre'><b><i>C ) </i></b></label>"+
					"</div><div class='col-md-11'>"+
				"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"3' placeholder='Troisième proposition'>"+propo3+"</textarea>"+
				"</div></div><p>"+
				"<div class='row'><div class='col-md-1'>"+
				"<input class='proposition' "+check4+" type='radio' name='proposition"+i+j+"' value='4'/>"+
				"<label class='lettre' for='lettre'><b><i>D ) </i></b></label>"+
					"</div><div class='col-md-11'>"+
				"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"4' placeholder='Quatrième proposition'>"+propo4+"</textarea>"+
					"</div></div><p>"+
				"</div>";
		return string;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Nombre getNombre() {
		return nombre;
	}

	public void setNombre(Nombre nombre) {
		this.nombre = nombre;
	}
}
