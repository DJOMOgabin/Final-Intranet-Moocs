<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf"%>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>

<%if(teacher.getLogin().equals(""))
	{ %> <jsp:forward page="../index.jsp"/> <%}else{%>
	
	
	
	<%connecteurForum.supprimervideo(request.getParameter("video"), Integer.parseInt(request.getParameter("idcours"))); %>
	
	<%System.out.println(courMoocs.getTitreCours()); %>
	
	<script>

		window.location.href="present.jsp?title="+courMoocs.getTitreCours();
	
	</script>
	
	
	<%}%>