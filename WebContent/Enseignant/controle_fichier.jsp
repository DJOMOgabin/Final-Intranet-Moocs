<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>
<<<<<<< HEAD
<%@ page import="org.apache.commons.fileupload.*,Modele.constante, java.io.File,controlleur.Lecture, java.util.List, java.util.Iterator, java.sql.Statement" %>
=======
<%@ page import="org.apache.commons.fileupload.*,Modele.constante, java.io.File, java.util.List, java.util.Iterator, java.sql.Statement" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<<<<<<< HEAD
<meta http-equiv="refresh" content="0.001;present.jsp?title=<%=request.getParameter("nomCours")%>
&exo=ok&envoie=ok&reussi=Upload Reussi">
=======

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
</head>

<body>

	
<<<<<<< HEAD
	<%	
=======
	<%
		System.out.println(request.getParameter("nomCours"));
	String title = request.getParameter("nomCours");
	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		courMoocs.setTitreCours(request.getParameter("nomCours"));
		DiskFileUpload upload = new DiskFileUpload();
		List items=upload.parseRequest(request);
		Iterator itr=items.iterator();
		
		while(itr.hasNext())
			{
				FileItem item = (FileItem)itr.next();
<<<<<<< HEAD
				File savedFile=null,uploadDir=null;
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
				if(item.isFormField())
				{
					return; 
				}
				else{
<<<<<<< HEAD
					if(!item.getName().equals("")){
						uploadDir = new File(getServletContext().getRealPath("/")+"cours/exercice/");
						savedFile = File.createTempFile("exercice",Lecture.LireExtension(item.getName()), uploadDir);
						item.write(savedFile);	
						connecteurForum.ajouterQuiz(savedFile.getName(),teacher.getId(),courMoocs.getId(),Integer.parseInt(request.getParameter("semaine")));					
					}
				}
			}		
	%>
=======
					
					
					File fullFile=new File(item.getName());
					System.out.println(item.getContentType());
					
					if(item.getContentType().equals("application/pdf"))
					{
					
					File uploadDir = new File(getServletContext().getRealPath("/")+"cours/exercice/");
					File savedFile = File.createTempFile("exercice", ".pdf", uploadDir);
					
					item.write(savedFile);
				
					
					connecteurForum.ajouterQuiz(savedFile.getName(),teacher.getId(),courMoocs.getId(),Integer.parseInt(request.getParameter("semaine")));
					}
					
					if(item.getContentType().equals("application/msword"))
					{
					
					File uploadDir = new File(getServletContext().getRealPath("/")+"cours/exercice/");
					File savedFile = File.createTempFile("exercice", ".docx", uploadDir);
					
					item.write(savedFile);
				
					
					connecteurForum.ajouterQuiz(savedFile.getName(),teacher.getId(),courMoocs.getId(),Integer.parseInt(request.getParameter("semaine")));
					}
					
					if(item.getContentType().equals("application/epub"))
					{
						File uploadDir = new File(getServletContext().getRealPath("/")+"cours/exercice/");
						File savedFile = File.createTempFile("exercice", ".epub", uploadDir);
						
						item.write(savedFile);
					
						connecteurForum.ajouterQuiz(savedFile.getName(),teacher.getId(),courMoocs.getId(),Integer.parseInt(request.getParameter("semaine")));	
					}
				}
			}
		

		
	%>
	
<jsp:forward page="present.jsp">
	<jsp:param name="reussi" value="Upload Reussi"/>
	<jsp:param name="title" value="<%=title %>"/>
	<jsp:param name="exo" value="ok"/>
	<jsp:param name="envoie" value="ok"/>
</jsp:forward>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
</body>

</html>