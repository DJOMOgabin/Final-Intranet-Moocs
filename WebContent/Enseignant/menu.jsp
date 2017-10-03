
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i>
            <span>Administration</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu"> 
          	  <li><a href="statEtd.jsp"><i class="fa fa-circle-o"></i> Statistiques sur les &eacute;tudiants <span class="label label-primary pull-right"><%=teacher.getNombreTotalEtd()%></span></a></li>
			  <li><a href="statDevoir.jsp"><i class="fa fa-circle-o"></i> Statistiques sur les devoirs <span class="label label-primary pull-right"><%=teacher.getNombreTotalEtd()%></span></a></li>
			  <li><a href="statCours.jsp"><i class="fa fa-circle-o"></i> Statistiques sur les cours <span class="label label-primary pull-right"><%=teacher.getNombreCours()%></span></a></li>
			  <li>
			  	<a href="statistiques_e.jsp">
			  		<i class="fa fa-circle-o"></i>
			  		Statistiques sur les Epreuves
			  	</a>
			  	<!-- <span class="label label-primary pull-right"></span> -->
			  </li>
			  <!--li><a href="cahier.jsp"><i class="fa fa-circle-o"></i> Cahier de pr&eacute;sence</a></li-->  
			<%if(teacher.getStatus().equals("admin")){%>
			  <li><a href="creeEns.jsp"><i class="fa fa-circle-o"></i> Cr&eacute;er un enseignant</a></li>
			  <li><a href="listEns.jsp"><i class="fa fa-circle-o"></i> Lister les enseignants</a></li>
			<%}%>           
          </ul>
        </li>
  <!--li><a href="ConfiChrono.jsp"><i class="fa fa-circle-o"></i> Configurer le chrono </a></li-->