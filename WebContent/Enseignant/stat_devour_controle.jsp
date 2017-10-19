<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="Modele.constante, Modele.Cours,  java.io.*, java.util.List, java.util.Iterator,  java.sql.*"%>
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ include file = "../WEB-INF/jspf/bean/devoirBean.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>	
	<%String id=request.getParameter("id")!=null?request.getParameter("id"):"-1";
         String titre = devoirBean.getTitreCercle(id);
        %>
	<jsp:forward page="statDevoir.jsp">
            <jsp:param name="id" value="<%=id%>"/>
            <jsp:param name="titre" value="<%=titre%>"/>
        </jsp:forward>

</body>
</html>