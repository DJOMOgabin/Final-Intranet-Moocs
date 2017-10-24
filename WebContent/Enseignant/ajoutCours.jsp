<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
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

  <script>
  function verif(evt) {
      var keyCode = evt.which ? evt.which : evt.keyCode;
      var accept = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ';
      if (accept.indexOf(String.fromCharCode(keyCode)) >= 0 || keyCode==8) {
          return true;
      } else {
          alert('Pas d\'accent ou caracteres speciaux autorise');
          return false;
      }
  }
  </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete2.jsp" %>
     <section class="content">
		
		<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info-circle"></i> Ajouter un cours  <i class="fa fa-book"></i> </h4>
                Veuillez remplir les informations sur le nouveau cours , puis cliquez sur <b> Cr&eacute;er </b>
					<div class="pull-right">Ne pas mettre d'<b style="color:red;">Apostrophe</b> dans le nom du cours.</div>
         </div>
		</div>
		</div>
		
		<div class="row">
			
			<div class="col-xs-12">
			
				<div class="box box-info">
				
			<form id="newcourse" action="controle_logo.jsp" enctype="multipart/form-data" method="post" class="form-horizontal" onsubmit="return chiffrer()">
			
					<div class="box-body">
							<div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label titre">TITRE DU COURS</label>

                  <div class="col-sm-3">
                    <input type="text" autofocus required onkeypress="" class="form-control" name="titreCours" id="titre" placeholder="TITRE DU COURS ... ">
                  </div>
               <label for="inputAdress" class="col-sm-2 control-label"> LOGO DU COURS</label>

                  <div class="col-sm-3">
                    <input type="file" accept="image/*" id="logo"  class="form-control" name="logo"/>
                  </div>
				
                  
				  </div>           
                  <div class="form-group">
                  <label for="inputAdress" class="col-sm-2 control-label"> LANGUE DU COURS </label>

                  <div class="col-sm-3">
                 		<select class="form-control" name="langueCours">
						<option>Allemand</option>
						<option>Anglais</option>
						<option>Arabe</option>
						<option>Chinois</option>
						<option>Espagnol</option>
						<option selected="selected">Français</option>
						<option>Italien</option>
						<option>Japonais</option>
						<option>Russe</option>
					</select>
                  </div>
         	 <label for="inputAdress" class="col-sm-2 control-label">  </label>

                  <div class="col-sm-3">
                 	                		<button type="submit" class="btn btn-block btn-info" id="cre"> CR&Eacute;ER  <i class="fa fa-spinner fa-spin" id="none"></i> </button>

                  </div>
                  </div>
				
                
				<div id="autre">
                  <div class="form-group">
                  <label for="inputAdress" class="col-sm-2 control-label"> AUTRE LIEN </label>

                  <div class="col-sm-8">
                     <input type="text" required name="lienA"   value="http://www.coursera.org" class="form-control"/>
                  </div>
                </div>
			   </div>



                     
                </div>	
               
                <div class="form-group">
                </div>										
				</form>			
					</div>
			
				</div>
			
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
<script>
<%if(request.getParameter("okay")!=null && request.getParameter("okay").length()>0){ %>
	$().toastmessage('showSuccessToast', "Creation du cours effectuee avec succes.");
<%} %> 


	$("#newcourse").submit(function(e){

			$("#cre").attr("disable",true);
			$("#none").show();
			

	});


	//CKEDITOR.replace('description');
	

	$('#apropos').click(function(){

		alert('On affiche apropos');

	});

	 	$("#none").hide();
		$('#autre').hide(); 

		$('#lien').change(function(){

					if($(this).val()=='Autre')
					{
						$('#autre').show();
					}
					else
					{
							$('#autre').hide();
					}
			
				});
		<%@include file="accent.jsp"%>
		function chiffrer(){
		 //On chiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		  $('#titre').val($('#titre').val().sansAccent());
			  return true;
	      }	    
	    </script>

</body>

</html>
<%} %>
