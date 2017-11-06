<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "../WEB-INF/jspf/bean/courMoocs.jspf" %>
<<<<<<< HEAD
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Devoirs" %>
=======
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
<!DOCTYPE html>
<html lang="en">
<%
	if(request.getParameter("title")!=null)
	{
		String title = request.getParameter("title");
		Cours cours = new Cours(); 
		if(request.getParameter("envoie")!=null && request.getParameter("envoie").length()>0)
		{
			cours.setTitreCours(title);	
		}else{
		cours.setTitreCours(new String(title.getBytes("ISO-8859-1"),"UTF-8"));
		}
<<<<<<< HEAD
=======
		System.out.println(new String(title.getBytes("ISO-8859-1"),"UTF-8")+"\n"+cours.getNombreSemainesCoursBD());
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
%>
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
  <style>
  	.current{
  		color : gray; 
  	}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<<<<<<< HEAD
	<%@ include file="entete.jsp" %>
=======
	<%@ include file="entete2.jsp" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	<section class="content">
	
		<div class="row">
		
		 <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
            <%int semaine = Integer.parseInt(request.getParameter("semaine")); %>
              <img class="profile-user-img img-responsive img-circle" src="../cours/img/<%=cours.getLogoCoursBD()%>" alt="Logo du cours">

              <h3 class="profile-username text-center"><%=cours.getTitreCours() %></h3>

              <p class="text-muted text-center"><%=cours.getNombreSemainesCoursBD() %> semaine<%=(cours.getNombreSemainesCoursBD()>1)?"s":"" %> </p>
             	<div class="box-group" id="accordion">
             		<%for(int i = 1; i<=cours.getNombreSemainesCoursBD();i++){ int count = 1;%>
             		 
             	<div class="panel box box-primary">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i%>">
                       Semaine <%=i %>
                      </a>
                    </h4>
                  </div>
                  <div id="collapse<%=i %>" class="panel-collapse collapse <%=(semaine==i)?"in":""%>">
                    <div class="box-body">
                     <ul>
                      <%ArrayList<String> listVideo = cours.getListeCoursSemaine(i);%>
                      <%for(String video: listVideo){ %>
                      	<li>
                      		<a  class="<%=(video.equals(request.getParameter("video")))?"current":""%>" href="presentResour.jsp?video=<%=video%>&&semaine=<%=semaine%>&&title=<%=request.getParameter("title")%>"> Video <%=count %> <i class="fa fa-gear <%=(video.equals(request.getParameter("video")))?"fa-spin":""%>"></i></a>
                      	</li>		
                      <%count++;} %>
                      	<li>
                      		<a href="ajoutVideo.jsp?semaine=<%=i%>&&title=<%=cours.getTitreCours()%>"> Ajouter des vid&eacute;os </a>
                      	</li>
                      
                      </ul>
                    </div>
                  </div>
                </div>
             		
             		<%} %>
             	</div>
            </div>
            <!-- /.box-body -->
          </div>
          </div>

          <div class="col-md-9">
          	<div class="embed-responsive embed-responsive-16by9">
     				<iframe class="embed-responsive-item" src="../cours/video/<%=request.getParameter("video")%>" controls autoplay="false" frameborder="0" allowfullscreen></iframe>
     		</div>
     		<br/>
     		<%String video = request.getParameter("video"); %>	
     		<%int i = semaine; %>						
			<%ArrayList<String> listComplement = teacher.listeComplement(video);int count = 1;  %>
     		<div class="box box-primary">
     			<div class="box-header with-border">
              		<h3 class="box-title">Compl&eacute;ments li&eacute; à cette vid&eacute;o </h3>
            	</div>
            	<div class="box-body">
            	<ul class="timeline">
            	<li class="time-label">
       				 <span class="bg-blue">
           				Compl&eacute;ments
       				 </span>
   				 </li>
            				
													
							<%if(listComplement.size()!=0){%>
							<%for(String complement : listComplement){ %>
							 <li>
        						<!-- timeline icon -->
        						<i class="fa fa-file-pdf-o bg-blue"></i>
        						<div class="timeline-item">
						            
						        <span class="pull-right"><a href="../cours/complement/<%=complement%>" style="margin-right:2px;" download="<%=cours.getTitreCours()%>.Semaine-<%=(i+1)%>.<%=video %>.complement-<%=count+1%>" title="Télécharger cette vidéo" type="button" class="btn btn-flat btn-success"><i class="fa fa-huge fa-download"></i></a></span> 
							    <span class="pull-right"><a href="#" onclick="supprimeComplement('<%=complement%>','<%=cours.getId()%>');" style="margin-right:2px;" title="Supprimer ce complement" type="button" class="btn btn-flat btn-danger"><i class="fa fa-huge fa-remove"></i></a></span>
									
						        <h3 class="timeline-header"><a href="../cours/complement/<%=complement%>"><%=complement %></a> </h3>
													
								</div>						
							</li>
							<%count++;}%>
							
							<%}else{%>
								<li>
								<div class="timeline-item">
									<h3 class="timeline-header">Aucun compl&eacute;ment n'est associ&eacute; à cette vid&eacute;o.</h3>
								</div>
								</li>
							<%}%>
								
								<li>
									<i class="fa fa-plus-circle"></i>
									<div class="timeline-item">
										<a href="ajoutComplement.jsp?video=<%=video%>&&title=<%=cours.getTitreCours()%>" type="button" class="btn btn-flat btn-info"> Ajouter des compl&eacute;ments à cette vid&eacute;o <i class="fa fa-clone"></i></a>
									</div>
								</li>
				</ul>
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
  <script src="../dist/js/readmore.js"></script>
  <script>

  function supprime(nomvideo,idcours)
  {
  		
  		
  		var supp = confirm('Voulez vous vraiment supprimez cette video ?');
  		if(supp == true)
  		{
  				window.location.href="delete.jsp?type=video&&video="+nomvideo+"&&idcours="+idcours;	
  		}
  		
  		
  }

  function supprimeComplement(nomComplement,idcours)
  {
  		var supp = confirm('Voulez vous vraiment supprimez ce complement ?');
  		if(supp == true)
  		{
  			window.location.href="delete.jsp?type=complement&&video="+nomComplement+"&&idcours="+idcours;
  		}
  }

  function supprime2(nomvideo, idcours)
  {
  		var supp = confirm('Voulez vous vraiment supprimez cette exercice ?');
  		if(supp==true)
  		{
  			window.location.href="delete.jsp?type=exercice&&exercice="+nomvideo+"&&idcours="+idcours;
  		}
  }
</script>
</body>
</html>
<%} %>
<%} %>