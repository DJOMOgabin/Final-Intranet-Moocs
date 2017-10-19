<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	
	<%if(request.getParameter("type")!=null && request.getParameter("type").equals("video")){ %>
	
	<!-- Suppression d'une vidéo -->
		<%String nomcours = connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("idcours"))); %>
		<%connecteurForum.supprimervideo(request.getParameter("video"),Integer.parseInt(request.getParameter("idcours"))); %>
		
		<jsp:forward page="present.jsp">
			<jsp:param name="title" value="<%=nomcours %>"/>
				<jsp:param name="supp" value="ok"/>
		</jsp:forward>
				
		
	
	<%}else if(request.getParameter("type")!=null && request.getParameter("type").equals("exercice")){ %>
	
		<%String nomcours = connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("idcours"))); %>
		<%connecteurForum.supprimerexercice(request.getParameter("exercice"),Integer.parseInt(request.getParameter("idcours"))); %>
		
		<jsp:forward page="present.jsp">
			<jsp:param name="title" value="<%=nomcours%>"/>
			<jsp:param name="supp" value="ok"/>
		</jsp:forward>
		
	<%}else if(request.getParameter("type")!=null && request.getParameter("type").equals("complement")){ %>
	
		<%String nomcours = connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("idcours"))); %>
		<%connecteurForum.supprimerComplement(request.getParameter("video"));%>
		
		<jsp:forward page="present.jsp">
			<jsp:param name="title" value="<%=nomcours%>"/>
			<jsp:param name="supp" value="ok"/>
		</jsp:forward>
	
	<%}else if(request.getParameter("type")!=null && request.getParameter("type").equals("fcours")){ %>
		<%String nomcours = new String(request.getParameter("cours").getBytes("ISO-8859-1"),"UTF-8"); %>
		<%connecteurForum.supprimeCours(nomcours) ;%>
		<jsp:forward page="index.jsp">
			<jsp:param name="supp" value="ok"/>
		</jsp:forward>
	<%}else if(request.getParameter("type")!=null && request.getParameter("type").equals("ocours")){ %>
		<%String nomcours = new String(request.getParameter("cours").getBytes("ISO-8859-1"),"UTF-8"); %>
		<%connecteurForum.ouvrirCours(nomcours); %>
		<jsp:forward page="index.jsp">
			<jsp:param name="ouv" value="ok"/>
		</jsp:forward>
	<%} %>
	
	<!-- Suppression d'un exercice -->

</body>
</html>