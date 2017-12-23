<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ page import = "java.util.List, java.util.Iterator, controlleur.Lecture,Modele.Examen, java.sql.PreparedStatement , java.sql.Statement,org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import = "Modele.constante" %>
<%if(session.getAttribute("enseignant")==null){ %> <jsp:forward page="Connexion.jsp"/> <%}else{%>	
  <meta http-equiv="refresh" content="0.001;present.jsp?title=<%=courMoocs.getTitreCoursID(Integer.parseInt(request.getParameter("id")))%>
  &videointro=success">
<%
		
		DiskFileUpload upload = new DiskFileUpload();
		List items=upload.parseRequest(request);
		Iterator itr=items.iterator();

File savedFile=null,uploadDir=null;
PreparedStatement prep=null;
while(itr.hasNext())
	{
		FileItem item = (FileItem)itr.next();
		if(item.isFormField())
		{
			return; 
		}
		else{
			if(!item.getName().equals("")){
				//File fullFile=new File(item.getName());
				uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				savedFile = File.createTempFile("video",Lecture.LireExtension(item.getName()), uploadDir);
				item.write(savedFile);
				prep = Examen.getConn().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));				
				prep.executeUpdate();	
			}
		}
	}
if(prep!=null)prep.close();
}%>