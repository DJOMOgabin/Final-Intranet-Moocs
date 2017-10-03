<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="WEB-INF/jspf/bean/utilisateurMooc.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="WEB-INF/jspf/bean/chronometre.jspf" %>
<% 
   userMooc.setLogin("");
   //userMooc.enregistreHeureFin();!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   chrono.setDateFin(new Timestamp(new java.util.Date().getTime()).getTime());
   chrono.setTempsRestant(chrono.getTempsRestant()-(chrono.getDateFin()-chrono.getDateDebut()));
   //chrono.setJour();
   
   System.out.println("valeur du chrono: "+chrono.toString());
   chrono.enregistrerSession(chrono);
   chrono.vide();
   session.removeAttribute("user");
   session.invalidate();
   
   System.out.println("la session "+session.getId()+" fini et verification de "+chrono.toString());
   /*if(session.isNew())
   { System.out.println("la session est nouvelle!");*/
   
%>
<jsp:forward page="go.jsp"/>
</html>