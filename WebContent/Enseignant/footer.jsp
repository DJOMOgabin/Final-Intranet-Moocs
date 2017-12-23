</section>
</div>
	
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.0
    </div>
    <strong>Copyright &copy; 2015-2017- 4GI ENSPY 
    	<a href="#" data-toggle="modal" data-target="#myModal">INTRANET MOOCs</a> .</strong> All rights
    reserved.
  </footer> 
</div>


<!-- Ici, nous allons présenter le texte d'introduction à Intranet Mooc ... -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
					<span class="logo-lg"><b>INTRANET</b> MOOCs</span>
				</div>
				<div class="modal-body">
					<article style="font-size: 20px; width:95%">
	  	Intranet MOOC est une plateforme de MOOCs locale. Elle permet aux enseignants de poster des cours
	  	audios et vid&eacuteos, cr&eacuteer des &eacutevaluations.<br> 
	  </article>
	  <br>
	  <p style="font-size: 20px;">Cette plateforme a &eacutet&eacute d&eacutevelopp&eacutee dans le cadre d'un projet acad&eacutemique.<br><br> encadrer par: </p><br>
	  
	  <!-- Left-aligned media object -->
	  <%if(session.getAttribute("user")!=null){%>
	  <div class="media">
	    <div class="media-left">
	    	<a href="images/bb.jpg" target="_blank"><img src="images/bb.jpg" class="media-object les_images" style="width:60px"></a>
	    </div>
	    <div class="media-body">
	      <h4 class="media-heading">Dr. Ing. BATCHAKUI B&eacuternab&eacute</h4>
	      <p>Professeur à ENSPY, D&eacutepartement G&eacutenie Informatique</p>
	    </div>
	  </div>
	  <br>
	  <%}else{%>
		<div class="media">
	    <div class="media-left">
	    	<a href="../images/bb.jpg" target="_blank"><img src="../images/bb.jpg" class="media-object les_images" style="width:60px"></a>
	    </div>
	    <div class="media-body">
	      <h4 class="media-heading">Dr. Ing. BATCHAKUI B&eacuternab&eacute</h4>
	      <p>Professeur à ENSPY, D&eacutepartement G&eacutenie Informatique</p>
	    </div>
	  </div>
	  <br>
	  <%}%>
	  <p style="font-size: 20px;">D&eacutevelopp&eacute par: </p><br>
	  
	  <a href="#" data-toggle="modal" data-target="#myModal1">Promotion 2017</a>
	  <br>
	  <br>
	  <a href="#" data-toggle="modal" data-target="#myModal2">Promotion 2018</a>
	 </div>
	</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>

<!-- Ici nous allons présenter les différentes promotions, les promoteurs et les suiveurs -->

<!-- promotion 2017 -->

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<span class="logo-lg"><b>INTRANET</b> MOOCs</span>
			</div>
			<div class="modal-body">
	  <p style="font-size: 20px; text-align:center; color:blue;"><b><u>Promotion 2017</u></b></p><br>
			<%if(session.getAttribute("enseignant")!=null){%>
				  <div class="media">
				    <div class="media-left">
				    	<a href="../images/djobi.jpg" target="_blank"><img src="../images/djobi.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">MVONDO DJOB BARBE Thystère</h4>
				      <p>Matricule 11P252</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				    	<a href="../images/joseph.jpg" target="_blank"><img src="../images/joseph.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">DOMGUIA Joseph Marie</h4>
				      <p>Matricule 12P274</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				    	<a href="../images/ivan.jpg" target="_blank"><img src="../images/ivan.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">DJOUAKA KINFACK Ivan Lionel</h4>
				      <p>Matricule 12P072</p>
				    </div>
				  </div>
				  <br>
			<%}else{%>				
				<div class="media">
				  <div class="media">
				    <div class="media-left">
				    	<a href="images/djobi.jpg" target="_blank"><img src="images/djobi.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">MVONDO DJOB BARBE Thystère</h4>
				      <p>Matricule 11P252</p>
				    </div>
				  </div>
				</div>
				<br>
				<div class="media">
				    <div class="media-left">
				    	<a href="images/joseph.jpg" target="_blank"><img src="images/joseph.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">DOMGUIA Joseph Marie</h4>
				      <p>Matricule 12P274</p>
				    </div>
				  </div>
				  <br>
				<div class="media">
				    <div class="media-left">
				    	<a href="images/ivan.jpg" target="_blank"><img src="images/ivan.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">DJOUAKA KINFACK Ivan Lionel</h4>
				      <p>Matricule 12P072</p>
				    </div>
				  </div>
				  <br>
			<%}%>
			<br>
 			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>


<!--  Promotion 2018 -->

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<span class="logo-lg"><b>INTRANET</b> MOOCs</span>
			</div>
			<div class="modal-body">
	  <p style="font-size: 20px; text-align:center; color:blue;"><b><u>Promotion 2018</u></b></p><br>
				  <%if(session.getAttribute("enseignant")!=null){%>
				  <div class="media">
				    <div class="media-left">
				    	<a href="../images/Ange.jpg" target="_blank"><img src="../images/Ange.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">MEKOULOU ENOCH Ange</h4>
				      <p>Matricule 12P191</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				      <a href="../images/Gabin.jpg" target="_blank"><img src="../images/Gabin.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">NKUIGWA DJOMO Gabin</h4>
				      <p>Matricule 13P053</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				    	<a href="../images/Um.jpg" target="_blank"><img src="../images/Um.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">UM-GWET Ruben</h4>
				      <p>Matricule 15P210</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				    	<a href="../images/Essi.jpg" target="_blank"><img src="../images/Essi.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">AMEGAYIBOR Essi Linda</h4>
				      <p>Matricule 16P333</p>
				    </div>
				  </div>
				  <%}else{%>				
				<div class="media">
				    <div class="media-left">
				    	<a href="images/Ange.jpg" target="_blank"><img src="images/Ange.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">MEKOULOU ENOCH Ange</h4>
				      <p>Matricule 12P191</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				      <a href="images/Gabin.jpg" target="_blank"><img src="images/Gabin.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">NKUIGWA DJOMO Gabin</h4>
				      <p>Matricule 13P053</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				    	<a href="images/Um.jpg" target="_blank"><img src="images/Um.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">UM-GWET Ruben</h4>
				      <p>Matricule 15P210</p>
				    </div>
				  </div>
				  <br>
				  <div class="media">
				    <div class="media-left">
				    	<a href="images/Essi.jpg" target="_blank"><img src="images/Essi.jpg" class="media-object les_images" style="width:60px"></a>
				    </div>
				    <div class="media-body">
				      <h4 class="media-heading">AMEGAYIBOR Essi Linda</h4>
				      <p>Matricule 16P333</p>
				    </div>
				  </div>
				<br>
			<%}%>
			<br>
 			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>




<style type="text/css">
   .modal-content{
  background-color:#222;
  color:#ddd;
}

.modal-dialog {
  width: 400px;
  overflow: auto;
  background-color:#333;
}

/* custom animation */
.modal.fade {
  left: -50%;
  -webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
     -moz-transition: opacity 0.3s linear, left 0.3s ease-out;
       -o-transition: opacity 0.3s linear, left 0.3s ease-out;
          transition: opacity 0.3s linear, left 0.3s ease-out;
}

.modal.fade.in {
  left: 100px;
}

</style>


