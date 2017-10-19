package WebSocket;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import forum.Forum;
import forum.JSON;
import forum.LectEcriForum;

	@ApplicationScoped
	@ServerEndpoint("/echange")
	public class WebSocketServe {
	
		private static Set<Session> clients = new HashSet<Session>();
		
		@OnOpen
	    public void open(Session session) {
			clients.add(session);
			System.out.println("La session est connectée : "+session.getId());
		}
		
		@OnClose
		public void close(Session session) {
			try {
				for (Session sess : clients) {
					if(sess.getId().equalsIgnoreCase(session.getId())){
						clients.remove(sess);
						System.out.println("La session est déconnectée : "+session.getId());
						session.close();
						break;
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		@OnError
		public void onError(Throwable error) {
			for (Session session : clients) {
				if(!session.isOpen()) {
					try {
						session.close();
						clients.remove(session);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		@OnMessage
		public void handleMessage(String message,Session sess) {
			try {
				String id,cours,theme,text,nom;
				JSON json = new JSON(message);
				id = json.Parse(1);
				cours = json.Parse(2);
				theme = json.Parse(3);
				text = json.Parse(4);
				text = text.replaceAll("\n", "<br>");
				LectEcriForum.Ecriture(id, cours, theme, text);
				nom = Forum.getId(id);
				for (Session session : clients) {
					if(!session.getId().equals(sess.getId()))session.getBasicRemote().sendText(message(text,nom,false,cours,theme));
					else session.getBasicRemote().sendText(message(text,nom,true,cours,theme));
				}
			} catch (IOException e) {
			}
		}
		//Permet de distinguer l'emetteur du message
		private String message(String text,String nom,boolean prop,String nomCours,String theme){
			return "{\"text\":\""+text+"\",\"nom\":\""+nom+"\",\"prop\":\""+prop+"\","
					+ "\"heure\":\""+(LectEcriForum.CreateTime(""
			+new Timestamp(new com.sun.jmx.snmp.Timestamp().getDateTime())))+"\""
					+ ",\"cours\":\""+nomCours+"\",\"theme\":\""+theme+"\"}";
		}
	
	}
