<%if(session.getAttribute("user")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Etudiant </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
   <link rel="stylesheet" href="plugins/iCheck/all.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script>
  function verif(evt) {
      var keyCode = evt.which ? evt.which : evt.keyCode;
      var accept = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ';
      if (accept.indexOf(String.fromCharCode(keyCode)) >= 0) {
          return true;
      } else {
          alert('Pas d\'accent ou caractères spéciaux autorisé');
          return false;
      }
  }
  </script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="entete2_e.jsp" %>
  <%ArrayList<String> listeCours= connecteurForum.getListeCours();%>    
     <section class="content">
     	<div class="row">
     	
     		<div class="col-md-3">
     			<div class="box box-primary">
            		<div class="box-body box-profile">
            			<form id="searchCours" action="recherche.jsp"  method="post" class="form-horizontal"> 
            				<div class="form-group">
			                  <div class="col-xs-12">
			                    <input type="text" autofocus required onkeypress="return verif(event);" class="form-control" name="recherche" id="recherche" placeholder="Rechercher un cours ... ">
			                  </div>
			                 </div>
							
					<button type="submit" href="#" class="btn btn-primary btn-block"  id="search"><b>Rechercher <i id="stay" class="fa fa-search"> </i>  <i class="fa fa-spinner fa-spin" id="none"></i></b></button>
					</form>
            		</div>
            	</div>
     		</div>
     		<div class="col-md-7">
     			<div id="results">
     			<%for(int i = 0; i<listeCours.size(); i++){ %>
            	<%Cours c  = new Cours(); %>
            	<%c.setTitreCours(listeCours.get(i));%>											
            	<div class="attachment-block" style="border: 2px solid white; border-width : 4px;border-style : edge; padding : 10px 10px;box-shadow : 6px 6px 6px 6px #ccc;">
                <img class="attachment-img" src="cours/img/<%=c.getLogoCoursBD()%>" alt="Logo du cours">

                <div class="attachment-pushed">
                  <h4 class="attachment-heading"><a href="#"><%=c.getTitreCours() %></a></h4>

                  <div class="attachment-text">
                    <article id="description"><%=c.getDescriptionCoursBD() %></article> 
                    <%if(userMooc.estInscrit(c.getTitreCours())){ %>
    				 <span><a href="present_e.jsp?title=<%=c.getTitreCours()%>" class="btn btn-info btn-flat">  Accéder au cours <i class="fa fa-home"></i></a></span>
  							<%}else{ %>
  					<span><a href="inscrire.jsp?title=<%=c.getTitreCours()%>" class="btn btn-success btn-flat">  S'inscrire à ce cours <i class="fa fa-hand-o-right"></i> </a></span>
  							<%}%>
                  </div>
                  <!-- /.attachment-text -->
                </div>
                <!-- /.attachment-pushed -->
              </div>
            	<%} %>
            	</div>
     		</div>
     	</div>
     
    <%@include file="footer.jsp" %>
    
   
   <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>         		
    <!-- jQuery -->
   <script src="dist/js/readmore.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script type="text/javascript">
$('#description').readmore({
  		  speed: 75,
  		  moreLink : '<a href="#"> Lire la suite ... </a>',
  		  lessLink: '<a href="#">Retirer</a>'
  		});
</script>
<script type="text/javascript">
    $('#none').hide();
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-blue',
        radioClass: 'iradio_flat-green'
      });
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
      });
    	$(function(){


        
    			$('input[type=radio]').click(function()
    					{
							$('input[type=radio]:checked').hide();
    					});
    			
			
    	});

    	$('#searchCours').submit(function(e){
			$('#stay').hide();
    		$('#none').show();
    		
			e.preventDefault();
			

			$.ajax({

			url: 'recherche.jsp',
			type: 'POST',
			data: $(this).serialize(),
			async: false,

			error : function(err)
			{
				console.log(err);
			},
			success : function(html)
			{
				$('#stay').show();
				$('#none').hide();
				$('#results').html(html);
			},
			complete : function(html){
				
			}

		});
			
			
    });
    
    </script>

</body>

</html>
<%} %>
