function decodage(){
		var arrays = $('label');
		
		//On d�chiffre tous les champs pour �viter les probl�mes d'encodage avant d'envoyer dans la base de donn�es
		arrays.each(function(){
			$(this).text(unescape($(this).text()));
		});
	}
	window.onload = decodage();