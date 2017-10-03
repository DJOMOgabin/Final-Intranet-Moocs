<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ObjectOutput"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="Traitement.ExerciceEntier"%>
<%@page import="Traitement.Proposition"%>
<%@page import="Traitement.EnonceExercice"%>
<%@page import="Traitement.ReponseQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Traitement.Remplissage"%>
<%@page import="Modele.Point"%>
<%@page import="Traitement.Question"%>
<%@include file="../WEB-INF/jspf/bean/Epreuve.jspf" %>
<%@include file="../WEB-INF/jspf/bean/ReponseEpreuve.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="././css/bootstrap-theme.css" rel="stylesheet">
	  <link rel="stylesheet" href="../css/style.css">
		<title>Composition d'une épreuve</title>
	</head>
	<body>
		<a href="/IntranetMooc/Composition" id="help">Syntaxe des formules</a>
		<form action="composition" method="post">
			<label id="entete">	COMPOSITION D'UNE EPREUVE </label><br><br>
			<input class="titre" type="text" required="required" name="titre" value="${titre}" placeholder="Titre de l'épreuve (exp: exam, ...)" size="80" maxlength="100"/>
			<br><br><p>	
				<label><i>Réponse juste:</i></label>
				<input type="text" class="point" placeholder="bonne reponse" name="juste"  required="required" value="${juste }"/>
				<input type="text" class="point" placeholder="mauvaise reponse" name="mauvais" required="required" value="${mauvais }"/>
				<input type="text" class="point" placeholder="aucune reponse" name="aucun" required="required" value="${aucun}"/>
			<br><br><p>
			<textarea rows="3" cols="108" class="enonce" name="indicative" placeholder="les indicatives de l'épreuve">${indicative }</textarea>
		
			<jsp:setProperty name="question" property="titre" value="${titre}"/>
			<jsp:setProperty name="question" property="indicative" value="${indicative}"/>
			
			<fieldset id="epreuve" class="main-login main-center">
				<%
					question.getExercice().clear();
					Remplissage rempli = new Remplissage(request);
					ArrayList<Question> array = new ArrayList<Question>();
					EnonceExercice enonce;
					question.setPoint(new Point(Float.parseFloat(request.getParameter("juste")),Float.parseFloat(request.getParameter("mauvais")),
							Float.parseFloat(request.getParameter("aucun"))));
					int i;
					for(i=1;i<=rempli.getNombre().getNombreExercice().size();i++){
						out.println(rempli.repeteurExercice(i));
						enonce = new EnonceExercice((String)request.getParameter("exercice"+i),(String)request.getParameter("enonce"+i));
						for(int j=1;j<=rempli.getNombre().getNombreExercice().get(i-1);j++){
							out.println(rempli.repeteurQuestion(i, j));
							array.add(new Question((String)request.getParameter("question"+i+j),
									new Proposition((String)request.getParameter("propositionText"+i+j+"1"),
											(String)request.getParameter("propositionText"+i+j+"2"),
											(String)request.getParameter("propositionText"+i+j+"3"),
											(String)request.getParameter("propositionText"+i+j+"4"))));
							if(request.getParameter("proposition"+i+j)!=null)reponse.getSuiteReponse().add(new ReponseQuestion(i,j,
									Integer.parseInt((String)request.getParameter("proposition"+i+j))));
						}
						out.println("</div>");
						question.getExercice().add(new ExerciceEntier(enonce,(ArrayList<Question>)array.clone()));
						
						//On serialise l'objet dans un fichier
						FileOutputStream fos = new FileOutputStream("user.serial");
						ObjectOutputStream oos = new ObjectOutputStream(fos);
						
						try{
							//Ecriture dans le flux de sortie
							oos.writeObject(question);
							
							//Vide le tampon
							oos.flush();
						}finally{
							try{
								oos.close();
							}finally{
								fos.close();
							}
						}
						
						//On reinitialise la l'ensemble des questions
						array.clear();
					}
					if(i==1){%>
					<div id="div1">
						<label for="exercice"><u><b>Exercice 1:</b></u></label>
						<input class="exercice" type="text" name="exercice1" value="" placeholder="Titre de l'exercice" size="100" maxlength="100"/>
						<br><br><p><br>
						<textarea rows="7" cols="150" class="enonce" name="enonce1"  placeholder="Veuillez entrer l'enoncé de votre exercice"></textarea>
						<br><p>
						 <label for="question"><b>1)</b></label>  
						<textarea rows="1" cols="100" class="question" name="question11" placeholder="Entrer la question"></textarea>
						<br> <label class = "comment" >(Sélectionner la bonne réponse)</label>
						<br><br>
						<p>
						<input class="proposition" type="radio" name="proposition11" value="1"/>
						<label class="lettre" for="lettre"><b><i>A = </i></b></label>
						<input class="propositionText" type="text" name="propositionText111" placeholder="Première proposition" size="50" maxlength="50"/>
						<p>
						<input class="proposition" type="radio" name="proposition11" value="2"/>
						<label class="lettre" for="lettre"><b><i>B = </i></b></label>
						<input  class="propositionText" type="text" name="propositionText112" placeholder="deuxième proposition" size="50" maxlength="50"/>
						<p>
						<input class="proposition" type="radio" name="proposition11" value="3"/>
						<label class="lettre" for="lettre"><b><i>C = </i></b></label>
						<input class="propositionText" type="text" name="propositionText113" placeholder="Troisième proposition" size="50" maxlength="50"/>
						<p>
						<input class="proposition" type="radio" name="proposition11" value="4"/>
						<label class="lettre" for="lettre"><b><i>D = </i></b></label>
						<input class="propositionText" type="text" name="propositionText114" placeholder="Quatrième proposition" size="50" maxlength="50"/>
						<p>			
					</div>			
					<%}
				%>			
			</fieldset>
				
			
			<label class="comment">
			<span><strong>Si vous voulez supprimer une question (respectivement un exercice), 
				il suffit d'enlever sa question (respectivement le titre)</strong> </span> 
			<br>
			</label>
			<label class="comment">
				<span><strong>Une question (respectivement un exercice) supprimée fait disparaître 
				toutes les autres questions (respectivement les exercices) en dessous  d'elle (de lui) </strong> </span>
			</label>
			<br><br>
			<br><br>
			<div class="row">		
	        <div class="col-xs-5">
		        <div id="ajoutQuestion">		        	
					<button class="btn btn-lg btn-warning" type="button" onclick="click">Ajouter une question</button>
		        </div>
	        </div>
	        <!-- /.col -->	
	        <div class="col-xs-5">
		        <div id="ajoutExercice">	        	
					<button class="btn btn-lg btn-warning " type="button" onclick="click">Ajouter un exercice</button>
		        </div>
	        </div>
	        <!-- /.col -->
        </div>
		<br><br>
		<br><br>
      <div class="row">
		  <div class="text-center">
			<input class="btn btn-primary btn-block login-button" name="soumettre" type="submit" value="Soumettre"/>
		  </div>	
	  </div>
		</form>
		<br><br>
		<br><br>
				
		<form action="evaluation" method="get">
			<input type="hidden" name="juste" value="${juste }"/>
				<input type="hidden" name="mauvais" value="${mauvais }"/>
				<input type="hidden" name="aucun" value="${aucun}"/>
			
			<div class="row">
			  <div class="text-center">
				<button type="submit" class="btn btn-lg btn-success suivant login-button">Générer l'épreuve --></button>
			  </div>	
		  </div> 
		</form>
		
	    <script type = "text/javascript" src ="./javascript/script.js"></script>
	</body>
</html>