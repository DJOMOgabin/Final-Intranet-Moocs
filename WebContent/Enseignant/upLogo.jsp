<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Modele.constante, java.sql.PreparedStatement,org.apache.commons.fileupload.*, java.io.*, java.util.List, java.util.Iterator, Modele.CopieFichier, java.sql.*"%>
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
		
		<% 
		
		
				DiskFileUpload upload = new DiskFileUpload();
				List items=upload.parseRequest(request);
				Iterator	 itr=items.iterator();
		
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
					}
					
				}
			}
					String nomcours = connecteurForum.getNomCoursID(Integer.parseInt(request.getParameter("id")));
					%>
					<jsp:forward page="present.jsp">
						<jsp:param name="newlogo" value="ok"/>
						<jsp:param name="title" value="<%=nomcours%>"/>
						<jsp:param name="envoie" value="ok"/>
					</jsp:forward>
</body>
</html>