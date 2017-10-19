<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "controlleur.TestMail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Felicitations</title>

	 <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
</head>

<body>


<!--  Presentation de la felicitations du fait qu'il a bien voulu s'inscrire à la plateforme  -->

<%
	if(request.getParameter("nom")==null)
	{
		%>
			<jsp:forward page="index.jsp"/>
		<% 
	}
%>

<div class="container">
<br/>
<div class="jumbotron">

	<h2> Bienvenue, <b><%=request.getParameter("nom")%></b> </h2>
	
	<p> F&eacute;licitations, vous vous êtes inscrit sur la plateforme de moocs en locale.  </p>
	<p> <b> Vous pourrez maintenant vous inscrire à des cours en local, accédez à des videos et aux exercices proposé par l'enseignant titulaire </b></p>
	<p> <b> Vos paramètres de connexions vous ont été transmis dans votre boîte email. </b></p>
	<br/>
	<br/>
	<p> <a class="btn btn-success btn-lg" href="newstd.jsp" role="button">  <span class="glyphicon glyphicon-home"></span> Demarrer </a></p>

</div>
</div>
            
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
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
<script src="dist/js/jquery.toastmessage.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="dist/js/readmore.js"></script>
<script src="js/jspdf.js"></script>
<script src="js/FileSaver.js"></script>
<script src="js/zlib.js"></script>
<script src="js/png.js"></script>
<script src="js/jspdf.plugin.addimage.js"></script>
<script src="js/jspdf.plugin.png_support.js"></script>
<script src="js/jspdf.plugin.autotable.js"></script>
<script src="js/jspdf.plugin.standard_fonts_metrics.js"></script>
<script src="js/jspdf.plugin.split_text_to_size.js"></script>

<script src="js/base64.js"></script>
<script src="js/sprintf.js"></script>
<script src="js/html2canvas.js"></script>
<script src="js/ace.js"></script>

</body>
</html>