<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante, forum.OutilsChaine" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
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
     <section class="content">
    	<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible">
					<h4>
						<i class="icon fa fa-info-circle"></i> LISTE DES COURS ET STATISTIQUES
				</div>
			</div>
		</div>
      
      <div class="row">
      	 <%if(request.getParameter("nouveau")!=null){%>
        	<br/><div class="row">
        	<div class="col-lg-9 col-md-6">
				<div class="alert  alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						Création du nouveau cours r&eacute;ussi.
				</div>
			</div>
			</div>
        <%} %>
         <%if(request.getParameter("semaine")!=null){%>
        	<br/><div class="row">
        	<div class="col-lg-9 col-md-6">
				<div class="alert  alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						Ajout du nombre de semaines r&eacute;ussi.
				</div>
			</div>
			</div>
        <%} %>
        <%if(request.getParameter("creer")!=null){%>
        	<br/><div class="row">
					<div class="col-lg-9 col-md-6">
				<div class="alert  alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						Création de l'enseignant r&eacute;ussi.
				</div>
				</div>
			</div>
        <%} %>
       
      </div>
      <br/>
        <div class="row">
            
            	
            	
            	<div class="col-xs-12">
            	<div class="box box-info">
            	<div class="box-header">
            		<h3 class="box-title"> <b>LISTE DE VOS COURS</b> </h3>
            	</div>
            	<div class="box-body">
            		<table id="courses" class="table table-bordered table-hover">
            		<%OutilsChaine outil = new OutilsChaine(); %>
            			<thead>
            				<tr>
            					<th> <center>#</center> </th>
            					<th> <center>COURS</center></th>
            					
            					<th> <center>STATISTIQUES</center> </th>
            					
            				</tr>
            			</thead>
            			<tbody>
           <%ArrayList<String> listCours = teacher.getListeCours();  Cours c = new Cours(); %>
           <%int nb= 0 ;  %>
        
            
            		<%for(int i = 0; i<listCours.size(); i++){ %>
            	<%c.setTitreCours(listCours.get(i));%>	
           	<% nb = teacher.getListeInscrit(c.getTitreCours()).size(); %>
            				<tr>
            					<td> <center><%=(i+1)%></center></td>
            					<td> <center><%=c.getTitreCours().toUpperCase() %></center></td>
            					<td> 
            						<center>
            							<a type="button" href="stats_e.jsp?title=<%=new OutilsChaine().convertirEnHTML(c.getTitreCours())%>" class="btn btn-block btn-info btn-flat">
            								VOIR STATISTIQUES <i class="fa fa-cogs"></i>
            							</a>
            						</center>
            					</td>
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
<script src="../dist/js/jquery.toastmessage.js"></script>
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
<!-- ChartJS 1.0.1 -->
<script src="../plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>

<script>


function supprime(nom)
{
		var supp = confirm('Voulez-vous vraiment fermer ce cours ?');
		if(supp==true)
		{
			window.location.href="delete.jsp?type=fcours&&cours="+nom;
		}
}

function ouvre(nom)
{
		var supp = confirm('Voulez-vous vraiment ouvrir  ce cours ?');
		if(supp==true)
		{
			window.location.href="delete.jsp?type=ocours&&cours="+nom;
		}
}
<%int ok = 0;%>
<%if(ok == 0 && request.getParameter("supp")!=null && request.getParameter("supp").length()>0){ %>
$().toastmessage('showSuccessToast', "Cours bloqué avec succès.");
<%ok=1;} %><%if(ok == 0 && request.getParameter("ouv")!=null && request.getParameter("ouv").length()>0){ %>
$().toastmessage('showSuccessToast', "Cours ouvert avec succès.");
<%ok=1;} %>

	$('#apropos').click(function(){

		alert('On affiche apropos');

	});

	$('#courses').DataTable({

		 "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "responsive" : true

	});
</script>
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
