<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ page import = "Modele.constante, java.util.List, java.util.Iterator, org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>history.forward();</script>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<!--meta http-equiv="refresh" content="1;present.jsp?title=<%=request.getParameter("title")%>"-->
</head>
<body>

	


<%

DiskFileUpload upload = new DiskFileUpload();
List items=upload.parseRequest(request);
Iterator itr=items.iterator();

while(itr.hasNext())
	{
		FileItem item = (FileItem)itr.next();
		if(item.isFormField())
		{
			return; 
		}
		else{
			
			
			File fullFile=new File(item.getName());
			System.out.println(getServletContext().getRealPath("/"));
			
			System.out.println(item.getContentType());			
		 
			if(item.getContentType().equals("application/pdf"))
			{
			File uploadDir = new File(getServletContext().getRealPath("/")+"cours/complement/");
			File savedFile = File.createTempFile("complement", ".pdf", uploadDir);
			item.write(savedFile);
			System.out.println("upload : "+uploadDir);
			System.out.println("save : "+savedFile.getName());
		
			teacher.ajouterComplement(savedFile.getName(), request.getParameter("video"));
			}
			if(item.getContentType().equals("application/msword")||
					item.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document"))
			{
		
			File uploadDir = new File(getServletContext().getRealPath("/")+"cours/complement/");
			File savedFile = File.createTempFile("complement", ".docx", uploadDir);
			item.write(savedFile);
		
			teacher.ajouterComplement(savedFile.getName(), request.getParameter("video"));
		
			
			}
			if(item.getContentType().equals("application/epub"))
			{
		
			File uploadDir = new File(getServletContext().getRealPath("/")+"cours/complement/");
			File savedFile = File.createTempFile("complement", ".epub", uploadDir);
			item.write(savedFile);
		
			teacher.ajouterComplement(savedFile.getName(), request.getParameter("video"));			
			}
			if(item.getContentType().equals("application/mp4"))
			{
		
			File uploadDir = new File(getServletContext().getRealPath("/")+"cours/complement/");
			File savedFile = File.createTempFile("complement", ".mp4", uploadDir);
			item.write(savedFile);
		
			teacher.ajouterComplement(savedFile.getName(), request.getParameter("video"));
		
			
			}
			
	String title = request.getParameter("title");		
			
%>
<jsp:forward page="present.jsp">
	<jsp:param name="comp" value="Envoie Effectue"/>
	<jsp:param name="title" value="<%=title%>"/>
</jsp:forward>
</body>
<%}}} %>
</html>