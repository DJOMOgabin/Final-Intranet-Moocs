
		function remplirvideo()
		
		{
			
			if(window.XMLHttpRequest)
				{
					xml=new XMLHttpRequest();
				}
			else
				{
					xml = new ActiveXObject("Microsoft.XMLHTTP");
				}
			xml.onreadystatechange=function()
			
			{
				if(xml.readyState==4 && xml.status==200)
					
					{
						document.getElementById("suite_cours").innerHTML=xml.responseText;	
					}
			}
			
			xml.open("GET","video.jsp?semaine="+document.getElementById("semaine_cours").value,false);
			xml.send();
		}
		
		function remplirvi()
	 	{

			
			if(window.XMLHttpRequest)
				{
					xml=new XMLHttpRequest();
				}
			else
				{
					xml = new ActiveXObject("Microsoft.XMLHTTP");
				}
			xml.onreadystatechange=function()
			
			{
				if(xml.readyState==4 && xml.status==200)
					
					{
						document.getElementById("video").innerHTML=xml.responseText;	
					}
			}
			
			xml.open("GET","vi.jsp?video="+document.getElementById("video1").value,false);
			xml.send();
	 	}
	 
	 function remplirCours()
	 {
	 	if(window.XMLHttpRequest)
	 	{
	 		xml = new XMLHttpRequest();
	 	}
	 	else
	 	{
	 		xml = new ActiveXObject("Microsoft.XMLHTTP");
	 	}

	 	xml.onreadystatechange= function()
	 	{
	 		if(xml.readyState==4 && xml.status==200)
	 		{
	 			document.getElementById("nomCours").innerHTML= xml.responseText;
	 		}
	 	}

	 	xml.open("GET","ajCour.jsp?categorie="+document.getElementById("categorie").value,false);
	 	xml.send();
	 }


