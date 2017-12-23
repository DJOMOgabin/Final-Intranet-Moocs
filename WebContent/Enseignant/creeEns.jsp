<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
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
 


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete2.jsp" %>
     <section class="content">
		
		<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info-circle"></i> Ajouter un enseignant  <i class="fa fa-user"></i> </h4>
                Veuillez remplir les informations sur l'enseignant  , puis cliquez sur <b> Cr&eacute;er </b>
				<div class="pull-right">Ne pas mettre d'<b style="color:red;">Apostrophe</b> dans le nom et prénom de enseignant.</div>
         </div>
		</div>
		</div>
		
		<div class="row">
			
			<div class="col-xs-12">
			
				<div class="box box-info">
				
			<form id="newprof"  method="post" class="form-horizontal" onsubmit="return chiffrer()">
			
					<div class="box-body">
							<div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">NOM</label>

                  <div class="col-sm-3">
                    <input type="text" autofocus required class="form-control" name="name" id="name" placeholder="NOM ... ">
                  </div>
               <label for="inputAdress" class="col-sm-2 control-label"> PRENOM </label>

                  <div class="col-sm-3">
                    <input type="text" required class="form-control" placeholder = "PRENOM ..." name="prenom" id="prenom"/>
                  </div>
				
                  
				  </div>           
                  <div class="form-group">
                  <label for="inputAdress" class="col-sm-2 control-label"> SEXE </label>

                  <div class="col-sm-3">
                 		<select class="form-control" name="sexe" id="sexe">
						<option>Masculin</option>
						<option>Feminin</option>
						
					</select>
                  </div>
  <label for="inputAdress" class="col-sm-2 control-label"> STATUS </label>

                  <div class="col-sm-3">
                    <select class="form-control" name="status" id="status">
							<option value="Enseignant"> Enseignant (SIMPLE) </option>
							<option value="admin"> Enseignant (ADMINISTRATEUR) </option>
					</select>
                  </div>
                   
                  </div>
				
                 <div class="form-group">
                  <label for="inputAdress" class="col-sm-2 control-label"> EMAIL </label>

                  <div class="col-sm-3">
                 	<input type="email" required class="form-control" placeholder="EMAIL ..." name="email" id="email"/>
                  </div>
                      <label for="inputAdress" class="col-sm-2 control-label">MOT DE PASSE </label>

                  <div class="col-sm-3">
                    <input type="password" required placeholder="MOT DE PASSE ..." class="form-control" name="password" id="password"/>
                  </div>   
                  </div>
			
                </div>	
                <div class="form-group">
              <label for="inputAdress"  class="col-sm-2 control-label">  </label>
                	<div class="col-sm-8">
                		<button type="submit" id="cre"  class="btn btn-block btn-info"> CR&Eacute;ER <i class="fa fa-spinner fa-spin" id="none"></i></button>
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
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../dist/js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->

<script>

$('#none').hide();

$("#newprof").submit(function(e){
	
e.preventDefault();


$.ajax({
	
	url : 'ajoutProf.jsp',
	type : 'POST',
	data : $(this).serialize() ,
	
	beforeSend : function(){
		$('#none').show();
		$('#cre').prop("disabled",true);
		
	},
	success : function(){

		
	},
	complete : function(){
		$('#none').hide();
		$('#cre').prop("disabled",false);
		$().toastmessage('showSuccessToast', "Creation de l'enseignant effectuee avec succes.");
	}
});

});

<%@include file="accent.jsp"%>
		function chiffrer(){
		  //On chiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		  $('#name').val($('#name').val().sansAccent());
		  $('#prenom').val($('#prenom').val().sansAccent());
		  return true;
		}
	    </script>

</body>

</html>
<%} %>
