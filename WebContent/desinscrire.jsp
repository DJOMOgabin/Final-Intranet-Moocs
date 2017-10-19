<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>

	<%if(request.getParameter("title")!=null){ 
	
			String cours = request.getParameter("title");
			System.out.println(cours);
			userMooc.desinscrit(cours);
			
		%>
			
			<jsp:forward page="homest.jsp"/>
		
	<%}
	else{System.out.println(" Page non accessible");}%>
	
