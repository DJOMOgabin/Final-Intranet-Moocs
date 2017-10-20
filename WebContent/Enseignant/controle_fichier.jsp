<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ page import="org.apache.commons.fileupload.*,Modele.constante, java.io.File,controlleur.Lecture, java.util.List, java.util.Iterator, java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="0.001;present.jsp?title=<%=request.getParameter("nomCours")%>
&exo=ok&envoie=ok&reussi=Upload Reussi">
</head>

<body>

	
	<%	
		courMoocs.setTitreCours(request.getParameter("nomCours"));
		DiskFileUpload upload = new DiskFileUpload();
		List items=upload.parseRequest(request);
		Iterator itr=items.iterator();
		
		while(itr.hasNext())
			{
				FileItem item = (FileItem)itr.next();
				File savedFile=null,uploadDir=null;
				if(item.isFormField())
				{
					return; 
				}
				else{
					if(!item.getName().equals("")){
						uploadDir = new File(getServletContext().getRealPath("/")+"cours/exercice/");
						savedFile = File.createTempFile("exercice",Lecture.LireExtension(item.getName()), uploadDir);
						item.write(savedFile);	
						connecteurForum.ajouterQuiz(savedFile.getName(),teacher.getId(),courMoocs.getId(),Integer.parseInt(request.getParameter("semaine")));					
					}
				}
			}		
	%>
</body>

</html>