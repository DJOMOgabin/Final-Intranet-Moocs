
<%@page import="controlleur.Upload"%>
<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/courMoocs.jspf" %>

<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<<<<<<< HEAD
<%@ page import = "java.util.ArrayList, Modele.Cours,controlleur.Lecture, Modele.constante, Modele.Devoirs, Modele.DevoirsEtudiant, forum.OutilsChaine, Modele.User" %>
=======
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante, Modele.Devoirs, Modele.DevoirsEtudiant, forum.OutilsChaine, Modele.User" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
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
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
 
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<<<<<<< HEAD
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<%
		Cours cours = courMoocs;
=======
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

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
<%
	if(request.getParameter("title")!=null || request.getAttribute("title")!=null){
		
		String title = request.getParameter("title");
		Upload.setToast(false);
		if(title==null){
			title=(String)request.getAttribute("title");
			Upload.setToast(true);
		}
		Cours cours = new Cours(); 
		cours.setTitreCours(title);
		courMoocs.setTitreCours(title);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
%>
<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="entete_e.jsp" %>      
      <section class="content">
<<<<<<< HEAD
		<div class="row">
	      	<div class="col-md-6 col-sm-6 col-xs-6">
	      		<a href="upload.jsp?title=<%=request.getParameter("title")%>"  class="btn btn-info btn-block btn-flat" id="upload"> Envoyer un nouveau devoir  <i class="fa fa-book"></i> <i class="fa fa-plus-circle"></i></a>
	      	</div>
      	</div>
      	<br><br>
      	<div class="row">
					<div class="col-xs-12">
						<div class="alert alert-info alert-dismissible">
							<h4>
								<i class="icon fa fa-info-circle"></i> LISTE DES DEVOIRS ENVOYES DANS LE COURS <b><%=request.getParameter("title")%></b>.
							</h4>
						</div>
					</div>
				</div>
      	<br><br>	
		<%if(request.getParameter("del").equals("true")){ 
					Devoirs.EffacerDevoir(request.getParameter("title"),false);
		}%>
		<%DevoirsEtudiant devoirsEtudiant = new DevoirsEtudiant(request.getParameter("title"), userMooc.getId()); %>
		<%userMooc.setDevoirEtudiant(devoirsEtudiant); %>
		<%if(devoirsEtudiant.getDevoirs().size()!=0){%>		
			<div class="row">
	           	<div class="col-xs-12">
		           	<div class="box box-info">
						<div class="box-header">
				           		<h3 class="box-title"> <b>LISTE DES DEVOIRS ENVOYES</b> </h3>
				        </div>							
						<div class="box-body">
			            		<table id="devoirs" class="table table-bordered table-hover">
			            			<%OutilsChaine outil = new OutilsChaine(); %>
				            			<thead>
				            				<tr>
				            					<th> <center>#</center> </th>
				            					<th> <center>TITRE </center></th>
				            					<th> <center>DATE D'ENVOI</center> </th>
				            					<th> <center> VUE PAR LE PROF</center></th>
				            					<th> <center>TELECHARGER</center> </th>
				            					<th> <center>NOTE / 20</center> </th>
				            				</tr>
				            			</thead>
			            				<tbody>
			        					<%for (int i=0;i<devoirsEtudiant.getDevoirs().size();i++){%>
			            				<tr>
			            					<td> <center><%=(i+1)%></center></td>
			            					<td> <center> <%=devoirsEtudiant.getDevoirs().get(i) %></center></td>
			            					<td> <center> <%=devoirsEtudiant.getDate().get(i) %></center></td>
			            					<td> 
			            						<center>
			            							<%if(devoirsEtudiant.getVue().get(i).equalsIgnoreCase("true")){ %>
			            								<span style="color:#008000" class="glyphicon glyphicon-ok center .fa-2x" aria-hidden="true"></span>
			            							<%}else{ %>
			            								<span style="color:#FF0000" class="glyphicon glyphicon-remove center .fa-2x" aria-hidden="true"></span>
			            							<%}%>
			            						</center>
			            					</td>
			            					<td>
			            						<center>
			            							<span class="">
			            								<a href="cours/Devoirs/<%=devoirsEtudiant.getLienDevoir().get(i)%>" target="_blank" 
			            								download="Devoir N°<%=(i+1)%> de <%=request.getParameter("title")%> <%=Lecture.LireExtension(devoirsEtudiant.getLienDevoir().get(i))%>" 
			            								style="margin-right:2px;" title="Télécharger" type="button" class="btn btn-flat btn-success">
			            									<i class="fa fa-huge fa-download"></i>
			            								</a>
			            							</span>
			            						</center>
			            					</td>
			            					<td> <center><%=devoirsEtudiant.getNote().get(i)%></center></td>
			            				</tr>
			            			<%}%>
			            			</tbody>
			            		</table>
            				</div>
	            		</div>
	            	</div>
			        <br><br>	
					<div class="row">
						 <div class="col-md-4"></div>
						 <div class="col-md-4"></div>
						 <div class="col-md-4">
						 	<a type="button" class="btn btn-warning btn-flat" 
							 	onclick="vider(escape('<%=request.getParameter("title")%>'))" href="#"> 
								 	Tout Effacer &nbsp;&nbsp;<i class="fa fa-times"></i></a>   
						 </div>				
					</div>
	            </div>
			<br><br>			
			<%}else{ %>
			<br><br>
			<br><br>
			<br><br>
			<div class="row" >
				<div class="col-xs-4"></div>
				<div class="col-xs-4">
					<p><strong><i> Il y'a aucun devoir disponible!</i></strong> </p>
				</div>				
				<div class="col-xs-4"></div>
			</div>
			<%} %>
=======
      
		<%Devoirs.EffacerDevoir(request.getParameter("title"),false);%>
		
		<div class="row">
      	<div class="col-md-6 col-sm-6 col-xs-6">
      		<a href="upload.jsp?title=<%=request.getParameter("title")%>"  class="btn btn-info btn-block btn-flat" id="upload"> Envoyer un nouveau devoir  <i class="fa fa-book"></i> <i class="fa fa-plus-circle"></i></a>
      	</div>
      </div>
		
		<%DevoirsEtudiant devoirsEtudiant = new DevoirsEtudiant(request.getParameter("title"), userMooc.getId()); %>
		<%System.out.println("nomCours LesDevoirs= " + request.getParameter("title")); %>
		<%User.setDevoirEtudiant(devoirsEtudiant); %>
		<%if(devoirsEtudiant.getDevoirs().size()!=0){ %>
		
		<div class="row">
           	<div class="col-xs-12">
           	<div class="box box-info">
           	<div class="box-header">
			<div class="box-header">
            		<h3 class="box-title"> <b>LISTE DES DEVOIRS ENVOYES</b> </h3>
            </div>
						
			<div class="box-body">
            		<table id="devoirs" class="table table-bordered table-hover">
            			<%OutilsChaine outil = new OutilsChaine(); %>
	            			<thead>
	            				<tr>
	            					<th> <center>#</center> </th>
	            					<th> <center>TITRE </center></th>
	            					<th> <center>DATE D'ENVOI</center> </th>
	            					<th> <center> VUE </center></th>
	            					<th> <center>TELECHARGER</center> </th>
	            				</tr>
	            			</thead>
            				<tbody>
        					<%for (int i=0;i<devoirsEtudiant.getDevoirs().size();i++){%>
            				<tr>
            					<td> <center><%=(i+1)%></center></td>
            					<td> <center> <%=devoirsEtudiant.getDevoirs().get(i) %></center></td>
            					<td> <center> <%=devoirsEtudiant.getDate().get(i) %></center></td>
            					<td> 
            						<center>
            							<%if(devoirsEtudiant.getVue().get(i).equalsIgnoreCase("true")){ %>
            								<span style="color:#008000" class="glyphicon glyphicon-ok center .fa-2x" aria-hidden="true"></span>
            							<%} else{ %>
            								<span style="color:#FF0000" class="glyphicon glyphicon-remove center .fa-2x" aria-hidden="true"></span>
            							<%} %>
            						</center>
            					</td>
            					<td>
            						<center>
            							<span class="">
            								<%
            									String chemin = devoirsEtudiant.getLienDevoir().get(i);
            									System.out.println("Chemin Final = " + chemin);
            									
            									String cheminSeul = chemin.substring(chemin.lastIndexOf('/')+1).substring(chemin.lastIndexOf('\\')+1);;
            									System.out.println("Chemin Final Substring= " + cheminSeul);
            									
            									String cheminMeme = chemin.substring(0, chemin.lastIndexOf('/')+1);
            									System.out.println("cheminMeme= " + cheminMeme);
            								%>
            								<a href="<%=chemin %>" target="_blank" download="<%=cheminSeul %>" style="margin-right:2px;" title="Télécharger" type="button" class="btn btn-flat btn-success">
            									<i class="fa fa-huge fa-download"></i>
            								</a>
            							</span>
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
            	</div>
		<br><br>
		
		<div class="row" >
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
			</div>
			<%}else{ %>
			<div class="col-xs-4">
				<p><strong><i> Il y'a aucun devoir disponible!</i></strong> </p>
			</div>
			<div class="col-xs-4">
			</div>
			<%} %>
		</div>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		<br><br>
    
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
<<<<<<< HEAD
<%if(request.getParameter("char")!=null && request.getParameter("char").length()>0){%>
$().toastmessage('showSuccessToast','Votre devoir a été soumis avec success!');
<%}%>
=======
	$().toastmessage('showSuccessToast','Votre devoir a été soumis avec success!');
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ...</a>',
	  lessLink: '<a href="#">Retirer</a>'
	});
<<<<<<< HEAD
	
=======
</script>

<script>

<%int ok = 0;%>
<%if(ok == 0 && request.getParameter("supp")!=null && request.getParameter("supp").length()>0){ %>
$().toastmessage('showSuccessToast', "Cours bloqué avec succès.");
<%ok=1;} %><%if(ok == 0 && request.getParameter("ouv")!=null && request.getParameter("ouv").length()>0){ %>
$().toastmessage('showSuccessToast', "Cours ouvert avec succès.");
<%ok=1;} %>

	$('#apropos').click(function(){

		alert('On affiche apropos');

	});

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	$('#devoirs').DataTable({

		 "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "responsive" : true

	});
<<<<<<< HEAD

	function vider(cours){
		cours=unescape(cours);
		var des = confirm('Voulez-vous vraiment supprimer les devoirs du cours '+cours+' ? '); 
		if(des == true){
			window.location.href="les_devoirs.jsp?title="+cours+"&del=true";
		}			
	}
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
</script>

</body>

</html>
<%} %>
<<<<<<< HEAD
<%//} %>
=======
<%} %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
