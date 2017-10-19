<%@page import="Traitement.Duree"%>
<%@page import="com.sun.jmx.snmp.Timestamp"%>
<%@page import="Hibernate.TestHibernate2"%>
<%@page import="Modele.Examen"%>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante, Modele.Devoirs, Modele.Examen" %>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ObjectOutput"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="Traitement.ExerciceEntier"%>
<%@page import="Traitement.Proposition"%>
<%@page import="Traitement.EnonceExercice"%>
<%@page import="Traitement.ReponseQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Traitement.Remplissage"%>
<%@page import="Modele.Point,Modele.Epreuve,Hibernate.TestHibernate"%>
<%@page import="Traitement.Question"%>
<%@include file="../WEB-INF/jspf/bean/Epreuve.jspf" %>
<%@include file="../WEB-INF/jspf/bean/ReponseEpreuve.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--meta http-equiv="refresh" content="5;/Intra/Enseignant/index.jsp"-->
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
<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ include file="entete.jsp" %>
	<section class="content-header">
		<%
		boolean bol;
		if(request.getParameter("update")!=null && request.getParameter("update").equalsIgnoreCase("true")){
			question= TestHibernate2.chargerEpreuve
					(request.getParameter("titre"), request.getParameter("title"));
			request.setAttribute("titre", ""+question.getTitre());
			request.setAttribute("juste", ""+question.getPoint().getJuste());
			request.setAttribute("mauvais",""+question.getPoint().getMauvais());
			request.setAttribute("aucun", ""+question.getPoint().getAucun());
			request.setAttribute("jour", ""+question.getDuree().getJour());
			request.setAttribute("heure", ""+question.getDuree().getHeure());
			request.setAttribute("minute", ""+question.getDuree().getMinute());
			request.setAttribute("duree", ""+question.getDuree().getDuree());
			request.setAttribute("tentative", ""+question.getDuree().getTentative());
			request.setAttribute("indicative", ""+question.getIndicative());
			request.setAttribute("title", ""+question.getMatiere());
		}else{
			request.setAttribute("titre", request.getParameter("titre"));
			request.setAttribute("juste", request.getParameter("juste"));
			request.setAttribute("mauvais", request.getParameter("mauvais"));
			request.setAttribute("aucun", request.getParameter("aucun"));
			request.setAttribute("jour", request.getParameter("jour"));
			request.setAttribute("heure", request.getParameter("heure"));
			request.setAttribute("minute", request.getParameter("minute"));
			request.setAttribute("duree", request.getParameter("duree"));
			request.setAttribute("tentative", request.getParameter("tentative"));
			request.setAttribute("indicative", request.getParameter("indicative"));
			request.setAttribute("title", request.getParameter("title"));
		}
		%>
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-info alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4><i class="icon fa fa-info-circle"></i> Créez votre épreuve à votre convenance</h4>
	         	</div>
			</div>
		</div>
		<a href="../cours/complement/sample-asciimath.html" target="_blank"  id="help">Syntaxe des formules</a>
		<form action="Evaluational.jsp" method="POST" accept-charset="utf-8" onsubmit="return verifForm(this)">
				<input type="hidden" name="title" value="<%=request.getParameter("title") %> "/>
			<label id="entete">	COMPOSITION D'UNE EPREUVE </label><br><br>
			<input class="titre  form-control" type="text" required="required" name="titre" value="${titre}" placeholder="Titre de l'épreuve (exp: exam, ...)" size="80" maxlength="100"/>
			<br><br><p>	
			<div class="row">
				<label class="col-md-2"><i>Points de réponse:</i></label>
				<input type="hidden" name="update" value="false"/>
				<input type="text" class="point col-md-3" placeholder="bonne reponse" name="juste"  required="required" value="${juste }"  onblur="verifNumber2(this)"/>
				<input type="text" class="point col-md-3" placeholder="mauvaise reponse" name="mauvais" required="required" value="${mauvais }"  onblur="verifNumber2(this)"/>
				<input type="text" class="point col-md-3" placeholder="aucune reponse" name="aucun" required="required" value="${aucun}"  onblur="verifNumber2(this)"/>
			
			</div>
				<br><p>	
			<div class="row">
				<label class="col-md-2"><i>Disponibilité:</i></label>
				<input type="number" class="point col-md-3" placeholder="jour" name="jour" required="required" value="${jour }"  onblur="verifNumber(this)"/>
				<input type="number" class="point col-md-3" placeholder="heure" name="heure" required="required" value="${heure }"  onblur="verifNumber(this)"/>
				<input type="number" class="point col-md-3" placeholder="minute" name="minute" required="required" value="${minute }"  onblur="verifNumber2(this)"/>
			</div>
		<br><p>	
			<div class="row">
				<div class="col-xs-6">
						<label for="duree"><i>Durée de l'épreuve:</i></label>
						<input type="number" id="duree" class="point" value="${duree }" name="duree" required="required" onblur="verifNumber(this)"/>
						<label for="duree">h</label>
					</div>
					<div>
						<label for="tentative" class="col-md-2"><i>Nombre de tentatives:</i></label>
						<input type="number" id="tentative" class="point col-md-3" value="${tentative }" name="tentative" required="required" onblur="verifNumber(this)"/>					
					</div>
			</div>
			<br><br><p>
			<textarea rows="3" cols="160" class="enonce  form-control" name="indicative" placeholder="les indicatives de l'épreuve">${indicative }</textarea>
		
			<jsp:setProperty name="question" property="titre" value="${titre}"/>
			<jsp:setProperty name="question" property="indicative" value="${indicative}"/>
			<jsp:setProperty name="question" property="matiere" value="${title}"/>
			
			<fieldset id="epreuve" class="main-login main-center">
				<%
				if(request.getParameter("update")!=null && request.getParameter("update").equalsIgnoreCase("true")){
					String string = Remplissage.Objet(question);
					out.println(string);
				}else{
					int idEpreuve,idExercice,idQuestion=0;
						question.getExercice().clear();
						Remplissage rempli = new Remplissage(request);
						ArrayList<Question> array = new ArrayList<Question>();
						ExerciceEntier exercice;
						Question questionExercice;
						
						question.setPoint(new Point(Float.parseFloat(request.getParameter("juste")),Float.parseFloat(request.getParameter("mauvais")),
								Float.parseFloat(request.getParameter("aucun"))));
						question.setDuree(new Duree(Integer.parseInt((String)request.getAttribute("jour")),
								Integer.parseInt((String)request.getAttribute("heure")),
								Integer.parseInt((String)request.getAttribute("minute")),
								Integer.parseInt((String)request.getAttribute("duree")),
								Integer.parseInt((String)request.getAttribute("tentative"))));
						idEpreuve = TestHibernate.EnregistrerEpreuve(question);
						int i,resultat,j=-1;
						float note=0;
							for(i=1;i<=rempli.getNombre().getNombreExercice().size();i++){
								out.println(rempli.repeteurExercice(i));
								exercice=new ExerciceEntier();
								exercice.setExercice(new EnonceExercice((String)request.getParameter("exercice"+i),
										(String)request.getParameter("enonce"+i)));
								exercice.setIdEpreuve(idEpreuve);
								idExercice = TestHibernate.EnregistrerExercice(exercice);
									for(j=1;j<=rempli.getNombre().getNombreExercice().get(i-1);j++){
										resultat=0;
										note+=Float.parseFloat(request.getParameter("juste"));
										if(request.getParameter("proposition"+i+j)!=null)
											resultat=Integer.parseInt((String)request.getParameter("proposition"+i+j));
										out.println(rempli.repeteurQuestion(i, j,resultat));
										questionExercice = new Question();
										questionExercice.setIdEpreuve(idEpreuve);
										questionExercice.setIdExercice(idExercice);
										questionExercice.setReponse(resultat);
										questionExercice.setQuestion((String)request.getParameter("question"+i+j));
										questionExercice.setProposition(new Proposition((String)request.getParameter("propositionText"+i+j+"1"),
												(String)request.getParameter("propositionText"+i+j+"2"),
												(String)request.getParameter("propositionText"+i+j+"3"),
												(String)request.getParameter("propositionText"+i+j+"4")));
										questionExercice.setReponse(resultat);
										idQuestion = TestHibernate.EnregistrerQuestion(questionExercice);							
										array.add(questionExercice);
									}
								exercice.setQuestion((ArrayList<Question>)array.clone());
								out.println("</div>");
								question.getExercice().add(exercice);
								array.clear();
								if(idEpreuve!=0)TestHibernate.setReussite(true);
							}
							java.sql.Timestamp time = new java.sql.Timestamp(new Timestamp().getDateTime());
							time.setDate(time.getDate()+Integer.parseInt((String)request.getAttribute("jour")));
							time.setHours(time.getHours()+Integer.parseInt((String)request.getAttribute("heure")));
							time.setMinutes(time.getMinutes()+Integer.parseInt((String)request.getAttribute("minute")));
							Examen.Inserer((String)request.getAttribute("title"), (String)request.getAttribute("titre"),
									time.toString(),(String)request.getAttribute("duree"),
									(String)request.getParameter("tentative"),note+"");
			}
			int i=question.getExercice().size();
			int j=question.getExercice().get(question.getExercice().size()-1).getQuestion().size();
			%>		
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
					<button class="btn btn-lg btn-warning" type="button" onclick="exercice('<%= i %>','<%= j %>')">Ajouter un exercice</button>
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
		<br><br>
		<br><br>
				
		<form action="../EpreuveFinal.jsp" method="post">
			<input type="hidden" name="juste" value="${juste }"/>
			<input type="hidden" name="mauvais" value="${mauvais }"/>
			<input type="hidden" name="aucun" value="${aucun}"/>
			<input type="hidden" name="titre" value="${titre }"/>
			<input type="hidden" name="title" value="${title}"/>
			<input type="hidden" name="tentative" value="${tentative}"/>
			<input type="hidden" name="status" value="en"/>
			<div class="row">
				<div class="col-md-4">
					<a type="submit" href="liste.jsp?title=<%=request.getParameter("title") %>" class="btn btn-lg retour btn-danger login-button"> <-- Retour</a>
			 	</div>				 	
				<div class="col-md-4">
				</div>
			  <div class="col-md-4">
				<button type="submit" class="btn btn-lg btn-success login-button">Voir l'épreuve --></button>
			  </div>	
		  </div> 
		</form>
		<br><br>
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
<%if(request.getParameter("update").equalsIgnoreCase("true")){%>
	$().toastmessage('showSuccessToast','Votre épreuve a été chargé avec succes!');	
<%}else{%>
	<%if(TestHibernate.isReussite()){
	TestHibernate.setReussite(false);
	%>
		$().toastmessage('showSuccessToast','Votre épreuve a été créé avec succes!');
	<%}%>
<%}%>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
	function decodage(){
		var arrays = $('textarea');
		var exercice = $('.exercice');
		
		$('.titre').val(unescape($('.titre').val()));
		
		//On déchiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		arrays.each(function(){
			$(this).val(unescape($(this).val()));
		});
		exercice.each(function(){
			$(this).val(unescape($(this).val()));
		});
	}

	window.onload = decodage();
</script> 
</body>

</html>
<%} %>
