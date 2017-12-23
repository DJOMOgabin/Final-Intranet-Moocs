<%@ page language="java" contentType="text/html"%>
<%@ include file="WEB-INF/jspf/bean/utilisateurMooc.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
System.out.println(userMooc);
if(userMooc.verifier()){


	System.out.println(" Inscription d'un nouvel étudiant : ");
	session.setAttribute("user", userMooc);
	request.setAttribute("user",userMooc);
	request.getRequestDispatcher( "/ServletChrono2" ).forward( request,response );
}%>
	 