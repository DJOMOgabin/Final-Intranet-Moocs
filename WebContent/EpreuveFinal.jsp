<%if(session.getAttribute("user")==null & session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@page import="Modele.Examen"%>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "../WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ include file= "../WEB-INF/jspf/bean/copie.jspf" %>
<%@ include file = "../WEB-INF/jspf/bean/utilisateurMooc.jspf"%>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,Modele.Point,Traitement.ReponseQuestion,
Modele.Examen,Hibernate.TestHibernate2, Modele.Devoirs,Modele.Reponse, Modele.Epreuve,Hibernate.TestHibernate,
Hibernate.HibernateChargementCopie,Modele.CopieEtudiant,Hibernate.HibernateCopie,Hibernate.HibernateChargementCopie,
Modele.Reponse,Traitement.ReponseQuestion" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<%if(session.getAttribute("enseignant")!=null){%>
  	<title>INTRANET MOOCs| Enseignant</title>
	<%}else{ %>
  	<title>INTRANET MOOCs</title>
	<%} %>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/epreuve.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
	<script type="text/javascript" src="js/real-time.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ page contentType="text/html; charset=UTF-8" %>
	<%if(session.getAttribute("enseignant")!=null){%>
		<%if(request.getParameter("status").equals("en")){%>	
	    <%@include file="Enseignant/enteteF.jsp" %>
		<%}else{ %>
		<%@ include file="enteteAperçu.jsp" %>
		<%} %>
	<%}else{ %>
	<%@ include file="entete_e.jsp" %>
	<%} %>
	<section class="content-header">
		<%
		Epreuve epreuve=TestHibernate2.chargerEpreuve
				(request.getParameter("titre"), request.getParameter("title"));
		request.setAttribute("aucun", epreuve.getPoint().getAucun());
		request.setAttribute("juste", epreuve.getPoint().getJuste());
		request.setAttribute("mauvais", epreuve.getPoint().getMauvais());
		request.setAttribute("title", epreuve.getMatiere());	
		request.setAttribute("tentative", epreuve.getDuree().getTentative());
		request.setAttribute("titre", epreuve.getTitre());
		double max=0;
		for(int i=0;i<epreuve.getExercice().size();i++)
			for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++)
				max+=epreuve.getPoint().getJuste();
		if(session.getAttribute("enseignant")==null){
				copie=new CopieEtudiant();
				copie.setIdEtudiant(""+userMooc.getId());
				copie.setNombreTentative(-1);
				copie.setNomCours(epreuve.getMatiere());
				copie.setNomEpreuve(epreuve.getTitre());
				System.out.println("j'ai crée une copie d'adresse: "+copie);
				copie.setDuree(epreuve.getDuree().getDuree());
				copie.setTotalTentative(epreuve.getDuree().getTentative());
				copie.setNote(0);
				copie.setMax(max);
				copie.setNombreTentative(-1);
				copie.setReponse(new ArrayList<Reponse>());
				int idReponse,idCopie = HibernateCopie.EnregistrerCopie(copie);	
				ReponseQuestion reponseQuestion;
				for(int i=0;i<epreuve.getExercice().size();i++){
					copie.getReponse().add(new Reponse());
					copie.getReponse().get(i).setIdCopie(idCopie);
					idReponse = HibernateCopie.EnregistrerReponse(copie.getReponse().get(i));
					for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){
						copie.getReponse().get(i).getSuiteReponse().add(new ReponseQuestion());
						reponseQuestion = copie.getReponse().get(i).getSuiteReponse().get(j);
						reponseQuestion.setProposition(0);
						reponseQuestion.setReponse(epreuve.getExercice().get(i).getQuestion().get(j).getReponse());
						reponseQuestion.setIdCopie(idCopie);
						reponseQuestion.setIdReponse(idReponse);				
						HibernateCopie.EnregistrerProposition(reponseQuestion);
					}
				}		
			copie.dispo();			
		}
		%>
			<form action="EpreuveFinal" method="POST">
			 <div class="row">
			 <input name="title" type="hidden" value="${title }" >
			 <input name="nom" type="hidden" value="${titre }" >
			 <input name="id" type="hidden" value="<%=userMooc.getId() %>">
			 <input name="ancien" type="hidden" value="<%= copie.getNombreTentative()%>" >
			 <label class="titre col-md-12"><strong>${titre }</strong> </label><br><p>
			 </div>
			<label class="comment"><small><i>bonne réponse ${juste} pt(s), mauvaise réponse  ${mauvais} pt(s),
			  aucune réponse  ${aucun} pt(s)</i></small> </label><br><p>			  
			<div class="row">
				<div class="col-md-9">
					<label class="indicative"><small><i><u >Indication:</u> </i> <strong> <%= epreuve.getIndicative() %> </strong></small></label><br><p>
				</div>				
				<%if(session.getAttribute("enseignant")==null){ %>
					<div class="col-md-3" style="font-size: x-large">			
				 		<input name="temps" id="temps" type="hidden" value="" >
				 		<%if(copie.getNote()>copie.getMax()/2){ %>
							<span class="note" style="color: green">
						<%}else{ %>							
							<span class="note" style="color: red">
						<%} %>
								Note: 0/<%=max%>
							</span><br>
						<div class="note">Temps: <span id="date_heure" style=""></span></div><br>
						<span class="note" style="">Tentative: 0 sur <%=epreuve.getDuree().getTentative() %></span>	
			            <script type="text/javascript">
							window.onload = date_heure('date_heure','<%=copie.reste()%>',
									'<%=epreuve.getMatiere()%>');
						</script>
					</div>	
				<%} %>			
			</div>
			<br><p>
			<fieldset id="epreuve">
				<%for(int i=0;i<epreuve.getExercice().size();i++){%>
				<label class="exercice"><i><b><u> Exercice <%=i+1 %>:</u>  </b></i> 
				<%= epreuve.getExercice().get(i).getExercice().getTitre() %></label><br><p>
				<label class="enonce"><%= epreuve.getExercice().get(i).getExercice().getEnonce() %></label><p>
					<% for(int j=0;j<epreuve.getExercice().get(i).getQuestion().size();j++){%>
						<div class="blocProposition" >
							<label class="question"><b><%=j+1 %>) </b><%=epreuve.getExercice().get(i).getQuestion().get(j).getQuestion() %></label><p>
							<div class="row">
								<div class="col-md-1" >
									<input class="proposition pull-right" name="proposition<%=i %><%=j %>" type="radio" value="1"/>								
								</div>
								<div class="col-md-10">
									<label>A )&nbsp; &nbsp; &nbsp;   <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo1()%></label><br>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1" >
									<input class="proposition pull-right" name="proposition<%=i %><%=j %>" type="radio" value="2"/>								
								</div>
								<div class="col-md-10">
									<label>B )&nbsp; &nbsp; &nbsp;   <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo2()%></label><br>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1" >
									<input class="proposition pull-right" name="proposition<%=i %><%=j %>" type="radio" value="3"/>								
								</div>
								<div class="col-md-10">
									<label>C )&nbsp; &nbsp; &nbsp;   <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo3()%></label><br>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1" >
									<input class="proposition pull-right" name="proposition<%=i %><%=j %>" type="radio" value="4"/>								
								</div>
								<div class="col-md-10">
									<label>D )&nbsp; &nbsp; &nbsp;   <%=epreuve.getExercice().get(i).getQuestion().get(j).getProposition().getPropo4()%></label><br>
								</div>
							</div><br><p>
						</div>
					<%}%>
				<%}%>
			</fieldset>
		<br><br>
		<br><br>
	<%if(session.getAttribute("enseignant")!=null){%>
		<%if(request.getParameter("status").equals("en")){%>
			<div class="row">
					<div class="col-md-4">
						<a type="submit" href="Enseignant/Evaluational.jsp?title=${title }&titre=${titre}&update=true"
					class="btn btn-lg retour btn-danger login-button"> <-- Retour</a>
				 	</div>				 	
					<div class="col-md-4"></div>
				    <div class="col-md-4"></div>	
			</div>
		<%}else{%>
			<div class="row">
					<div class="col-md-4">
						<a type="submit" href="liste_e.jsp?title=${title }"class="btn btn-lg retour btn-danger login-button">
						 <-- Retour</a>
				 	</div>				 	
					<div class="col-md-4"></div>
				    <div class="col-md-4"></div>	
			</div>
		<%}%>
	<%}else{%>
				<input type="hidden" name="juste" value="${juste }"/>
				<input type="hidden" name="mauvais" value="${mauvais }"/>
				<input type="hidden" name="aucun" value="${aucun}"/>
				<input type="hidden" name="title" value="${title}"/>
				<input type="hidden" name="tentative" value="${tentative}"/>
				<input type="hidden" name="status" value="en"/>
				<div class="row">
					<div class="col-md-4">
						<a type="submit" href="liste_e.jsp?title=${title }" class="btn btn-lg retour btn-danger login-button"> <-- Retour</a>
					</div>				 	
					<div class="col-md-4"></div>
				  <div class="col-md-4">
					<button type="submit" class="btn btn-lg btn-success login-button">Soumettre</button>
				  </div>	
			  </div> 
			</form>
			<br><br>
		<%}%>	
	
    <%@include file="footer.jsp" %>
    
    <!-- jQuery -->
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
<script type="text/javascript" src="js/MathJax.js?config=AM_HTMLorMML-full"></script>
<script src="dist/js/readmore.js"></script>
<script src="bootstrap/js/script.js" type="text/javascript"></script>
<script>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
    <%@include file="decodage.jsp" %>
</script> 
</body>

</html>
<%}%>
