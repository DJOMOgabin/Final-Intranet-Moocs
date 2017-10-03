<%if(session.getAttribute("user")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@page import="Controleur.EpreuveFinal,java.sql.Timestamp,java.sql.Time"%>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file = "/WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Point,
Modele.Examen,Hibernate.TestHibernate2, Modele.Devoirs, Modele.Epreuve,Hibernate.TestHibernate,
Hibernate.HibernateChargementCopie,Modele.CopieEtudiant,Hibernate.HibernateCopie,Modele.Reponse,Traitement.ReponseQuestion" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Enseignant</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="css/epreuve.css">
	  <!-- Bootstrap 3.3.5 -->
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<script type="text/javascript" src="js/real-time.js"></script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ page contentType="text/html; charset=UTF-8" %>
	<%@include file="entete_e.jsp" %>
	<section class="content-header">
		<%
		Epreuve epreuve = TestHibernate2.chargerEpreuve(request.getParameter("nom"), request.getParameter("title"));
		CopieEtudiant copie = HibernateChargementCopie.chargerCopie(epreuve.getTitre(), epreuve.getMatiere(), userMooc.getId()+"",true);
		request.setAttribute("aucun", epreuve.getPoint().getAucun());
		request.setAttribute("juste", epreuve.getPoint().getJuste());
		request.setAttribute("mauvais", epreuve.getPoint().getMauvais());
		request.setAttribute("title", epreuve.getMatiere());	
		request.setAttribute("titre", epreuve.getTitre());		
		request.setAttribute("id", copie.getIdEtudiant());	
		request.setAttribute("tentative", epreuve.getDuree().getTentative());
		copie.setTotalTentative(epreuve.getDuree().getTentative());
		double max=0;
		for(int i=0;i<epreuve.getExercice().size();i++)
			for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++)
				max+=epreuve.getPoint().getJuste();
		copie.setMax(max);
		double duree = epreuve.getDuree().getDuree()-copie.getDuree();
		 if(duree>0 && copie.reste()<0){
			 copie.setDuree(duree);
			 copie.setDate(new Timestamp(new com.sun.jmx.snmp.Timestamp().getDateTime()));
			 copie.setTime(new Time(new com.sun.jmx.snmp.Timestamp().getDateTime()));
			 copie.getTime().setHours(copie.getTime().getHours()-(int)copie.getDuree());
			 copie.getDate().setHours(copie.getDate().getHours()-(int)copie.getDuree());
			 copie.setNombreTentative(copie.getNombreTentative()-1);
			 copie.setDuree(epreuve.getDuree().getDuree());
			 HibernateCopie.EnregistrerCopie(copie);
		 }
		 copie.setDuree(epreuve.getDuree().getDuree());
		 copie.dispo();
		%>
			<form action="EpreuveFinal" method="POST">
				 <div class="row">
				 <input name="title" type="hidden" value="${title }" >
				 <input name="nom" type="hidden" value="${titre }" >
				 <input name="id" type="hidden" value="${id }" >
				 <input name="ancien" type="hidden" value="<%= copie.getNombreTentative()%>" >
				 	<label class="titre col-md-12"><strong>${titre}</strong> </label><br><p>
				 </div>
				<label class="comment"><small><i>bonne réponse ${juste} pt(s), mauvaise réponse  ${mauvais} pt(s),
				  aucune réponse  ${aucun} pt(s)</i></small> </label><br><p>
				 
				<div class="row">
					<div class="col-md-9">
						<label class="indicative"><small><i><u >Indication:</u> </i> <strong> <%= epreuve.getIndicative() %> </strong></small></label><br><p>
					</div>
					<div class="col-md-3" style="font-size: x-large">			
				 		<input name="temps" id="temps" type="hidden" value="" >
				 		<%if(copie.getNote()>copie.getMax()/2){ %>
							<span class="note" style="color: green">
						<%}else{ %>							
							<span class="note" style="color: red">
						<%} %>
								Note: <%=copie.getNote() %>/<%=max %>
							</span><br>
						<div class="note">Temps: <span id="date_heure" style=""></span></div><br>
						<span class="note" style="">Tentative: <%=copie.getNombreTentative() %> sur <%=copie.getTotalTentative() %></span>
			            <script type="text/javascript">
							window.onload = date_heure('date_heure','<%=copie.reste()%>',
									'<%=epreuve.getMatiere()%>');
						</script>
					</div>				
				</div>
				<br><p>
				<fieldset id="epreuve">
					<%
						String string = EpreuveFinal.remplissage(copie, epreuve);
						out.println(string);
						duree = epreuve.getDuree().getDuree()-copie.getDuree();
					%>
				</fieldset>
			<br><br>
			<br><br>
			<input type="hidden" name="juste" value="${juste }"/>
				<input type="hidden" name="mauvais" value="${mauvais }"/>
				<input type="hidden" name="aucun" value="${aucun}"/>
				<input type="hidden" name="title" value="${title}"/>
				<input type="hidden" name="tentative" value="${tentative}"/>
				<div class="row">
				<div class="col-md-2"></div>
					<div class="col-md-3"><a href="liste_e.jsp?title=${title }" 
					class="btn btn-lg btn-danger login-button"> Retour</a></div>				 	
					<div class="col-md-4"></div>
				  <div class="col-md-3">
					  <%if(copie.isPossible()){%>
						<button type="submit" class="btn btn-lg btn-success login-button">Soumettre</button>
					  <%} %>
				  </div>	
			  </div> 
			</form>
			<br><br>
	
    <%@include file="footer.jsp" %>
    
    <!-- jQuery -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="plugins/ckeditor/ckeditor.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="dist/js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.2.2/video.js"></script>
<script src="dist/js/readmore.js"></script>
<script src="bootstrap/js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="js/MathJax.js?config=AM_HTMLorMML-full"></script>
<script>
$().toastmessage('showSuccessToast','Votre copie a été chargée!');
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
	/*function decodage(){
		var arrays = $('label');
		
		//On déchiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		arrays.each(function(){
			$(this).text(unescape($(this).text()));
		});
	}
	window.onload = decodage();*/

    <%@include file="decodage.jsp" %>
</script> 
</body>

</html>
<%} %>
