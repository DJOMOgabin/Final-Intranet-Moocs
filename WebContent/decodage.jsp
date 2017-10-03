function decodage(){
		var arrays = $('label');
		
		//On déchiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données
		arrays.each(function(){
			$(this).text(unescape($(this).text()));
		});
	}
	window.onload = decodage();