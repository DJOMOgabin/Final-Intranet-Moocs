<%@page import="com.sun.jmx.snmp.Timestamp"%>
<%@page import="Hibernate.TestHibernate"%>
<%@page import="Traitement.Duree"%>
<%@page import="Modele.Examen"%>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList,Modele.Epreuve,Hibernate.TestHibernate2, Modele.Cours, Modele.constante, Modele.Examen, Modele.Devoirs" %>
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

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete.jsp" %>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4><i class="icon fa fa-info-circle"></i> cliquez sur l'évaluation si vous voulez modifier la durée ou <b>LE CONTENU</b>.
	         	</div>
			</div>
		</div>
		<%
			System.out.println(request.getParameter("epreuve")+" epreuve");
			if(request.getParameter("epreuve")!=null){
				System.out.println("Suppression");
		    	Examen.supprimer(request.getParameter("title"), 
		    			request.getParameter("epreuve"));
		    	Epreuve epreuve = TestHibernate2.chargerEpreuve
						(request.getParameter("epreuve"), request.getParameter("title"));
		    	TestHibernate.Supprimer(epreuve);
			}
			String string;
			Examen examen = new Examen(request.getParameter("title"));%>
			<input type="hidden" id="nombre" value="<%= examen.getList().size()%>">
			
			<%for (int i=0;i<examen.getList().size();i++){%>
			<script type="text/javascript">
				var nomCours = escape("<%=request.getParameter("title")%>"),
				nomEpreuve = escape("<%=examen.getList().get(i).getNomExam()%>");
			</script>
			<div class="row" data-nomepreuve="<%=examen.getList().get(i).getNomExam()%>">
				<div class="col-xs-2 btn">
					<div type="button" class="supprimer btn btn-block alert alert-dismissible alert-warning" >
					<i class="fa fa-trash"></i> supprimer </div>  
				</div>
				<div class="btn col-xs-10">
				<a href="Evaluational.jsp?title=<%= request.getParameter("title") %>
				&titre=<%=examen.getList().get(i).getNomExam()%>&update=true">
					<div class="col-xs-12">
					<%
					if(examen.getList().get(i).isVue()){
					%>
						<div type="button" class="alert alert-info alert-dismissible">
			    			<div><strong ><%=examen.getList().get(i).getNomExam() %></strong> </div>  
							<div class="col-xs-4">
							</div>
							<div class="col-xs-3">  
							</div>
							<div class="col-xs-3">
					    		<div><i class="fa fa-hourglass-half"></i> 
					    		<small>Restant : <%=examen.StringDuree(i) %></small> </div>  
							</div>    
			         	</div>
			        <%
					}else{
			        %>
			        	<div class="alert alert-danger alert-dismissible ">
			    			<div><strong ><%=examen.getList().get(i).getNomExam() %></strong> </div>  
							<div class="col-xs-4">
							</div>
							<div class="col-xs-3">  
							</div>
							<div class="col-xs-4">
					    		<div><i class="fa fa-hourglass-half"></i>
					    		 <small> Restant : <%=examen.StringDuree(i) %></small> </div>  
							</div>    
			         	</div>
			        <%} %>
					</div>
				</a>				
				</div>							
			</div>
		<%} 
		java.sql.Timestamp time = new java.sql.Timestamp(new Timestamp().getDateTime());%>
		<br><br><br><br><br>
		<div class="row">
				<div class="col-xs-12">
					<div> 
						<div class="col-xs-3">
						</div>
						<div class="col-xs-3">  
						</div>
						<div class="col-xs-3">  
						</div>
						<div class="col-xs-3">
				    		<div onclick="click">
				    		<a type="button" id="creer" href="Compositional.jsp?title=<%= request.getParameter("title") %>&nom=" class="btn btn-info btn-flat">Créer une épreuve <i class="fa fa-edit"></i></a>      
				    		</div>  
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
<script src="../bootstrap/js/script.js" type="text/javascript"></script>
<script>
<%if(TestHibernate.isReussite()){
	TestHibernate.setReussite(false);
	%>
		$().toastmessage('showSuccessToast','Votre épreuve a été supprimé!');
<%}%>

$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});

function supprimer(cours,epreuve)
{
	    var nomepreuve = unescape(epreuve);
	    var nomcours = unescape(cours);
		var des = confirm("Voulez-vous vraiment supprimer l 'epreuve "+nomepreuve+" ?"); 

		if(des == true)
		{
			window.location.href="liste.jsp?title="+nomCours+"&epreuve="+nomepreuve;
		}
		
}

	console.log("start");
	$(".supprimer").click(function(){
		var row = $(this).closest(".row");
		console.log("Click supprimer");
		supprimer(nomCours,$(row).data('nomepreuve'));
	});

</script> 
</body>

</html>
<%} %>
