<<<<<<< HEAD
<%if(session.getAttribute("user")==null && session.getAttribute("enseignant")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
=======

<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/courMoocs.jspf" %>

<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<<<<<<< HEAD
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Devoirs" %>
<!DOCTYPE html>
<html lang="en">
<%
		String title = request.getParameter("title");
		courMoocs.setTitreCours(title);
		Cours cours = courMoocs; 
=======
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
<!DOCTYPE html>
<html lang="en">
<%
	if(request.getParameter("title")!=null)
	{
		
		String title = request.getParameter("title");
		Cours cours = new Cours(); 
		cours.setTitreCours(title);
		courMoocs.setTitreCours(title);
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
%>
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
<<<<<<< HEAD
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <%if(session.getAttribute("user")!=null){%>
		<%@ include file="entete_e.jsp" %>
	<%}else{ %>
		<%@ include file="enteteAper�u.jsp"%>
	<%} %>
=======
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
    <%@include file="entete_e.jsp" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
     <section class="content">
     	<!-- Pr�sentation du titre et du logo -->
     	<div class="row">
     		   <div class="col-xs-12">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-aqua-active">
            <div class="widget-user-image">
              <img  src="cours/img/<%=cours.getLogoCoursBD()%>" alt="Logo du cours">
            </div>
              <h2 class="widget-user-desc"><center><%=cours.getTitreCours() %></center></h2>
            </div>
          </div>
          <!-- /.widget-user -->
        </div>
     	</div>
     	
     	<div class="row">
     	<div class="col-xs-6">
     		
     	
     		 <blockquote>
     		 
               <article id="description">
                   <%=cours.getDescriptionCoursBD()%>                 
               </article>
        	      Le lien d'&eacute;valuation de ce cours est <a href="<%=cours.getLienCoursBD()%>" target="blank"><%=cours.getLienCoursBD()%></a>
				<br><br>
<<<<<<< HEAD
				<a type="button" class="evaluation btn btn-info btn-flat" href="liste_e.jsp?title=<%= cours.getTitreCours()%>">Evaluations &nbsp;<i class="fa fa-edit"></i></a>      
=======
				<a type="button" class="evaluation btn btn-info btn-flat" href="liste_e.jsp?title=<%= cours.getTitreCours()%>">Evaluations <i class="fa fa-edit"></i></a>      
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
              </blockquote>
     	
     	</div>
     	
     	<div class="col-xs-5">	
     			<%if(cours.getVideoIntroduction()!=null && cours.getVideoIntroduction().length()!=0){ %>
     				<br/>
     				<div class="embed-responsive embed-responsive-16by9">
     				<iframe class="embed-responsive-item" src="cours/video/<%=cours.getVideoIntroduction()%>" controls autoplay="false" frameborder="0" allowfullscreen></iframe>
     				
     				</div>
                	<br/>
                		                		 
                	<% }else{%>
                	<blockquote>
<<<<<<< HEAD
                		<div style="olor:red;"> Aucune video d'introduction pour l'instant. </div>
                	</blockquote>
                	<%}%>
=======
                		<a href="videoIntro.jsp?title=<%=cours.getTitreCours()%>"> Aucune video d'introduction pour l'instant. </a>
                	</blockquote>
                	<%} %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
     	
     	</div>
     	
     	</div>
     	
     	<div class="row">
     		 
     		 <div class="col-xs-2">
     		 </div>
        <div class="col-xs-8">
          <%for(int i = 0; i<cours.getNombreSemainesCoursBD();i++){%>
          <div class="box box-info collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">Resources de la semaine <%=(i+1)%></h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            
            	
       <ul class="timeline">

    <!-- timeline time label -->
    <li class="time-label">
        <span class="bg-blue">
            Vid&eacute;os de la semaine <%=(i+1) %>
        </span>
    </li>
    <!-- /.timeline-label -->

    <!-- timeline item -->
    <%
        	ArrayList<String> listVideo = cours.getListeCoursSemaine(i+1);
       		int compteur = 0;
        	int count = 0; 
        	for(String video : listVideo)
    {%>
    
    <li>
        <!-- timeline icon -->
        <i class="fa fa-video-camera bg-blue"></i>
        <div class="timeline-item">            
        <span class="pull-right"><a href="cours/video/<%=video%>" style="margin-right:2px;" download="<%=cours.getTitreCours()%>.Semaine-<%=(i+1)%>.video<%=(compteur+1)%>" title="T�l�charger cette vid�o" type="button" class="btn btn-flat btn-success"><i class="fa fa-huge fa-download"></i></a></span> 			
        <h3 class="timeline-header"><a href="presentResour.jsp?video=<%=video%>&&title=<%=cours.getTitreCours()%>&&semaine=<%=(i+1)%>"><%=video %></a> </h3>
         <div class="timeline-body">
            <b> Compl&eacute;ments associ&eacute; � cette vid&eacute;o</b>
            	
            	<ul style="padding: 20px; list-style-type:square;" >
																		
							<%ArrayList<String> listComplement = teacher.listeComplement(video);count = 0;  %>
																
							<%if(listComplement.size()!=0){%>
							<%for(String complement : listComplement){ %>
								
							 <li>
							 	
							 	<a href="cours/complement/<%=complement%>" download="Complement<%=(compteur+1)%><%=(count+1)%>">Complement-<%=(compteur+1)%>-<%=(count+1)%></a>
							</li>
					
									<%count++;}%>
							<%}else{ %>
							<li>
								Aucun complement disponible pour cette vid&eacute;o. 
							</li>
								<%} %>								
				</ul>
                
            </div>
        </div>
    </li>
    
    <%compteur++;} %>
 
    
    <li class="time-label">
        <span class="bg-blue">
            Exercices  de la semaine <%=(i+1) %>
        </span>
    </li>
    <%ArrayList<String> listExo = cours.getListeExo(i+1);
	  compteur = 0; 
      for(String exo : listExo){%>        									
     <li>
        <!-- timeline icon -->
        <i class="fa fa-file-pdf-o bg-blue"></i>
        <div class="timeline-item">
             <span class="pull-right"><a href="cours/exercice/<%=exo%>" style="margin-right:2px;" download="<%=cours.getTitreCours()%>.Semaine-<%=(i+1)%>.exercice-<%=(compteur+1)%>" title="T�l�charger cette exercice" type="button" class="btn btn-flat btn-success"><i class="fa fa-huge fa-download"></i></a></span> 
	    	 
            <h3 class="timeline-header"><a href="cours/exercice/<%=exo%>"><%=exo %></a> </h3>
        </div>
    </li>
 <%} %>
 


</ul>
            </div>
            <!-- /.box-body -->
          </div>
          <%} %>
          <!-- /.box -->
        </div>
        
        
     	</div>
     
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



$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ...</a>',
	  lessLink: '<a href="#">Retirer</a>'
	});

</script>

</body>

</html>
<%} %>
<<<<<<< HEAD
=======
<%} %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
