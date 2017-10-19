<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs | Connexion</title>
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

  <script>

  window.history.forward();
  
  VK_BSPACE = 8; VK_F5 = 116;  function isFromEdit(e) { if (window.event) e = window.event;
  var target = e.target ? e.target : e.srcElement; 
  return ((target.tagName=="INPUT" && (target.type == "text" || target.type == "password" || target.type=="email")) || target.tagName=="TEXTAREA"); } 
  function blocBadTouche(e) { if (window.event) e = window.event; var touche = window.event ? e.keyCode : e.which;
  var target = e.target ? e.target : e.srcElement; if ((touche == VK_BSPACE && !isFromEdit(e)) || touche == VK_F5 ) { 
	  if (e.keyCode) e.keyCode=0; return false; } return true; 
	  }
  </script>
</head>
<body class="hold-transition login-page" onkeydown="return blocBadTouche(e)" onunload="window.history.forward();">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>INTRANET</b> MOOCs</a>
  </div>	
  
  <%
  if(session.getAttribute("user")!=null||session.getAttribute("enseignant")!=null) {
	  session.invalidate();
  }
  if(request.getParameter("error")!=null && request.getParameter("error").length()!=0){ %>
  
  	  <div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-ban"></i> Erreur ! </h4>
                Les informations entr&eacute;e sont invalide. Veuillez r&eacute;esayez.
         </div>
  
  <%} %>
  <%//System.out.println(request.getSession().getServletContext().getInitParameter("workDir"));%> 
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg"> --- Connectez-vous --- </p>

    <form action="verifier.jsp" method="post">
      <div class="form-group has-feedback">
        <input type="email" name="email" required class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" required class="form-control" placeholder="Mot de passe">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="status"> Enseignant
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Connexion</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  
  <div class="text-center">
  <br/>
      <p>- Nouveau sur la plateforme ??-</p>
      <a href="register.jsp" class="btn btn-block btn-info btn-flat"><i class="fa fa-hand-o-right"> </i> S'inscrire</a>
    </div>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
