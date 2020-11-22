package kr.or.iei.ex20201120.multichat.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Application {

	// 포트번호 : 0 ~ 65535
	private static final int PORT = 12345;

	public static void main(String[] args) {
		try {
			final ServerSocket serverSocket = new ServerSocket(PORT);
			Socket clientSocket;
			while((clientSocket = serverSocket.accept()) != null) {
				ClientManager.reqisterClient(clientSocket);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}	

	}

}
