<%if(session.getAttribute("user")==null && session.getAttribute("enseignant")==null){%><jsp:forward page="home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file = "WEB-INF/jspf/bean/copie.jspf" %>

<%@ include file = "WEB-INF/jspf/bean/connecteurforum.jspf"%>
<%@ page import = "java.util.ArrayList,java.sql.Timestamp,java.sql.Time, Modele.CopieEtudiant,
Modele.Cours, Modele.constante,Modele.Examen,Modele.Epreuve,Controleur.RechercheCopie,Modele.Devoirs" %>
<!DOCTYPE html>
<html lang="en">
<%
	if(request.getParameter("title")!=null)
	{
		
		String title = request.getParameter("title");
		Cours cours = new Cours(); 
		cours.setTitreCours(title);
		courMoocs.setTitreCours(title);
%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Etudiant </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link href="http://vjs.zencdn.net/5.2.2/video-js.css" rel="stylesheet">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- If you'd like to support IE8 -->

  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <%if(session.getAttribute("enseignant")!=null){%>
		<%@ include file="enteteAperçu.jsp" %>
	<%}else{ %>
		<%@ include file="entete_e.jsp"%>
	<%} %>
<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4><i class="icon fa fa-info-circle"></i> cliquez sur l'évaluation si vous voulez <b>COMPOSER</b>.
	         	</div>
			</div>
		</div>
		<div id="liste">
		<%
			int compteur=0;
			Examen examen = new Examen(request.getParameter("title"));%>
			<input type="hidden" id="nombre" value="<%= examen.getList().size()%>">
			<script type="text/javascript">
				var nomCours = escape("<%=request.getParameter("title")%>");
			</script>
			<%
			ArrayList<CopieEtudiant> copies = new ArrayList<CopieEtudiant>();
			for (int i=0;i<examen.getList().size();i++){ 
			
			//On charge la copie
			copie = RechercheCopie.charger(examen.getList().get(i).getNomExam(), request.getParameter("title"),
					userMooc.getId()+"");
			 //Si elle n'existe pas, on crée une nouvelle
			 if(copie==null){
				 copie = new CopieEtudiant();
				 copie.setNombreTentative(0);
				 copie.setNomCours(request.getParameter("title"));
				 copie.setIdEtudiant(userMooc.getId()+"");
				 copie.setNomEpreuve(examen.getList().get(i).getNomExam());
				 copie.setDuree(examen.getList().get(i).getDuree());
			 }else{
				 double duree = examen.getList().get(i).getDuree()-copie.getDuree();
				 if(duree>0){
					 copie.setDuree(duree);
					 copie.setDate(new Timestamp(new com.sun.jmx.snmp.Timestamp().getDateTime()));
					 copie.setTime(new Time(new com.sun.jmx.snmp.Timestamp().getDateTime()));
				 }
			 }
			 copie.setTotalTentative(examen.getList().get(i).getEssai());
			 copie.dispo();
			 copies.add(copie);
			%>
				<div class="row" data-nomepreuve="<%=examen.getList().get(i).getNomExam()%>"
				data-nombre="<%=copies.get(i).reste()%>">
				<%if(copies.get(i).getNombreTentative()!=0){%>
					<div class="deja">
				<%}else{%>
					<div class="compo">
				<%}%>
					<div class="btn col-xs-12">
					<%
					if(examen.getList().get(i).isVue()){
						compteur++;
					%>
						<div type="submit" class="alert alert-info alert-dismissible">
			    			<div><strong ><%=examen.getList().get(i).getNomExam() %></strong> </div>			    			
    						<%if(session.getAttribute("enseignant")==null){%>			    			
								<%if(copies.get(i).getNote()>=examen.getList().get(i).getMax()/2){ %>
									<div class="col-xs-2" style="color:green">
								<%}else{ %>
									<div class="col-xs-2" style="color:red">							
								<%} %>
									<strong><%=copies.get(i).getNote() %>/<%=examen.getList().get(i).getMax() %> </strong>  
									</div>
    						<%}%>
							<div class="col-xs-2" style="color:red">
								<div><small>Durée : <%=examen.getList().get(i).getDuree() %> h</small> </div>  
							</div>
							<div class="col-xs-2" ></div>
							
    						<%if(session.getAttribute("enseignant")==null){%>
								<div class="col-xs-3">
						    		<div><i class="fa fa-hourglass-half"></i> <small>Restant : <%=examen.StringDuree(i) %></small> </div>  
								</div>
								<%if(copies.get(i).getNombreTentative()<copies.get(i).getTotalTentative()){ %>
									<div class="col-xs-3" style="color:black">
								<%}else{ %>
									<div class="col-xs-3" style="color:red">							
								<%} %>
							    		<div><strong>Tentative : <%=copies.get(i).getNombreTentative() %>
							    		/<%=copies.get(i).getTotalTentative() %></strong> </div>  
									</div>    
				         		</div>				         		
    						<%}else{%>
    							<div class="col-xs-3"></div>
								<div class="col-xs-3">
							    	<div><strong>Tentative : <%=copies.get(i).getTotalTentative() %></strong> </div>  
								</div>
			        		<%}%>
			        <%}%>
					</div>	
				</div>						
			</div>			
		<%} %>
		</div>
		<%if(compteur==0){ %>
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
				<p><strong><i> Aucune évaluation disponible!</i></strong> </p>
			</div>
			<div class="col-xs-4">
			</div>
		<%} %>
		<br><br><br>
	
    <%@include file="footer.jsp" %>

<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="dist/js/readmore.js"></script>
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
    
<script>

$('#description').readmore({
	  speed: 75,
	  moreLink : '<a href="#"> Lire la suite ...</a>',
	  lessLink: '<a href="#">Retirer</a>'
});

//Lorsqu'on a dejà vue la copie, le temps et en cours et qu'on est sorti de l'épreuve
function VoirDeja(nomMatiere,nomEpreuve,nombreTentative){
	var nomepreuve = unescape(nomEpreuve);
	var nomcours = unescape(nomMatiere); 
	if(nombreTentative>0)
	{
		window.location.href="Deja.jsp?title="+nomcours+"&nom="+nomepreuve;
	}else{
		alert("Vous ne pouvez plus composer cette épreuve, votre temps s'est ecoule!");
	}
}

//Losque c'est notre première fois de voir la copie
function VoirEpreuve(nomMatiere,nomEpreuve,nombreTentative){
	var nomepreuve = unescape(nomEpreuve);
	var nomcours = unescape(nomMatiere); 
	if(nombreTentative>0)
	{
		var des = confirm("Une fois que l'epreuve est lance, vous ne pouvez pas \narreter le temps, voulez vous continuez ?");
		if(des == true)
		{
			window.location.href="EpreuveFinal.jsp?title="+nomcours+"&titre="+nomepreuve+"&status=etu";
		}
	}else{
		alert("Vous ne pouvez pas composer soit le temps est nul, soit le nombre de tentative est nul");
	}
}

function AperEpreuve(nomMatiere,nomEpreuve,nombreTentative){
	var nomepreuve = unescape(nomEpreuve);
	var nomcours = unescape(nomMatiere); 
	window.location.href="EpreuveFinal.jsp?title="+nomcours+"&titre="+nomepreuve+"&status=test";
}

<%if(session.getAttribute("enseignant")==null){%>
	$(".compo").click(function(){
		var row = $(this).closest(".row");
		VoirEpreuve(nomCours,$(row).data('nomepreuve'),$(row).data('nombre'));
	});
	
	$(".deja").click(function(){
		var row = $(this).closest(".row");
		VoirDeja(nomCours,$(row).data('nomepreuve'),$(row).data('nombre'));
	});
<%}else{%>
	$(".compo").click(function(){
		var row = $(this).closest(".row");
		AperEpreuve(nomCours,$(row).data('nomepreuve'),$(row).data('nombre'));
	});
	
	$(".deja").click(function(){
		var row = $(this).closest(".row");
		AperEpreuve(nomCours,$(row).data('nomepreuve'),$(row).data('nombre'));
	});
<%}%>	
$('#liste').DataTable({

	 "paging": true,
     "lengthChange": true,
     "searching": true,
     "ordering": true,
     "info": true,
     "autoWidth": true,
     "responsive" : true

});

</script>

</body>
	<%} %>

</html>
<%} %>
