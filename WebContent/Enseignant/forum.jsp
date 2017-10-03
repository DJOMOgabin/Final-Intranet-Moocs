<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,java.util.*, java.net.*, java.text.*, forum.*" %>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
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
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> <b>Mes Etudiants</b> <span class="badge"><%=teacher.getNombreEtdIns() %></span> </a>
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
       			<h1 class="page-header"> Forum sur <%=request.getParameter("sujet")%></h1>
       		</div> 
       		
       		<div class="row">
       			
       			<div class="panel panel-default">
       			<div class="panel-heading"></div>
       			<div class="panel-body">
       			<ul class="timeline">
       			
       			<%
       			EnsembleMessagesForum messages = new EnsembleMessagesForum();
				messages.rechercherMessagesSujet(connecteurForum, request.getParameter("sujet")); 
				
				DateFormat formatDate = DateFormat.getDateInstance(); 
				DateFormat formatHeure = DateFormat.getTimeInstance(); 
				
				int ligne = 0 ; 
			
				for(Iterator it = messages.iterator(); it.hasNext();)
				{
					MessageForum message = (MessageForum)it.next();
					
					%>
							 <li class="<%=(ligne%2==0)?"":""%>">
                                   
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title"><%=OutilsChaine.convertirEnHTML(message.getAuteur()) %></h4>
                                            <p><small class="text-muted"><i class="fa fa-clock-o"></i> <%=message.getDateCreation() %> </small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p><%= OutilsChaine.convertirEnHTML(message.getTexte()) %></p>
                                        </div>
                                    </div>
                                     <div class="timeline-badge"><i class="fa fa-user"></i>
                                    </div>
                                </li>	
				<%ligne++;}%>
				
       			
       			</ul>
       			<hr/>
       				<%Cours c = new Cours(); c.setTitreCours(request.getParameter("sujet")); %>
       			 <div class="col-sm-5">
                            <form method="post" action="ajoutmessage.jsp?id=<%=c.getId()%>">
                               <label> Ajouter votre message : </label>
                                <textarea name="texte" id="btn-input" class="form-control input-sm" placeholder="Entrez votre message ici ...">
                                </textarea>
                                <br/>
                                    <input type="submit" class="btn btn-warning btn-large btn-block" value="Envoyer">
                                        
                            </form>
                            </div>
       			</div>
       		
       			<div class="panel-footer">
                            
                           
                        </div>
       			
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

</body>

</html>
<%} %>
