<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<<<<<<< HEAD
<%@ page import = "java.util.List, java.util.Iterator,controlleur.Lecture,Modele.Examen, java.sql.PreparedStatement , java.sql.Statement,org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
=======
<%@ page import = "java.util.List, java.util.Iterator, java.sql.PreparedStatement , java.sql.Statement,org.apache.commons.fileupload.*, java.io.File, java.io.IOException" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import = "Modele.constante" %>

<<<<<<< HEAD
<%if(session.getAttribute("enseignant")==null){%> <jsp:forward page="Connexion.jsp"/> <%}else{%>
<meta http-equiv="refresh" content="0.001;present.jsp?title=<%=request.getParameter("title")%>&video=Upload Reussi&envoie=ok">
<%
=======
<%if(session.getAttribute("enseignant")==null)
	{ %> <jsp:forward page="Connexion.jsp"/> <%}else{%>

<%

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
DiskFileUpload upload = new DiskFileUpload();
List items=upload.parseRequest(request);
Iterator itr=items.iterator();

<<<<<<< HEAD
File savedFile=null,uploadDir=null;
PreparedStatement prep=null;
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
while(itr.hasNext())
	{
		FileItem item = (FileItem)itr.next();
		if(item.isFormField())
		{
			return; 
		}
		else{
<<<<<<< HEAD
			if(!item.getName().equals("")){
				//File fullFile=new File(item.getName());
				uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				savedFile = File.createTempFile("video",Lecture.LireExtension(item.getName()), uploadDir);
				item.write(savedFile);
				prep = Examen.getConn().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();		
			}
		}
	}
	if(prep!=null)prep.close();
}%>
=======
			
			
			File fullFile=new File(item.getName());
			System.out.println(getServletContext().getRealPath("/"));
			
			System.out.println(item.getContentType());
			
		 
			if(item.getContentType().equals("application/x-vlc-plugin") || item.getContentType().equals("video/mp4"))
			{
		
			File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
			File savedFile = File.createTempFile("video", ".mp4", uploadDir);
			item.write(savedFile);
		
			PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
			prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
			prep.setString(2,savedFile.getName());
			prep.setInt(3,courMoocs.getId());
			prep.executeUpdate();
			prep.close(); 
			connecteurForum.fermerConnexion();
		
			
			}
			
			if(item.getContentType().equals("video/flv"))
			{
			
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".flv", uploadDir);
				item.write(savedFile);
			
				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
					
				
			}
			
			if(item.getContentType().equals("video/mkv"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".mkv", uploadDir);
				item.write(savedFile);
			
				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
				
			}
			if(item.getContentType().equals("video/webm"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".webm", uploadDir);
				item.write(savedFile);
				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
				
			}
			if(item.getContentType().equals("video/3gp"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video",".3gp",uploadDir);
				item.write(savedFile);
				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
			}
			if(item.getContentType().equals("video/avi"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".avi", uploadDir);
				item.write(savedFile);
				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
				
			}
			
			if(item.getContentType().equals("video/x-ms-wmv"))
			{
				File uploadDir = new File(getServletContext().getRealPath("/")+"cours/video/");
				File savedFile = File.createTempFile("video", ".wmv", uploadDir);
				item.write(savedFile);
				PreparedStatement prep = connecteurForum.getConnexion().prepareStatement("insert into video(semaine,video,id_cours) values (?,?,?)");
				prep.setInt(1,Integer.parseInt(request.getParameter("semaine")));
				prep.setString(2,savedFile.getName());
				prep.setInt(3,courMoocs.getId());
				prep.executeUpdate();
				prep.close(); 
				connecteurForum.fermerConnexion();
				
			}
		}
	}


String title = request.getParameter("title");
%>

        <jsp:forward page="present.jsp">
        	<jsp:param name="title" value="<%=title%>"/>
        	<jsp:param name="video" value="Upload Reussi"/>
        	<jsp:param name="envoie" value="ok"/>
        </jsp:forward>
<%}%>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
