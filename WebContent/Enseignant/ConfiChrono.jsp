<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jspf/bean/teacher.jspf" %>
<%@ include file="/WEB-INF/jspf/bean/utilisateurMooc.jspf" %>
<%@ page import = "Modele.User, java.util.ArrayList" %>
    <!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8" />
	<title>Confi chrono - INTRANET MOOCS</title>
	<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  	<link href="http://vjs.zencdn.net/5.2.2/video-js.css" rel="stylesheet">
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
                                <li class="active">
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
        <br/>
        		<div class="row">
				 <div class="alert alert-info alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                             Ici vous avez la possibilité de configurer le chrono.Remplissez les informations proposé et valider
                 </div>
			
			</div>
        		<div class="row">
        			<h1 class="page-header"> Configurer le chrono </h1>
        		</div>
        		
        
        		<div class="row">
        		
        			

	<form method="post" action="gestionChrono.jsp" class="form-horizontal" id="formulaire">
		
		<fieldset>
        <legend>  </legend>
    	<div class="form-group">
			    	
        	<div class="col-sm-8"> 
        	Activer le chrono?<br/>
        	<input type="radio" name="radioActivation" value="oui" id="oui" />
        	<label for="oui">Oui</label><br />
        	<input type="radio" name="radioActivation" value="non" id="non" checked/>
        	<label for="non">Non</label><br />
        	</div> 
       	</div>
   	    <div class="form-group" style="display:none" id="temps">
   	    	<p>Veuillez entrer:</p>
   	    	<label for="temps" class="col-sm-2 control-label">Le temps(minutes)</label>
        	<div class="col-sm-8"> 
        	<input type="number" name="temps" id="temps" placeholder="par ex: 10" class="col-sm-8 form-control">
        	</div>
    	</div>
        <div class="form-group" style="display:none" id="jours">
        	<label for="jours" class="col-sm-2 control-label">Le nombre de jours par semaine </label>
        	<div class="col-sm-8"> 
        	<input type="number" name="jours" id="jours" placeholder="par ex: 10" class="col-sm-8 form-control">
    		</div>
    	</div>
    		     
    <hr/>
     <hr/>
     <%
     
     		if(request.getAttribute("erreur")!=null)
     		{
     		%>
     		<center><em> <b id="erreur_con"> <%=request.getAttribute("erreur")%></b> </em></center>
     	<hr/>	
   <%}else{
	   if(request.getAttribute("result")!=null)
		{
   		%>
   			
     		<center><em> <b id="result_con"> <%=request.getAttribute("result")%></b> </em></center>
     	<hr/>	
   <%}}%>
    <div class="col-lg-12">
    <center> <a id="suivant" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Suivant<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> </a></center>
    </div>
    <hr/>    
    </fieldset>
	
	<!-- gestion du modal -->
	<div id="myModal" class="modal fade" role="dialog">
  	<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Selection d'étudiants</h4>
      </div>
      <div class="modal-body">
        <fieldset>
        	<p>
        	Selectionner:<br />
        	<input type="radio" name="radioSelection" value="tous" id="tous" checked/>
        	<label for="tous">Tous les étudiants</label><br />
        	<input type="radio" name="radioSelection" value="groupe" id="groupe" />
        	<label for="groupe">Un groupe d'étudiants</label><br />
      	
        	<p/>
        </fieldset>
        		<table class="table table-bordered table-striped table-hover table-condensed" id="table" style="display: none">
					<thead> 
						<tr>
							<th> # </th>
							<th> NOM </th>
							<th> PRENOM </th>
							<th> NIVEAU</th>
							<th> FACULTE </th>
							<th> Selection? </th>
						</tr>
					</thead>
					<tbody>
						<%
							int i = 0;
							User s = new User();
							ArrayList<User> list=s.getEtudiantAll();
							for(i=0; i<list.size(); i++)
							{%>
								<tr>
										<td><%=i+1%></td>
										<td><%=list.get(i).getNom()%></td>
										<td><%=list.get(i).getPrenom()%></td>
										<td><%=list.get(i).getNiveau()%></td>
										<td><%=list.get(i).getFaculte()%></td>
										<td><input type="checkbox" id="select<%=list.get(i).getIdEtudiant()%>" name=""/></td>
								</tr>
									
							<%}%>
							<%
							
					%>
					</tbody>
				</table>
	</div>
		
      <div class="modal-footer">
      	
        <a id="fermer" type="button" class="btn btn-default" data-dismiss="modal">OK</a>
      </div>
    </div>
    </div>
  </div>
  </form>
</div>
        
        </div>
        </div>
        </body>



<script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.bootstrap.min.js"></script>
<script>
	$(document).ready(function(){$('#table').DataTable({
		responsive : true
	});
	});

</script>

	<script>
    $(document).ready(function() {
    	var compteur=0;//compte les checkbox coches
    	//on reinitialise les checkbox
    	$('[checkbox]:checked').checked=false;
    	//apparution du tableau
    	$('#groupe').on('click', function(e){
    		$('#table').css("display", "table");		
    	});
    	$('#tous').on('click', function(e){
    		$('#table').css("display", "none");		
    	});
    	$('[id^=select]').on('change', function(e) {
    		
    		var $num = this.id.slice('select'.length);
            //on teste si s'est selectionne
            //alert(this.checked);
            if(this.checked)
            {
            	//on l'augmente au formulaire
            	$('<input type="checkbox" style="display:none" name="selectionEtudiant'+$num+'" value="'+$num+'" checked/>').appendTo("#formulaire");
            	compteur=compteur+1;
            	//alert("ca change!");
            }else
            {
            	$('[name="selectionEtudiant'+$num+'"').remove();
            	compteur--;
            }
    	});
    	$('#suivant').on('click', function(e){
    	});
    	$('#fermer').on('click', function(e){
    		//alert($('#tous').val());
    		$('#suivant').replaceWith('<input type="submit" id="enregistrer" class="btn btn-lg btn-success" data-dismiss="modal" value="Enregistrer">');
    		if($(':radio[id="tous"]:checked').val())
    		{
    			$('<input type="radio" name="radioSelection" value="tous" style="display:none" checked/>').appendTo('#formulaire');
    			$('#formulaire').attr('action', 'gestionChrono.jsp?id=0');
    			//alert($('#formulaire').attr('action'));
        		
    		}else
    		{
    			$('<input type="radio" name="radioSelection" value="non" style="display:none" />').appendTo('#formulaire');
    			$('#formulaire').attr('action', 'gestionChrono.jsp?id='+compteur);
    			//alert($('#formulaire').attr('action'));
    			
    		}
    		
    		
    	});
    	$('#formulaire').submit(function(e){
    			//alert();
    			e.preventDefault();
    			//on recupere les champs pour constituer
    			//une requete post qu'on enverra au controlleur pour utilisation
    			
    		$.ajax({
                url: $('#formulaire').attr('action'),
                type: $('#formulaire').attr('method'), // La méthode indiquée dans le formulaire (get ou post)
                data: $('#formulaire').serialize(), // Je sérialise les données (j'envoie toutes les valeurs présentes dans le formulaire)
                success: function(result) {
                   	//alert(result);
                	alert("Configuration effectue avec succès");
                    //on reinitialise notre formulaire
                    $("#formulaire").remove("[name^=selectionEtudiant]");
                    $('#enregistrer').replaceWith('<center> <a id="suivant" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Suivant<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span> </a></center>');
                    $(":radio[id=non]").checked=true;
                    $(":checkbox[id^=select]").checked=false;
                    $(":radio[id=tous]").checked=true;
                    $("#temps").val("");
                    $("#jours").val("");
                    //on recharge completement la page
                    
                }
            });
    			
    	});
    	 $("#oui").on('click', function(e){
    		 $("#temps").css("display", "block");
    		 $("#jours").css("display", "block");
    	 });
    	 $("#non").on('click', function(e){
    		 $("#temps").css("display", "none");
    		 $("#jours").css("display", "none");
    	 });
    	 
  	});
   
    
	</script>


</body>
</html>