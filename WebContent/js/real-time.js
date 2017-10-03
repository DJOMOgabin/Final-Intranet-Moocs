var compteur=-1;
var bol=0;
var glo=0;
var coleur=black;
var delai=0;
function date_heure(id,duree,title)
{
        date = new Date;
        s = date.getSeconds();
        if(compteur==-1){
        	delai=s;
        	s=0;
        }
        if(s==0&&bol==0){
        	if(compteur==-1){
            	s=delai;
            }
        	compteur++;
        	bol=1;
        }else if(s!=0 && bol!=0) bol=0;

        	temps = Math.floor(duree*60*60-(compteur*60+s-delai));
        	s = temps%60;
            div = Math.floor(temps/60);
            m = div%60;
            h = Math.floor(div/60);
            if(temps<=60*5){
            	if(s%3==1){
                	coleur="black";
                }else if(s%3==0){
                	if(temps<=60){
                		coleur="red; font-size: 1.5em;";
                	}else{
                		coleur="red;";                		
                	}
                }else {
                	coleur="green";
                }
            }
            
            if(temps==59 && glo==0){
            	$().toastmessage('showWarningToast','Il vous reste moins 1 minute!');
            	glo=1;
            }
            
            if(h<10)
            {
                    h = "0"+h;
            }
            if(m<10)
            {
                    m = "0"+m;
            }
            if(s<10)
            {
                    s = "0"+s;
            }
            if(temps<=0){
            	alert("Votre temps s'est ecoule!!!");
            	window.location.href="liste_e.jsp?title="+title;
            	return false;
            }
            resultat = h+':'+m+':'+s;
            document.getElementById("temps").setAttribute("value",resultat);
            document.getElementById(id).setAttribute("style", "color: "+coleur);
            document.getElementById(id).innerHTML = resultat;
            setTimeout('date_heure("'+id+'","'+duree+'","'+title+'");','100');
            return true;
        	
}
