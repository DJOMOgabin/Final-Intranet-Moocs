package controlleur;

import java.awt.Desktop;
import java.awt.Menu;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modele.Session;
import Modele.User;

public class chronoThread extends Thread {
	private long tempsFin;
	private long tempsDebut;
	private HttpServletResponse response;
	private long temp;
	private long tempsRestant;
	private long tempsAlloueGeneral;
	private String login="";
	private User usr;
	private Session sess1;
	public void setThreadSession(chronoThread t)
	{
		this.sess1.setT(t);
	}
	public String getLoginActuel()
	{
		return this.login;
	}
	public long getTempRestant()
	{
		return tempsRestant;
	}
	public chronoThread(Session sess, User usr, long tempsAlloueGeneral, long tempsRestant, long tempsDebut, long tempsFin)
	{
		
		super();
		this.usr=usr;
		this.sess1=sess;
		this.login=usr.getLogin();
		this.tempsAlloueGeneral=tempsAlloueGeneral;
		this.tempsRestant=tempsRestant;
		this.tempsDebut=tempsDebut;
		this.tempsFin=tempsFin;
	}
	public void run(){
		boolean flag=true;
		
		long t=tempsRestant;
		while((true)&&flag)
		{
			temp=new Timestamp(new java.util.Date().getTime()).getTime();
			tempsRestant=tempsFin-temp;
			if(temp>=tempsFin)
			{
				
				login="";
				this.stop();
			}
				
		}
	}
}
