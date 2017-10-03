<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ page import = "java.util.List, java.util.Iterator, java.sql.PreparedStatement , java.sql.Statement,org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import = "Modele.constante" %>

<%if(session.getAttribute("enseignant")==null)
	{ %> <jsp:forward page="Connexion.jsp"/> <%}else{%>
	


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
			
			
			System.out.println(item.getContentType());
			
		 
			if(item.getContentType().equals("application/x-vlc-plugin") || item.getContentType().equals("video/mp4"))
			{
		
			File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
			File savedFile = File.createTempFile("video", ".mp4", uploadDir);
			item.write(savedFile);
		
			PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
			prep.setString(1,savedFile.getName());
			prep.setInt(2,Integer.parseInt(request.getParameter("id")));
			
			prep.executeUpdate();
			prep.close(); 
			connecteurForum.fermerConnexion();
		
			
			}
			
			if(item.getContentType().equals("video/flv"))
			{
			
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".flv", uploadDir);
				item.write(savedFile);
			

				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));
				
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			
				
				
			}
			
			if(item.getContentType().equals("video/mkv"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".mkv", uploadDir);
				item.write(savedFile);
			

				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));
				
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			
				
				
			}
			if(item.getContentType().equals("video/webm"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".webm", uploadDir);
				item.write(savedFile);

				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));
				
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			
				
				
			}
			if(item.getContentType().equals("video/3gp"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video",".3gp",uploadDir);
				item.write(savedFile);

				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));
				
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			
				
			}
			if(item.getContentType().equals("video/avi"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".avi", uploadDir);
				item.write(savedFile);

				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));
				
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			
				
				
			}
			
			if(item.getContentType().equals("video/x-ms-wmv"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".wmv", uploadDir);
				item.write(savedFile);

				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("UPDATE cours SET introduction = ? WHERE idcours = ?");
				prep.setString(1,savedFile.getName());
				prep.setInt(2,Integer.parseInt(request.getParameter("id")));
				
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			
				
				
			}
			
			
			
		
			
			
			
		}
	}



%>
	
	<%String nomcours = courMoocs.getTitreCoursID(Integer.parseInt(request.getParameter("id"))); %>
	<jsp:forward page="present.jsp">
			<jsp:param name="title" value="<%=nomcours%>"/>
			<jsp:param name="videointro" value="success"/>
		</jsp:forward>
      
<%}%>