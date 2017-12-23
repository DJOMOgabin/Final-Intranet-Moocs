<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Array, Modele.Cours,Modele.Examen, Modele.constante, forum.OutilsChaine" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
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
	<%@ include file="entete2.jsp" %>
     <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">VOS COURS</span>
              <span class="info-box-number"><%=teacher.getNombreCours()%><small></small></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
          <div class="clearfix visible-sm-block"></div>
        <!-- /.col -->
        <div class="col-md-6 col-sm-6 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">COURS DE L'ENSEIGNANT(E) </span>
              <div class="pull-right" style="color:red;"> <%=request.getParameter("nom").toUpperCase()%></div>
           <%ArrayList<Array> list = Examen.ListEnseignantCours(request.getParameter("nom"));%>
              <span class="info-box-number"><%=list.size()%></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
      

        <!-- /.col -->
      </div>
     <br/>
      <div class="row">
      	<div class="col-md-6 col-sm-6 col-xs-6">
      		<a href="ajoutCours.jsp"  class="btn btn-info btn-block btn-flat"> Ajouter un cours  <i class="fa fa-book"></i> <i class="fa fa-plus-circle"></i></a>
      	</div>
      	<div class="col-md-6 col-sm-6 col-xs-6">
      		<a href="creeEns.jsp" class="btn btn-success btn-block btn-flat"> Ajouter un enseignant  <i class="fa fa-table"></i></a>
      	</div>
      </div>
      
      <div class="row">
      	<div class="col-md-6 col-sm-6 col-xs-6">
      		<!-- Liste des cours dispo -->
      		
      	</div>
      	
      	<div class="col-md-6 col-sm-6 col-xs-6">
      		<!--  Liste des étudiant -->
      	</div>
      	
      </div>
      
      <br/>
        <div class="row">                  	            	
            	<div class="col-xs-12">
            	<div class="box box-info">
            	<div class="box-header">
            		<h3 class="box-title"><b>LISTE DES COURS DE L'ENSEIGNANT(E) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div class="pull-right" style="color:red;"> <%=request.getParameter("nom").toUpperCase()%></div></b></h3>
            	</div>
            	<div class="box-body">
            		<table id="courses" class="table table-bordered table-hover">	
					<script type="text/javascript">
						var nomenseignant = escape("<%=request.getParameter("nom")%>");
						var id = <%=teacher.getId()%>;
					</script>
            			<thead>
            				<tr>
            					<th> <center># </center></th>
            					<th> <center>COURS </center></th>
            					<th> <center>INSCRITS </center></th>
            					            					
            					<th> <center> VOIR COURS</center></th>
            					<th> <center>FERMER / OUVRIR </center></th>
            					<th> <center> SUPPRIMER COURS</center></th>
            					
            				</tr>
            			</thead>
            			<tbody>       
            
            		<%for(int i = 0; i<list.size(); i++){ %>
            				<tr data-nomcours="<%=list.get(i).getNom()%>">
            					<td> <center><%=(i+1)%></center></td>
            					<td> <center><%=list.get(i).getNom().toUpperCase() %></center></td>            					
            					<td> <center><%=Examen.EtudiantInscrit(list.get(i).getNom())%></center></td>
            					
            					<td> <center><a type="button" href="../present_e.jsp?title=<%=list.get(i).getNom()%>" class="btn btn-block btn-info btn-flat">Aperçu ... <i class="fa fa-cogs"></i></a></center></td>
            					<%if(list.get(i).getValeur().equalsIgnoreCase("1")){%>
            					<td> <center><a type="button" href="#" class="fermer btn btn-block btn-warning btn-flat">BLOQUER LE COURS <i class="fa fa-ban"></i></a></center></td>
            					<%}else{ %>
            					<td> <center><a type="button" href="#" class="ouvrir btn btn-block btn-success btn-flat">DEBLOQUER LE COURS <i class="fa fa-check-circle"></i></a></center></td>
            					<%}%>
            					<td> <center><a type="button" href="#" data-toggle="modal" data-target="#myModal3" class="supp btn btn-block btn-danger btn-flat">SUPPRIMER <i class="fa fa-times"></i></a></center></td>
            				</tr>
            			<%} %>
            			</tbody>
            		</table>
            		</div>
            	</div>
            </div>
            </div>
           
      
    <%@include file="../footer.jsp" %>
    <%@include file="../confirm.jsp" %>
    

<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- Bootstrap 3.3.5 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../dist/js/jquery.toastmessage.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- Sparkline -->
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

<script>
<%@include file="chemin.jsp" %>

	$('#apropos').click(function(){

		alert('On affiche apropos');

	});

	$('#courses').DataTable({

		 "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "responsive" : false
	});
	
		$(".fermer").click(function(){
			var row = $(this).closest("tr");
			var des = confirm("Voulez-vous vraiment bloquer ce cours : \""+$(row).data('nomcours')+"\" ?");
			if(des==true){
				bloquer("0",$(row).data('nomcours'));
			}			
		});
	
	$(".ouvrir").click(function(){
		var row = $(this).closest("tr");
		var des = confirm("Voulez-vous vraiment débloquer ce cours : \""+$(row).data('nomcours')+"\" ?");	
		if(des==true){
			bloquer("1",$(row).data('nomcours'));
		}	
	});
	
			function bloquer(valeur,cours){
				cours = unescape(cours);
				$.ajax({
					url:chemin+'forum',
					type:'GET',
					data:"type=bloquer&valeur="+valeur+"&cours="+cours,					
					success:function(code_html,statut){
						if(code_html=='true'){
							$().toastmessage('showSuccessToast','Le cours a été bloqué avec succes!');
							window.location.reload();
						}else{
							 alert("Nous n'avons pas pu bloquer le cours, un problème est survenu du côté serveur");						
						}						
					},		
					error : function(resultat, statut, erreur){
						 alert("Nous n'avons pas pu joindre le serveur, vérifier votre connexion");
				    }
				});
			}
	
</script>
<script src="../js/confirm.js"></script>
</body>

</html>
<%} %>
