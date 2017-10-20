<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Modele.constante, java.sql.PreparedStatement,Modele.Examen,controlleur.Lecture,org.apache.commons.fileupload.*, java.io.*, java.util.List, java.util.Iterator, Modele.CopieFichier, java.sql.*"%>
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="0.001;present.jsp?title=<%=courMoocs.getTitreCoursID(Integer.parseInt(request.getParameter("id")))%>
  &newlogo=ok&envoie=ok">
</head>
<body>
		
<%
DiskFileUpload upload = new DiskFileUpload();
List items=upload.parseRequest(request);
Iterator itr=items.iterator();
PreparedStatement prep=null;		
		while(itr.hasNext()){
			FileItem item = (FileItem)itr.next();
			File savedFile=null,uploadDir=null;
				if(item.isFormField())
				{
					return; 
				}
				else{

					if(!item.getName().equals("")){
						uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						savedFile = File.createTempFile("img",Lecture.LireExtension(item.getName()), uploadDir);
						item.write(savedFile);
						prep  = Examen.getConn().prepareStatement("update cours set logocours = ? where idcours = ?");
						prep.setString(1,savedFile.getName());
						prep.setString(2,request.getParameter("id"));
						prep.executeUpdate();				
					}
					
				}
			}

if(prep!=null)prep.close();%>
</body>
</html>