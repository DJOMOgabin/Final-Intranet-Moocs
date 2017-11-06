<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<<<<<<< HEAD
<%@ page import="Modele.constante, java.sql.PreparedStatement,Modele.Examen,controlleur.Lecture,org.apache.commons.fileupload.*, java.io.*, java.util.List, java.util.Iterator, Modele.CopieFichier, java.sql.*"%>
=======
<%@ page import="Modele.constante, java.sql.PreparedStatement,org.apache.commons.fileupload.*, java.io.*, java.util.List, java.util.Iterator, Modele.CopieFichier, java.sql.*"%>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< HEAD
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
=======

</head>
<body>
		
		<% 
		
		
				DiskFileUpload upload = new DiskFileUpload();
				List items=upload.parseRequest(request);
				Iterator	 itr=items.iterator();
		
		while(itr.hasNext())
			{
				FileItem item = (FileItem)itr.next();
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
				if(item.isFormField())
				{
					return; 
				}
				else{
<<<<<<< HEAD

					if(!item.getName().equals("")){
						uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						savedFile = File.createTempFile("img",Lecture.LireExtension(item.getName()), uploadDir);
						item.write(savedFile);
						prep  = Examen.getConn().prepareStatement("update cours set logocours = ? where idcours = ?");
						prep.setString(1,savedFile.getName());
						prep.setString(2,request.getParameter("id"));
						prep.executeUpdate();				
=======
					
					
					File fullFile=new File(item.getName());
					System.out.println(getServletContext().getRealPath("/"));
					
					if(item.getContentType().equals("image/png"))
					{
					
					File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
					File savedFile = File.createTempFile("img", ".png", uploadDir);
					
					item.write(savedFile);
				
					
					PreparedStatement prep  = connecteurForum.getConnexion().prepareStatement("update cours set logocours = ? where idcours = ?");
					prep.setString(1,savedFile.getName());
					prep.setString(2,request.getParameter("id"));
					prep.executeUpdate();
					prep.close();
					connecteurForum.fermerConnexion();
					
					}
					
					if(item.getContentType().equals("image/jpg"))
					{
						File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						File savedFile = File.createTempFile("img", ".jpg", uploadDir);
						
						item.write(savedFile);
					
						

						PreparedStatement prep  = connecteurForum.getConnexion().prepareStatement("update cours set logocours = ? where idcours = ?");
						prep.setString(1,savedFile.getName());
						prep.setString(2,request.getParameter("id"));
						prep.executeUpdate();
						prep.close();
						connecteurForum.fermerConnexion();
					}
					
					if(item.getContentType().equals("image/jpeg"))
					{
						File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						File savedFile = File.createTempFile("img", ".jpeg", uploadDir);
						
						item.write(savedFile);

						PreparedStatement prep  = connecteurForum.getConnexion().prepareStatement("update cours set logocours = ? where idcours = ?");
						prep.setString(1,savedFile.getName());
						prep.setString(2,request.getParameter("id"));
						prep.executeUpdate();
						prep.close();
						connecteurForum.fermerConnexion();
					}
					
					if(item.getContentType().equals("image/ico"))
					{
						File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						File savedFile = File.createTempFile("img", ".ico", uploadDir);
						
						item.write(savedFile);

						PreparedStatement prep  = connecteurForum.getConnexion().prepareStatement("update cours set logocours = ? where idcours = ?");
						prep.setString(1,savedFile.getName());
						prep.setString(2,request.getParameter("id"));
						prep.executeUpdate();
						prep.close();
						connecteurForum.fermerConnexion();
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
					}
					
				}
			}
<<<<<<< HEAD

if(prep!=null)prep.close();%>
=======
					String nomcours = connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("id")));
					%>
					<jsp:forward page="present.jsp">
						<jsp:param name="newlogo" value="ok"/>
						<jsp:param name="title" value="<%=nomcours%>"/>
						<jsp:param name="envoie" value="ok"/>
					</jsp:forward>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
</body>
</html>