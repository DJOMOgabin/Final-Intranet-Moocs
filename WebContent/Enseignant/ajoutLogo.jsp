<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>INTRANET MOOCs - ENSEIGNANT </title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">INTRANET MOOCs</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
             
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <%=teacher.getLogin()%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li class="divider"></li>
                        <li><a href="../index.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>Acceuil</a>
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> <b>Cours</b> <span class="badge"><%=teacher.getNombreCours() %></span> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ajoutCours.jsp">Ajouter un cours </a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="listeEtd.jsp"><i class="fa fa-table fa-fw"></i> <b>Mes Etudiants</b> <span class="badge"><%=teacher.getNombreEtdIns() %></span> </a>
                        </li>
                        
<%if(teacher.getStatus().equals("admin")){%>
                        <li class="active">
                            <a href="#"><i class="fa fa-signal"></i> <b>Administration </b><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="statEtd.jsp">Statistiques sur Etudiant <span class="badge"><%=teacher.getNombreTotalEtd()%></span></a>
                                </li>
                                <li>
                                    <a href="statCours.jsp">Statistiques sur les Cours<span class="badge"><%=teacher.getNombreCours()%></span> </a>
                                </li>
                                <li>
                                    <a href="cahier.jsp">Cahier de Presence</a>
                                </li>
                                <li>
                                    <a href="creeEns.jsp">Créer un enseignant</a>
                                </li>
                                <li>
                                	<a href="ConfiChrono.jsp">Configurer le chrono</a>
                                </li>
                              </ul>
                              <%} %>  
                             </li>   
                            
                            <!-- /.nav-second-level -->
                        
                          </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> Cr&eacute;ation d'un nouveau cours <span class="glyphicon glyphicon-book"> </span> </b></h1>
                    
                </div>
                <!-- /.col-lg-12 -->
            </div>
           
			
			<div class="row">
				 <div class="alert alert-info alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                               Remplir les informations du nouveau cours. Et cliquez sur continuez. 
                 </div>
			
			</div>
			
            	<div class="row">
            	
            				<form class="form-horizontal" method="post" enctype="multipart/form-data" action="controle_logo.jsp">
			
			<fieldset>
			
			<legend> Le Logo Du Cours </legend>
			
				<div class="form-group">
				
					<label for="inputlogin" class="col-sm-2 control-label"> Logo Du Cours </label>
				
					<div class="col-sm-8">
							<input type="file" class="col-sm-8" name="logoCours" required/>
					</div>
					
				</div>
				
				<div class="form-group">
				    	<label for="inputLogo" class="col-sm-2 control-label"> </label>
						<div class="col-sm-8">
							<button type="submit" class="btn btn-lg btn-primary"> Uploader Logo <span class="glyphicon glyphicon-picture"> </span></button>
						</div>
					</div>
			</fieldset>
			<hr/>
			
			
			</form>
			
			<br/>
<<<<<<< HEAD
=======
				
			
			
            	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
            	</div>
            
            <div class="row">
            
            		<center>	<a href="controle_logo.jsp?logo=nothing" class="btn btn-info btn-large"> <h3><em>Pas de logo, continuez ... </em> </h3><span class="glyphicon glyphicon-right-arrow"></span></a>	 </center>
            
            </div>
            
        <!-- /#page-wrapper -->
        </div>
       
</div>
  
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <script src="../dist/js/sb-admin-2.js"></script>
    <script src="../dist/js/jquery-1.11.3.js"></script>
    
</body>

</html>
<%} %>
