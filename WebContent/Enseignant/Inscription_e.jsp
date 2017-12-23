<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>

	<meta http-equiv="content-type" content="text/html" />
	<meta name="djobiii" content="Love4All" />
  
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="stytest.css">
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
   	<script src="js/bootstrap-dropdown.js"></script>
	<script src="js/dropdown.js"></script>
	<%-- Script Ajax pour controler le departement --%>	
    <title> Inscription </title>

</head>

<body>





<div class="container">

<div class="row" id="pre_ins">
 
    <center> <h1> S'inscrire, c'est simple </h1> </center>
    
    <center>
        <p> <b>Pour  s'inscrire, veuillez remplir les informations suivantes  </b></p>
    </center>

      <hr />
</div>
	
	<% if(request.getParameter("erreur")!=null){ %>
	 <center> <font color="#FF0000"> <p>Erreur :  </p> <b> <%=request.getParameter("erreur") %></b></font>  </center>
    
    <%} %>
    
    <div id="Inscription_fen">
    
    <form id="formInscription" method="post" action="ajoutUser.jsp" class="form-horizontal">
    
    <fieldset>
    
        <legend>Informations Personnelle</legend>
    
    
    	
    	    
        <div class="form-group">    	
       		  
       		  <label for="inputNom" class="col-sm-2 control-label"> NOM </label>
       		  <div class="col-sm-8">
       		  <input type="text"  autofocus class="form-control" name="nom" placeholder="Veuillez Entrez Votre Nom (ex: MVONDO DJOB III)" required>
       		   </div>
        </div>
        <br/>
        <div class="form-group">
            
             <label for="inputPrenom" class="col-sm-2 control-label"> PRENOM </label>
             <div class="col-sm-8">
            <input type="text"  name="prenom" class="form-control" placeholder="Veuillez Entrez Votre Prenom (ex: BARBE THYSTERE III)"  required>
             </div>
         </div>
         <br/>
          <div class="form-group">
        	<label for="inputFaculte" class="col-sm-2 control-label"> FACULTE </label>
        	<div class="col-sm-8">
        		<input placeholder="Veuillez Entrez Votre Faculte (ex : ENSP,CUSS,ENSGSI)" type="text" id="faculte" name="faculte" required class="col-sm-8 form-control">
        	</div>
        </div>          
         <br/>
		<div class="form-group">
            
             <label for="inputMatricule" class="col-sm-2 control-label"> MATRICULE </label>
             <div class="col-sm-8">
            	<input  placeholder="Veuillez Entrez Votre Matricule Scolaire (ex: 11P252, 468X8019), Entrez Rien si l'on ne possede pas encore de matricule" type="text" id="matricule" name="matricule" required class="col-sm-8 form-control" >
            </div>
           
            
        </div>   
       
 </fieldset>
             
             <br/>
           
 
    	<br/>
    	
   


<br/>

    <fieldset>
    
    
        <legend> Informations de Connexion </legend>
        
         
        <div class="form-group">
        
        	<label for="inputEmail" class="col-sm-2 control-label"> EMAIL </label>
        	<div class="col-sm-8"> 
        	<input type="email" name="email" required  placeholder="Veuillez Entrez Votre Email (ex: djobiii2078@gmail.com, aristide.marie@yahoo.com)" class="col-sm-8 form-control">
    		</div>
    	</div>
    <br/>
        
        <div class="form-group">
        
        	<label for="inputLogin" class="col-sm-2 control-label"> PSEUDO </label> 
        	<div class="col-sm-8">
        	<input type="text" name="login" placeholder="Veuillez Entrez Votre pseudi (ex: djobiii2078, aristidemarie )" required class="col-sm-8 form-control">
        	</div>
        </div>
        
        <br/>
        
        
        <div class="form-group">
        	
        	<label for="inputPassword" class="col-sm-2 control-label"> MOT DE PASSE  </label>
        	<div class="col-sm-8">
        	<input type="password"  name="password" placeholder="Veuillez Entrez Votre Mot de Passe (ex: ornella2078, jeanpierrefokou)" required class="col-sm-8 form-control">
       		</div>
        </div>
        <br/>
        <div class="form-group">
        	
        	<label for="inputPassword" class="col-sm-2 control-label"> RESAISIR LE MOT DE PASSE </label>
        	<div class="col-sm-8">
        	<input type="password"  name="repass" placeholder="Veuillez resaisir le mot de passe précedement enregistré " required class="col-sm-8 form-control">
       		</div>
        </div>
        
        
        
        <br/>
       
    </fieldset>
    <br></br>
    
    <hr/>
    
    <div class="col-lg-12">
    <center> <button class="btn btn-info btn-lg"> S'INSCRIRE <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> </button> </center>
    </div>
    <br/>
    
    <hr/>
    
    </form>
    
    </div>
   
</div>



</body>
</html>
