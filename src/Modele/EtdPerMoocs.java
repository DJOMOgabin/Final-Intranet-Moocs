package Modele;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class EtdPerMoocs {
	
	public EtdPerMoocs()
	{
		
	}
	
	public static void generateRecap(int idcours, String nomcours, String nomprof) throws DocumentException, MalformedURLException, IOException, ClassNotFoundException, SQLException{
		Document recap=new Document(PageSize.A4);
		PdfWriter pw=PdfWriter.getInstance(recap, new FileOutputStream(new constante().chemin+"bilan/bilan"+idcours+""+nomcours+".pdf"));
		recap.open();
		PdfContentByte canvas=pw.getDirectContent();
		BaseFont arial=BaseFont.createFont(new constante().chemin+"font/Roboto-Regular.ttf",BaseFont.WINANSI, BaseFont.EMBEDDED);
		Font ar=new Font(arial,10);
		Image logo=Image.getInstance(new constante().chemin+"img/logo.jpg");
		logo.setAlignment(Image.ALIGN_TOP|Image.ALIGN_LEFT);
		logo.scaleToFit(100,72);
		//recap.add(logo);
		canvas.addImage(logo,72, 0, 0,72,36,recap.getPageSize().getHeight()-82);
		canvas.beginText();
		canvas.setFontAndSize(arial,10);
		ResultSet resultats = null;
		String requete = "SELECT titrecours FROM cours WHERE idcours like '"+idcours+"'";
		Statement stmt=null;
		Connection con=ouvrirBD();
		try {
			stmt = con.createStatement();
			resultats = stmt.executeQuery(requete);
		} catch (SQLException e) {
			//traitement de l'exception
		}
		String titrecours="";
		while (resultats.next()) {
			titrecours=resultats.getString("titrecours");
		}
		requete="SELECT nom,prenom,matricule,email FROM etudiant WHERE idetudiant IN (SELECT idetudiant FROM etd_cours WHERE idcours like '"+idcours+"') GROUP BY idetudiant order by nom";
		canvas.showTextAligned(Element.ALIGN_LEFT,"UNIVERSITE DE YAOUNDE I",120,recap.getPageSize().getHeight()-40, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"ECOLE NATIONALE SUPERIEURE POLYTECHNIQUE",120,recap.getPageSize().getHeight()-52, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"B.P 8390 Yaoundé",120,recap.getPageSize().getHeight()-64, 0);
		ar.setStyle(Font.BOLD);
		canvas.setFontAndSize(ar.getBaseFont(), 14);
		Phrase l=new Phrase("LISTE DES ETUDIANTS INSCRITS AU MOOC : "+nomcours);
		l.getFont().setStyle(Font.BOLD|Font.UNDERLINE);
		l.getFont().setSize(14);
		canvas.setFontAndSize(ar.getBaseFont(), 10);
		canvas.showTextAligned(Element.ALIGN_LEFT,"Intitulé : "+titrecours,36,recap.getPageSize().getHeight()-180, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"Par :"+nomprof,36,recap.getPageSize().getHeight()-192, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"Année académique : 2014/2015",36,recap.getPageSize().getHeight()-204, 0);
		PdfPTable list=new PdfPTable(4);
		list.setWidths(new float[]{0.3f,1f,2.5f,1.5f});
		list.setTotalWidth(recap.getPageSize().getWidth()-72);
		list.getDefaultCell().setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
		canvas.setFontAndSize(ar.getBaseFont(), 10);
		Phrase p=new Phrase("N°");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("MATRICULE");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("NOM");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("EMAIL");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		String nom="";
		String prenom="";
		String matricule="";
		String email="";
		try {
			stmt = con.createStatement();
			resultats = stmt.executeQuery(requete);
		} catch (SQLException e) {
			//traitement de l'exception
		}
		int i=1;
		while (resultats.next()) {
			nom=resultats.getString("nom").toUpperCase();
			prenom=resultats.getString("prenom").toUpperCase();
			matricule=resultats.getString("matricule").toUpperCase();
			email=resultats.getString("email");
			p=new Phrase(""+(i));
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(matricule);
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(nom+" "+prenom);
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			list.addCell(email);
			i+=1;
		}	
		list.writeSelectedRows(0, -1,36,recap.getPageSize().getHeight()-220, canvas);
		canvas.endText();
		ColumnText.showTextAligned(canvas,
				Element.ALIGN_CENTER,l,recap.getPageSize().getWidth()/2,recap.getPageSize().getHeight()-120, 0);
		canvas.rectangle(36,recap.getPageSize().getHeight()-90,recap.getPageSize().getWidth()-72,0.01f);
		canvas.fill();
		canvas.fill();
		canvas.saveState();
		canvas.restoreState();
		recap.close();
		resultats.close();
		stmt.close();
		con.close();
	}
	
	public static Connection ouvrirBD() throws SQLException,ClassNotFoundException
  	{
  		Connection conn=null;
  		
  		try{
  			
  			Class.forName(new constante().driver);
  			conn=DriverManager.getConnection(new constante().chaine_connexion,new constante().log_bd,new constante().pass_bd);
  			
  			
  		}catch(SQLException e)
  		{
  			
  			throw new SQLException("Erreur\nDetails "+e.getMessage());
  			
  		}catch(ClassNotFoundException e)
  		{
  			throw new ClassNotFoundException("Erreur\nDetails "+e.getMessage());
  		}
  		
  		return conn;
  		
  	}
	
	public static void main(final String args[]) throws MalformedURLException, DocumentException, IOException, ClassNotFoundException, SQLException{
		generateRecap(9,"Programmation En Ajax","djobiii");
	}
}