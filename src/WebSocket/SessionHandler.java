package WebSocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.Session;

import Device.Device;

@ApplicationScoped
public class SessionHandler {
	private final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>()); 
	private final Set<Device> devices = new HashSet<>();
	
	public Set<Session> getSessions() {
		return sessions;
	}
	
	public void addSession(Session session) { 
		sessions.add(session); 
	}
	
	public void removeSession(Session session) { 
		sessions.remove(session); 
	}
	public List<Device> getDevices() { 
		return new ArrayList<>(devices); 
	}
	
	public void addDevice(Device device) { } 
	public void removeDevice(int id) { } 
	public void toggleDevice(int id) { } 
	private Device getDeviceById(int id) { 
		return null; 
	}
	
	private String createAddMessage(Device device) { 
		return null; 
	}
	
	private void sendToAllConnectedSessions(String message) { } 
	private void sendToSession(Session session, String message) { }
}
