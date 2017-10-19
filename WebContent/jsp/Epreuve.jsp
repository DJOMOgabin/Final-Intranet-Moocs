<%@page import="Modele.Epreuve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  	<link rel="stylesheet" href="././css/epreuve.css">
		<title>Epreuve</title>
	</head>
	
	<body>
		<%Epreuve epreuve = (Epreuve)request.getServletContext().getAttribute("question");%>
			<label class="titre"><strong><%= epreuve.getTitre() %></strong> </label><br><p>
			<label class="comment"><i>bonne réponse ${juste} pt(s),
			 mauvaise réponse ${mauvais} pt(s),
			  aucune réponse ${aucun} pt(s)</i></label><br><p>
			<label class="indicative"><%= epreuve.getIndicative() %> </label><br><p><br><p>
			<fieldset id="epreuve">
				<%for(int i=0;i<epreuve.getExercice().size();i++){%>
				<label class="exercice"><i><b><u> Exercice <%=i+1 %>:</u>  </b></i> 
				<%= epreuve.getExercice().get(i).getExercice().getTitre() %></label><br><p>
				<label class="enonce"><%= epreuve.getExercice().get(i).getExercice().getEnonce() %></label><p>
					<% for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){%>
						<div class="blocProposition" >
							<label class="question"><b><%=j+1 %>) </b><%=epreuve.getExercice().get(i).getQuestion().get(j).getQuestion() %></label><p>
							<input selected="selected" class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="1"/>
							<label>A = <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo1() %></label><br>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="2"/>
							<label>B = <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo2() %></label><br>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="3"/>
							<label>C = <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo3() %></label><br>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="4"/>
							<label>D = <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo4() %></label><br><p>
						</div>
					<%}%>
				<%}%>
			</fieldset>
			
	</body>
</html>