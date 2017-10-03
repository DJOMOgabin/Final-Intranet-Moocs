package Modele;

import java.awt.Color;
import java.awt.GradientPaint;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.DefaultCategoryDataset;

import com.itextpdf.text.BadElementException;
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

import forum.ConnecteurForum;


public class GraphePdf

{

	public GraphePdf()
	{
		
	}
	
	public static void  creePDF1() throws SQLException, IOException, DocumentException
	
	{	
		
		ConnecteurForum e = new ConnecteurForum();
        e.setDriver(new constante().driver);
        e.setChaineConnexion(new constante().chaine_connexion);
        e.setLogin(new constante().log_bd);
        e.setPassword(new constante().pass_bd);
        
        Cours c = new Cours();
        
        ArrayList<String> listcours = e.getListeCours(); 
		
		final DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		
		final String series1 = "First";
		
		for(int i =1 ; i<=listcours.size(); i++)
		{
			c.setTitreCours(listcours.get(i-1));
			dataset.addValue(c.getNombreCours(), "Nombre Inscrit", i+"");
			
		}
		
		
		
		
		final JFreeChart chart = ChartFactory.createBarChart(

					"",
					"Indexes des Cours",
					"Nombre D'inscrit",
					dataset,
					PlotOrientation.VERTICAL,
					false,
					false,
					false
					
				
				);
		
		chart.setBackgroundPaint(Color.white);
		
		final CategoryPlot  plot = chart.getCategoryPlot(); 
		
		plot.setBackgroundPaint(Color.white);
		plot.setDomainGridlinePaint(Color.white);
		plot.setRangeGridlinePaint(Color.white);
		
		final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        
        final BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(true);
        
        
        final GradientPaint gp0 = new GradientPaint(
                0.0f, 0.0f, new Color(66,171,219), 
                0.0f, 0.0f, new Color(66,171,219)
            );
        
        renderer.setSeriesPaint(0, gp0);
        
        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(
            CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0)
        );
        
        final JFreeChart freechart = chart ; 
        
        ChartUtilities.saveChartAsPNG(new File("C:\\J2EE\\intranet_moocs\\WebContent\\graphe1.png"), freechart,500, 350);
        
    	Document recap=new Document(PageSize.A4);
		PdfWriter pw=PdfWriter.getInstance(recap, new FileOutputStream("C:\\J2EE\\intranet_moocs\\WebContent\\bilan\\bilanCours.pdf"));
		recap.open();
		PdfContentByte canvas=pw.getDirectContent();
		BaseFont arial=BaseFont.createFont("C:\\J2EE\\intranet_moocs\\WebContent\\font\\RobotoCondensed-Bold.ttf",BaseFont.WINANSI, BaseFont.EMBEDDED);
		Font ar=new Font(arial,10);
		Image logo=Image.getInstance("C:\\J2EE\\intranet_moocs\\WebContent\\img\\logo.jpg");
		logo.setAlignment(Image.ALIGN_TOP|Image.ALIGN_LEFT);
		logo.scaleToFit(100,72);
		canvas.addImage(logo,72, 0, 0,72,36,recap.getPageSize().getHeight()-82);
		canvas.beginText();
		canvas.setFontAndSize(arial,10);
		
		canvas.showTextAligned(Element.ALIGN_LEFT,"UNIVERSITE DE YAOUNDE I",120,recap.getPageSize().getHeight()-40, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"ECOLE NATIONALE SUPERIEURE POLYTECHNIQUE",120,recap.getPageSize().getHeight()-52, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"B.P 8390 Yaoundé",120,recap.getPageSize().getHeight()-64, 0);
		ar.setStyle(Font.BOLD);
		canvas.setFontAndSize(ar.getBaseFont(), 14);
		Phrase l=new Phrase("STATISTIQUES SUR LES COURS");
		l.getFont().setStyle(Font.BOLD|Font.UNDERLINE);
		l.getFont().setSize(14);
		
		
		Image graphe = Image.getInstance("C:\\J2EE\\intranet_moocs\\WebContent\\graphe1.png");
		graphe.setAlignment(Image.ALIGN_CENTER|Image.ALIGN_CENTER);
		graphe.setAbsolutePosition(35f,350f);
		recap.add(graphe);
		
		
		canvas.setFontAndSize(ar.getBaseFont(), 10);
		PdfPTable list=new PdfPTable(4);
		list.setWidths(new float[]{0.3f,2.5f,1.5f,1.5f});
		list.setTotalWidth(recap.getPageSize().getWidth()-72);
		list.getDefaultCell().setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
		canvas.setFontAndSize(ar.getBaseFont(), 10);
	
		Phrase p=new Phrase("N°");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("NOM DU COURS");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("NOMBRE D'INSCRITS");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("NOM ENSEIGNANT");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
	
		for(int i = 1; i <=listcours.size();  i++) {
			
			c.setTitreCours(listcours.get(i-1));
			
			p=new Phrase(""+(i));
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(c.getTitreCours().toUpperCase());
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(c.getNombreCours()+"");
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			list.addCell(c.getNomEnseignant().toUpperCase());
			
		}	
		list.writeSelectedRows(0, -1,36,recap.getPageSize().getHeight()-500, canvas);
		canvas.endText();
		ColumnText.showTextAligned(canvas,
				Element.ALIGN_CENTER,l,recap.getPageSize().getWidth()/2,recap.getPageSize().getHeight()-120, 0);
		canvas.rectangle(36,recap.getPageSize().getHeight()-90,recap.getPageSize().getWidth()-72,0.01f);
		canvas.fill();
		canvas.fill();
		canvas.saveState();
		canvas.restoreState();
		recap.close();

        
        
	}
	
	public static void imprimer()
	{
		
		try {
			try {
				
				try {
					Connection conn = GraphePdf.ouvrirBD();
					Statement stat = conn.createStatement();
					ResultSet rs = stat.executeQuery("select * from etudiant");
					
					

					Document recap=new Document(PageSize.A4);
					PdfWriter pw=PdfWriter.getInstance(recap, new FileOutputStream("bilanEtudiant.pdf"));
					recap.open();
					PdfContentByte canvas=pw.getDirectContent();
					BaseFont arial=BaseFont.createFont("roboto-condensed.bold.ttf",BaseFont.WINANSI, BaseFont.EMBEDDED);
					Font ar=new Font(arial,10);
					Image logo=Image.getInstance("logo.jpeg");
					logo.setAlignment(Image.ALIGN_TOP|Image.ALIGN_LEFT);
					logo.scaleToFit(100,72);
					canvas.addImage(logo,72, 0, 0,72,36,recap.getPageSize().getHeight()-82);
					canvas.beginText();
					canvas.setFontAndSize(arial,10);
					
					canvas.showTextAligned(Element.ALIGN_LEFT,"UNIVERSITE DE YAOUNDE I",120,recap.getPageSize().getHeight()-40, 0);
					canvas.showTextAligned(Element.ALIGN_LEFT,"ECOLE NATIONALE SUPERIEURE POLYTECHNIQUE",120,recap.getPageSize().getHeight()-52, 0);
					canvas.showTextAligned(Element.ALIGN_LEFT,"B.P 8390 Yaoundé",120,recap.getPageSize().getHeight()-64, 0);
					ar.setStyle(Font.BOLD);
					canvas.setFontAndSize(ar.getBaseFont(), 14);
					Phrase l=new Phrase("LISTE DES ETUDIANTS");
					l.getFont().setStyle(Font.BOLD|Font.UNDERLINE);
					l.getFont().setSize(14);
					canvas.setFontAndSize(ar.getBaseFont(), 10);
					PdfPTable list=new PdfPTable(6);
					list.setWidths(new float[]{0.3f,0.7f,2.0f,2.0f,2.0f,1.5f});
					list.setTotalWidth(recap.getPageSize().getWidth()-72);
					list.getDefaultCell().setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
					canvas.setFontAndSize(ar.getBaseFont(), 10);
					
					Phrase p=new Phrase("N°");
					p.getFont().setStyle(Font.BOLD);
					p.getFont().setSize(10);
					list.addCell(p);

					p=new Phrase("CODE");
					p.getFont().setStyle(Font.BOLD);
					p.getFont().setSize(10);
					list.addCell(p);
					
					p=new Phrase("NOM ");
					p.getFont().setStyle(Font.BOLD);
					p.getFont().setSize(10);
					list.addCell(p);
					p=new Phrase("PRENOM ");
					p.getFont().setStyle(Font.BOLD);
					p.getFont().setSize(10);
					list.addCell(p);
					p=new Phrase("DATE DE NAISSANCE");
					p.getFont().setStyle(Font.BOLD);
					p.getFont().setSize(10);
					list.addCell(p);
					p=new Phrase("VILLE");
					p.getFont().setStyle(Font.BOLD);
					p.getFont().setSize(10);
					list.addCell(p);
					  int i = 0; 
					while(rs.next())
					{
						
						//code - nom - prenom - date_de_naissance - ville
						p=new Phrase(""+(++i));
						p.getFont().setStyle(Font.NORMAL);
						p.getFont().setSize(10);
						list.addCell(p);
						p=new Phrase(rs.getString("matricule"));
						p.getFont().setStyle(Font.NORMAL);
						p.getFont().setSize(10);
						list.addCell(p);
						p=new Phrase(rs.getString("nom"));
						p.getFont().setStyle(Font.NORMAL);
						p.getFont().setSize(10);
						list.addCell(p);
						p=new Phrase(rs.getString("prenom"));
						p.getFont().setStyle(Font.NORMAL);
						p.getFont().setSize(10);
						list.addCell(p);
						p=new Phrase(rs.getString("anneNaissance"));
						p.getFont().setStyle(Font.NORMAL);
						p.getFont().setSize(10);
						list.addCell(p);
						p=new Phrase(rs.getString("email"));
						p.getFont().setStyle(Font.NORMAL);
						p.getFont().setSize(10);
						list.addCell(p);
						
						
						
					}

					list.writeSelectedRows(0, -1,36,recap.getPageSize().getHeight()-500, canvas);
					canvas.endText();
					ColumnText.showTextAligned(canvas,
							Element.ALIGN_CENTER,l,recap.getPageSize().getWidth()/2,recap.getPageSize().getHeight()-120, 0);
					canvas.rectangle(36,recap.getPageSize().getHeight()-90,recap.getPageSize().getWidth()-72,0.01f);
					canvas.fill();
					canvas.fill();
					canvas.saveState();
					canvas.restoreState();
					recap.close();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (BadElementException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
	
	public static void  creePDF2() throws SQLException, IOException, DocumentException
	
	{	
		
		ConnecteurForum e = new ConnecteurForum();
        e.setDriver(new constante().driver);
        e.setChaineConnexion(new constante().chaine_connexion);
        e.setLogin(new constante().log_bd);
        e.setPassword(new constante().pass_bd);
        
        User c = new User();
        
        ArrayList<String> listcours = e.getListeNom(); 
		
		final DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		
		final String series1 = "First";
		
		for(int i =1 ; i<=listcours.size(); i++)
		{
			c.setNom(listcours.get(i-1));
			dataset.addValue(c.getNombreCours(), "Nombre de Cours", i+"");
			
		}
		
		
		
		
		final JFreeChart chart = ChartFactory.createBarChart(

					"",
					"Indexes des Etudiants",
					"Nombre de Cours",
					dataset,
					PlotOrientation.VERTICAL,
					false,
					false,
					false
					
				
				);
		
		chart.setBackgroundPaint(Color.white);
		
		final CategoryPlot  plot = chart.getCategoryPlot(); 
		
		plot.setBackgroundPaint(Color.white);
		plot.setDomainGridlinePaint(Color.white);
		plot.setRangeGridlinePaint(Color.white);
		
		final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        
        final BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(true);
        
        
        final GradientPaint gp0 = new GradientPaint(
                0.0f, 0.0f, new Color(66,171,219), 
                0.0f, 0.0f, new Color(66,171,219)
            );
        
        renderer.setSeriesPaint(0, gp0);
        
        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(
            CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0)
        );
        
        final JFreeChart freechart = chart ; 
        
        ChartUtilities.saveChartAsPNG(new File("C:\\J2EE\\intranet_moocs\\WebContent\\graphe2.png"), freechart,500, 350);
        
    	Document recap=new Document(PageSize.A4);
		PdfWriter pw=PdfWriter.getInstance(recap, new FileOutputStream("C:\\J2EE\\intranet_moocs\\WebContent\\bilan\\bilanEtudiant.pdf"));
		recap.open();
		PdfContentByte canvas=pw.getDirectContent();
		BaseFont arial=BaseFont.createFont("C:\\J2EE\\intranet_moocs\\WebContent\\font\\RobotoCondensed-Bold.ttf",BaseFont.WINANSI, BaseFont.EMBEDDED);
		Font ar=new Font(arial,10);
		Image logo=Image.getInstance("C:\\J2EE\\intranet_moocs\\WebContent\\img\\logo.jpg");
		logo.setAlignment(Image.ALIGN_TOP|Image.ALIGN_LEFT);
		logo.scaleToFit(100,72);
		canvas.addImage(logo,72, 0, 0,72,36,recap.getPageSize().getHeight()-82);
		canvas.beginText();
		canvas.setFontAndSize(arial,10);
		
		canvas.showTextAligned(Element.ALIGN_LEFT,"UNIVERSITE DE YAOUNDE I",120,recap.getPageSize().getHeight()-40, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"ECOLE NATIONALE SUPERIEURE POLYTECHNIQUE",120,recap.getPageSize().getHeight()-52, 0);
		canvas.showTextAligned(Element.ALIGN_LEFT,"B.P 8390 Yaoundé",120,recap.getPageSize().getHeight()-64, 0);
		ar.setStyle(Font.BOLD);
		canvas.setFontAndSize(ar.getBaseFont(), 14);
		Phrase l=new Phrase("STATISTIQUES SUR LES ETUDIANTS");
		l.getFont().setStyle(Font.BOLD|Font.UNDERLINE);
		l.getFont().setSize(14);
		
		
		Image graphe = Image.getInstance("C:\\J2EE\\intranet_moocs\\WebContent\\graphe2.png");
		graphe.setAlignment(Image.ALIGN_CENTER|Image.ALIGN_CENTER);
		graphe.setAbsolutePosition(35f,350f);
		recap.add(graphe);
		
		
		canvas.setFontAndSize(ar.getBaseFont(), 10);
		PdfPTable list=new PdfPTable(6);
		list.setWidths(new float[]{0.3f,2.5f,1.5f,1.5f,1.5f,1.5f});
		list.setTotalWidth(recap.getPageSize().getWidth()-72);
		list.getDefaultCell().setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
		canvas.setFontAndSize(ar.getBaseFont(), 10);
	
		Phrase p=new Phrase("N°");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("NOM");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("FACULTE");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("MATRICULE");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("NOMBRE DE COURS");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
		p=new Phrase("TEMPS MOYEN/HEURES");
		p.getFont().setStyle(Font.BOLD);
		p.getFont().setSize(10);
		list.addCell(p);
	
		for(int i = 1; i <=listcours.size();  i++) {
			
			c.setNom(listcours.get(i-1));
			
			p=new Phrase(""+(i));
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(c.getNom().toUpperCase());
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(c.getFaculteId(c.getId()+"").toUpperCase());
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			list.addCell(c.getMatriculeId(c.getId()+"").toUpperCase());
			p=new Phrase(c.getNombreCours()+"");
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			p=new Phrase(c.getTempsMoyen()+"");
			p.getFont().setStyle(Font.NORMAL);
			p.getFont().setSize(10);
			list.addCell(p);
			
		}	
		list.writeSelectedRows(0, -1,36,recap.getPageSize().getHeight()-500, canvas);
		canvas.endText();
		ColumnText.showTextAligned(canvas,
				Element.ALIGN_CENTER,l,recap.getPageSize().getWidth()/2,recap.getPageSize().getHeight()-120, 0);
		canvas.rectangle(36,recap.getPageSize().getHeight()-90,recap.getPageSize().getWidth()-72,0.01f);
		canvas.fill();
		canvas.fill();
		canvas.saveState();
		canvas.restoreState();
		recap.close();

        
        
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
	
}