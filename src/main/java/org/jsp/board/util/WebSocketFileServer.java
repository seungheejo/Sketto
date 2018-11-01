package org.jsp.board.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/upload")
public class WebSocketFileServer {

	BufferedOutputStream bos;
	String path = "C:\\SkettoMeeting\\FilesUploaded";

	@OnMessage
	public void onMessage(Session session, String msg) {

		if (!msg.equals("end")) {

			String fileName = msg.substring(msg.indexOf(":") + 1);
			System.out.println(fileName);
			File file = new File(path + fileName);
			try {
				bos = new BufferedOutputStream(new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}

		} else {
			try {
				bos.flush();
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@OnMessage
	public void processUpload(ByteBuffer msg, boolean last, Session session) {

		while (msg.hasRemaining()) {
			try {
				bos.write(msg.get());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@OnOpen
	public void open(Session session) {
		System.out.println("WebSocket File Server Open......");
	}

	@OnError
	public void error(Session session, Throwable t) {
		System.out.println("error.......");
	}

	@OnClose
	public void closedConnection(Session session) {
		System.out.println("연결종료........");
	}

}
