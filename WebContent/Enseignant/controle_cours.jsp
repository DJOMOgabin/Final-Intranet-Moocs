<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file= "../WEB-INF/jspf/bean/courMoocs.jspf" %>

<%@ page import ="Modele.Cours, org.apache.commons.fileupload.*, java.util.List, java.util.Iterator, java.io.File, org.jdom2.*" errorPage="erreur.jsp"%>
  
	
	<%-- Creation de l'instance userMoocs --%>
	
	
	
	
	<jsp:useBean id="coursMoocs" class="Modele.Cours">
	
		<jsp:setProperty name="courMoocs" property="titreCours" param="titreCours"/>
		<jsp:setProperty name="courMoocs" property="langueCours" param="langueCours"/>
		<jsp:setProperty name="courMoocs" property="categorieCours" param="categorieCours"/>
		<jsp:setProperty name="courMoocs" property="descriptionCours" param="descriptionCours"/>
		<jsp:setProperty name="courMoocs" property="nombreSemainesCours" param="nombreSemainesCours"/> 
		<%if(request.getParameter("lienS").equals("Autre")){ %>
	
		<jsp:setProperty name="courMoocs" property="lien" param="lien"/>
	
	<%}else{ %>
		<jsp:setProperty name="courMoocs" property="lien" param="lienS"/>
	<%} %> 	
	</jsp:useBean>

	
	
	<hr/>
	
	

	
	<!-- Enregistrement dans document XML  -->

	
	
	<jsp:forward page="ajoutLogo.jsp"/>
	
		
	
