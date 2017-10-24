<%@ page language="java" contentType="text/html;"%>
<%@ include file="/WEB-INF/jspf/bean/utilisateurMooc.jspf" %>
<%@ page import =" java.sql.Timestamp, controlleur.ThreadMail, Modele.Divers" errorPage="erreur.jsp" %>
<%@ page import = "controlleur.TestMail" %>
<%@ include file="/WEB-INF/jspf/bean/chronometre.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/divers.jspf" %>

<jsp:useBean id="userMoocs" class="Modele.User">
		
		<jsp:setProperty name="userMoocs" property="nom" param="nom"/>
		<jsp:setProperty name="userMoocs" property="matricule" param="matricule"/>
		<jsp:setProperty name="userMoocs" property="password" param="password"/>
		<jsp:setProperty name="userMoocs" property="email" param="email"/>


	
	</jsp:useBean>

<%--Controle des erreurs --%>

	<%--Le champ du nom est vide --%>
	
<%System.out.println("Nom : "+userMoocs.getNom()); %>	
	<% if(userMoocs.getNom().length()==0){ %>
	
	<jsp:forward  page="register.jsp">
		<jsp:param name="erreur" value="Veuillez remplir le champ nom"/>
	</jsp:forward>

	<%}%>
	
	<%--Le champ du prenom est vide --%>
	
	<% if(!(userMoocs.getPassword().equals(request.getParameter("repassword")))){%>
	
	<jsp:forward page="register.jsp">
		<jsp:param name="badpass" value="Mot de passe diff&eacute;rent"/>
	</jsp:forward>
	
	<%}%>
	
	<%--Le champ du login est vide --%>

	
	<%--Le champ du mot de passe est vide --%>
	
	<%if(userMoocs.getPassword().length()==0){ %>
	
		<jsp:forward page="register.jsp">
			<jsp:param name="erreur" value="Veuillez remplir le champ mot de passe"/> 
		</jsp:forward>
	
	<%} %>
	
	<%--Le champ de l'email est vide --%>
	
	<%if(userMoocs.getEmail().length()==0){%>
	
		<jsp:forward page="register.jsp">
			<jsp:param name="erreur" value="Veuillez remplir le champ de l'email"/>
		</jsp:forward>
		
	<%}%>
	
	<%-- Les deux champs pour les mots de passes ne corresponde pas --%>
	
	
	
	<%--Le controle d'erreur est positif --%>
	
	<%-- On enregistre dans la base de données --%> 
	
	<%--- On envoie le mail à l'utilisateur qui vient de s'inscrire qui contient déja ses paramètres de connexion. --%>
	
	 <%	
	 	try{
	 		
	 	
	 	int id=userMoocs.enregistreBD(); 
		Divers div=new Divers();
		div=div.getDiversFromEtudiant(id);
		//creation d'une session afin de l'accorder du temps de travail
		chrono.setEmail(userMoocs.getEmail());
		chrono.setTempsAlloue(div.tempsAlloueGeneral);
		chrono.setTempsRestant(div.tempsAlloueGeneral);
		chrono.setDateDebut(new Timestamp(new java.util.Date().getTime()).getTime());
		chrono.setDateFin(chrono.getDateDebut()+chrono.getTempsRestant());
		chrono.setJour(div.joursAlloueGeneral);
		chrono.enregistrerSession(chrono);
		chrono.vide();
		String emailMsgTxt = "Felicitations pour l'inscription sur la plateforme INTRANET MOOCs. Vos Paramètres de connexions sont les suivantes"+
		 
		 				"\nEmail : "+userMoocs.getEmail()+"\n"+
		 				"Password : "+userMoocs.getPassword()+"\n"+
		 				"Status : Etudiant"+"\n"+
		 				"Profitez bien des cours de cette plateforme. S'il ya des suggestions quelquonque faites le savoir à l'adresse email  intranet.moocs@yahoo.com "; 
		 String emailSubjectTxt = "INSCRIPTION REUSSI - INTRANET MOOCs"; 
		 String emailFromAddress = "intranet.moocs@yahoo.com"; // Add List of Email address to who email needs to be sent to 
		
		ThreadMail smtpMailSender = new ThreadMail(emailFromAddress,userMoocs.getEmail(),emailMsgTxt,emailSubjectTxt); 
		Thread mailSend = new Thread(smtpMailSender);
		mailSend.start();
		 //smtpMailSender.postMail(new String[]{userMoocs.getEmail()}, emailSubjectTxt, emailMsgTxt, emailFromAddress);
		userMooc.setEmail(userMoocs.getEmail());userMooc.setPassword(userMoocs.getPassword()); userMooc.setNom(userMoocs.getNom());
	 	}catch(Exception ex){
	 		System.out.println("Erreur : "+ex.getMessage());
	 		
	 	}
	%>
	
		<jsp:forward page="Felicitations.jsp">
			<jsp:param name="nom" value="<%=userMoocs.getNom()%>"/>
		</jsp:forward>
			
	