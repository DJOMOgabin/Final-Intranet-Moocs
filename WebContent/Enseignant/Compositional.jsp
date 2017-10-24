<%@page import="Modele.Examen"%>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante, Modele.Devoirs" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Enseignant</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="../dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="../css/style.css">
	  <!-- Bootstrap 3.3.5 -->
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

</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ page contentType="text/html" %>
	<%@ include file="entete.jsp" %>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-info alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4><i class="icon fa fa-info-circle"></i> Créez votre épreuve à votre convenance</h4>
	         	</div>
			</div>
		</div>
		<a href="../cours/complement/sample-asciimath.html" target="_blank" id="help">Syntaxe des formules</a>
	<form action="Evaluational.jsp" method="POST" accept-charset="utf-8" onsubmit="return verifForm(this)">
	<% 
	   int i=1,j=1;
	%>
		<label id="entete">	COMPOSITION D'UNE EPREUVE </label><br><br>
		<input class="titre has-feedback  form-control" type="text" name="titre" 
		required="required" value="<%= request.getParameter("nom")%>" 
		placeholder="Titre de l'épreuve (exp: exam, ...)" size="110" 
		maxlength="120" onkeyup="forum('*','<%=request.getParameter("title")%>','toto',this.value)"/>
		<br><br><p>	
		<div class="row">
				<label class="col-md-2"><i>Points de question:</i></label>
				<input type="hidden" name="update" value="false"/>
				<input type="text" class="point col-md-3" placeholder="bonne reponse" name="juste" required="required" onblur="verifNumber2(this)"/>
				<input type="text" class="point col-md-3" placeholder="mauvaise reponse" name="mauvais" required="required" onblur="verifNumber2(this)"/>
				<input type="text" class="point col-md-3" placeholder="aucune reponse" name="aucun" required="required" onblur="verifNumber2(this)"/>
				<input type="hidden" name="title" value="<%=request.getParameter("title") %> "/>
				<input type="hidden" name="en" value="true"/>		
		</div>
		<br><p>	
				<div class="row">
					<label class="col-md-2"><i>Disponibilité:</i></label>
					<input type="number" class="point col-xs-3" placeholder="jour" name="jour" required="required" onblur="verifNumber(this)"/>
					<input type="number" class="point col-xs-3" placeholder="heure" name="heure" required="required" onblur="verifNumber(this)"/>
					<input type="number" class="point col-xs-3" placeholder="minute" name="minute" required="required" onblur="verifNumber(this)"/>
					
				</div>
		<br><p>	
				<div class="row">
					<div class="col-xs-6">
						<label for="duree"><i>Durée de l'épreuve:</i></label>
						<input type="number" id="duree" class="point" value="2" name="duree" required="required" onblur="verifNumber(this)"/>
						<label for="duree">h</label>
					</div>
					<label for="tentative" class="col-md-2">Nombre de tentatives:</label>
					<input type="number" id="tentative" class="point col-xs-3" value="3" name="tentative" required="required" onblur="verifNumber(this)"/>
				</div>		
		<br><br><p>
		<textarea rows="3" cols="160" class="enonce  form-control" id="indic" name="indicative" placeholder="les indicatives de l'épreuve"></textarea>
		<br><br><p>
		<fieldset id="epreuve" class="main-login main-center">
			<div id="div1">
				<label for="exercice"><u><b>Exercice 1:</b></u></label>
				<input class="exercice  form-control" type="text" name="exercice1" value="" placeholder="Titre de l'exercice" size="100" maxlength="100" required="required"/>
				<br><br><p><br>
				<textarea rows="7" cols="150" class="enonce form-control" name="enonce1" placeholder="Veuillez entrer l'enoncé de votre exercice"></textarea>
				<br><p>
				 <label for="question"><b>1)</b></label>  
				<textarea rows="1" cols="100" class="question  form-control" name="question11" placeholder="Entrer la question"></textarea>
				<br> <label class = "comment" >(Sélectionner la bonne réponse)</label>
				<br><br>
				<p>
				<div class="row">				
					<div class="col-md-1">
				<input class="proposition" type="radio" name="proposition11" value="1"/>
				<label class="lettre" for="lettre"><b><i>A ) </i></b></label>
					</div>
					<div class="col-md-11">
				<textarea rows="1" cols="100" class="propositionText  form-control" name="propositionText111" placeholder="Première proposition"></textarea>
					</div>
				</div>
				<p>
				<div class="row">				
					<div class="col-md-1">
				<input class="proposition" type="radio" name="proposition11" value="2"/>
				<label class="lettre" for="lettre"><b><i>B ) </i></b></label>
					</div>
					<div class="col-md-11">
				<textarea rows="1" cols="100" class="propositionText  form-control" name="propositionText112" placeholder="Deuxième proposition"></textarea>
					</div>
				</div>
				<p><div class="row">				
					<div class="col-md-1">
				<input class="proposition" type="radio" name="proposition11" value="3"/>
				<label class="lettre" for="lettre"><b><i>C ) </i></b></label>
					</div>
					<div class="col-md-11">
				<textarea rows="1" cols="100" class="propositionText  form-control" name="propositionText113" placeholder="Troisième proposition"></textarea>
					</div>
				</div>
				<p><div class="row">				
					<div class="col-md-1">
				<input class="proposition" type="radio" name="proposition11" value="4"/>
				<label class="lettre" for="lettre"><b><i>D ) </i></b></label>
					</div>
					<div class="col-md-11">
				<textarea rows="1" cols="100" class="propositionText  form-control" name="propositionText114" placeholder="Quatrième proposition"></textarea>
					</div>
				</div>
				<p>			
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
      	
      		<div class="col-md-5">
		        <div id="ajoutExercice">	        	
					<button class="btn btn-lg btn-warning" type="button" onClick="exercice('<%= i %>','<%= j %>')">Ajouter un exercice</button>
		        </div>
	        </div>		
	        <div class="col-md-5">
		        <div id="ajoutQuestion">		        	
					<button class="btn btn-lg btn-warning" type="button" onclick="question('<%= i %>','<%= j %>')">Ajouter une question</button>
		        </div>
	        </div>
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
	<br><br><br>
	<div class="row">
		 <div>
			<a type="submit" href="liste.jsp?title=<%=request.getParameter("title") %>" class="btn btn-lg retour btn-danger login-button"> <-- Retour</a>
		 </div>	
	</div> 
		<br><br>
		<br><br>
	
     
    <%@include file="../footer.jsp" %>
	<script><%@include file="accent.jsp"%></script>
    <script type = "text/javascript" src ="../js/script.js"></script>
	
	<!-- jQuery 2.1.4 -->
	<script src="././jQuery-3.1.1.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="././bootstrap.min.js"></script>
    <!-- jQuery -->
   <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="../dist/js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="../plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.2.2/video.js"></script>
<script src="../dist/js/readmore.js"></script>
<script>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
</script> 
</body>

</html>
<%} %>
