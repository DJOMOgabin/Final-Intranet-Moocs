<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
<%@ page import="controlleur.chronoThread" errorPage="erreur.jsp"%>
<%@ include file="WEB-INF/jspf/bean/chronometre.jspf"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Etudiant </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
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

 <% 
try{

System.out.println("temps debut transmis: "+(String)request.getAttribute("debut"));
System.out.println("temps alloue transmis: "+(String)request.getAttribute("alloue"));
System.out.println("email transmis: "+request.getParameter("loginEmail"));
chrono.setDateDebut(Long.valueOf((String)request.getAttribute("debut")));
chrono.setEmail(request.getParameter("loginEmail"));
chrono.setTempsAlloue(Long.valueOf((String)request.getAttribute("alloue")));
chrono.setT((chronoThread)request.getAttribute("threadChrono"));
chrono.setTempsRestant(Long.valueOf((String)request.getAttribute("restant")));
chrono.setJour(Integer.valueOf((String)request.getAttribute("jourRestant")));
chrono.divisionTemps(chrono.getTempsRestant());
}catch(Exception ex){ex.printStackTrace();}
  
  
%>
<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="entete2_e.jsp" %>
    <%ArrayList<String> listeCours= userMooc.getMesCours();%>
   
    
     <section class="content">
     		<div class="row">
     			<div class="col-lg-2 col-md-2">
     			</div>
     			<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
     			<%if(listeCours.size()==0){ %>
					<div class="alert alert-info alert-dismissible">
    					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                		<h4><i class="icon fa fa-info-circle"></i> Aucun cours  <i class="fa fa-book"></i> </h4>
                		Vous n'etes inscrit à aucun cours pour le moment. Veuillez visiter la liste de cours pour voir ce qui pourrait vous interressez.
         			</div>
				  <%} %>
     			  <%for(int i = 0; i<listeCours.size(); i++){ %>
				  <%Cours c  = new Cours(); %>
				  <%c.setTitreCours(listeCours.get(i));%>
     				<div class="attachment-block clearfix" style="border: 2px solid white; border-width : 4px;border-style : edge; padding : 10px 10px;box-shadow : 6px 6px 6px 6px #ccc;">
                <img class="attachment-img" src="cours/img/<%=c.getLogoCoursBD()%>" alt="Logo du cours">

                <div class="attachment-pushed" >
                  <h4 class="attachment-heading"><a href="#"><%=c.getTitreCours() %></a></h4>

                  <div class="attachment-text">
                    <article id="description"><%=c.getDescriptionCoursBD() %></article> 
                    <div class="row">
                    	<div class="col-xs-5">
                    		<span><a href="present_e.jsp?title=<%=c.getTitreCours()%>" class="btn btn-flat btn-info">  Accéder au cours <i class="fa fa-home"></i></a></span>
                    	</div>
                    	<div class="col-xs-1">
                    	</div>
                    	<div class="col-xs-5">
  							<span><a href="#" onclick="desinscrire('<%=c.getTitreCours()%>','<%=userMooc.getId()%>')" class="btn btn-flat btn-danger"> Se desinscrire <i class="fa fa-times-circle"></i></a></span>
  						</div>
                  	</div>
                  </div>
                  <!-- /.attachment-text -->
                </div>
                <!-- /.attachment-pushed -->
              </div>
             <%} %>
     			</div>
     		</div>
     		
     	
     		<div class="row">
     			<div class="col-lg-2 col-md-2">
     			</div>
     			<div  class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
					<a href="toutcours.jsp" class="btn btn-flat btn-success btn-block"> Voir la liste des cours  <i class="fa fa-plus-circle"></i></a> 
     			</div>
     			
     		</div>
     		
     
    <%@include file="footer.jsp" %>
    
            
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="dist/js/readmore.js"></script>
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

<script>

<%int ok = 0;%>
<%if(ok==0 && request.getParameter("nouveau")!=null && request.getParameter("nouveau").length()>0){%>
$().toastmessage('showNoticeToast','Félicitations à votre inscription sur INTRANET MOOCs');
<%}%>
<%if(ok == 0 && request.getParameter("inscription_reussi")!=null && request.getParameter("inscription_reussi").length()>0){ %>
$().toastmessage('showSuccessToast', "Vous vous etes inscrit avec succès au cours demandé. Vérifiez cela sur la liste de vos cours.");
<%ok=1;} %>


	$(function(){
		
			$('span').css("margin-right","2px");
			
	});

	function desinscrire(cours)
	{
			var des = confirm('Voulez-vous vraiment vous desinscrire de '+cours+' ? '); 

			if(des == true)
			{
				window.location.href="desinscrire.jsp?title="+cours;
			}
			
	}
	$('#description').readmore({
		  speed: 75,
		  moreLink : '<a href="#"> Lire la suite ... </a>',
		  lessLink: '<a href="#">Retirer</a>'
		});
	


</script>
</body>

</html>
<%} %>
