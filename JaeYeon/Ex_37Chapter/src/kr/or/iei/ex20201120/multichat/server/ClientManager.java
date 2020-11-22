package kr.or.iei.ex20201120.multichat.server;

import java.net.Socket;
import java.util.ArrayList;
import java.util.List;


public class ClientManager {
	
	private static final ClientManager INSTANCE = new ClientManager();
	
	private final List<Client> clients = new ArrayList<>();
	
	// �ܺο��� �ν��Ͻ� ������ ����
	private ClientManager() {
		
	}

	public static ClientManager getInstance() {
		return INSTANCE;
	}
	
	public static void reqisterClient(Socket clientSocket) {
		getInstance().addClient(clientSocket);
	}
	
	public void broadcast(String message) {
		for (Client client : clients) {
			client.sendMessage(message);
		}
	}

	private void addClient(Socket clientSocket) {
		final Client client = new Client(clientSocket);
		// 1. Ŭ���̾�Ʈ ��ü ���
		clients.add(client);
		// 2. Ŭ���̾�Ʈ ������ ����
		client.start();
	}
}