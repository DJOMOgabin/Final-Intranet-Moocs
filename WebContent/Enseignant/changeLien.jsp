<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
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
	<div class="wrapper">
		<header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>MO</b>OCs</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>INTRANET</b> MOOCs</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
          <!-- Notifications: style can be found in dropdown.less -->
          <!-- Tasks: style can be found in dropdown.less -->
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../dist/img/user.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=teacher.getLogin()%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../dist/img/user.png" class="img-circle" alt="User Image">

                <p>
                   <%=teacher.getLogin() %> - Enseignant
                  <small><%=teacher.getHeureActuelle() %></small>
                </p>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                
                <div class="pull-right">
                  <a href="../index.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        
        </ul>
      </div>

    </nav>
  </header>
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../dist/img/user.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=teacher.getLogin() %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Connect&eacute; </a>
        </div>
      </div>
     
      <ul class="sidebar-menu">
        <li class="header"> NAVIGATION</li>
        <li class="active">
          <a href="index.jsp#">
            <i class="fa fa-home"></i> <span>Acceuil</span> 
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-book"></i>
            <span>Cours </span>
            <span class="label label-primary pull-right"><%=teacher.getNombreCours()%></span>
             
          </a>
          <ul class="treeview-menu">
            <li><a href="ajoutCours.jsp"><i class="fa fa-circle-o"></i> </i> Ajouter un cours</a></li>
            
          </ul>
        </li>
        <li>
          <a href="listeEtd.jsp">
            <i class="fa fa-users"></i>
            <span>Mes &Eacute;tudiants </span>
            <span class="label label-primary pull-right"><%=teacher.getNombreEtdIns()%></span>
          </a>
        </li>
<%if(teacher.getStatus().equals("admin")){%>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i>
            <span>Administration</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="statEtd.jsp"><i class="fa fa-circle-o"></i> Statistiques sur les &eacute;tudiants <span class="label label-primary pull-right"><%=teacher.getNombreTotalEtd()%></span></a></li>
            <li><a href="statCours.jsp"><i class="fa fa-circle-o"></i> Statistiques sur les cours <span class="label label-primary pull-right"><%=teacher.getNombreCours()%></span></a></li>
            <li><a href="cahier.jsp"><i class="fa fa-circle-o"></i> Cahier de pr&eacute;sence</a></li>
            <li><a href="creeEns.jsp"><i class="fa fa-circle-o"></i> Cr&eacute;er un enseignant</a></li>
            
            
          </ul>
        </li>
<%} %>
      </ul>
    </section>

  </aside>
  		    
  		    <%Cours c = new Cours(); %>
			<%if(request.getParameter("title")==null){ %>
			<%c.setTitreCours(courMoocs.getTitreCours()); %>
			<%}else{ %>
			<%courMoocs.setTitreCours(request.getParameter("title")); %>
			<%c = new Cours(); c.setTitreCours(new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8")); %>
			<%}%>
  <div class="content-wrapper">
   <section class="content-header">
      <h1>
        Tableau de bord
        <small>Version 1.0</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Tableau de bord</li>
      </ol>
    </section>
	<section class="content">
		<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info-circle"></i> Changez le lien d'&eacute;valuation de <b><%=c.getTitreCours() %></b>   </h4>
              	 Entrez le nouveau lien  et cliquez sur <b>CHANGER</b>.
         </div>
		</div>
		</div>
		<div class="row">
			<form  class="form-horizontal" method="post" id="newlink" action="updateLien.jsp?id=<%=c.getId()%>" >
			
				   <div class="form-group">
                  <label for="inputAdress"  class="col-sm-2 control-label"> LIEN ACTUEL </label>

                  <div class="col-sm-8">
                    <input type="text" disabled="disabled" class="form-control"  value="<%=c.getLienCoursBD() %>"/>
                  </div>
                </div> 
                 <div class="form-group">
                  <label for="inputAdress"  class="col-sm-2 control-label"> NOUVEAU LIEN </label>

                  <div class="col-sm-8">
                    <input type="text" name="lien"  class="form-control"  value="http://"/>
                  </div>
                </div>
				 <div class="form-group">
              		<label for="inputAdress"  class="col-sm-2 control-label">  </label>
                	<div class="col-sm-8">
                		<button type="submit" class="btn btn-block btn-info" id="soumettre"> CHANGER <i class="fa fa-spinner fa-spin" id="none"></i></button>
                	</div>
              
                </div>
	
			</form>
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
<script>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
</script> 
</body>

</html>
<%} %>
