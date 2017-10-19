package Modele;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class SiteConsulter {
	private String site, rechercher;
	
	

	public SiteConsulter(String url, String rech) {
		super();
		site = url.substring(0,url.lastIndexOf('/'));
		rechercher = rech;
	}
	
	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getRechercher() {
		return rechercher;
	}

	public void setRechercher(String rechercher) {
		this.rechercher = rechercher;
	}
	
	public void saveInXML(String file) {
		final DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		try {
			final DocumentBuilder builder = factory.newDocumentBuilder();
			final Document document= builder.newDocument();
			final Element racine = document.createElement("teachers");
			document.appendChild(racine);
			final Element teacher = document.createElement("teacher");
			racine.appendChild(teacher);
			
			//Création d'un commentaire
			final Comment comment = document.createComment("Le Batch");
		
			final Element nom = document.createElement("nom");
			final Element function = document.createElement("function");
			final Element contact = document.createElement("contact");
			
			nom.appendChild(document.createTextNode("Batchakui Bernabé"));
			function.appendChild(document.createTextNode("Enseignant Chercheur"));
			contact.setAttribute("email", "bbatchakui@gmail.com");

			teacher.appendChild(comment);
			teacher.appendChild(nom);
			teacher.appendChild(function);
			teacher.appendChild(contact);

			/*
			 * Etape 6 : affichage
			 */
			
			//Recuperation d'une instance de la classe TransformerFactory
			final TransformerFactory transformerFactory =
					TransformerFactory.newInstance();
			
			//Création d'un transformer
			final Transformer transformer =
					transformerFactory.newTransformer();
			
			//prologue
			transformer.setOutputProperty(OutputKeys.VERSION, "1.0");
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			transformer.setOutputProperty(OutputKeys.STANDALONE, "yes");
			
			//formatage/indentation
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

			//sortie
			final DOMSource source = new DOMSource(document);
			final StreamResult sortie = new StreamResult(new
					File("batch.xml"));
			transformer.transform(source, sortie);
		}
		catch (final ParserConfigurationException e) {
			e.printStackTrace();
		}
		catch (TransformerConfigurationException e) {
			e.printStackTrace();
		}
		catch (TransformerException e) {
			e.printStackTrace();
		}
	}
	
}