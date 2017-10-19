<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import =" java.sql.*,forum.OutilsChaine" %>
    <%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getParameter("descriptionCours")!=null){ %>
<% 
						Statement  stat= connecteurForum.getConnexion().createStatement();
						stat.executeUpdate("update cours  set descriptionCours='"+request.getParameter("descriptionCours")+"' where idcours = "+request.getParameter("id"));
						stat.close();
						connecteurForum.fermerConnexion();
						String nomcours = connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("id")));
						//nomcours = new OutilsChaine().convertirEnHTML(nomcours);
						System.out.println("Description : "+nomcours);
%>				

	<jsp:forward page="present.jsp">
			<jsp:param name="title" value="<%=nomcours%>"/>
			<jsp:param name="newdesc" value="ok"/>
			<jsp:param name="envoie" value="ok"/>
	</jsp:forward>

<%}else{%>
	<%System.out.println("I am not"); %>
<%} %> 
</body>
</html>