/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.addEventListener('DOMContentLoaded', function (event) {
	bool=true;
});
<<<<<<< HEAD
=======

String.prototype.sansAccent = function(){
    var accent = [
        /[\300-\306]/g, /[\340-\346]/g, // A, a
        /[\310-\313]/g, /[\350-\353]/g, // E, e
        /[\314-\317]/g, /[\354-\357]/g, // I, i
        /[\322-\330]/g, /[\362-\370]/g, // O, o
        /[\331-\334]/g, /[\371-\374]/g, // U, u
        /[\321]/g, /[\361]/g, // N, n
        /[\307]/g, /[\347]/g, // C, c
    ];
    var noaccent = ['A','a','E','e','I','i','O','o','U','u','N','n','C','c'];
     
    var str = this;
    for(var i = 0; i < accent.length; i++){
        str = str.replace(accent[i], noaccent[i]);
    }
     
    return str;
}

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
function surligne(champ, erreur){
   if(erreur)
      champ.style.backgroundColor = "#fba";
   else
      champ.style.backgroundColor = "";
}

function filterFloat(value) {
    if (/^(\-|\+)?([0-9]+(\.[0-9]+)?|Infinity)$/
      .test(value))
      return Number(value);
  return NaN;
}

function filterInt(value) {
	  if (/^(\-|\+)?([0-9]+|Infinity)$/.test(value))
	    return Number(value);
	  return NaN;
	}

//On verifie si la valeur entrée est un numérique et positive
function verifNumber(champ){
   var age = filterInt(champ.value);
   if(isNaN(age) || age < 0){
      surligne(champ, true);
      return false;
   }else{
      surligne(champ, false);
      return true;
   }
}

function verifNumber2(champ){
	   var age = filterFloat(champ.value);
	   if(isNaN(age)){
	      surligne(champ, true);
	      return false;
	   }else{
	      surligne(champ, false);
	      return true;
	   }
	}

<<<<<<< HEAD

=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
function chiffrer(){
	var arrays = $('textarea');
	var exercice = $('.exercice');
	//On chiffre tous les champs pour éviter les problèmes d'encodage avant d'envoyer dans la base de données

	$('.titre').val($('.titre').val().sansAccent());
	arrays.each(function(){
		$(this).val(escape($(this).val()));
	});
	exercice.each(function(){
		$(this).val(escape($(this).val()));
	});
}
	
function verifForm(f){
	var jour = verifNumber(f.jour);
	var heure = verifNumber(f.heure);
	var minute = verifNumber(f.minute);
	var juste = verifNumber2(f.juste);
	var mauvais = verifNumber2(f.mauvais);
	var aucun = verifNumber2(f.aucun);
	if(jour & heure & minute & juste & mauvais & aucun){
		chiffrer();
		return true;
	}else{
	    alert("Veuillez remplir correctement tous les champs");
	    return false;
	}	
}

	var i,j;
    function exercice(exer,ques){
    	if(bool==true){
    		i=exer;
    		j=ques;
    		bool=false;
<<<<<<< HEAD
    	}    	
=======
    	}
    	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
    	i++;
    	j=0;
    	var tr = document.createElement('div');
    	tr.innerHTML = "<div id='div"+i+"'><label for='exercice'><u><b>Exercice "+i+":</b></u> </label>" +
    			"<input class='exercice form-control' type='text' name='exercice"+i+"' value='' placeholder=\"Titre de l' exercice\" size='100' maxlength='100'/>" +
    			"<br><br><br><p><textarea rows='7' cols='150' class='enonce  form-control' name='enonce"+i+"'  placeholder=\"Veuillez entrer l'enoncé de votre exercice\"></textarea><p>";
    	document.getElementById('epreuve').appendChild(tr);
<<<<<<< HEAD
    	question(i,j);    	
=======
    	question(i,j);
    	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
    }
    
    function question(exer,ques){
    	if(bool==true){
			i=exer;
			j=ques;
			bool=false;
    	}
    	j++;
		var td = document.createElement('div');
		td.innerHTML = "<label for='question'><b>"+j+") </b></label>"+
		"<textarea rows='1' cols='100' class='question  form-control' name='question"+i+j+"' placeholder='Entrer la question'></textarea>"+
		"<br> <label for = 'commentaire' class='comment'>(Sélectionner la bonne réponse)</label><div id='propo"+i+j+"'>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' type='radio' name='proposition"+i+j+"' value='1'/>"+
		"<label class='lettre' for='lettre'><b><i>A ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"1' placeholder='Première proposition'></textarea>"+
		"</div></div><p>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' type='radio' name='proposition"+i+j+"' value='2'/>"+
		"<label class='lettre' for='lettre'><b><i>B ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"2' placeholder='Deuxième proposition'></textarea>"+
		"</div></div><p>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' type='radio' name='proposition"+i+j+"' value='3'/>"+
		"<label class='lettre' for='lettre'><b><i>C ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"3' placeholder='Troisième proposition'></textarea>"+
		"</div></div><p>"+
		"<div class='row'><div class='col-md-1'>"+
		"<input class='proposition' type='radio' name='proposition"+i+j+"' value='4'/>"+
		"<label class='lettre' for='lettre'><b><i>D ) </i></b></label>"+
			"</div><div class='col-md-11'>"+
		"<textarea rows='1' cols='100' class='propositionText  form-control' name='propositionText"+i+j+"4' placeholder='Quatrième proposition'></textarea>"+
			"</div></div><p>"+
		"</div>";
    	document.getElementById('div'+i).appendChild(td);
<<<<<<< HEAD
=======

>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
    }
    
    