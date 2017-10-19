<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/courMoocs.jspf" %>

<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Devoirs" %>
<!DOCTYPE html>
<html lang="en">
<%
	if(request.getParameter("title")!=null)
	{
		
		String title = request.getParameter("title");
		Cours cours = new Cours(); 
		cours.setTitreCours(title);
		System.out.println(cours.getTitreCours()+"\n"+cours.getNombreSemainesCoursBD());
		courMoocs.setTitreCours(title);
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

<%@ page contentType="text/html; charset=UTF-8" %>
	<%@include file="entete_e.jsp" %>
	<section class="content">
		
		<%if(request.getParameter("del").equals("true")){ 
		Devoirs.EffacerDevoir(request.getParameter("title"),false);
		}
		%>
		<%
		//Le premier paramètre représente si 
		//le second paramètre représente si nous sommes en présence de l'étudiant ou de 
		//l'enseignant
		Devoirs devoir = new Devoirs(request.getParameter("title"),true,false);%>			
		<%for (int i=0;i<devoir.getList().size();i++){%>
			<div class="btn btn-block" id="block1">
				<div class="col-xs-12">
					<div class="alert alert-info alert-dismissible ">
		    			<div><strong ><%=devoir.getList().get(i).getDevoir() %></strong> </div>  
						<div class="col-xs-3">
						</div>
						<div class="col-xs-3">  
							 <a href="#"><small>Envoyé le:</small> </a>
						</div>
						<div class="col-xs-3"> 
							 <a href="#"><small><%=devoir.getList().get(i).getDate() %></small> </a> 
						</div>
						<div class="col-xs-3">
				    		<a href="#"><small>View</small> </a>  
						</div>    
		         	</div>
				</div>
			</div>
		<%} %>
		<p>
		<div class="row" ></div>
		
		<div class="row" >
			<%if(devoir.getList().size()!=0){ %>
			<div class="col-xs-4">
				<a href="#" type="button" id="ajouterDevoir" class="evaluation btn btn-success btn-flat" style="margin-left:50%" > Nouveau devoir <i class="fa fa-drop"></i></a>
			</div>
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
				<a type="button" id="vider" class="evaluation btn btn-danger btn-flat" onClick="vider('<%= request.getParameter("title") %>')" > Vider la liste <i class="fa fa-times"></i></a>
			</div>
			<%}else{ %>
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
				<p><strong><i> Aucun devoir n'est soumis</i></strong> </p>
			</div>
			<div class="col-xs-4">
			</div>
			<%} %>
		</div>
		<br><br>
		<%if(devoir.getList().size()==0){ %>
		<div class="row">
			<div class="col-xs-4">
				<a href="#" type="button" id="ajouterDevoir" class="evaluation btn btn-success btn-flat" style="margin-left:50%" > Nouveau devoir <i class="fa fa-drop"></i></a>
			</div>
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
			</div>
		</div>
		<%} %>
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



$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ...</a>',
	  lessLink: '<a href="#">Retirer</a>'
	});

function vider(cours)
{
		var des = confirm('Voulez-vous vraiment supprimer les devoirs du cours '+cours+' ? '); 

		if(des == true)
		{
			window.location.href="listeDevoir_e.jsp?title="+cours+"&del=true";
		}
		
}
</script>

</body>

</html>
<%} %>
<%} %>
