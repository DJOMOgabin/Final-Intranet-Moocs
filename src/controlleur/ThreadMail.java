package controlleur;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;


public class ThreadMail  implements Runnable{
	
	private String emailFrom; 
	private String emailTo;
	private String message;
	private String emailSubject;
	
	public String getEmailSubject() {
		return emailSubject;
	}

	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}

	public ThreadMail(){
		this.emailFrom = "intranet.moocs@yahoo.com";
		this.emailTo = "djobiii2078@gmail.com";
		this.message = "Test Thread Mail";
		this.emailSubject = "Test de déploiement";
	}
	
	public ThreadMail(String emailFrom,String emailTo,String message,String emailSubject)
	{
		this.emailFrom = emailFrom; 
		this.emailTo = emailTo; 
		this.message = message; 
		this.emailSubject = emailSubject; 
	}
	
	public String getEmailFrom() {
		return emailFrom;
	}



	public void setEmailFrom(String emailFrom) {
		this.emailFrom = emailFrom;
	}



	public String getEmailTo() {
		return emailTo;
	}



	public void setEmailTo(String emailTo) {
		this.emailTo = emailTo;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public void run()
	{
		//L'envoie en background du mail
		TestMail smtpMailSender = new TestMail(); 
		try {
			smtpMailSender.postMail(new String[]{this.getEmailTo()}, this.getEmailSubject(), this.getMessage(), this.getEmailFrom());
		} catch (AuthenticationFailedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
