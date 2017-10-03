<%@ include file = "../WEB-INF/jspf/bean/divers.jspf"%>
<%@ page import="Modele.*, java.util.ArrayList" errorPage="erreur.jsp" %>

        <%
        String sid=request.getParameter("id");
        String stemps=request.getParameter("temps");
        String sjours=request.getParameter("jours");
        Integer nombreId=-1;
        Long temps=-1l;
        Long jours=-1l;
        try
        {
        	temps=Long.parseLong(request.getParameter("temps"));
        }catch(Exception e)
        {
        }
        try{
        	jours=Long.parseLong(request.getParameter("jours"));
        }catch(Exception e)
        {
        	
        }
		String activation=request.getParameter("radioActivation");
        String tous=request.getParameter("radioSelection");
        
        ArrayList<Integer> listId=new ArrayList<Integer>();
        Divers div=new Divers();
        
        boolean flag=activation.equals("oui");
        //on commence d'abord par regarder si les modif, c'est pour tout le monde ou pas
        if(tous.equals("tous"))
        {
        	//c'est le cas
        	//on teste l'activation
        	//System.out.println("\non entre\n");
        		if((temps!=-1)&&(jours!=-1)){
        			div.ajoutConfigTous(temps, jours, flag);
        		}else
        		{
        			if(temps!=-1)
        			{
        				div.ajoutTempsAlloueTous(temps);
        			}else if(jours!=-1)
        			{
        				div.ajoutJoursAlloueTous(jours);
        			}else
        			{
        				div.ajoutChronoTous(flag);
        			}
        		}
        	
        }else
        {
        	//non
        	User s = new User();
			nombreId=s.getMaxIdUser();
        	int iddivers=0;
        	//on ajout le divers
        	if((temps!=-1)&&(jours!=-1)&&flag){
        		iddivers=div.ajoutTempsAlloue(temps, jours, flag);	
                for(int i=0; i<nombreId; i++)
                {
                	//on constitue le groupe
                	String temp=request.getParameter("selectionEtudiant"+(i+1));
                	if((temp!=null)&&(!temp.equals("")))
                	{
                		div.insertCorrespEtudiantDivers(iddivers, Integer.parseInt(temp));	
                	}
                }	
        	}else{ 
        		if(temps!=-1)
        		{
        			//on change uniquement le temps du chrono pour le groupe d'etudiants
        			for(int i=0; i<nombreId; i++)
                	{
                		//on constitue le groupe
                		String temp=request.getParameter("selectionEtudiant"+(i+1));
                		if((temp!=null)&&(!temp.equals("")))
                    	{
     						div.updateTempsEtudiant(temps, Integer.parseInt(temp));
                    	}
                	}	
        			
        			
        		}
        		if(jours!=-1)
        		{
        			//on change uniquement le nombre de jours du chrono pour le groupe d'etudiants
        			for(int i=0; i<nombreId; i++)
                	{
                		//on constitue le groupe
                		String temp=request.getParameter("selectionEtudiant"+(i+1));
                		if((temp!=null)&&(!temp.equals("")))
                		{
	                		div.updateJoursEtudiant(jours, Integer.parseInt(temp));
    	            	}	
                	}
        			
        		}
        		if((jours==-1)&&(temps==-1))
        		{
        			//on veut juste changer letat du chrono pour un groupe d'etudiants deja existant
        			for(int i=0; i<nombreId; i++)
                	{
                		//on constitue le groupe
                		String temp=request.getParameter("selectionEtudiant"+(i+1));
                		if((temp!=null)&&(!temp.equals("")))
                    	{
                    		div.activationChronoEtudiant(flag, Integer.parseInt(temp));
                    	}
                	}	
        		}
        	}
        		
            
            	
        }
        
        //puis on procede aux mises a jours
        
        
        String result="ok";
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result);
        
        %>
