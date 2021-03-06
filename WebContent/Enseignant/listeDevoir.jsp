<%@page import="forum.LectEcriForum"%>
<%@page import="controlleur.Lecture"%>
<%@page import="Modele.Examen"%>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward
	page="../home.jsp?page=index.jsp" />
<%}else{ %>
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
<link rel="stylesheet" href="<%=prefix%>dist/css/jquery.toastmessage.css" />
<link rel="stylesheet" href="<%=prefix%>bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
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
		<%@ include file="../enteteAper�u.jsp"%>
	<%}else{ %>  
	<%@ include file="entete.jsp" %>
	<%} %>
     <section class="content">	
		<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="alert alert-info alert-dismissible">
							<h4>
								<i class="icon fa fa-info-circle"></i> LISTE DES DEVOIRS ENVOYES PAR <b>LES ETUDIANTS</b>.
							</h4>
						</div>
					</div>
				</div>
				<%if(request.getParameter("del").equals("true")){ 
					Devoirs.EffacerDevoir(request.getParameter("title"),true);
					}%>
			<%DevoirsEtudiant devoirsEtudiant = new DevoirsEtudiant();%>
			<%devoirsEtudiant.devoirsEnseignant(courMoocs.getId()); %>
			<%if(devoirsEtudiant.getDevoirs().size() != 0) {%>	
			
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
	            			<thead>
	            				<tr>
	            					<th> <center>#</center> </th>
	            					<th> <center>MATRICULE </center></th>
	            					<th> <center>NOM </center></th>
	            					<th> <center>TITRE </center></th>
	            					<th> <center>DATE D'ENVOI</center> </th>
	            					<th> <center>DEJA VUE </center></th>
	            					<th> <center>TELECHARGER</center> </th>
									<th> <center>NOTE / 20</center> </th>
	            				</tr>
	            			</thead>
            				<tbody>
        					<%for(int i=0; i<devoirsEtudiant.getDevoirs().size(); i++) {%>
            				<tr class="ligne">
            					<td> <center><%=(i+1)%></center></td>
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
            						<%if(prefix.equals("../"))devoirsEtudiant.updateVue(devoirsEtudiant.getIdDevoirs().get(i),"true");%>
            							<a href="<%=prefix%>cours/Devoirs/<%=devoirsEtudiant.getLienDevoir().get(i)%>" 
            							target="_blank" download="Devoir N�<%=(i+1)%> de <%=devoirsEtudiant.getEtudiants().get(i)%> de <%=request.getParameter("title")%><%=Lecture.LireExtension(devoirsEtudiant.getLienDevoir().get(i))%>" 
            							style="margin-right:2px;" title="T�l�charger" type="button" class="btn btn-flat btn-success download_e">
            									<i class="fa fa-huge fa-download"></i>
            								</a>
            						</center>
            					</td>   
            					<!-- Quand on est enseignant -->         					
            					<%if(prefix.equals("../")){%>
	            					<!-- Si pas encore not� -->         					
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
$().toastmessage('showSuccessToast', "Cours bloqu� avec succ�s.");
<%ok=1;} %><%if(ok == 0 && request.getParameter("ouv")!=null && request.getParameter("ouv").length()>0){ %>
$().toastmessage('showSuccessToast', "Cours ouvert avec succ�s.");
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
$("#apply").hide();
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});

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
	$().toastmessage('showSuccessToast','Les devoirs ont �t� not� avec success!');	
	$("#apply").hide();
	$("#no").show();	
});

function vider(cours)
{		cours=unescape(cours);
		var des = confirm('Voulez-vous vraiment supprimer les devoirs du cours '+cours+' ? '); 

		if(des == true)
		{
			window.location.href="listeDevoir.jsp?title="+cours+"&del=true&admin=";
		}
		
}

function noter(devoir,note){
	$.ajax({
		url:chemin+'forum',
		type:'POST',
		data:"type=noter&devoir="+devoir+"&note="+note,
		error : function(resultat, statut, erreur){
			 alert("Nous n'avons pas pu joindre le serveur, un probl�me est survenu");
			 window.location.reload();
	    }
	});	
}


</script>
</body>

</html>
<%}%>
