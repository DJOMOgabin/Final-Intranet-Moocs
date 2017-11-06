document.addEventListener('DOMContentLoaded', function (event) {

});

<<<<<<< HEAD
=======
var currentLocation = document.location.href;
var current = currentLocation.substring(currentLocation.indexOf("/",10),currentLocation.lastIndexOf("/"))+"/";
current = current.substring(0,current.indexOf("/",3));
var chemin = current+'/';
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
currentLocation = 'ws'+currentLocation.substring(currentLocation.indexOf(":",0),currentLocation.indexOf("/",9))+"/"+chemin;
var websocket = new WebSocket(currentLocation+"echange ");
	function forumenvoi(id,cours,theme){
		if($("#text").val()!=''){
			var text=$("#text").val();
			websocket.send(id+"\n"+cours+"\n"+theme+"\n"+text);
			$("#text").val("");
		}
	}
	
<<<<<<< HEAD
=======
	
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
	function conversation(nom,text,heure,prop,cours,them){
		var title = $("#title").val();
		var theme = $("#theme").val();
		if(unescape(cours)==title && unescape(them) == theme){
			if(prop=='true'){
				var champ = '<div class="col-md-6">'+
							'</div><div class="direct-chat-msg right col-md-6">'+            
	            				'<div class="direct-chat-text">'+text+'</div>'+
	            				'<div class="direct-chat-info clearfix">'+
	            				'<span class="direct-chat-timestamp pull-right">'+heure+'</span></div>'+
	            			'</div>';
				$("#conversation").append(champ);
			}else{
				var champ ='<div class="direct-chat-msg left col-md-7">'+
					            '<div class="direct-chat-info clearfix">';
				
				if(nom=='Teacher')champ +='<span class="direct-chat-name pull-left" style="color: green;">Teacher</span>';
				else champ +='<span class="direct-chat-name pull-left">'+nom+'</span>';
					            champ +='</div>'+
					            '<div class="direct-chat-text">'+text+
					            '</div>'+
					            '<div class="direct-chat-info clearfix">'+
					              '<span class="direct-chat-timestamp pull-left">'+heure+'</span>'+
					            '</div>'+
				           '</div>';
				$("#conversation").append(champ);	
				var element = document.getElementById("compte");
				var compte = element.innerHTML;
				if(compte=='')compte=0;
				element.innerHTML=(parseInt(compte)+1);
			}
			scrollBas();
		}
		
	}	
	
	function compte(){
		var element = document.getElementById("compte");
		element.innerHTML='';
	}
	
	function scrollBas(){	
		element = document.getElementById('conversation');
		element.scrollTop = element.scrollHeight;
	}
	
	window.onload = scrollBas();
	
	
	function init(){
		websocket.onopen = function(evt) {
				onOpen(evt);
		};
		websocket.onmessage = function(evt) {
				onMessage(evt);
		};
		websocket.onerror = function(evt) {
				onError(evt);
		};		
	}
	function onOpen(evt) {
		$().toastmessage('showSuccessToast','Vous êtes connecté');
	}
	function onMessage(evt) {
		var json = JSON.parse(evt.data);
		conversation(json.nom,json.text,json.heure,json.prop,json.cours,json.theme);
	}
	function onError(evt) {
		alert("Vous avez perdu la connexion!");
	}	
	