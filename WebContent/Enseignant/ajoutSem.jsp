<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf"%>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>

<%if(teacher.getLogin().equals(""))
	{ %> <jsp:forward page="../index.jsp"/> <%}else{%>
		<%courMoocs.addSemaine(Integer.parseInt(request.getParameter("nombreSemainesCours")),Integer.parseInt(request.getParameter("id"))); %>
		<%System.out.println(courMoocs.getTitreCoursID(Integer.parseInt(request.getParameter("id")))); %>
		<%String nomcours = courMoocs.getTitreCoursID(Integer.parseInt(request.getParameter("id"))); %>
		<jsp:forward page="present.jsp">
			<jsp:param name="title" value="<%=nomcours%>"/>
			<jsp:param name="envoie" value="ok"/>
		</jsp:forward>
			
<%}%>