package forum;

public class OutilsChaine 

{
		public static final String CHAINE_SUITE = "[...]"; 
		
		public OutilsChaine()
		{
			
		}
		
		public static String limiterLongeur(String chaine, int max)
		{
			if(chaine.length() <= max )
			{
				return chaine; 
			}
			
			else 
			{
				int indiceEspace = chaine.lastIndexOf(' ', max - CHAINE_SUITE.length()); 
				
				if(indiceEspace == -1)
				{
					return chaine.substring(0, max-CHAINE_SUITE.length()); 
				}
				
				else 
				{
					 return chaine.substring(0,indiceEspace) + CHAINE_SUITE; 
				}
			}
		}
			public static String convertirEnEntites(String chaine)
			{
				if(chaine!=null)
				{
					chaine = remplacer(chaine,'&',"&amp;"); 
					chaine = remplacer(chaine,'<',"&lt;"); 
					chaine = remplacer(chaine,'\'',"&apos;");
					chaine = remplacer(chaine,'"',"&quot;");
					
					
				}
				
				return chaine ; 
			}
			
			public static String convertirEnHTML(String chaine)
			{
				if(chaine!=null)
				{
					chaine = convertirEnEntites (chaine); 
					chaine = remplacer(chaine, '\n',"<br>"); 
				}
				
				return chaine; 
			}
			
			public static String remplacer(String chaine, char c , String t)
			{
				for(int indiceC = chaine.indexOf(c);indiceC !=-1; indiceC = chaine.indexOf(c, indiceC + 1)) chaine = chaine.substring(0,indiceC) + t+ chaine.substring(indiceC+1); 
				
				return chaine; 
			}
}
