package controlleur;


import java.util.Properties;

import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class TestMail { 
	private static final String SMTP_HOST_NAME = "smtp.mail.yahoo.com"; //or simply "localhost" 
	private static final String SMTP_AUTH_USER = "intranet.moocs"; 
	private static final String SMTP_AUTH_PWD = "polytechnique.cm2078"; 
	private static String emailMsgTxt = "Felicitations pour l'inscription sur la plateforme INTRANET MOOCs"; 
	private static String emailSubjectTxt = "Bienvenue sur INTRANET MOOCs"; 
	private static final String emailFromAddress = "intranet.moocs@yahoo.com"; // Add List of Email address to who email needs to be sent to 
	private static String[] emailList = {"djobiii2078@gmail.com"};
	
	
	public static String getSmtpHostName() {
		return SMTP_HOST_NAME;
	}

	public static String getSmtpAuthUser() {
		return SMTP_AUTH_USER;
	}

	public static String getSmtpAuthPwd() {
		return SMTP_AUTH_PWD;
	}

	public static String getEmailmsgtxt() {
		return emailMsgTxt;
	}

	public static String getEmailsubjecttxt() {
		return emailSubjectTxt;
	}

	public static String getEmailfromaddress() {
		return emailFromAddress;
	}

	public static String[] getEmaillist() {
		return emailList;
	}

	public static void main(String args[]) throws Exception { 
		TestMail smtpMailSender = new TestMail(); 
		smtpMailSender.postMail( emailList, emailSubjectTxt, emailMsgTxt, emailFromAddress); 
		}
	

	public void postMail( String recipients[ ], String subject, String message , String from) throws MessagingException, AuthenticationFailedException { 
		boolean debug = false; //Set the host smtp address 
		Properties props = new Properties(); 
		props.put("mail.smtp.host", SMTP_HOST_NAME); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable", "true");
	       
		Authenticator auth = new SMTPAuthenticator(); 
		Session session = Session.getDefaultInstance(props, auth);
		session.setDebug(debug); // create a message 
		Message msg = new MimeMessage(session); // set the from and to address 
		InternetAddress addressFrom = new InternetAddress(from); 
		msg.setFrom(addressFrom); 
		InternetAddress[] addressTo = new InternetAddress[recipients.length]; 
		for (int i = 0; i < recipients.length; i++) { 
			addressTo[i] = new InternetAddress(recipients[i]); 
			} 
		msg.setRecipients(Message.RecipientType.TO, addressTo); // Setting the Subject and Content Type*/ 
		msg.setSubject(subject); 
		msg.setContent(message, "text/plain");
		Transport.send(msg); 
		} 


private class SMTPAuthenticator extends javax.mail.Authenticator { 
		public PasswordAuthentication getPasswordAuthentication() { 
			String username = SMTP_AUTH_USER; 
			String password = SMTP_AUTH_PWD; 
			return new PasswordAuthentication(username, password); 
			} 
		}

 
	}