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
	}
	window.onload = decodage();