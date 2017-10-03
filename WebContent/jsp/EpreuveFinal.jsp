<%@page import="Modele.Examen"%>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file = "/WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante, Modele.Examen, Modele.Devoirs, Modele.Epreuve" %>
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
  <link rel="stylesheet" href="../css/epreuve.css">
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
	<%if(session.getAttribute("enseignant")==null){%>	
    <%@include file="../entete_e.jsp" %>
	<%}else{ %>
	<%@ include file="/Enseignant/entete.jsp" %>
	<%} %>
	<section class="content ">
		<%
			request.setAttribute("aucun", request.getParameter("aucun"));
			request.setAttribute("juste", request.getParameter("juste"));
			request.setAttribute("mauvais", request.getParameter("mauvais"));
			request.setAttribute("title", request.getParameter("title"));
		%>
		
		<% Epreuve epreuve = (Epreuve)request.getServletContext().getAttribute("question");%>
			<label class="titre form-control"><strong><%= epreuve.getTitre() %></strong> </label><br><p>
			<label class="comment"><small><i>bonne réponse ${juste} pt(s), mauvaise réponse ${mauvais} pt(s),
			  aucune réponse ${aucun} pt(s)</i></small> </label><br><p>
			<label class="indicative"><small><i><u >Indication:</u> </i> <strong> <%= epreuve.getIndicative() %> </strong></small></label><br><p><br><p>
			<fieldset id="epreuve">
				<%for(int i=0;i<epreuve.getExercice().size();i++){%>
				<label class="exercice"><i><b><u> Exercice <%=i+1 %>:</u>  </b></i> 
				<%= epreuve.getExercice().get(i).getExercice().getTitre() %></label><br><p>
				<label class="enonce"><%= epreuve.getExercice().get(i).getExercice().getEnonce() %></label><p>
					<% for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){%>
						<div class="blocProposition" >
							<label class="question"><b><%=j+1 %>) </b><%=epreuve.getExercice().get(i).getQuestion().get(j).getQuestion() %></label><p>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="1"/>
							<label>A ) <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo1() %></label><br>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="2"/>
							<label>B ) <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo2() %></label><br>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="3"/>
							<label>C ) <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo3() %></label><br>
							<input class="proposition" name="proposition<%=i %><%=j %>" type="radio" value="4"/>
							<label>D ) <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo4() %></label><br><p>
						</div>
					<%}%>
				<%}%>
			</fieldset>
		<br><br>
		<br><br>
		<%if(request.getParameter("status").equals("en")){%>
		
			<div class="row">
					<div class="col-md-4">
						<a type="submit" href="../Enseignant/liste.jsp?title=${title }" class="btn btn-lg retour btn-danger login-button"> <-- Retour</a>
				 	</div>				 	
					<div class="col-md-4">
					</div>
				    <div class="col-md-4">
				    </div>	
			  </div>
		<%}else{%>
			<form action="../jsp/EpreuveFinal.jsp?title=<%=request.getParameter("title") %>&status=en" method="get">
				<input type="hidden" name="juste" value="${juste }"/>
				<input type="hidden" name="mauvais" value="${mauvais }"/>
				<input type="hidden" name="aucun" value="${aucun}"/>
				<div class="row">
					<div class="col-md-4">
					</div>				 	
					<div class="col-md-4">
					</div>
				  <div class="col-md-4">
					<button type="submit" class="btn btn-lg btn-success login-button">Soumettre</button>
				  </div>	
			  </div> 
			</form>
		<%}%>	
	</section>
</div>
	
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2015-2016 <a href="#apropos">INTRANET MOOCs</a>.</strong> All rights
    reserved.
  </footer>        
</div>
           

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
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.2.2/video.js"></script>
<script src="../dist/js/readmore.js"></script>
<script src="../bootstrap/js/script.js" type="text/javascript"></script>
<script>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
</script> 
</body>

</html>
