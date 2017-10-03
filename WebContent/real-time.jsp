<script>
function date_heure(id,duree)
{
        date = new Date;
        s = date.getSeconds();
        temps = duree*60*60-s;
        h = (temps/60)/60;
        m = (temps/60)%60;
        s = temps%60;
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
        resultat = 'Il reste: '+h+':'+m+':'+s;
        document.getElementById(id).innerHTML = resultat;
        setTimeout('date_heure("'+id+'","'+duree+'");','1000');
        return true;
}
</script>


