<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Enseignant</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
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
     <section class="content">
				
		<div class="row">
		
			<div class="col-xs-12">
			
				<div class="box box-info">
				
					<div class="box-header with-border">
						<h3 class="box-title"> <i class="fa fa-users"></i><b> LISTE  DES ETUDIANTS INCRITS A MES COURS </b> </h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered table-hover table-striped" id="etudiant">
            		
            			<thead>
            				<tr>
            					<th> <center>#</center> </th>
            					<th> <center>TITRE DU COURS</center></th>
            					<th> <center>CONSULTER</center> </th>
            					
            				</tr>
            			</thead>
            			<tbody>
            				<%ArrayList<String> listCours = teacher.getListeCours();Cours c = new Cours();int compteur = 0;  %>
            					<%for(String cours: listCours){ %>
            						<tr>
            							<td><center><%=++compteur%></center></td>
            							<td><center><%=cours.toUpperCase()%></center></td>
            							<td><center><a href="impStd.jsp?title=<%=cours%>" class="btn btn-block btn-flat btn-success"> Consulter liste des inscrits </a></center></td>
            						</tr>
            					<%} %>
            			
            			</tbody>
            			
            		</table>
					</div>
				</div>
			
			</div>
		
		</div>
		
	
    <%@include file="../footer.jsp" %>
    

<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>


<!-- Bootstrap 3.3.5 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
 <script src="../js/jspdf.js"></script>
<script src="../js/FileSaver.js"></script>
<script src="../js/zlib.js"></script>
<script src="../js/png.js"></script>
<script src="../js/jspdf.plugin.addimage.js"></script>
<script src="../js/jspdf.plugin.png_support.js"></script>
<script src="../js/jspdf.plugin.autotable.js"></script>
<script src="../js/jspdf.plugin.standard_fonts_metrics.js"></script>
<script src="../js/jspdf.plugin.split_text_to_size.js"></script>

<script src="../js/base64.js"></script>
<script src="../js/sprintf.js"></script>
<script src="../js/html2canvas.js"></script>
<script src="../js/ace.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="../plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<script>

	$('#apropos').click(function(){

		alert('On affiche apropos');

	});
	$('#etudiant').DataTable({

		 "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "responsive" : true
	});

</script>
    
</body>

</html>
<%} %>
