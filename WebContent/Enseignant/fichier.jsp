<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
 <% int semaine=0; %>
 <%if (request.getParameter("semaine")!=null){ semaine =Integer.parseInt(request.getParameter("semaine"));}%>
 
 

 <form method="post" class="form-horizontal" id="ajoutCours" action="controle_fichier.jsp?nomCours=<%=request.getParameter("title")%>&&semaine=<%=semaine%>" enctype="multipart/form-data">

 	<fieldset>
 		
 		<legend> Semaine <%=semaine %></legend>
 		<center>
 		
 		<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-1 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept=".pdf" onchange="change(1);" id="1" class="form-control" value="Uploader Video" name="video1" required/>
 			</div>
 			<div class="col-sm-4" id="place1">
 				
 			</div>
 		</div>
 			<br/>	<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-1 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept=".pdf" onchange="change(2);" id="2" class="form-control" value="Uploader Video" name="video2"/>
 			</div>
 			<div class="col-sm-4" id="place2">
 				
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-1 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept=".pdf" onchange="change(3);" id="3" class="form-control" value="Uploader Video" name="video3"/>
 			</div>
 			<div class="col-sm-4" id="place3">
 				
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-1 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept=".pdf" onchange="change(4);" id="4" class="form-control" value="Uploader Video" name="video4"/>
 			</div>
 			<div class="col-sm-4" id="place4">
 				
 			</div>
 		</div>
 			<br/>	
 			<div class="form-group">
 		
 			<label for="inputName3" class="col-sm-2 control-label">  </label>
 			<label for="inputName3" class="col-sm-1 control-label">  </label>
 			<div class="col-offset-3 col-sm-4">
 				<input type="file" accept=".pdf" onchange="change(5);" id="5" class="form-control" value="Uploader Video" name="video5"/>
 			</div>
 			<div class="col-sm-4" id="place5">
 				
 			</div>
 		</div>
 			<br/>	
 		
 		
 		
 		</center>
 		
 		<hr/>
 	<center> <button id="soumettre" data-loading-text = "Soummission en cours ... "  auto-complete="off" class="btn btn-default  btn-lg"> Soumettre  <i class="fa fa-upload"></i></button> <span style="display : none; background-color : blue;" id="span"> <img src="img/load.gif"/></span> </center>  	
 	</fieldset>
 	
 	
</form> 
 

 