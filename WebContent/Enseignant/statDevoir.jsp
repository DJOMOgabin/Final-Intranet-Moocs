<%if (session.getAttribute("enseignant") == null) {%>
<jsp:forward page="../home.jsp?page=index.jsp"/><%} else {%>
<%@ include file = "../WEB-INF/jspf/bean/teacher.jspf"%>
<%@ include file = "../WEB-INF/jspf/bean/devoirBean.jspf"%>
<%@ include file="../WEB-INF/jspf/bean/connecteurforum.jspf" %>
<%@ page import = "java.util.ArrayList,java.util.List, Modele.Cours, Modele.constante, Modele.User,Modele.Devoir,Modele.DevoirBean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>INTRANET MOOCs| Enseignant</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.5 -->
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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
	<%@ include file="entete2.jsp" %>            <!-- Graphe -->
            <!--#########################################################################  -->
<<<<<<< HEAD
            <%  String id1 = request.getParameter("id");
                String titre = request.getParameter("titre");
=======
            <%

                String id1 = request.getParameter("id");
                String titre = request.getParameter("titre");
               
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
                String code = devoirBean.getCode(id1 == null ? null : Integer.valueOf(id1));
                out.print("<input type=\"text\" class=\"hidden\" id =\"titre\" value=\"" + titre + "\"/>" + "\n");
            %>
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
            <script type="text/javascript">
                google.load("visualization", "1", {packages: ["corechart"]});
                google.setOnLoadCallback(drawChart);
                function drawChart() {


                    var data = google.visualization.arrayToDataTable(<%=code%>);
                    var titre = document.getElementById("titre").getAttribute('value');
   if(titre==='null'){
	   titre='';
	   }
                    var options = {
                        title:  titre,
                        is3D: true,
                        fontSize:10,
                    };
                    var chart = new google.visualization.PieChart(document.getElementById("graph"));
                    google.visualization.events.addListener(chart, 'ready', function () {
                        var content = '<img id="graphe" src="' + chart.getImageURI() + '">';
                        $('#graph_pdf').append(content);
                    });
                    chart.draw(data, options);
                }
            </script>
            
             <!--#########################################################################  -->
              <!-- Graphe -->
              
              
              <!-- Tableau affichant la liste des devoirs -->
              <!-- ######################################################################## -->
            
                <section class="content">
                    <div class="row">
<<<<<<< HEAD
                        <div class="col-md-5 col-lg-5">
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title"><i class="fa fa-bar-chart"></i> FREQUENCE DES NOTES</h3>
=======
                        <div class="col-md-6 col-lg-6 col-md-12 col-xs-12">
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title"><i class="fa fa-bar-chart"></i> FREQUENCE DES NOTES NOTES</h3>
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
                                </div>
                                <div class="box-body">
                                    <div id="graph" style="height: 300px">

                                    </div>

                                    <div id="graph_pdf" style="display:none;"></div>

                                </div>
                            </div>
                        </div>
<<<<<<< HEAD
                        <div class="col-md-7 col-lg-7">
=======
                        <div class="col-md-6 col-lg-6 col-md-12 col-xs-12">
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><i class="fa fa-table"></i> TABLEAU RECAPITULATIF DES DEVOIRS</h3>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive">
                                        <table id="table_id" class="table table-striped table-bordered table-hover display">
<<<<<<< HEAD
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th><center>TITRE DU COURS</center></th>
                                                    <th><center>NOMBRE DE DEVOIRS</center></th>
                                                    <th><center>MOYENNE / 20</center></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%List<Devoir> list = DevoirBean.getDevoirBD(""+teacher.getId());
                                            for (int i = 0; i < list.size(); i++) {%>
	                                            <tr class="<%=i%2==0?"success":"info"%>">
				            						<td> <center><%=(i+1)%></center></td>
				            						<td> <center><%=list.get(i).getNomCours()%></center></td>
				            						<td> <center><%=list.get(i).getNombreDevoir()%></center></td>
				            						<td> <center><%=list.get(i).getNoteMoyenne()%></center></td>                                            
	                                            </tr>
                                            <%}%>
=======

                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th>  MATIERE   </th>
                                                    <th>  # DEVOIR </th>
                                                    <th>#ETAT </th>
                                                    <th># TAUX DE PARTICIPATION </th>
                                                    <th># FREQUENCE DES NOTES </th>

                                                </tr>

                                            </thead>

                                            <tbody>

                                                <%
                                                
                                                List<Devoir> listd = devoirBean.getDevoirBD();
                                                    Cours s = new Cours();
                                                  
                                                    for (int i = 0; i < listd.size(); i++) {%>

                                                <tr class="<%=i % 2 == 0 ? "success" : "info"%>">

                                                    <td><%=i + 1%></td>
                                                    <td><%=connecteurForum.getNomCoursID(listd.get(i).getIdCours())%></td>

                                                    <td><%=listd.get(i).getTypeDevoir()%></td>

                                                    <td><%=listd.get(i).getEtat()%></td>

                                                    <td><%=devoirBean.getnombreParticipant(listd.get(i).getIdDevoir())%></td>
                                                    <td> <a href="stat_devour_controle.jsp?id=<%=listd.get(i).getIdDevoir()%>"><span title="Voir la fr�quence des notes" class="glyphicon glyphicon-stats"></span></a></td>
                                                </tr>
                                                <%} %>

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
                                            </tbody>

                                        </table>
                                    </div>
                                    <br/>
                                    <a href="#" id="imprime" class="pull-right btn btn-success"> IMPRIMER <i class="fa fa-print"></i></a>
<<<<<<< HEAD
                                </div>
                            </div>
                        </div>
                    </div>		
    <%@include file="../footer.jsp" %>
        <!-- /#wrapper -->
=======


                                </div>
                            </div>
                        </div>

                    </div>		
                
    <%@include file="../footer.jsp" %>
    

        <!-- /#wrapper -->

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
        <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>


        <!-- Bootstrap 3.3.5 -->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="../dist/js/app.min.js"></script>
        <!-- Sparkline -->
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

        <script src="../js/jspdf.js"></script>
        <script src="../js/FileSaver.js"></script>
        <script src="../js/zlib.js"></script>
        <script src="../js/png.js"></script>
        <script src="../js/jspdf.plugin.addimage.js"></script>
        <script src="../js/jspdf.plugin.png_support.js"></script>
        <script src="../js/jspdf.plugin.autotable.js"></script>
        <script src="../js/jspdf.plugin.standard_fonts_metrics.js"></script>
        <script src="../js/jspdf.plugin.split_text_to_size.js"></script>

        <script src="../js/base64.js"></script>
        <script src="../js/sprintf.js"></script>
        <script src="../js/html2canvas.js"></script>
        <script src="../js/ace.js"></script>
        <!-- Impression -->
<!-- ######################################################################## -->
        <script>


                $(document).ready(function () {
                    $('#table_id').DataTable({
                        "paging": true,
                        "lengthChange": true,
                        "searching": true,
                        "ordering": true,
                        "info": true,
                        "autoWidth": true,
                        "responsive": true
                    });
                });



                $('#imprime').click(function (e) {

    var titre = document.getElementById("titre").getAttribute('value');
                    var doc = new jsPDF('p', 'pt');
                    var headerImgData = 'data:image/png;base64,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';
                    var header = function (data) {
                        doc.setFontSize(15);
                        doc.setTextColor(40);
                        doc.setFontStyle('normal');
                        doc.addImage(headerImgData, 'JPEG', data.settings.margin.left, 40, 25, 25);
                        doc.text("Tabbleau de bord des notes.\n"+titre, data.settings.margin.left + 35, 60);
                        
                    };
                    var totalPagesExp = "{total_pages_count_string}";
                    var footer = function (data) {
                        var str = "Page " + data.pageCount;
                        // Total page number plugin only available in jspdf v1.0+
                        if (typeof doc.putTotalPages === 'function') {
                            str = str + " of " + totalPagesExp;
                        }
                        doc.text(str, data.settings.margin.left, doc.internal.pageSize.height - 30);
                    };

                    var options = {
                        beforePageContent: header,
                        afterPageContent: footer,
                        margin: {top: 160}
                    };


                    var elem = document.getElementById("table_id");

                    var res = doc.autoTableHtmlToJson(elem);

                    doc.autoTable(res.columns, res.data, options);
                    var val = doc.autoTableEndPosY() + 10;
                    doc.addImage($('#graphe').attr("src"), 'png', 0, val);

                    if (typeof doc.putTotalPages === 'function') {
                        doc.putTotalPages(totalPagesExp);
                    }

                    var bloburi = doc.output('bloburi');
                    window.open(bloburi);

                });
        </script>
        
<!-- ######################################################################## -->

<!-- Impression -->
    </body>

</html>
<%}%>
