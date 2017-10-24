<%if(session.getAttribute("user")==null){%><jsp:forward
	page="home.jsp?page=index.jsp" />
<%}else{ %>
<%@ include file="WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file="WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file="WEB-INF/jspf/bean/courMoocs.jspf"%>

<%@ include file="WEB-INF/jspf/bean/connecteurforum.jspf"%>
<%@ page
	import="java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Devoirs"%>
<!DOCTYPE html>
<html lang="en">
<%
	if(request.getParameter("title")!=null){
		
		String title = request.getParameter("title");
		Cours cours = new Cours(); 
		cours.setTitreCours(title);
		courMoocs.setTitreCours(title);
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>INTRANET MOOCs| Etudiant</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link href="http://vjs.zencdn.net/5.2.2/video-js.css" rel="stylesheet">
<link rel="stylesheet"
	href="plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- If you'd like to support IE8 -->

<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="entete_e.jsp"%>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible">
					<h4>
						<i class="icon fa fa-info-circle"></i> Liste des devoirs envoyés
					</h4>
				</div>
			</div>
		</div>
		<%if(request.getParameter("del").equals("true")){ 
		Devoirs.EffacerDevoir(request.getParameter("title"),false);
		}
		%>

		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<a href="ajoutdevoir.jsp" class="btn btn-info btn-block btn-flat">
					Envoyer un nouveau devoir <i class="fa fa-book"></i> <i
					class="fa fa-plus-circle"></i>
				</a>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
				<a href="listeEtd.jsp" class="btn btn-success btn-block btn-flat">
					Liste de mes &eacute;tudiants <i class="fa fa-table"></i>
				</a>
			</div>
		</div>

		<%Devoirs devoir = new Devoirs(request.getParameter("title"),true,false);%>
		<%for (int i=0;i<devoir.getList().size();i++){%>
		<div class="btn btn-block" id="block1">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible ">
					<div>
						<strong><%=devoir.getList().get(i).getDevoir() %></strong>
					</div>
					<div class="col-xs-3"></div>
					<div class="col-xs-3"></div>
					<div class="col-xs-3"></div>
					<div class="col-xs-3">
						<a href="#"><small>View</small> </a>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<br>
		<br>
		<br> <br>
		<br>


		<div class="row">
			<div class="col-xs-4"></div>
			<%if(devoir.getList().size()!=0){ %>
			<div class="col-xs-4"></div>
			<div class="col-xs-4">
				<a type="button" id="vider" class="evaluation btn btn-info btn-flat"
					onClick="vider('<%= request.getParameter("title") %>')"> Vider
					la liste <i class="fa fa-drop"></i>
				</a>
			</div>
			<%}else{ %>
			<div class="col-xs-4">
				<p>
					<strong><i> Il y'a aucun devoir disponible!</i></strong>
				</p>
			</div>
			<div class="col-xs-4"></div>
			<%} %>
		</div>
		<br>
		<br>
	</section>

	</section>
	</div>


	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0
		</div>
		<strong>Copyright &copy; 2015-2016 <a href="#apropos">INTRANET
				MOOCs</a>.
		</strong> All rights reserved.
	</footer>
	</div>

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
	<script type="text/javascript"
		src="http://platform.twitter.com/widgets.js"></script>

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

</script>

</body>

</html>
<%} %>
<%} %>
