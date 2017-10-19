<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
<!DOCTYPE html>
<html lang="en">
<head>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete2.jsp" %>
  		    <%Cours c = new Cours(); %>
			<%if(request.getParameter("title")==null){ %>
			<%c.setTitreCours(courMoocs.getTitreCours()); %>
			<%}else{ %>
			<%courMoocs.setTitreCours(request.getParameter("title")); %>
			<%c = new Cours(); c.setTitreCours(new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8")); %>
			<%}%>
	<section class="content">
	
		<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info-circle"></i> Ajouter des compl&eacute;ments pour la vid&eacute;o suivante   </h4>
              	 S&eacute;lectionnez les compl&eacute;ments  à ajouter à la vid&eacute;o suivante  et cliquez sur <b>Soumettre</b>.<br/>Vous pouvez s&eacute;lectionnez plusieurs fichiers à la fois en maintenant la touche <b> Ctrl </b>.
         </div>
		</div>
		</div>
		<div class="row">
			<div class="col-xs-6">
     				<div class="embed-responsive embed-responsive-16by9">
     					<iframe class="embed-responsive-item" src="../cours/video/<%=request.getParameter("video")%>" controls autoplay="false" frameborder="0" allowfullscreen></iframe>
     				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="box box-info">
					<div class="box-body">
					<form method="post" id="ajoutComplement" action="tempon.jsp?video=<%=request.getParameter("video")%>&title=<%=request.getParameter("title")%>" class="live form-horizontal" enctype="multipart/form-data">
						<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">  </label>
							<div class="col-xs-6">
 								<input type="file" <%@ include file="acceptFichier.jsp" %> multiple  class="form-control" value="Uploader compléments" name="complement1" required/>
 							</div>
						</div>
						<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">  </label>
							<div class="col-xs-6">
 								<input type="file" <%@ include file="acceptFichier.jsp" %> multiple  class="form-control" value="Uploader compléments" name="complement2" />
 							</div>
						</div>
						<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">  </label>
							<div class="col-xs-6">
 								<input type="file" <%@ include file="acceptFichier.jsp" %> multiple  class="form-control" value="Uploader compléments" name="complement3" />
 							</div>
						</div>
						<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">  </label>
							<div class="col-xs-6">
 								<input type="file" <%@ include file="acceptFichier.jsp" %> multiple  class="form-control" value="Uploader compléments" name="complement4" />
 							</div>
						</div>
						<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">  </label>
							<div class="col-xs-6">
 								<input type="file" <%@ include file="acceptFichier.jsp" %> multiple  class="form-control" value="Uploader compléments" name="complement5" />
 							</div>
						</div>
						<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">  </label>
 								<div class="col-xs-6">
									<button id="soumettre"  class="btn btn-flat btn-block btn-success"> Soumettre  <i class="fa fa-upload" id="go"></i><i class="fa fa-spinner fa-spin" id="none"></i></button>				
 								</div>
 				
 						</div>
					</form>
					</div>
					</div>
			</div>
		
		</div>
	
	
    <%@include file="../footer.jsp" %>
    

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
$("#ajoutComplement").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
</script> 
</body>

</html>
<%} %>
