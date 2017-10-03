<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/bean/utilisateurMooc.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ page import = "Modele.User,Modele.Examen,controlleur.Lecture" errorPage="erreur.jsp" %>
<%@ page import = "Modele.Teachers" errorPage="erreur.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<%if(request.getParameter("status")==null && request.getParameter("email")==null && request.getParameter("password")==null){%>
		<jsp:forward page="index.jsp"/>
	<%}%>
	

	<%if(request.getParameter("status")!=null){%>
				<!-- Création du bean pour un enseignant -->
				
				<jsp:useBean id="teachers" class="Modele.Teachers" scope="session">
					<jsp:setProperty name="teachers" property="email" param="email"/>
					<jsp:setProperty name="teachers" property="password" param="password"/>
					<jsp:setProperty name="teachers" property="status" param="status"/>
				</jsp:useBean>
	<% 	
			//System.out.println(teacher.getStatus());
			/**
			* Authentification de l'utilisateur
			*/
			//System.out.println("qu\'es ce qui se passe?");
			teacher.setEmail(request.getParameter("email"));
			teacher.setPassword(request.getParameter("password"));
			teacher.setStatus("Enseignant");
			
			
			boolean toto = teacher.verfier();
			//Examen.ouvrirBD();
			//System.out.println(toto);
			
			if(toto)
			{
				teacher.setLogin(teacher.getName());
				session = request.getSession();
				session.setAttribute("enseignant",teacher);
				
				
			%>
					<jsp:forward page="home.jsp?page=Enseignant/index.jsp"/>
					
			<%}else{%>
			
				
				<jsp:forward page="index.jsp"> 
						<jsp:param name="error" value="Erreur D'Authentification"/>
				</jsp:forward>
			<%}}
	
	if(request.getParameter("status")==null){
	new Lecture();
	//System.out.println("logoin "+Lecture.getUserName());
	%>
	
	<!-- Création du bean pour un etudiant -->	
	
	<jsp:useBean id="userMoocs" class="Modele.User" scope="session">
		<jsp:setProperty name="userMoocs" property="email" param="email"/>
		<jsp:setProperty name="userMoocs" property="password" param="password"/>
		
	</jsp:useBean>
<% 	
	userMoocs.setEmail(request.getParameter("email"));
	userMoocs.setPassword(request.getParameter("password"));
	//System.out.println("l'email est : "+userMoocs.getEmail());
	//System.out.println("le password est : "+userMoocs.getPassword());
	//System.out.println(userMoocs.toString());
	
	userMooc.setEmail(request.getParameter("email"));
	userMooc.setPassword(request.getParameter("password"));
	
/**
* Authentification de l'utilisateur
*/

if(userMoocs.verifier()){System.out.println("Bingo");userMooc.setNom(userMoocs.getNom());%>

	<%-- Son équivalent en code Java  est : --%>
<% 
	session.setAttribute("user", userMooc);
	request.setAttribute("user",userMooc);
	request.getRequestDispatcher( "/ServletChrono2" ).forward( request,response ); %>
	
<%}
else{%>
	<jsp:forward page="index.jsp"> 
			<jsp:param name="error" value="Erreur D'Authentification"/>
	</jsp:forward><%
	}
}%>

	
</html>

