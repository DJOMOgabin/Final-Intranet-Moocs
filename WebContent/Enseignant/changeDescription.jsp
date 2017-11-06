<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<<<<<<< HEAD
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Devoirs" %>
=======
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
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

<<<<<<< HEAD
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete.jsp" %>
=======
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete2.jsp" %>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
  		    <%Cours c = new Cours(); %>
			<%if(request.getParameter("title")==null){ %>
			<%c.setTitreCours(courMoocs.getTitreCours()); %>
			<%}else{ %>
			<%courMoocs.setTitreCours(request.getParameter("title")); %>
			<%c = new Cours(); c.setTitreCours(new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8")); %>
			<%}%>
	<section class="content">
		<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info-circle"></i> Modifier la description du cours <b><%=c.getTitreCours() %></b>   </h4>
              	 Modifier l'ancienne description  et cliquez sur <b>MODIFIER</b>.
         </div>
		</div>
		</div>
		<div class="row">
			<form  class="form-horizontal" method="post" id="newdesc" action="updateDesc.jsp?id=<%=c.getId()%>" >
			
				  <div class="form-group">
                  <label for="inputAdress"  class="col-sm-2 control-label"> DESCRIPTION DU COURS </label>

                  <div class="col-sm-8">
                  <%System.out.println(c.getDescriptionBD()); %>
                    <textarea rows="5" required class="form-control" name="descriptionCours" id="description"  placeholder="Une breve description du cours  ..." required><%=c.getDescriptionBD()%></textarea>
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
<script src="../dist/js/readmore.js"></script>
<script>

CKEDITOR.replace('description');

$('#apropos').click(function(){

	alert('On affiche apropos');

});

$('#none').hide(); 
$("#newdesc").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
</script> 
</body>

</html>
<%} %>
