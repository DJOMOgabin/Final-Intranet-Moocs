<%@include file="Enseignant/accent.jsp"%>

function decodage(){
		var arrays = $('label');
		var temp
		//On déchiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		arrays.each(function(){
			$(this).text($(this).text().replaceAll("%0A","<br>"));
			$(this).text(unescape($(this).text()));		
			temp = $(this).text();
			$(this).text("");
			$(this).append(temp);
		});	
	}
	window.onload = decodage();