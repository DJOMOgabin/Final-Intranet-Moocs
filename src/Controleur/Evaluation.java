package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jmx.snmp.Timestamp;

import Hibernate.TestHibernate;
import Hibernate.TestHibernate2;
import Modele.Epreuve;
import Modele.Examen;
import Modele.Point;
import Traitement.Duree;
import Traitement.EnonceExercice;
import Traitement.ExerciceEntier;
import Traitement.Proposition;
import Traitement.Question;
import Traitement.Remplissage;

/**
 * Servlet implementation class Evaluation
 */
//@WebServlet("/evaluation")
public class Evaluation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Evaluation() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/Epreuve.jsp").forward(request, response);
	}

	@SuppressWarnings({ "deprecation", "unchecked","unused" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Epreuve question;
		if(request.getParameter("update")!=null && request.getParameter("update").equalsIgnoreCase("true")){
			question = TestHibernate2.chargerEpreuve
					(request.getParameter("titre"), request.getParameter("title"));
			request.setAttribute("titre", ""+question.getTitre());
			request.setAttribute("juste", ""+question.getPoint().getJuste());
			request.setAttribute("mauvais",""+question.getPoint().getMauvais());
			request.setAttribute("aucun", ""+question.getPoint().getAucun());
			request.setAttribute("jour", ""+question.getDuree().getJour());
			request.setAttribute("heure", ""+question.getDuree().getHeure());
			request.setAttribute("minute", ""+question.getDuree().getMinute());
			request.setAttribute("duree", ""+question.getDuree().getDuree());
			request.setAttribute("tentative", ""+question.getDuree().getTentative());
			request.setAttribute("indicative", ""+question.getIndicative());
			request.setAttribute("title", ""+question.getMatiere());
			String string = Remplissage.Objet(question);
			request.setAttribute("question", question);
			request.setAttribute("string",string);
		}else{
			request.setAttribute("titre", request.getParameter("titre"));
			request.setAttribute("juste", request.getParameter("juste"));
			request.setAttribute("mauvais", request.getParameter("mauvais"));
			request.setAttribute("aucun", request.getParameter("aucun"));
			request.setAttribute("jour", request.getParameter("jour"));
			request.setAttribute("heure", request.getParameter("heure"));
			request.setAttribute("minute", request.getParameter("minute"));
			request.setAttribute("duree", request.getParameter("duree"));
			request.setAttribute("tentative", request.getParameter("tentative"));
			request.setAttribute("indicative", request.getParameter("indicative"));
			request.setAttribute("title", request.getParameter("title"));
			question = new Epreuve();
			int idEpreuve,idExercice,idQuestion=0;
			question.getExercice().clear();
			Remplissage rempli = new Remplissage(request);
			ArrayList<Question> array = new ArrayList<Question>();
			ExerciceEntier exercice;
			Question questionExercice;
			
			question.setPoint(new Point(Float.parseFloat(request.getParameter("juste")),Float.parseFloat(request.getParameter("mauvais")),
					Float.parseFloat(request.getParameter("aucun"))));
			question.setDuree(new Duree(Integer.parseInt((String)request.getAttribute("jour")),
					Integer.parseInt((String)request.getAttribute("heure")),
					Integer.parseInt((String)request.getAttribute("minute")),
					Integer.parseInt((String)request.getAttribute("duree")),
					Integer.parseInt((String)request.getAttribute("tentative"))));
			idEpreuve = TestHibernate.EnregistrerEpreuve(question);
			int i,resultat,j=-1;
			String string ="";
			float note=0;
				for(i=1;i<=rempli.getNombre().getNombreExercice().size();i++){
					string += rempli.repeteurExercice(i);
					exercice=new ExerciceEntier();
					exercice.setExercice(new EnonceExercice((String)request.getParameter("exercice"+i),
							(String)request.getParameter("enonce"+i)));
					exercice.setIdEpreuve(idEpreuve);
					idExercice = TestHibernate.EnregistrerExercice(exercice);
						for(j=1;j<=rempli.getNombre().getNombreExercice().get(i-1);j++){
							resultat=0;
							note+=Float.parseFloat(request.getParameter("juste"));
							if(request.getParameter("proposition"+i+j)!=null)
								resultat=Integer.parseInt((String)request.getParameter("proposition"+i+j));
							string +=rempli.repeteurQuestion(i, j,resultat);
							questionExercice = new Question();
							questionExercice.setIdEpreuve(idEpreuve);
							questionExercice.setIdExercice(idExercice);
							questionExercice.setReponse(resultat);
							questionExercice.setQuestion((String)request.getParameter("question"+i+j));
							questionExercice.setProposition(new Proposition((String)request.getParameter("propositionText"+i+j+"1"),
									(String)request.getParameter("propositionText"+i+j+"2"),
									(String)request.getParameter("propositionText"+i+j+"3"),
									(String)request.getParameter("propositionText"+i+j+"4")));
							questionExercice.setReponse(resultat);
							idQuestion = TestHibernate.EnregistrerQuestion(questionExercice);							
							array.add(questionExercice);
						}
					exercice.setQuestion((ArrayList<Question>)array.clone());
					string += "</div>";
					question.getExercice().add(exercice);
					array.clear();
					if(idEpreuve!=0)TestHibernate.setReussite(true);
				}
				java.sql.Timestamp time = new java.sql.Timestamp(new Timestamp().getDateTime());
				time.setDate(time.getDate()+Integer.parseInt((String)request.getAttribute("jour")));
				time.setHours(time.getHours()+Integer.parseInt((String)request.getAttribute("heure")));
				time.setMinutes(time.getMinutes()+Integer.parseInt((String)request.getAttribute("minute")));
				Examen.Inserer((String)request.getAttribute("title"), (String)request.getAttribute("titre"),
						time.toString(),(String)request.getAttribute("duree"),
						(String)request.getParameter("tentative"),note+"");
				request.setAttribute("string", string);
				request.setAttribute("question", question);
				request.setAttribute("exercice",question.getExercice().size());
				request.setAttribute("quest",question.getExercice().get(question.getExercice().size()-1).getQuestion().size());
				question.setTitre(request.getParameter("titre"));
				question.setMatiere(request.getParameter("title"));
				this.getServletContext().getRequestDispatcher("/Enseignant/Evaluational.jsp").forward(request, response);
		}
	}
}
