<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs | Inscription</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="#"><b>INTRANET</b> MOOCs</a>
  </div>
<%if(request.getParameter("badpass")!=null && request.getParameter("badpass").length()!=0){ %>
	 <div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-ban"></i> Mot de passe diff&eacute;rent ! </h4>
                Les mots de passe entr&eacute;e ne correspondent pas.
         </div>
<%} %>

  <div class="register-box-body">
    <p class="login-box-msg">-- Inscription --</p>

    <form id="inscription" action="ajoutUser.jsp" method="post">
      <div class="form-group has-feedback">
        <input required type="text" name="nom" class="form-control" placeholder="Nom & Prenom ...">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" name="email" required class="form-control" placeholder="Email ...">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
   
       <div class="form-group has-feedback">
        <input type="text" name="matricule" class="form-control" placeholder="Matricule ...">
        <span class="glyphicon glyphicon-info-sign form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
        <input type="password" required name="password" class="form-control" placeholder="Mot de Passe ...">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" required name="repassword" class="form-control" placeholder="Retaper Mot de Passe ...">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="text-center">
        
       
          <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-thumbs-o-up"></i> S'inscrire<i class="fa fa-spinner fa-spin" id="none"></i></button>
      
        <!-- /.col -->
      </div>
    </form>

    <div class="text-center">
    <br/>
      <p>- D&eacute;ja inscrit ??-</p>
     <a href="index.jsp" class="btn btn-block btn-info btn-flat"><i class="fa fa-hand-o-left"></i> Se Connecter</a>
    </div>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>

  $(function () {
	  $("#none").hide();
	  $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });

	    $('#inscription').submit(function(e){

	    	$('#none').show();

	    	
	    });
  });
  
</script>
</body>
</html>
