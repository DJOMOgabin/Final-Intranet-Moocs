    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modele;


import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import forum.ConnecteurForum;
/**
 *
 * @author Arche 3.3
 */

@WebServlet("/ThreadUploadVideo")
public class ThreadUploadVideo extends HttpServlet implements Runnable{
    

    private HttpServletRequest request;
    private ConnecteurForum connecteurForum;
    
    public ThreadUploadVideo(){
    
    	this.connecteurForum=new ConnecteurForum();
    	
    	
}
    public ThreadUploadVideo(HttpServletRequest request, ConnecteurForum connecteurForum, Cours cours)
    {
        this.request=request;
        this.connecteurForum=connecteurForum;
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
    	
		this.request = request; 
    	this.connecteurForum.setChaineConnexion(new constante().chaine_connexion);
    	this.connecteurForum.setDriver(new constante().driver);
    	this.connecteurForum.setLogin("root");
    	this.connecteurForum.setPassword(new constante().pass_bd);
    	Thread t  = new Thread(this);
    	t.start();
    	request.setAttribute("reussi", "Upload Réussi ");
    	
		
		this.getServletContext().getRequestDispatcher("/controle_video.jsp").forward( request, response );
		}catch(SQLException ex){System.out.println(ex.getMessage());}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
    public void run(){
    	
        try {

            DiskFileUpload upload = new DiskFileUpload();
            List items=upload.parseRequest(this.getRequest());
            Iterator itr=items.iterator();
            
            while(itr.hasNext())
            {
                FileItem item = (FileItem)itr.next();
                if(item.isFormField())
                {
                    return;
                }
                else{
                    
                    
                    @SuppressWarnings("unused")
					File fullFile=new File(item.getName());
                    
                    
                    if(item.getContentType().equals("video/mp4"))
                    {
                        
                    	
                    	
                        try {
                            File uploadDir = new File("C:\\J2EE\\intranet_moocs\\WebContent\\cours\\video");
                            File savedFile = File.createTempFile("video", ".mp4", uploadDir);
                            String query = "insert into video(semaine,video,id_cours) values ('"+Integer.parseInt(request.getParameter("idsemaine"))+"','"+savedFile.getName()+"',"+this.request.getParameter("id_cours")+")";
                           connecteurForum.getConnexion().createStatement().executeUpdate(query);
                            item.write(savedFile);
                            
                          
                        } catch (Exception ex) {
                            System.out.println(ex.getMessage());
                        }
                        
                        
                    }
                    
                    if(item.getContentType().equals("video/flv"))
                    {
                        
                    	File uploadDir = new File("C:\\J2EE\\intranet_moocs\\WebContent\\cours\\video");
                        File savedFile = File.createTempFile("video", ".flv", uploadDir);

                        String query = "insert into video(semaine,video,id_cours) values ('"+Integer.parseInt(request.getParameter("idsemaine"))+"','"+savedFile.getName()+"',"+this.request.getParameter("id_cours")+")";
                        connecteurForum.getConnexion().createStatement().executeUpdate(query);
                        
                        
                        item.write(savedFile);
                        
                        
                        
                    }
                    
                    if(item.getContentType().equals("video/mkv"))
                    {
                    	File uploadDir = new File("C:\\J2EE\\intranet_moocs\\WebContent\\cours\\video");
                        File savedFile = File.createTempFile("video", ".mkv", uploadDir);
                        
                        String query = "insert into video(semaine,video,id_cours) values ('"+Integer.parseInt(request.getParameter("idsemaine"))+"','"+savedFile.getName()+"',"+this.request.getParameter("id_cours")+")";
                        connecteurForum.getConnexion().createStatement().executeUpdate(query);
                        
                        
                        item.write(savedFile);
                        
                        
                        
                    }
                    if(item.getContentType().equals("video/webm"))
                    {
                    	File uploadDir = new File("C:\\J2EE\\intranet_moocs\\WebContent\\cours\\video");
                        File savedFile = File.createTempFile("video", ".webm", uploadDir);
                        
                        String query = "insert into video(semaine,video,id_cours) values ('"+Integer.parseInt(request.getParameter("idsemaine"))+"','"+savedFile.getName()+"',"+this.request.getParameter("id_cours")+")";
                        connecteurForum.getConnexion().createStatement().executeUpdate(query);
                        
                        
                        item.write(savedFile);
                        
                        
                        
                    }
                    if(item.getContentType().equals("video/avi"))
                    {
                    	File uploadDir = new File("C:\\J2EE\\intranet_moocs\\WebContent\\cours\\video");
                        File savedFile = File.createTempFile("video", ".avi", uploadDir);
                        
                        String query = "insert into video(semaine,video,id_cours) values ('"+Integer.parseInt(request.getParameter("idsemaine"))+"','"+savedFile.getName()+"',"+this.request.getParameter("id_cours")+")";
                        connecteurForum.getConnexion().createStatement().executeUpdate(query);
                        
                        
                        
                        item.write(savedFile);
     
                        
                        
                    }
                }
            }
        } catch (FileUploadException ex) {
            System.out.println(ex.getMessage());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
                        
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public ConnecteurForum getConnecteurForum() {
        return connecteurForum;
    }

    public void setConnecteurForum(ConnecteurForum connecteurForum) {
        this.connecteurForum = connecteurForum;
    }


    public String toString() {
        return "ThreadUploadVideo{" + "request=" + request + ", connecteurForum=" + connecteurForum +" , }'";
    }

	
}