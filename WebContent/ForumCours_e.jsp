<%if(session.getAttribute("user")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@page import="Modele.Examen"%>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file = "/WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,forum.LectEcriForum,forum.Forum, Modele.Devoirs" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="css/epreuve.css">
	  <!-- Bootstrap 3.3.5 -->
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ page contentType="text/html; charset=UTF-8" %>
	<%@include file="entete_e.jsp" %>
	<section class="content">
		<!--div class="row">
			<div class="col-md-12">
				<div class="alert alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h3 style="text-align:center"><i class="icon fa fa-info-circle"></i>Les conversations sur  
	                <b style="color:green"> <%=request.getParameter("theme")%></b></h3>
	         	</div>
			</div>
		</div-->
		<%ArrayList<Forum> conversation = LectEcriForum.Lecture(request.getParameter("title"),request.getParameter("theme"));%>
		<script type="text/javascript">
				var iduser = escape(<%=userMooc.getId()%>);
				var theme = escape("<%=request.getParameter("theme")%>");
				var nomCours = escape("<%=request.getParameter("title")%>");
		</script>
		<input type="hidden" value="<%= request.getParameter("title")%>" id="title">
		<input type="hidden" value="<%= request.getParameter("theme")%>" id="theme">
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4><i class="icon fa fa-info-circle"></i><b><%= request.getParameter("theme")%></b>.
	                <span class="label label-warning pull-right" id="compte" value="0"><%=conversation.size() %></span></h4>
	         	</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<a class="pull-left btn btn-danger btn-blog" href="ForumMenu_e.jsp?title=<%= request.getParameter("title")%>">Retour</a>
			</div>			
			<div class="col-md-9">
				<a href="cours/complement/sample-asciimath.html" class="pull-right" target="_blank" id="help">Syntaxe des formules</a>
			</div>
		</div><br>
		<div class="box box-success direct-chat direct-chat-info">
                
                <div class="box-body" style="display: block;">
                  <div class="direct-chat-messages" id="conversation">
	                 <% for(int i=0;i<conversation.size();i++){%>
	                  <%if(conversation.get(i).getNomUser().equalsIgnoreCase(userMooc.getNom())){ %>	                  
	                    <div class="col-md-6"></div>
	                  	<div class="direct-chat-msg right col-md-6">
		                    <div class="direct-chat-text">
			                	<%=conversation.get(i).getText() %>
			                </div>
			                <div class="direct-chat-info clearfix">
			                	<span class="direct-chat-timestamp pull-right"><%=conversation.get(i).getDate() %></span>
			                </div>                     
	                      <!-- /.direct-chat-text -->
	                    </div>
	                  <%}else{%>
	                  	<div class="direct-chat-msg left col-md-7">
	                      <div class="direct-chat-info clearfix">
	                      <%if(conversation.get(i).getNomUser().equalsIgnoreCase("Teacher")){ %>
	                        <span class="direct-chat-name pull-left" style="color:green;">Teacher</span>
	                      <%}else{ %>
	                        <span class="direct-chat-name pull-left"><%=conversation.get(i).getNomUser() %></span>
	                      <%} %>
	                      </div>
	                      <div class="direct-chat-text">
	                        <%=conversation.get(i).getText() %>
	                      </div>
	                      <div class="direct-chat-info clearfix">
	                        <span class="direct-chat-timestamp pull-left"><%=conversation.get(i).getDate() %></span>
	                      </div>
                    	</div>	                  
	                  <%} %>
     				<%} %>                    
                  </div>
                </div>
                
                <div class="row box-footer input-group" style="display:block;">
			  		<div class="col-md-10">
			     		<textarea rows="1" cols="100" id="text" class="form-control" placeholder="Type message ..." onkeypress="compte()"></textarea>
			     	</div>
			     	<div class="col-md-1 btn btn-lg retour btn-success login-button envoi">
			     	Send <i class="glyphicon glyphicon-send"></i></div>     	
			    </div>
              </div>
    <%@include file="../footer.jsp" %>
    <script type = "text/javascript" src ="js/script.js"></script>
    <script type = "text/javascript" src ="js/js.js"></script>
	
	<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="plugins/ckeditor/ckeditor.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="dist/js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
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
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.2.2/video.js"></script>
<script src="dist/js/readmore.js"></script>
<script type="text/javascript" src="js/MathJax.js?config=AM_HTMLorMML-full"></script>
<script src="bootstrap/js/script.js" type="text/javascript"></script>
<script>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
$(".envoi").click(function(){
	forumenvoi(unescape(iduser),unescape(nomCours),unescape(theme));
});
window.onload=init();
</script> 
</body>

</html>
<%} %>
