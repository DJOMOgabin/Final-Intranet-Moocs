<%@page import="java.util.ArrayList"%>
<%@page import="Traitement.Nombre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <link rel="stylesheet" href="././css/style.css">
	  <!-- Bootstrap 3.3.5 -->
    <link href="../css/bootstrap-theme.css" rel="stylesheet">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Enseignant</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="../dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
	  <!-- iCheck -->
	<title>Composition d'une épreuve</title>
</head>
<body>
	<a href="composition" id="help">Syntaxe des formules</a>
	<form action="composition" method="post">
		<label id="entete">	COMPOSITION D'UNE EPREUVE </label><br><br>
		<input class="titre form-control" type="text" name="titre" required="required" value="" placeholder="Titre de l'épreuve (exp: exam, ...)" size="80" maxlength="100"/>
		<br><br><p>	
		<label><i>Réponse juste:</i></label>
		<input type="text" class="point" placeholder="bonne reponse" name="juste" required="required"/>
		<input type="text" class="point" placeholder="mauvaise reponse" name="mauvais" required="required"/>
		<input type="text" class="point" placeholder="aucune reponse" name="aucun" required="required"/>
		<br><p>	
		<label><i>Durée de l'épreuve:</i></label>
		<input type="number" class="jour" placeholder="jours" name="jour" required="required"/>
		<input type="number" class="point" placeholder="heures" name="heure" required="required"/>
		<label for="option"><i>Cas<strong> de Réponses partielles</strong>:</i></label>
		<select class="point" name="option">
			<option value="0">Aucun point</option>
			<option value="1">Le ratio des points</option>
		</select>
		<br><br><p>
		<textarea rows="3" cols="108" class="enonce" name="indicative" placeholder="les indicatives de l'épreuve"></textarea>
		<br><br><p>
		<fieldset id="epreuve" class="main-login main-center">
			<div id="div1">
				<label for="exercice"><u><b>Exercice 1:</b></u></label>
				<input class="exercice" type="text" name="exercice1" value="" placeholder="Titre de l'exercice" size="50" maxlength="100"/>
				<br><p>
				<textarea rows="7" cols="98" class="enonce" name="enonce1"  placeholder="Veuillez entrer l'enoncé de votre exercice"></textarea>
				<br><p>
				 <label for="question"><b>1)</b></label>  
				<textarea rows="1" cols="75" class="question" name="question11" placeholder="Entrer la question"></textarea>
				 <img class="btn" src="images/p1.png" id="ajout11"/>
				<br> <label class = "comment" >(Sélectionner la bonne réponse)</label>
				<br><br>
				<p>
				<div id="propo11">
					<input class="proposition" type="checkbox" name="proposition111" value="1"/>
					<label class="lettre" for="lettre"><b><i>1 </i>) </b></label>
					<input class="propositionText" type="text" name="propositionText111" placeholder="proposition 1" size="50" maxlength="50"/>
					<p>
					<input class="proposition" type="checkbox" name="proposition112" value="2"/>
					<label class="lettre" for="lettre"><b><i>2 </i>) </b></label>
					<input  class="propositionText" type="text" name="propositionText112" placeholder="proposition 2" size="50" maxlength="50"/>
					<p>
					<input class="proposition" type="checkbox" name="proposition113" value="3"/>
					<label class="lettre" for="lettre"><b><i>3 </i>) </b></label>
					<input class="propositionText" type="text" name="propositionText113" placeholder="proposition 3" size="50" maxlength="50"/>
					<p>
					<input class="proposition" type="checkbox" name="proposition114" value="4"/>
					<label class="lettre" for="lettre"><b><i>4 </i>) </b></label>
					<input class="propositionText" type="text" name="propositionText114" placeholder="proposition 4" size="50" maxlength="50"/>
					<p>
				</div>							
			</div>			
		</fieldset>
		<div>
			<label class="comment">
				<span><strong>Si vous voulez supprimer une question (respectivement un exercice), 
				il suffit de ne pas remplir le champs de sa question (respectivement le titre)</strong> </span> 
				<br>
			</label>
			<label class="comment">
				<span><strong>Une question (respectivement un exercice) supprimée fait disparaître
				 toutes les autres questions (respectivement les exercices) en dessous  d'elle (de lui) </strong> </span>
			</label>
		<br><br>
		<br><br>
		</div>
      	<div class="row">		
	        <div class="col-xs-5">
		        <div id="ajoutQuestion">		        	
					<button class="btn btn-lg btn-warning" type="button" onclick="click">Ajouter une question</button>
		        </div>
	        </div>
	        <!-- /.col -->	
	        <div class="col-xs-5">
		        <div id="ajoutExercice">	        	
					<button class="btn btn-lg btn-warning" type="button" onclick="click">Ajouter un exercice</button>
		        </div>
	        </div>
	        <!-- /.col -->
        </div>
		<br><br>
		<br><br>
		<br>
      <div class="row">
		  <div class="text-center">
			<input class="btn btn-primary btn-block login-button" name="soumettre" type="submit" value="Soumettre"/>
		  </div>	
	  </div>
	</form>
		<br><br>
		<br><br>
    <script type = "text/javascript" src ="js/script.js"></script>
	
	<!-- jQuery 2.1.4 -->
	<script src="././jQuery-3.1.1.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="././bootstrap.min.js"></script>
</body>
</html>