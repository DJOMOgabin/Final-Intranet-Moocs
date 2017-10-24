<%@page import="javax.print.attribute.standard.Severity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ page import = "Modele.constante,Modele.DevoirsEtudiant,java.util.ArrayList,controlleur.Lecture, java.util.List, java.util.Iterator, org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>history.forward();</script>
<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{%>
  <meta http-equiv="refresh" content="0.001;les_devoirs.jsp?title=<%=request.getParameter("title")%>&del=false&char=1">
</head>
<body>
<%
DiskFileUpload upload = new DiskFileUpload();
List items=upload.parseRequest(request);
Iterator itr=items.iterator();
while(itr.hasNext()){
		FileItem item = (FileItem)itr.next();
		File savedFile=null,uploadDir=null;
		if(item.isFormField()){
			return; 
		}else{
			if(!item.getName().equals("")){
				uploadDir = new File(getServletContext().getRealPath("/")+"cours/Devoirs/");
				savedFile = File.createTempFile("devoir",Lecture.LireExtension(item.getName()), uploadDir);
				item.write(savedFile);
				userMooc.setDevoirEtudiant(new DevoirsEtudiant(request.getParameter("title"),userMooc.getId()));
				userMooc.getDevoirEtudiant().setCheminDevoir(savedFile.getName());
				//userMooc.getDevoirEtudiant().setNomDevoir("hello");
				userMooc.getDevoirEtudiant().setNomDevoir(request.getParameter("titre"));
				DevoirsEtudiant.chargerDevoir(userMooc.getDevoirEtudiant());				
			}
		}
	}
%>
</body>
<%}%>
</html>