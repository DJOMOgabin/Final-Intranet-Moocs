<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Modele.constante, forum.OutilsChaine, Modele.Cours, org.apache.commons.fileupload.*, java.io.*, java.util.List, java.util.Iterator, Modele.CopieFichier, java.sql.*"%>
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
					//Process input type=text|radio|checkbox entries
					if(item.getFieldName().equals("titreCours")){
						courMoocs.setTitreCours(new OutilsChaine().convertirEnHTML(item.getString()));	
					}
					if(item.getFieldName().equals("langueCours")){
						courMoocs.setLangueCours(item.getString());						
					}
					if(item.getFieldName().equals("categorieCours")){
						courMoocs.setCategorieCours(new OutilsChaine().convertirEnHTML(item.getString()));
					}
					if(item.getFieldName().equals("lienS")){
						courMoocs.setLien(item.getString());	
					}
					if(item.getFieldName().equals("lienA")){
						
						if(courMoocs.getLien().equals("Autre"))
						{
							courMoocs.setLien(item.getString());
						}
							
					}
					if(item.getFieldName().equals("nombreSemainesCours"))
					{
						courMoocs.setNombreSemainesCours(Integer.parseInt(""+item.getString()));
					}
					if(item.getFieldName().equals("descriptionCours")){
						courMoocs.setDescriptionCours(item.getString());
					}
					 
				}else{					
					File fullFile=new File(item.getName());
					
					if(item.getName().equals(""))
					{
						courMoocs.setLogoCours("logo.png");
						courMoocs.enregistreBD();
						
						Statement  stat= connecteurForum.getConnexion().createStatement();
						
						stat.executeUpdate("insert into prof_cours values ("+teacher.getId()+","+courMoocs.getId()+")");
						stat.close();
						connecteurForum.fermerConnexion();
						
					}else{
						if(item.getContentType().equals("image/png")){
					
					File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
					File savedFile = File.createTempFile("img", ".png", uploadDir);
					
					item.write(savedFile);
				
					
					courMoocs.setLogoCours(savedFile.getName());
					courMoocs.enregistreBD();
					
					Statement  stat= connecteurForum.getConnexion().createStatement();
					
					stat.executeUpdate("insert into prof_cours values ("+teacher.getId()+","+courMoocs.getId()+")");
					stat.close();
					connecteurForum.fermerConnexion();
					}
					
					if(item.getContentType().equals("image/jpg"))
					{
						File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						File savedFile = File.createTempFile("img", ".jpg", uploadDir);
						
						item.write(savedFile);
					
						
						courMoocs.setLogoCours(savedFile.getName());
						courMoocs.enregistreBD();
						
						Statement  stat= connecteurForum.getConnexion().createStatement();
						
						stat.executeQuery("set names utf8");
						
						stat.close();
						
						stat= connecteurForum.getConnexion().createStatement();
						
						stat.executeUpdate("insert into prof_cours values ("+teacher.getId()+","+courMoocs.getId()+")");
						stat.close();
						connecteurForum.fermerConnexion();
					}
					
					if(item.getContentType().equals("image/jpeg"))
					{
						File uploadDir = new File(getServletContext().getRealPath("/")+"cours/img/");
						File savedFile = File.createTempFile("img", ".jpeg", uploadDir);
						
						item.write(savedFile);
					
						
						courMoocs.setLogoCours(savedFile.getName());
						courMoocs.enregistreBD();
						
						Statement  stat= connecteurForum.getConnexion().createStatement();
						stat.executeUpdate("insert into prof_cours values ("+teacher.getId()+","+courMoocs.getId()+")");
						stat.close();
						connecteurForum.fermerConnexion();
					}
					
					}
			}
			}
			
		

		
	%>
	<%teacher.creeForum(courMoocs.getTitreCours()); %>
	<%courMoocs = new Cours(); %>
	<jsp:forward page="ajoutCours.jsp?okay=good"/>
	

</body>
</html>