package controlleur;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modele.Divers;
import Modele.Session;
import Modele.User;

/**
 * Servlet implementation class ServletChrono2
 */
@WebServlet("/ServletChrono2")
public class ServletChrono2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private long tempsDebut;
	private long tempsFin;
	private long permis=0;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public ServletChrono2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//on recupere les param a recuperer 
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		String status="Etudiant";
		User usr=(User)request.getAttribute("user");
		if(email==null)
		{
			email = usr.getEmail();
		}
		if(password==null)
		{
			password = usr.getPassword();
		}
		if(status==null)
		{
			status = "Etudiant";
		}
		Session sess1=new Session();
		sess1=sess1.rechercheDerniereSession(email);
		Divers div=new Divers();
		
		/*tout commence par la recuperation de la possibilit� ou non pour l'etudiant
		 * en question detre ger� par un chrono*/
		
		//div=div.getDiversFromEtudiant(usr.getIdEtudiant());
		div=div.getDiversFromEtudiant(sess1.idEtudiant(email));
		
		/*if(div.ischrono)
		{
		*/	/*on recupere le temps restant*/
			permis=div.tempsAlloueGeneral-sess1.getTempsAlloue()+sess1.getTempsRestant();
			if((permis>0)&&(sess1.getJour()>1))
			{	
			/*le temps de debut*/
			tempsDebut=new Timestamp(new java.util.Date().getTime()).getTime();
			/*le temps de fin*/
			tempsFin=tempsDebut+permis;
			
			sess1.setEmail(email);
			/*on lance un thread d'ecoute*/
			chronoThread thread=new chronoThread(sess1, usr, div.tempsAlloueGeneral, permis, tempsDebut, tempsFin);
			thread.setThreadSession(thread);
			thread.start();
			
			/*
			 * on fait le calcul de nombre de jours restant
			 */
			long nbJourRestant=0;
			Timestamp date1=new Timestamp(sess1.getDateFin());//date de fin de la derniere session
			Timestamp dateNow=new Timestamp(tempsDebut);
			if(date1.getDay()==dateNow.getDay())
			{
				nbJourRestant=sess1.getJour();
			}
			else
			{
				nbJourRestant=sess1.getJour()-1;
			}
			/*
			 * on transmet les parametres recuperes
			 */
			request.setAttribute("loginEmail", email);
			request.setAttribute("loginPass", password);
			request.setAttribute("loginStatus", status);
			request.setAttribute("debut", ""+tempsDebut);
			request.setAttribute("alloue", ""+div.tempsAlloueGeneral);
			request.setAttribute("restant", ""+permis);
			request.setAttribute("threadChrono", thread);
			request.setAttribute("jourRestant", ""+nbJourRestant);
			
			
			
			/*
			 * puis on renvoit la vue verifier.jsp
			 */
			
			this.getServletContext().getRequestDispatcher("/homest.jsp").forward( request, response );
			//puis on enregistre dans la bd la nouvelle connexion
			
		}else
		{
			this.getServletContext().getRequestDispatcher("/homest.jsp").forward( request, response );	
		}
			
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}