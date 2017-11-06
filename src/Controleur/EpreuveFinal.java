package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Hibernate.HibernateChargementCopie;
import Hibernate.HibernateCopie;
import Hibernate.TestHibernate2;
import Modele.CopieEtudiant;
import Modele.Epreuve;
import Modele.Reponse;
import Traitement.Question;
import Traitement.ReponseQuestion;


/**
 * Servlet implementation class Composition
 */
@WebServlet("/EpreuveFinal")
public class EpreuveFinal extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static boolean valeur;
       
    public EpreuveFinal() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//this.getServletContext().getRequestDispatcher("/jsp/Composition.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nomEpreuve = request.getParameter("nom"),
				matiere=request.getParameter("title"),
				idEtudiant=request.getParameter("id");
		Epreuve epreuve = TestHibernate2.chargerEpreuve(nomEpreuve, matiere);
		CopieEtudiant copie = HibernateChargementCopie.chargerCopie(nomEpreuve, matiere, idEtudiant,true);
		copie.setDuree(epreuve.getDuree().getDuree());
		copie.setTotalTentative(epreuve.getDuree().getTentative());		
		copie.dispo();
		if(copie.getNombreTentative()==Integer.parseInt(request.getParameter("ancien")))setValeur(true);
		else setValeur(false);
		if(isValeur()){
			copie.setNote(0);
			copie = Arrangement(copie, epreuve,request);
		}
		request.setAttribute("copie",copie);
		request.setAttribute("epreuve", epreuve);
		this.getServletContext().getRequestDispatcher("/Copie.jsp").forward(request, response);
	
	}
	public static CopieEtudiant Arrangement(CopieEtudiant copie,Epreuve epreuve,HttpServletRequest request){
		ReponseQuestion reponseQuestion;
		int idCopie,idReponse;
		//Si la copie n'a pas encore corrigée
		try{
			copie.getReponse().size();
		}catch(NullPointerException e){
			copie.setReponse(new ArrayList<Reponse>());
		}
		idCopie = HibernateCopie.EnregistrerCopie(copie);
		for(int i=0;i<epreuve.getExercice().size();i++){
			//Si l'exercice i n'a pas ï¿½tï¿½ crï¿½e
			try{
				copie.getReponse().get(i).getId();
			}catch(IndexOutOfBoundsException e){
				copie.getReponse().add(new Reponse());
			}
			copie.getReponse().get(i).setIdCopie(idCopie);
			idReponse = HibernateCopie.EnregistrerReponse(copie.getReponse().get(i));
			for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){
				//Si la question j de l'exercice i n'a pas ï¿½tï¿½ crï¿½ï¿½e
				try{
					copie.getReponse().get(i).getSuiteReponse().get(j).getProposition();
				}catch(IndexOutOfBoundsException e){
					copie.getReponse().get(i).getSuiteReponse().add(new ReponseQuestion());
					copie.getReponse().get(i).getSuiteReponse().get(j).setProposition(0);
				}
				reponseQuestion = copie.getReponse().get(i).getSuiteReponse().get(j);
				reponseQuestion.setIdCopie(idCopie);
				reponseQuestion.setIdReponse(idReponse);				
				reponseQuestion.setReponse(epreuve.getExercice().get(i).getQuestion().get(j).getReponse());
				if(request.getParameter("proposition"+i+j)!=null){
					reponseQuestion.setProposition(Integer.parseInt(request.getParameter("proposition"+i+j)));
				}else{
					reponseQuestion.setProposition(0);
				}
				if(reponseQuestion.getProposition()==reponseQuestion.getReponse()){
					copie.setNote(copie.getNote()+epreuve.getPoint().getJuste());
				}else{
					if(reponseQuestion.getProposition()==0){
						copie.setNote(copie.getNote()+epreuve.getPoint().getAucun());
					}else{
						copie.setNote(copie.getNote()+epreuve.getPoint().getMauvais());						
					}
				}
				HibernateCopie.EnregistrerProposition(reponseQuestion);
			}
		}
		HibernateCopie.UploadNote(copie);
		return copie;
	}
	
	public static String remplissage(CopieEtudiant copie,Epreuve epreuve){
		String string="",choix1="",choix2="",choix3="",choix4="";
		String style1="",style2="",style3="",style4="",style="";
		String juste1="",juste2="",juste3="",juste4="",juste="";
		ReponseQuestion reponseQuestion;
		Question epreuveProposition;
		for(int i=0;i<epreuve.getExercice().size();i++){
			try{
				copie.getReponse().get(i).getId();
			}catch(IndexOutOfBoundsException e){
				copie.getReponse().add(new Reponse());
			}
			string+="<label class='exercice'><i><b><u> Exercice "+(i+1)+":</u>  </b></i>";
			string+=epreuve.getExercice().get(i).getExercice().getTitre()+"</label><br><p>";
			string+="<label class='enonce'>"+epreuve.getExercice().get(i).getExercice().getEnonce()+"</label><p>";
			for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){
				epreuveProposition = epreuve.getExercice().get(i).getQuestion().get(j);
				try{
					copie.getReponse().get(i).getSuiteReponse().get(j).getProposition();
				}catch(IndexOutOfBoundsException e){
					copie.getReponse().get(i).getSuiteReponse().add(new ReponseQuestion());
					copie.getReponse().get(i).getSuiteReponse().get(j).setProposition(0);
					copie.getReponse().get(i).getSuiteReponse().get(j).setReponse(epreuveProposition.getReponse());
				}
				reponseQuestion = copie.getReponse().get(i).getSuiteReponse().get(j);
				choix1="";choix2="";choix3="";choix4="";
				style1="";style2="";style3="";style4="";style="";
				juste1="";juste2="";juste3="";juste4="";juste="";
				if(reponseQuestion.getProposition()==0 && reponseQuestion.getReponse()==0){
					juste+=" <i class='fa fa-check'></i> ";	
					style+=" style='color:green' ";
				}else if(reponseQuestion.getProposition()==1){
					choix1+=" checked='checked' ";
					if(reponseQuestion.getProposition()==reponseQuestion.getReponse()){
						style1+=" style='color:green' ";
						juste1+=" <i class='fa fa-check'></i> ";
					}else{
						style1+=" style='color:red' ";
						juste1+=" <i class='fa fa-times'></i> ";
					}
				}else if(reponseQuestion.getProposition()==2){
					choix2+=" checked='checked' ";
					if(reponseQuestion.getProposition()==reponseQuestion.getReponse()){
						style2+=" style='color:green' ";
						juste2+=" <i class='fa fa-check'></i> ";
					}else{
						style2+=" style='color:red' ";
						juste2+=" <i class='fa fa-times'></i> ";
					}
				}else if(reponseQuestion.getProposition()==3){
					choix3+=" checked='checked' ";
					if(reponseQuestion.getProposition()==reponseQuestion.getReponse()){
						style3+=" style='color:green' ";
						juste3+=" <i class='fa fa-check'></i> ";
					}else{
						style3+=" style='color:red' ";
						juste3+=" <i class='fa fa-times'></i> ";
					}
				}else if(reponseQuestion.getProposition()==4){
					choix4+=" checked='checked' ";
					if(reponseQuestion.getProposition()==reponseQuestion.getReponse()){
						style4+=" style='color:green' ";
						juste4+=" <i class='fa fa-check'></i> ";
					}else{
						style4+=" style='color:red' ";
						juste4+=" <i class='fa fa-times'></i> ";
					}
				}
<<<<<<< HEAD
				string+="<div class='blocProposition'>"+
							"<label "+style+" class='question'><b>"+(j+1)+") </b>"+epreuveProposition.getQuestion() +juste+"</label><p>"+
							"<div class='row'>"+
								"<div class='col-md-1'>"+
									"<input class='proposition pull-right'"+choix1+" name='proposition"+i+j+"' type='radio' value='1'/>"+							
								"</div>"+
								"<div class='col-md-10'>"+
									"<label"+style1+">A )&nbsp; &nbsp; &nbsp; "+epreuveProposition.getProposition().getPropo1() +juste1+"</label><br>"+
								"</div>"+
							"</div>"+
							"<div class='row'>"+
								"<div class='col-md-1' >"+
									"<input class='proposition pull-right'"+choix2+" name='proposition"+i+j+"' type='radio' value='2'/>"+							
								"</div>"+
								"<div class='col-md-10'>"+
									"<label"+style2+">B )&nbsp; &nbsp; &nbsp; "+epreuveProposition.getProposition().getPropo2() +juste2+"</label><br>"+
								"</div>"+
							"</div>"+
							"<div class='row'>"+
								"<div class='col-md-1' >"+
									"<input class='proposition pull-right'"+choix3+" name='proposition"+i+j+"' type='radio' value='3'/>"+							
								"</div>"+
								"<div class='col-md-10'>"+
									"<label"+style3+">C )&nbsp; &nbsp; &nbsp; "+epreuveProposition.getProposition().getPropo3() +juste3+"</label><br>"+
								"</div>"+
							"</div>"+
							"<div class='row'>"+
								"<div class='col-md-1' >"+
									"<input class='proposition pull-right'"+choix4+" name='proposition"+i+j+"' type='radio' value='4'/>"+							
								"</div>"+
								"<div class='col-md-10'>"+
									"<label"+style4+">D )&nbsp; &nbsp; &nbsp; "+epreuveProposition.getProposition().getPropo4() +juste4+"</label><br>"+
								"</div>"+
								"</div><br><p>"+
							"</div>";
=======
				string+="<div class='blocProposition' >";
				string+="<label "+style+" class='question'><b>"+(j+1)+") </b>"+epreuveProposition.getQuestion() +juste+"</label><p>\n";
				string+="<input class='proposition'"+choix1+" name='proposition"+i+j+"' type='radio' value='1'/> \n";
				string+="<label"+style1+"> A ) "+epreuveProposition.getProposition().getPropo1() +juste1+"</label><br>\n";
				string+="<input class='proposition'"+choix2+" name='proposition"+i+j+"' type='radio' value='2'/> \n";
				string+="<label"+style2+"> B ) "+epreuveProposition.getProposition().getPropo2() +juste2+"</label><br>\n";
				string+="<input class='proposition'"+choix3+" name='proposition"+i+j+"' type='radio' value='3'/> \n";
				string+="<label"+style3+"> C ) "+epreuveProposition.getProposition().getPropo3() +juste3+"</label><br>\n";
				string+="<input class='proposition'"+choix4+" name='proposition"+i+j+"' type='radio' value='4'/> \n";
				string+="<label"+style4+"> D ) "+epreuveProposition.getProposition().getPropo4() +juste4+"</label><br>\n";
				string+="</div>";
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			}
		}
		return string;
	}

	public static boolean isValeur() {
		return valeur;
	}

	public static void setValeur(boolean valeur) {
		EpreuveFinal.valeur = valeur;
	}
	
}

