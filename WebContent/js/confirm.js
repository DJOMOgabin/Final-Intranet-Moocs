		function supp(nomenseignant,cours){
	  		    var nomenseignant = unescape(nomenseignant);
	  			var des = confirm("Voulez-vous vraiment supprimer le cours \""+cours+"\" ?"); 
				$("#password").val("");
	  			if(des == true)
	  			{
	  				//window.location.href="liste.jsp?title="+nomCours+"&epreuve="+nomepreuve;
	  				$.ajax({
	  					url:chemin+'forum',
	  					type:'GET',
	  					data:"type=supp&enseignant="+nomenseignant+"&cours="+cours,					
	  					success:function(code_html,statut){
	  						if(code_html=='true'){
	  							$().toastmessage('showSuccessToast','Le cours a été supprimé avec succes!');
	  							window.location.reload();
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
	  		var row;
	  		$(".supp").click(function(){
	  			row = $(this).closest("tr");
	  		});
	  		
	  		$(".confirm").click(function(){
	  			var password = $("#password").val();
	  			if(password!=''){
	  				confirmer(password,id,$(row).data('nomcours'),nomenseignant);
	  			}			
	  		});
	  		
	  		function confirmer(pass,id,cours,nomenseignant){
	  			$.ajax({
	  				url:chemin+'forum',
	  				type:'GET',
	  				data:"type=auth&mot="+pass+"&id="+id,					
	  				success:function(code_html,statut){
	  					if(code_html=='true'){
	  						if(nomenseignant!='*'){
		  						supp(nomenseignant,cours);	  							
	  						}else{
	  							suppens(cours);
	  						}
	  					}else{
	  						 alert("Mot de passe incorrect");
	  						$("#password").val("");
	  					}						
	  				},		
	  				error : function(resultat, statut, erreur){
	  					 alert("Nous n'avons pas pu joindre le serveur, vérifier votre connexion");
	  			    }
	  			});
	  		}
	  		
	  		function suppens(nomenseignant){
	  		    var nomenseignant = unescape(nomenseignant);
	  			var des = confirm("Voulez-vous vraiment supprimer l'enseignant \""+nomenseignant+"\" ?"); 
				$("#password").val("");
	  			if(des == true)
	  			{
	  				$.ajax({
	  					url:chemin+'forum',
	  					type:'GET',
	  					data:"type=suppens&enseignant="+nomenseignant,					
	  					success:function(code_html,statut){
	  						if(code_html=='true'){
	  							$().toastmessage('showSuccessToast','L\'enseignant a été supprimé avec succes!');
	  							window.location.reload();
	  						}else{
	  							 alert("Nous n'avons pas pu supprimer l'enseignant, un problème est survenu du côté serveur");						
	  						}						
	  					},		
	  					error : function(resultat, statut, erreur){
	  						 alert("Nous n'avons pas pu joindre le serveur, vérifier votre connexion");
	  				    }
	  				});
	  			}
	  			
	  	}