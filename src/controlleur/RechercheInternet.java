package controlleur;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modele.SiteConsulter;

/**
 * Servlet implementation class RecherhceInternet
 */
@WebServlet("/RechercheInternet")
public class RechercheInternet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	
    public RechercheInternet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html;charset=UTF-8");
		 HttpSession session=request.getSession();
		 String siteRecherche = request.getParameter("siteRecherche");
		 String recherche=(String)session.getAttribute("keyword");
		 if(recherche==null)return;
		 if(siteRecherche==null)siteRecherche="coursera";
		 String url=" ";
		
		 if(siteRecherche.equalsIgnoreCase("coursera")) {
			 url = "https://www.coursera.org/courses?"+URLEncoder.encode("query", "UTF-8")+"="+URLEncoder.encode(recherche, "UTF-8");
		 } else if (siteRecherche.equalsIgnoreCase("edx")) {
			 url = "https://www.edx.org/course?"+URLEncoder.encode("search_query", "UTF-8")+"="+URLEncoder.encode(recherche, "UTF-8");
		 }else if (siteRecherche.equalsIgnoreCase("FranceUniversite")) {
			 url = "http://www.france-universite-numerique.fr/fun.php?"+URLEncoder.encode("page=recherche&recherche", "UTF-8")+"="+URLEncoder.encode(recherche, "UTF-8");
		 } else {
			 if(siteRecherche.equalsIgnoreCase("udacity"))url = "https://www.udacity.com/courses";
		 }
		 SiteConsulter site = new SiteConsulter(url, recherche);
		 response.sendRedirect(url);
	}
}