package Controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modele.Examen;
import forum.LectEcriForum;

/**
 * Servlet implementation class Composition
 */
@WebServlet("/forum")
public class Composition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Composition() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String etat="";
		if(request.getParameter("type").equals("auth")){
			String id = request.getParameter("id");
			String password = request.getParameter("mot");
			etat = ""+Examen.authentification(id, password);
		}else if(request.getParameter("type").equals("suppens")){
			String nom = request.getParameter("enseignant");
			etat = ""+Examen.suppEnseignant(nom);
		}else if(request.getParameter("type").equals("bloquer")){
			String valeur = request.getParameter("valeur");
			String cours = request.getParameter("cours");
			etat = ""+Examen.bloquer(valeur, cours);
		}else{
			String enseignant = request.getParameter("enseignant");
			String cours = request.getParameter("cours");
			etat = ""+Examen.supprimerCours(enseignant, cours);
		}
		response.getWriter().write(etat);			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String etat;
		if(request.getParameter("type").equals("delete")){
			etat = ""+LectEcriForum.Creation(request.getParameter("id"), request.getParameter("theme"),false);
			response.getWriter().write(etat);
		}else if(request.getParameter("type").equals("create")){
			String idcours=request.getParameter("id");
			String theme=request.getParameter("theme");
			etat = ""+LectEcriForum.Creation(idcours, theme,true);	
			response.getWriter().write(etat);
		}
	}
	
}
