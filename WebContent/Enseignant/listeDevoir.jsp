<<<<<<< HEAD
<%@page import="forum.LectEcriForum"%>
<%@page import="controlleur.Lecture"%>
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<%@page import="Modele.Examen"%>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward
	page="../home.jsp?page=index.jsp" />
<%}else{ %>
<<<<<<< HEAD
	<% String prefix,update;%>
    <%if(request.getParameter("admin")!=null & request.getParameter("admin").length()!=0){%>
		<%prefix="";%>    
	<%}else{%>
		<%prefix="../"; %>    
	<%}%>
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf"%>
<%@ page
	import="java.util.ArrayList, Modele.Cours,controlleur.Lecture, Modele.constante,
	Modele.Devoirs,forum.LectEcriForum, forum.OutilsChaine, Modele.DevoirsEtudiant"%>
=======
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file="/WEB-INF/jspf/bean/courMoocs.jspf"%>
<%@ page
	import="java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Devoirs, forum.OutilsChaine, Modele.DevoirsEtudiant"%>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>INTRANET MOOCs| Enseignant</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<<<<<<< HEAD
<link rel="stylesheet" href="<%=prefix%>dist/css/jquery.toastmessage.css" />
<link rel="stylesheet" href="<%=prefix%>bootstrap/css/bootstrap.min.css">
=======
<link rel="stylesheet" href="../dist/css/jquery.toastmessage.css" />
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
<<<<<<< HEAD
	href="<%=prefix%>plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="<%=prefix%>plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=prefix%>dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<%=prefix%>dist/css/skins/_all-skins.min.css">


	<link rel="stylesheet" href="<%=prefix%>dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="<%=prefix%>bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="<%=prefix%>plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link href="http://vjs.zencdn.net/5.2.2/video-js.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=prefix%>plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="<%=prefix%>dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<%=prefix%>dist/css/skins/_all-skins.min.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <%if(request.getParameter("admin")!=null & request.getParameter("admin").length()!=0){%>
		<%@ include file="../enteteAperçu.jsp"%>
	<%}else{ %>  
	<%@ include file="entete.jsp" %>
	<%} %>
     <section class="content">	
=======
	href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="../plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">


	<link rel="stylesheet" href="../dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link href="http://vjs.zencdn.net/5.2.2/video-js.css" rel="stylesheet">
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">	
	<%@ include file="entete.jsp" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="alert alert-info alert-dismissible">
							<h4>
								<i class="icon fa fa-info-circle"></i> LISTE DES DEVOIRS ENVOYES PAR <b>LES ETUDIANTS</b>.
<<<<<<< HEAD
							</h4>
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
						</div>
					</div>
				</div>
				<%if(request.getParameter("del").equals("true")){ 
<<<<<<< HEAD
					Devoirs.EffacerDevoir(request.getParameter("title"),true);
					}%>
=======
			System.out.print("un ");
		Devoirs.EffacerDevoir(request.getParameter("title"),true);
			System.out.print("peu");
		}
		%>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
			<%DevoirsEtudiant devoirsEtudiant = new DevoirsEtudiant();%>
			<%devoirsEtudiant.devoirsEnseignant(courMoocs.getId()); %>
			<%if(devoirsEtudiant.getDevoirs().size() != 0) {%>	
			
<<<<<<< HEAD
 <div class="row">
   <div class="col-xs-12">
     <div class="box box-info">
        <div class="box-header">
			<div class="box-header">
            		<h3 class="box-title"> <b>LISTE DES DEVOIRS ENVOYES</b> </h3>
            		<%if(request.getParameter("admin").length()==0){ %>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="pull-right"><button class="btn alert-info" 
						disabled id="no">No Apply</button></div>	
						<div class="pull-right"><button class="btn alert-warning" 
						id="apply">Apply Change</button></div>		
					<%}%>
            </div>	
			<div class="box-body">
				<table id="devoirs" class="table table-bordered table-hover">
        			<%OutilsChaine outil = new OutilsChaine();%>
=======
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
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	            			<thead>
	            				<tr>
	            					<th> <center>#</center> </th>
	            					<th> <center>MATRICULE </center></th>
	            					<th> <center>NOM </center></th>
	            					<th> <center>TITRE </center></th>
	            					<th> <center>DATE D'ENVOI</center> </th>
<<<<<<< HEAD
	            					<th> <center>DEJA VUE </center></th>
	            					<th> <center>TELECHARGER</center> </th>
									<th> <center>NOTE / 20</center> </th>
=======
	            					<th> <center> VUE </center></th>
	            					<th> <center>TELECHARGER</center> </th>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	            				</tr>
	            			</thead>
            				<tbody>
        					<%for(int i=0; i<devoirsEtudiant.getDevoirs().size(); i++) {%>
<<<<<<< HEAD
            				<tr class="ligne">
            					<td> <center><%=(i+1)%></center></td>
=======
            				<tr id="ligne" data-note="<%=devoirsEtudiant.getNote().get(i) %>" data-note="">
            				
            					<td> <center><%=i+1 %></center></td>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
            					<td> <center><%=devoirsEtudiant.getMatricules().get(i) %></center></td>
            					<td> <center><%=devoirsEtudiant.getEtudiants().get(i) %></center></td>
            					<td> <center><%=devoirsEtudiant.getDevoirs().get(i) %> </center></td>
            					<td> <center><%=devoirsEtudiant.getDate().get(i) %></center></td>
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
<<<<<<< HEAD
            						<%if(prefix.equals("../"))devoirsEtudiant.updateVue(devoirsEtudiant.getIdDevoirs().get(i),"true");%>
            							<a href="<%=prefix%>cours/Devoirs/<%=devoirsEtudiant.getLienDevoir().get(i)%>" 
            							target="_blank" download="Devoir N°<%=(i+1)%> de <%=devoirsEtudiant.getEtudiants().get(i)%> de <%=request.getParameter("title")%><%=Lecture.LireExtension(devoirsEtudiant.getLienDevoir().get(i))%>" 
            							style="margin-right:2px;" title="Télécharger" type="button" class="btn btn-flat btn-success download_e">
            									<i class="fa fa-huge fa-download"></i>
            								</a>
            						</center>
            					</td>   
            					<!-- Quand on est enseignant -->         					
            					<%if(prefix.equals("../")){%>
	            					<!-- Si pas encore noté -->         					
	            					<%if(devoirsEtudiant.getNote().get(i).equals("No Note")){%>
	            					<td data-devoir="<%=devoirsEtudiant.getLienDevoir().get(i)%>"> 
	            						<center><input onkeyup="apply()" type="text" placeholder="<%=devoirsEtudiant.getNote().get(i)%>"></center>
	            					</td>
	            					<%}else{%>
	            					<td data-devoir="<%=devoirsEtudiant.getLienDevoir().get(i)%>"> 
	            						<center><input onkeyup="apply()" type="text" placeholder="<%=devoirsEtudiant.getNote().get(i)%>" value="<%=devoirsEtudiant.getNote().get(i)%>"></center>
	            					</td>
	            					<%}%>
            					<%}else{%>
            					<!-- Quand on est admin et qu'on inspecte le surveillant -->
            					<td> <center><%=devoirsEtudiant.getNote().get(i)%></center></td>            					
            					<%}%> 
            				</tr>
            				<%}%>            				
            			</tbody>
            		</table>
            	</div>
            </div>				
          </div>
       </div>
		<%if(request.getParameter("admin").length()==0){ %>
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
		<%}%>
    </div>
	<%}else{ %>
		<br><br>
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
	<%}%>
	<br><br>
    <%@include file="../footer.jsp" %>
    

<script src="<%=prefix%>plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="<%=prefix%>dist/js/readmore.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="<%=prefix%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=prefix%>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=prefix%>plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=prefix%>plugins/ckeditor/ckeditor.js"></script>
<!-- FastClick -->
<script src="<%=prefix%>plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=prefix%>dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="<%=prefix%>dist/js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

<script src="<%=prefix%>plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="<%=prefix%>plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=prefix%>plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="<%=prefix%>plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="<%=prefix%>plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=prefix%>dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=prefix%>dist/js/demo.js"></script>

  <script src="<%=prefix%>dist/js/videojs-ie8.min.js"></script>
  <script src="<%=prefix%>dist/js/video.js"></script>
<script >
<%@include file="chemin.jsp" %>
=======
            							<%
           									String chemin = devoirsEtudiant.getLienDevoir().get(i);
            								chemin = "../" + chemin;
           									System.out.println("Chemin Final = " + chemin);
           									
           									String cheminSeul = chemin.substring(chemin.lastIndexOf('/')+1).substring(chemin.lastIndexOf('\\')+1);
           				
           									System.out.println("Chemin Final Substring= " + cheminSeul);
           									
           									String cheminMeme = chemin.substring(0, chemin.lastIndexOf('/')+1);
           									System.out.println("cheminMeme= " + cheminMeme);
            							%>
            							<a onselect="<%devoirsEtudiant.updateVue(devoirsEtudiant.getIdDevoirs().get(i), "true"); %>" href="<%=chemin %>" target="_blank" download="<%=cheminSeul %>" style="margin-right:2px;" title="Télécharger" type="button" class="btn btn-flat btn-success download_e">
            									<i class="fa fa-huge fa-download"></i>
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
            	</div>
				<br>
				<br>
				<br> <br>
				<br>


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
				<br>
				<br>
			
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
	<script type="text/javascript"
		src="http://platform.twitter.com/widgets.js"></script>

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
	<script src="../bootstrap/js/script.js" type="text/javascript"></script>
	
	<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="../dist/js/readmore.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../dist/js/app.min.js"></script>
<script src="../dist/js/jquery.toastmessage.js"></script>
<script type="../text/javascript" src="http://platform.twitter.com/widgets.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../dist/js/pages/dashboard2.js"></script>
<script src="../dist/js/demo.js"></script>

<script >
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	$('.download_e').on
</script>

<script>

$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ...</a>',
	  lessLink: '<a href="#">Retirer</a>'
	});

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

	$('#devoirs').DataTable({

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
$('#none').hide(); 
<<<<<<< HEAD
$("#apply").hide();
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});

<<<<<<< HEAD
function apply(){
	$("#no").hide();
	$("#apply").show();
}

$("#apply").click(function(){
	var arrays = $('td input');
	arrays.each(function(){
		if($(this).val()!='' && $(this).val!='No Note'){
			var fichier = $(this).closest("td");
			noter($(fichier).data("devoir"),$(this).val());
		}
	});
	$().toastmessage('showSuccessToast','Les devoirs ont été noté avec success!');	
	$("#apply").hide();
	$("#no").show();	
});

function vider(cours)
{		cours=unescape(cours);
=======
function vider(cours)
{
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
		var des = confirm('Voulez-vous vraiment supprimer les devoirs du cours '+cours+' ? '); 

		if(des == true)
		{
<<<<<<< HEAD
			window.location.href="listeDevoir.jsp?title="+cours+"&del=true&admin=";
		}
		
}

function noter(devoir,note){
	$.ajax({
		url:chemin+'forum',
		type:'POST',
		data:"type=noter&devoir="+devoir+"&note="+note,
		error : function(resultat, statut, erreur){
			 alert("Nous n'avons pas pu joindre le serveur, un problème est survenu");
			 window.location.reload();
	    }
	});	
}


=======
			window.location.href="listeDevoir.jsp?title="+cours+"&del=true";
		}
		
}
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
</script>
</body>

</html>
<<<<<<< HEAD
<%}%>
=======
<%} %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
