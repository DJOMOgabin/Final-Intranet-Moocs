<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ page import = "Modele.constante,java.util.ArrayList,controlleur.Lecture, java.util.List, java.util.Iterator, org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>history.forward();</script>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{%>
  <meta http-equiv="refresh" content="0.001;present.jsp?title=<%=request.getParameter("title")%>&comp=Envoie Effectue">
</head>
<body>
<%
DiskFileUpload upload = new DiskFileUpload();
List items=upload.parseRequest(request);
Iterator itr=items.iterator();

while(itr.hasNext()){
		FileItem item = (FileItem)itr.next();
		File savedFile=null,uploadDir=null;
		if(item.isFormField())
		{
			return; 
		}else{
			if(!item.getName().equals("")){
				File fullFile=new File(item.getName());
				uploadDir = new File(getServletContext().getRealPath("/")+"cours/complement/");
				savedFile = File.createTempFile("complement",Lecture.LireExtension(item.getName()), uploadDir);
				item.write(savedFile);
				teacher.ajouterComplement(savedFile.getName(), request.getParameter("video"));				
			}
		}
	}
%>
</body>
<%}%>
</html>