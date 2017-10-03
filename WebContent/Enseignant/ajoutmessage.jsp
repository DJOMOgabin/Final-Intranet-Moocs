<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import = "java.net.*,java.util.Date"  %>
   <%@ include file="../WEB-INF/jspf/bean/teacher.jspf" %>
   <%@ include file ="../WEB-INF/jspf/bean/connecteurforum.jspf" %>

   
   <jsp:useBean id="message" class="forum.MessageForum">
   
   	<jsp:setProperty name="message" property="*"/>
   
<%System.out.println(connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("id")))); %>
<% message.setSujet(connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("id")))); %>
<% message.setAuteur(teacher.getLogin()); %>
<% message.setDateCreation(new Date()); %>
<% System.out.println(message.getDateCreation()); %>
   
   </jsp:useBean>
   
   <% message.ajouter(connecteurForum );%>
   <%response.sendRedirect("forum.jsp?sujet="+URLEncoder.encode(message.getSujet(),"ISO-8859-1")); %>