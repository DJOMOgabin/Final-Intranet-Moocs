<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante" %>
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
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete2.jsp" %>
  		    
  		    <%Cours c = new Cours(); %>
			<%if(request.getParameter("title")==null){ %>
			<%c.setTitreCours(courMoocs.getTitreCours()); %>
			<%}else{ %>
			<%courMoocs.setTitreCours(request.getParameter("title")); %>
			<%c = new Cours(); c.setTitreCours(new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8")); %>
			<%}%>
	<section class="content">
	<%int semaine = Integer.parseInt(request.getParameter("semaine")); %>
		<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info-circle"></i> Ajouter des vid&eacute;os pour <b><%=c.getTitreCours()%>-Semaine <%=semaine%></b>. </h4>
              	 S&eacute;lectionnez les vid&eacute;os à ajouter à la semaine <%=semaine %> et cliquez sur <b>Soumettre</b>.<br/>Vous pouvez s&eacute;lectionnez plusieurs fichiers à la fois en maintenant la touche <b> Ctrl </b>.
         </div>
		</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-info">
					
					
 <form method="post" class="live form-horizontal" id="ajoutCours" action="con_video.jsp?semaine=<%=semaine%>&&title=<%=request.getParameter("title")%>" enctype="multipart/form-data">

 
    
    <div class="box-body"> 		
 		<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" multiple onchange="change(1);" id="1" class="form-control" value="Uploader Video" name="video1" required/>
 			</div>
 			<div class="col-sm-4" id="place1">
 				
 			</div>
 		</div>
 			<br/>		
 		<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" onchange="change(2)" id="2" class="form-control" value="Uploader Video" name="video2"/>
 			</div>
 			<div class="col-sm-4" id="place2">
 				
 			</div>
 		</div>
 			<br/>	
 		<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" onchange="change(3)" id="3" class="form-control" value="Uploader Video" name="video3"/>
 			</div>
 			<div class="col-sm-4" id="place3">
 				
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" onchange="change(4)" id="4" class="form-control" value="Uploader Video" name="video4"/>
 			</div>
 			<div class="col-sm-4" id="place4">
 				
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" id="5" onchange="change(5)" class="form-control" value="Uploader Video" name="video5"/>
 			</div>
 			<div class="col-sm-4" id="place5">
 				
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" id="6" onchange="change(6)" class="form-control" value="Uploader Video" name="video6"/>
 			</div>
 			<div class="col-sm-4" id="place6">
 				<button id="r6" style="display:none;" onclick="remove(6)" class="btn btn-danger btn-large col-sm-4">Annuler <span class="glyphicon glyphicon-remove-sign"></span></button>
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept="video/*" id="7" onchange="change(7)" class="form-control" value="Uploader Video" name="video7" />
 			</div>
 			<div class="col-sm-4" id="place7">
 				<button id="r7" style="display:none;" class="btn btn-danger btn-large col-sm-4">Annuler <span class="glyphicon glyphicon-remove-sign"></span></button>
 			</div>
 		</div>
 			<br/>	
 		<hr/>
 			<div class="form-group">
 				<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 				<div class="col-offset-3	 col-sm-4">
					<button id="soumettre"  class="btn btn-flat btn-block btn-success"> Soumettre  <i class="fa fa-upload" id="go"></i><i class="fa fa-spinner fa-spin" id="none"></i></button></center>				
 				</div>
 				
 			</div>
 	  	
 
 </div>
 	
 	
</form> 
				</div>
			</div>
		</div>
	
    <%@include file="../footer.jsp" %>
    

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
<script src="../dist/js/jquery.toastmessage.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="../plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.2.2/video.js"></script>
<script src="../dist/js/readmore.js"></script>
<script>
<%if(request.getParameter("reussi")!=null && request.getParameter("reussi").length()>0){ %>
$().toastmessage('showSuccessToast', "Vidéo d'introduction intégrée avec succès.");
<%} %>
</script>
    <script>

    $('#none').hide(); 
	$("#ajoutCours").submit(function(e){

		$("#soumettre").attr("disable",true);
		$("#go").hide();
		$("#none").show();
		

});
    $(document).on('click','.remove',function(e){
        
		e.getPreventDefault(); 
		var id = $(this).attr("id");
		var control = $("#"+id);
		control.replaceWith( control.val('').clone( true ) );
		$(this).css("display","none"); 
		
    });
    function remplirvideo()
	{
		if(window.XMLHttpRequest)
	 	{
	 		xml = new XMLHttpRequest();
	 	}
	 	else
	 	{
	 		xml = new ActiveXObject("Microsoft.XMLHTTP");
	 	}

	 	xml.onreadystatechange= function()
	 	{
	 		if(xml.readyState==4 && xml.status==200)
	 		{
	 			document.getElementById("videoupload").innerHTML= xml.responseText;
	 		}
	 	}
	 	
	 	xml.open("GET","video.jsp?semaine="+document.getElementById("idsemaine").value,false);
	 	xml.send();
	}
    
    function remove(id)
    {
        alert('id');
        var control = $("#"+id);
    	control.replaceWith( control.val('').clone( true ) );
    	$("#r"+id).css("display","none");
    }

	function change(id)
	{
		
		if(window.XMLHttpRequest)
	 	{
	 		xml = new XMLHttpRequest();
	 	}
	 	else
	 	{
	 		xml = new ActiveXObject("Microsoft.XMLHTTP");
	 	}
	 	xml.onreadystatechange= function()
	 	{
	 		if(xml.readyState==4 && xml.status==200)
	 		{
	 			document.getElementById("place"+id).innerHTML= xml.responseText;
	 		}
	 	}
	 	var tab = $(":file");
	 	xml.open("GET","new.jsp?id="+id,false);
	 	xml.send();
	}
    </script>

</body>

</html>
<%} %>
