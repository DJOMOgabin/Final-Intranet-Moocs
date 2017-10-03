package controlleur;

import java.io.IOException;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modele.User;

/**
 * Servlet implementation class ServletOubli
 */
@WebServlet("/ServletOubli")
public class ServletOubli extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletOubli() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TestMail sender = new TestMail(); 
		String result;
		String adresseEmail=(String)request.getParameter("loginEmail");
		String sujet="Mot de passe d'accès à la plateforme MOOCS!";
		User usr=new User();
		String contenu=usr.trouvePassFromEmail(adresseEmail);// a modifier
		try {                        
			sender.postMail(new String[]{adresseEmail}, sujet, contenu, sender.getEmailfromaddress());
			result="mot de passe envoyé! à l'adresse email: "+adresseEmail;
			request.setAttribute("result", result);
			this.getServletContext().getRequestDispatcher("/Connexion.jsp").forward( request, response );
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result="Echec lors de l'envoi du mot de passe! Ressayez!";
			request.setAttribute("erreur", result);
			this.getServletContext().getRequestDispatcher("/oubliPass.jsp").forward( request, response );
			
		} 
		
	}
	
	
	

}