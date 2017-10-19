<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ page import="java.util.ArrayList,Modele.Cours" %>
	<%if(request.getParameter("recherche")!=null){ %>
		<%String recherche = request.getParameter("recherche"); %>
		<%
			String categorie_recherche = "(";
			ArrayList<String> categorie = new ArrayList<String>();
			
			if(request.getParameter("int")!=null)
			{
				categorie.add("Intélligence Artificielle");
			}
			if(request.getParameter("sys")!=null)
			{
				categorie.add("Système et Sécurité");
			}
			if(request.getParameter("ene")!=null)
			{
				categorie.add("Energie et Sciences de la terre");
			}
			if(request.getParameter("tec")!=null)
			{
				categorie.add("Technologie et Design");
			}
			if(request.getParameter("stat")!=null)
			{
				categorie.add("Statistiques et analyse des données");
			}
			
			for(int i=0;i<categorie.size();i++)
			{
				if(i==(categorie.size()-1))
				{
					categorie_recherche=categorie_recherche+"\""+categorie.get(i)+"\"";
				}
				else
				{
					categorie_recherche=categorie_recherche+"\""+categorie.get(i)+"\",";		
				}
						
			}
			
			categorie_recherche=categorie_recherche+")";
			
			
			
			
			ArrayList<String> results = userMooc.getRecherche(recherche,categorie_recherche);
			
			if(results.size()>0)
			{
				for(int i = 0; i<results.size(); i++)
				{ 
        		Cours c  = new Cours(); 
        		c.setTitreCours(results.get(i));
       %>
       
        	<div class="attachment-block" style="border: 2px solid white; border-width : 4px;border-style : edge; padding : 10px 10px;box-shadow : 6px 6px 6px 6px #ccc;">
                <img class="attachment-img" src="cours/img/<%=c.getLogoCoursBD()%>" alt="Logo du cours">

                <div class="attachment-pushed">
                  <h4 class="attachment-heading"><a href="#"><%=c.getTitreCours() %></a></h4>

                  <div class="attachment-text">
                    <p id="description"><%=c.getDescriptionCoursBD() %></p> 
                    <%if(userMooc.estInscrit(c.getTitreCours())){ %>
    				 <span><a href="present_e.jsp?title=<%=c.getTitreCours()%>" class="btn btn-info btn-flat">  Accéder au cours <i class="fa fa-home"></i></a></span>
  							<%}else{ %>
  					<span><a href="inscrire.jsp?title=<%=c.getTitreCours()%>" class="btn btn-success btn-flat">  S'inscrire à ce cours <i class="fa fa-hand-o-right"></i> </a></span>
  							<%}%>
                  </div>
                  <!-- /.attachment-text -->
                </div>
                <!-- /.attachment-pushed -->
              </div>
							<%}%>
		
        <%}
        
			}
			
			else
			{%>
				<h2> Désolé, nous n'avons rien à ce sujet dans nos cours. Vous pouvez continuez la recherche sur l'un des sites suivants.</h2>
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="http://www.edx.org" target="_blank"> EDX </a> 
				</p>	
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="http://www.coursera.org" target="_blank"> COURSERA </a>
				</p>
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="http://www.udemy.com" target="_blank"> UDEMY </a>
				</p>
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="http://www.udacity.com" target="_blank"> UDACITY </a>
				</p>
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="https://www.france-universite-numerique-mooc.fr" target="_blank"> FUN (France Université Numérique)</a>
				</p>
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="https://www.epfl.ch" target="_blank"> EPFL (Ecole Polytechnique Federale de Lausanne) </a>
				</p>
				<p>
					<span class="glyphicon glyphicon-circle-arrow-right"> </span> <a href="https://openclassrooms.com" target="_blank">OpenClassrooms </a>
				</p>
			<%}%>
	<%}%>

