
<jsp:useBean id="message" class="forum.MessageForum" scope="request"/>

<form class="form-horizontal" action="<%=request.getParameter("actionFormulaire")%>" method="post">

<fieldset>
	<legend> Ajouter Message </legend>
	
	
		<div class="form-group">
		
				<label style="display: none;" for="inputSujet" class="col-sm-2 control-label"> SUJET </label>
				<div class="col-sm-8">
				 <input style="display: none;" name="sujet"  type="text" class="col-sm-8 form-control" value="<%=message.getSujet()!=null ? message.getSujet():"" %>">
				</div>
		</div>
	
	
		<div class="form-group">
		
		<label for="inputText" class="col-sm-2 control-label"> MESSAGE </label>
		<div class="col-sm-8">
		<textarea name="texte" cols="50" class="form-control" rows="5"><%=message.getTexte()!=null ? message.getTexte():"" %></textarea>
		</div>
		
	</div>


	
	
</fieldset>
	<br/>
	 <center><input type="submit" class="btn btn-lg btn-primary" value="<%=request.getParameter("labelSubmit")%>"></center>

</form>