<<<<<<< HEAD
<%@include file="Enseignant/accent.jsp"%>

function decodage(){
		var arrays = $('label');
		var temp
		//On d�chiffre tous les champs pour �viter les probl�mes d'encodage avant d'envoyer dans la base de donn�es
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
		
		//On d�chiffre tous les champs pour �viter les probl�mes d'encodage avant d'envoyer dans la base de donn�es
		arrays.each(function(){
			$(this).text(unescape($(this).text()));
		});
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	}
	window.onload = decodage();