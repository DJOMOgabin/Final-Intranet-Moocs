
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, forum.OutilsChaine,Modele.constante,Modele.Devoirs" contentType="text/html;charset=UTF-8"%>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">	
	<%@ include file="entete.jsp" %>
<%
System.out.println(request.getParameter("title"));
Cours cours = courMoocs;
System.out.println("titre du cours : "+courMoocs.getTitreCours());
	if(request.getParameter("title")!=null)
	{
 
		//String title = request.getParameter("title");
	}
%>
	 <section class="content">
     	<!-- Presentation du titre et du logo -->
     	<div class="row">
     		   <div class="col-xs-12">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-aqua-active">
            <div class="widget-user-image">
              <img  src="../cours/img/<%=cours.getLogoCoursBD()%>" alt="Logo du cours">
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
	               <br/> Le lien d'&eacute;valuation de ce cours est <a href="<%=cours.getLienCoursBD()%>" target="blank"><%=cours.getLienCoursBD()%></a>
	        		<br> <a type="button" class="btn btn-info btn-flat" href="changeDescription.jsp?title=<%=cours.getTitreCours()%>"> Modifier cette description  <i class="fa fa-edit"></i></a>
	        		<br> <a type="button" class="btn btn-info btn-flat" href="changeLien.jsp?idcours=<%=cours.getTitreCours()%>">Modifier le lien d'&eacute;valuation <i class="fa fa-edit"></i></a>  
					<br> <a type="button" class="evaluation btn btn-info btn-flat" href="liste.jsp?title=<%=cours.getTitreCours()%>">Evaluations <i class="fa fa-edit"></i></a>      
              </blockquote>    	
     	</div>
     	
     	<div class="col-xs-5">	
     			<%if(cours.getVideoIntroduction()!=null && cours.getVideoIntroduction().length()!=0){ %>
     				<br/>
     				<div class="embed-responsive embed-responsive-16by9">
     				<iframe class="embed-responsive-item" src="../cours/video/<%=cours.getVideoIntroduction()%>" controls autoplay="false" frameborder="0" allowfullscreen></iframe>
     				</div>
                	<br/>
                		<a type="button" class="btn btn-info btn-flat" href="videoIntro.jsp?title=<%=cours.getTitreCours()%>"> Modifier cette video d'introduction  <i class="fa fa-exchange"></i></a>
                		<a type="button" class="btn btn-info btn-flat" href="changeLogo.jsp?title=<%=cours.getTitreCours()%>">Modifier le logo du cours <i class="fa fa-edit"></i></a>
                	<br/>
                		 
                	<% }else{%>
                	
                	<blockquote>
                	<div class="col-xs-6">
                		<a href="videoIntro.jsp?title=<%=cours.getTitreCours()%>"> Aucune video d'introduction.</a> Uploader une ...
                	</div>
                	<div class="col-xs-6">
                		<a type="button" class="btn btn-info btn-flat" href="changeLogo.jsp?title=<%=cours.getTitreCours()%>">Modifier le logo du cours <i class="fa fa-edit"></i></a>
                	</div>	
                	
                	</blockquote>
                	<%} %>
     	
     	</div>
     	
     	</div>
     	<br/>
     	<div class="row">
     		 
     		 <div class="col-xs-2">
     		 </div>
        <div class="col-xs-8">
          <%for(int i = 0; i<cours.getNombreSemainesCoursBD();i++){ %>
          <div class="box box-info collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">Resources de la semaine <%=(i+1) %></h3>

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
            
        <span class="pull-right"><a href="../cours/video/<%=video%>" style="margin-right:2px;" download="<%=cours.getTitreCours()%>.Semaine-<%=(i+1)%>.video<%=(compteur+1)%>" title="Telecharger cette video" type="button" class="btn btn-flat btn-success"><i class="fa fa-huge fa-download"></i></a></span> 
	    <span class="pull-right"><a href="#" onclick="supprime('<%=video%>','<%=cours.getId()%>');" style="margin-right:2px;" title="Supprimer cette video" type="button" class="btn btn-flat btn-danger"><i class="fa fa-huge fa-remove"></i></a></span>
			
        <h3 class="timeline-header"><a href="presentResour.jsp?video=<%=video%>&title=<%=cours.getTitreCours()%>&semaine=<%=(i+1)%>"><%=video %></a> </h3>

         <div class="timeline-body">
            <b> Compl&eacute;ments associ&eacute; à cette vid&eacute;o</b>
            	
            	<ul style="padding: 20px; list-style-type:square;" >
																		
							<%ArrayList<String> listComplement = teacher.listeComplement(video);count = 0;  %>
																
							<%if(listComplement.size()!=0){%>
							<%for(String complement : listComplement){ %>
								
							 <li>
							 	
							 	<a href="../cours/complement/<%=complement%>" download="Complement<%=(compteur+1)%><%=(count+1)%>">Complement-<%=(compteur+1)%>-<%=(count+1)%></a>
							</li>
					
									<%count++;}%>
							<%}else{ %>
							<li>
								Aucun complement disponible pour cette vid&eacute;o. 
							</li>
								<%} %>
								
								<li style="list-style-type:none;">
									<a href="ajoutComplement.jsp?video=<%=video %>&&title=<%=cours.getTitreCours()%>" type="button" class="btn btn-flat btn-info"> Ajouter des compl&eacute;ments à cette vid&eacute;o <i class="fa fa-clone"></i></a>
								</li>
				</ul>
                
            </div>
        </div>
    </li>
    
    <%compteur++;} %>
    <li>
        <!-- timeline icon -->
        <i class="fa fa-plus-circle bg-blue"></i>
        <div class="timeline-item">
            <h3 class="timeline-header"><a href="ajoutVideo.jsp?semaine=<%=(i+1)%>&&title=<%=cours.getTitreCours()%>"> Ajouter des vid&eacute;os </a> </h3>        
        </div>
    </li>
    
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
             <span class="pull-right"><a href="../cours/exercice/<%=exo%>" style="margin-right:2px;" download="<%=cours.getTitreCours()%>.Semaine-<%=(i+1)%>.exercice-<%=(compteur+1)%>" title="Telecharger cette exercice" type="button" class="btn btn-flat btn-success"><i class="fa fa-huge fa-download"></i></a></span> 
	    	 <span class="pull-right"><a href="#" onclick="supprime2('<%=exo%>','<%=cours.getId()%>');" style="margin-right:2px;" title="Supprimer cette video" type="button" class="btn btn-flat btn-danger"><i class="fa fa-huge fa-remove"></i></a></span>
            <h3 class="timeline-header"><a href="../cours/exercice/<%=exo%>"><%=exo %></a> </h3>
        </div>
    </li>
 <%} %>
 
  <li>
        <!-- timeline icon -->
        <i class="fa fa-plus-circle bg-blue"></i>
        <div class="timeline-item">
            <h3 class="timeline-header"><a href="ajoutExercices.jsp?title=<%=cours.getTitreCours()%>&&semaine=<%=(i+1)%>"> Ajouter des exercices </a> </h3>        
        </div>
    </li>

</ul>
            </div>
            <!-- /.box-body -->
          </div>
          <%} %>
           <div class="box box-info collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">Ajouter des semaines à ce cours</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <form method="post" action="ajoutSem.jsp?id=<%=cours.getId()%>" class="form-horizontal">
            						
            							<div class="form-group">
            							<label for="nombre" class="col-sm-4 control-label"> Nombre de Semaine </label>
            								<div class="col-sm-2">
												<input type="number" min="1" max="10" value="1" name="nombreSemainesCours" class="form-control">
											</div>
											
											<div class="col-sm-4">
												<button type="submit" class="btn btn-flat btn-primary"> Ajouter <i class="fa fa-plus-circle"></i></button> 
											</div>
						
										</div>
            						
            							</form>	
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        
     	</div>
     
    <%@include file="../footer.jsp" %>
    

<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="../dist/js/readmore.js"></script>
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

  <script src="../dist/js/videojs-ie8.min.js"></script>
  <script src="../dist/js/video.js"></script>

    
<script>
<%int ok = 0;%>
<%if(ok == 0 && request.getParameter("videointro")!=null && request.getParameter("videointro").length()>0){ %>
$().toastmessage('showSuccessToast', "Video d'introduction integree avec succes.");
<%ok=1;} %>
<%if(ok == 0 && request.getParameter("newdesc")!=null && request.getParameter("newdesc").length()>0){ %>
$().toastmessage('showSuccessToast', "La description du cours a ete mis à jour avec succes.");
<%ok=1;} %>
<%if(ok == 0 && request.getParameter("newlink")!=null && request.getParameter("newlink").length()>0){ %>
$().toastmessage('showSuccessToast', "Le nouveau lien d'evaluation a ete integre avec succes.");
<%ok=1;} %>
<%if(ok == 0 && request.getParameter("newlogo")!=null && request.getParameter("newlogo").length()>0){ %>
$().toastmessage('showSuccessToast', "Le nouveau logo a ete integre avec succes.");
<%ok=1;} %>
<%if(ok==0 && request.getParameter("comp")!=null && request.getParameter("comp").length()>0){ %>
$().toastmessage('showSuccessToast', "Les complements ont ete integre avec succes.");
<%ok=1;} %> 
<%if(ok == 0 && request.getParameter("video")!=null && request.getParameter("video").length()>0){ %>
$().toastmessage('showSuccessToast', "Videos integree avec succes.");
<%ok=1;} %> 
<%if(ok==0 && request.getParameter("supp")!=null && request.getParameter("supp").length()>0){ %>
$().toastmessage('showSuccessToast', "Suppression effectue avec succes.");
<%ok=1;} %> 
<%if(ok==0 && request.getParameter("exo")!=null && request.getParameter("exo").length()>0){ %>
$().toastmessage('showSuccessToast', "Exercice integre avec succes.");
<%ok=1;} %> 

function supprime(nomvideo,idcours)
{
		
		
		var supp = confirm('Voulez vous vraiment supprimer cette video ?');
		if(supp == true)
		{
				window.location.href="delete.jsp?type=video&&video="+nomvideo+"&&idcours="+idcours;	
		}
		
		
}

function supprimeComplement(nomComplement,idcours)
{
		var supp = confirm('Voulez vous vraiment supprimer ce complement ?');
		if(supp == true)
		{
			window.location.href="delete.jsp?type=complement&&video="+nomComplement+"&&idcours="+idcours;
		}
}

function supprime2(nomvideo, idcours)
{
		var supp = confirm('Voulez vous vraiment supprimer cette exercice ?');
		if(supp==true)
		{
			window.location.href="delete.jsp?type=exercice&&exercice="+nomvideo+"&&idcours="+idcours;
		}
}
$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ... </a>',
	  lessLink: '<a href="#">Retirer </a>'
	});
</script>

</body>

</html>
<%}%>
