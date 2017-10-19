<%@page import="Modele.Examen"%>
<%if(session.getAttribute("enseignant")==null){%><jsp:forward page="../home.jsp?page=index.jsp"/><%}else{ %>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file= "/WEB-INF/jspf/bean/courMoocs.jspf" %>
<%@ page import = "java.util.ArrayList, Modele.Cours, Modele.constante,forum.LectEcriForum, 
Modele.Devoirs,java.sql.SQLException,Traitement.PaireString,java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>INTRANET MOOCs| Enseignant</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="../dist/css/jquery.toastmessage.css" />
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="../css/style.css">
	  <!-- Bootstrap 3.3.5 -->
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

</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ include file="entete.jsp" %>
	<section class="content">
		<div onload="init()"></div>
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-info alert-dismissible">
	    			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4><i class="icon fa fa-info-circle"></i>SUJETS DU FORUM</h4>
	         	</div>
			</div>
		</div>
		<%
			String id = LectEcriForum.getCours(request.getParameter("title"));
			ArrayList<String> forum= new ArrayList<String>();
			ArrayList<String> string=new ArrayList<String>();
			ArrayList<PaireString> paire=new ArrayList<PaireString>();
			string.add("titresujet");
			paire.add(new PaireString("idcours", id));
			ResultSet set = Examen.totalQuery(string, "forum", paire);
			try {
				int i=0;
				while(set.next()){
					forum.add(set.getString("titresujet"));
					++i;
				}
				set.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			for (int i=0;i<forum.size();i++){%>
			<script type="text/javascript">
				var idCours = <%=id%>;
				var nomCours = escape("<%=request.getParameter("title")%>");
			</script>
			<div class="row" data-nomforum="<%=forum.get(i)%>">
				<div class="col-xs-2 btn">
					<div type="button" class="supprimer btn alert alert-dismissible alert-warning" >
					<i class="fa fa-trash"></i> supprimer </div>  
				</div>
				<div class="btn col-xs-10">
					<div class="accept">
						<div class="col-xs-12">
								<div type="button" class="alert alert-info alert-dismissible">
				    			<div><strong ><%=forum.get(i) %></strong> </div>  
								<div class="col-xs-4">
								</div>
								<div class="col-xs-3">  
								</div>
								<div class="col-xs-3">  
								</div>    
				         	</div>
						</div>
					</div>							
				</div>							
			</div>
     <%}%>
     <br><br><br><br><br>
		<div class="row">
				<div class="col-xs-12">
					<div> 
						<div class="col-xs-3">
						</div>
						<div class="col-xs-3">  
						</div>
						<div class="col-xs-3">  
						</div>
						<div class="col-xs-3">
				    		<div onclick="soumis('<%=id%>')" class="btn btn-info btn-flat" >
				    			Ajouter un sujet   <i class="fa fa-edit"></i>
				    		</div>  
						</div>    
		         	</div>
				</div>
			</div>
    <%@include file="../footer.jsp" %>
    <script type = "text/javascript" src ="../js/script.js"></script>
	
	<!-- jQuery 2.1.4 -->
	<script src="././jQuery-3.1.1.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="././bootstrap.min.js"></script>
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
<script type="text/javascript" src="../MathJax/MathJax.js?config=AM_HTMLorMML-full"></script>
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.2.2/video.js"></script>
<script src="../dist/js/readmore.js"></script>
<script>
<%@include file="chemin.jsp" %>
$('#none').hide(); 
$("#newlink").submit(function(e){
	$("#soumettre").attr("disable",true);
	$("#go").hide();
	$("#none").show();
});
function supprimer(id,theme)
{
	    var theme = unescape(theme);
	    var id = unescape(id);
		var des = confirm("Voulez-vous vraiment supprimer le thème de discussion \""+theme+"\" ?"); 
		
		if(des == true)
		{
			$.ajax({
				url:chemin+'forum',
				type:'POST',
				data:"type=delete&id="+id+"&theme="+theme,
				//dataType:'json',
				
				success:function(code_html,statut){
					if(code_html=='true'){
						window.location.reload();
						$().toastmessage('showSuccessToast','Le thème a été supprimé!');
					}else{
						 alert("Nous n'avons pas pu supprimer le cours, un problème est survenu du côté serveur");							
					}						
				},		
				error : function(resultat, statut, erreur){
					 alert("Nous n'avons pas pu joindre le serveur, vérifier votre connexion");
			    }
			});
		}
		
}

	console.log("start");
	$(".supprimer").click(function(){
		var row = $(this).closest(".row");
		console.log($(row).data('nomforum'));
		supprimer(idCours,$(row).data('nomforum'));
	});
	
	$(".accept").click(function(){
		var row = $(this).closest(".row");
		forum(nomCours,$(row).data('nomforum'));
	});
	
	function forum(nomCours,theme){
		window.location.href="ForumCours.jsp?title="+nomCours+"&theme="+escape(theme);
	}
	
	function soumis(id){
		var theme = prompt("Nom du nouveau sujet","");
	    var id = unescape(id);
		var des = confirm("Voulez créer le sujet de discussion \""+theme+"\"");
		if(des==true){
			$.ajax({
				url:chemin+'forum',
				type:'POST',
				data:"type=create&id="+id+"&theme="+theme,
				//dataType:'json',
				
				success:function(code_html,statut){
					if(code_html=='true'){
						$().toastmessage('showSuccessToast','Le sujet de conversation a été créé!');
						window.location.reload();
					}else{
						 alert("Nous n'avons pas pu créer le sujet, un problème est survenu dans la base de données");						
					}						
				},		
				error : function(resultat, statut, erreur){
					 alert("Nous n'avons pas pu créer le sujet, un problème est survenu");
			    },
				/*complete : function(resultat,statut){
					
				}*/
			});
		}
	}
</script> 
</body>

</html>
<%} %>
