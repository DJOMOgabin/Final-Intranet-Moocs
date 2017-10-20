
<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/courMoocs.jspf" %>

<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<%@ page import = "java.util.ArrayList,controlleur.Upload, Modele.Cours, Modele.constante,Modele.Devoirs, Modele.DevoirsEtudiant" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Etudiant </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link href="http://vjs.zencdn.net/5.2.2/video-js.css" rel="stylesheet">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- If you'd like to support IE8 -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<%
	String title = request.getParameter("title");
	Cours cours = new Cours(); 
	cours.setTitreCours(title);
	courMoocs.setTitreCours(title);
	// onsubmit="nom()"
%>
<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="entete_e.jsp" %>
	<%DevoirsEtudiant devoirsEtudiant = new DevoirsEtudiant(request.getParameter("title"), userMooc.getMatricule()); %>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible">
					<h4><i class="icon fa fa-info-circle"></i> Nouveau devoir  <i class="fa fa-book"></i> </h4>
					Veuillez remplir les informations sur le devoir , puis cliquez sur <b> Envoyer </b>
         		</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-info">
				
					<!-- FORMULAIRE -->
					<form id="newcourse" action="uploadDevoir.jsp?title=<%=title%>" method="post" 
					class="form-horizontal" enctype="multipart/form-data" onsubmit="return nom(escape('<%=title%>'))">
						<div class="box-body">
							<div class="form-group">
								<label for="titre" class="col-sm-2 control-label">TITRE DU DEVOIR</label>
								<div class="col-sm-3">
									<input type="text" formmethod="get" autofocus required onkeypress="" 
									class="form-control" id="titre" placeholder="TITRE DU DEVOIR ... ">
									<span class="succes"></span>
                  				</div>
               					<label for="fichier" class="col-sm-2 control-label">Sélectionner Fichier</label>
               					<div class="col-sm-3">
                    				<input type="file" <%@include file="Enseignant/acceptFichier.jsp" %> required class="form-control" name="fichier"/>
                  				</div>
                  			</div>
				  		</div>           
                  		<div class="form-group">
                  			<div class="col-sm-3">
                	 		 </div>
         	 				<div class="col-sm-2" id="send_button">
                 	  			<button type="submit" class="btn btn-block btn-info" id="soumettre"> ENVOYER &nbsp;&nbsp;<i class="fa fa-upload" id="go"></i> <i class="fa fa-spinner fa-spin" id="none"></i></button>
							</div>
                 		 </div>
                 	</form>	
               	</div>
            </div>
		</section>	
    <%@include file="footer.jsp" %>  

<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="dist/js/readmore.js"></script>
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
    
<script>
$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ...</a>',
	  lessLink: '<a href="#">Retirer</a>'
	});
$("#none").hide();
$("#newcourse").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
	function nom(title){
	    var title = unescape(title);
	    $("#newcourse").attr("action","uploadDevoir.jsp?title="+title+"&titre="+$("#titre").val());
	    return true;
	}
</script>

</body>

</html>
<%} %>
