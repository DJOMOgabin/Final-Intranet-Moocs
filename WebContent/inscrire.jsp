<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="WEB-INF/jspf/bean/utilisateurMooc.jspf" %>
<%@ page import = "Modele.Cours" %>

	<%String nomCours  = request.getParameter("title"); %>
	
	<%userMooc.inscrit(nomCours); %>
	
	
	<jsp:forward page="homest.jsp?inscription_reussi=bien"/>