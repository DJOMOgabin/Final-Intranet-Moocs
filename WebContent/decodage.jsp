<<<<<<< HEAD
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
=======
function decodage(){
		var arrays = $('label');
		
		//On déchiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		arrays.each(function(){
			$(this).text(unescape($(this).text()));
		});
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	}
	window.onload = decodage();