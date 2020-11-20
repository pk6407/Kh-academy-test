package kr.or.iei.ex20201119.multi;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Application {

	private static final int PORT = 12345;
	
	public static void main(String[] args) {
		try {
			final ServerSocket serverSocket = new ServerSocket(PORT);
			Socket client;
			while((client = serverSocket.accept()) != null) {
				System.out.println("���ο� Ŭ���̾�Ʈ ����!");
				ClientManager.registerClient(client);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
