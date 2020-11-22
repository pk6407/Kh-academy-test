package kr.or.iei.ex20201120.multichat.server;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * 여기서 클라이언트는 서버에서 접속자를 관리하기 위한 객체 클라이언트임.
 * 채팅 클라이언트가 아님.
 * 
 * 1. 접속자의 데이터를 수신하고 ClientManager 에게 broadcast를 부탁
 * 2. 접속자에게 전송
 */

public class Client extends Thread{

	private final Socket socket;

	public Client(Socket clientSocket) {
		socket = clientSocket;
	}

	@Override
	public void run() {
		try {
			final InputStream in = socket.getInputStream();
			final byte[] buffer = new byte[4096];	// 메세지 담을 곳
			int readBytes;  // 읽은 메세지 바이트 수
			while ((readBytes = in.read(buffer)) != -1) {
				final String dataFromClient =
						new String(buffer, StandardCharsets.UTF_8);
				final String message = String.format("[%s]: %s",
						socket.getInetAddress().getHostAddress(),
						dataFromClient
						);
				ClientManager.getInstance().broadcast(message);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void sendMessage(String message) {
		try {
			final OutputStream out = socket.getOutputStream();
			out.write(message.getBytes(StandardCharsets.UTF_8));
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
