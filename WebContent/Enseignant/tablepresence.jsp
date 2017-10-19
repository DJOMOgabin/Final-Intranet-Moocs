<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/Graphe.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ page import = "Modele.User, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<%if(teacher.getLogin().equals(""))
	{ %> <jsp:forward page="Connexion.jsp"/> <%}else{%>
	
	
</head>
<body>

	
	<br/>
	



		
			<div class="table">
			
				<table class="table table-bordered table-striped table-hover table-condensed" id="table">
				
					<thead> 
					
						<tr>
						
							<th> # </th>
							<th> NOM </th>
							<th> HEURE CONNEXION </th>
							<th> HEURE FIN </th>
							<th> TEMPS MIS / MINUTE </th>
							
						</tr>
					
					</thead>
					
					<tbody>
					
						<%
						
							Connection conn = connecteurForum.getConnexion();
							Statement stat = conn.createStatement();
							
							ResultSet rs ;
							//System.out.println("select idetudiant, dateDebut, dateFin, timestampdiff(minute,dateDebut,dateFin) as tempmis from session where datediff('"+request.getParameter("date")+" 00:00:00',dateDebut) =0");
							if(request.getParameter("date1")!=null)
							{ 
								rs = stat.executeQuery(" select idetudiant, dateDebut, dateFin, timestampdiff(minute,dateDebut,dateFin) as tempmis from session where datediff('"+request.getParameter("date1")+"',dateDebut) <=0 and datediff('"+request.getParameter("date2")+"',dateDebut)>=0;");
							}
							else{
								
							
							 rs = stat.executeQuery("select idetudiant, dateDebut, dateFin, timestampdiff(minute,dateDebut,dateFin) as tempmis from session where datediff('"+request.getParameter("date")+" 00:00:00',dateDebut) =0");
						
							}
							int i = 0;
							User s = new User();
							
							while(rs.next())
							
							{%>
							
								<tr>
									
										<td><%=i+1%></td>
										<td><a href="profil_p.jsp?id_Etudiant=<%=rs.getInt("idetudiant")%>"><%=s.getNomId(rs.getInt("idetudiant")+"").toUpperCase()%></a></td>
										<td><%=rs.getString("dateDebut")%></td>
										<td><%=rs.getString("dateFin")%></td>
										<td><%=rs.getInt("tempmis")%></td>
								
								</tr>
								<%i++;%>	
							<%}%>
							<%
								rs.close();
								stat.close();
								conn.close();
					%>
					</tbody>
				
				
				</table>
			
			</div>
		
	

</body>
<%}%>
</html>