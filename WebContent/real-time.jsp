<script>
<<<<<<< HEAD
function heure_actuelle(id)
{
        date = new Date;
        annee = date.getFullYear();
        moi = date.getMonth();
        mois = new Array('Janvier', 'F&eacute;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao&ucirc;t', 'Septembre', 'Octobre', 'Novembre', 'D&eacutecembre');
        j = date.getDate();
        jour = date.getDay();
        jours = new Array('Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi');
        h = date.getHours();
=======
function date_heure(id,duree)
{
        date = new Date;
        s = date.getSeconds();
        temps = duree*60*60-s;
        h = (temps/60)/60;
        m = (temps/60)%60;
        s = temps%60;
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
        if(h<10)
        {
                h = "0"+h;
        }
<<<<<<< HEAD
        m = date.getMinutes();
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
        if(m<10)
        {
                m = "0"+m;
        }
<<<<<<< HEAD
        s = date.getSeconds();
=======
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
        if(s<10)
        {
                s = "0"+s;
        }
<<<<<<< HEAD
        resultat = jours[jour]+',  '+j+' '+mois[moi]+' '+annee+'  '+h+':'+m+':'+s;
        document.getElementById(id).innerHTML = resultat;
        setTimeout('heure_actuelle("'+id+'");','1000');
        return true;
}

window.onload = heure_actuelle('heure');
=======
        resultat = 'Il reste: '+h+':'+m+':'+s;
        document.getElementById(id).innerHTML = resultat;
        setTimeout('date_heure("'+id+'","'+duree+'");','1000');
        return true;
}
>>>>>>> 647841db7d091c842900a7c18b2079aeb8d6ee5b
</script>


