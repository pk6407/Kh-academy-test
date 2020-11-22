package kr.or.iei.ex20201120.multichat.client;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

/**
 * 클라이언트. 서버에서 그거 말고..!
 */
public class Application {

    // 접속할 `서버` 주소
    private static final String IP_ADDRESS = "localhost";
    // 접속할 서버 포트
    private static final int PORT = 12345;

    public static void main(String[] args) {
        try {
            // 1. 접속
            final Socket socket = new Socket(IP_ADDRESS, PORT);
            final ListenerThread listener = new ListenerThread(socket);
            listener.start();
            
            while(true) {
            	sendMessage(socket.getOutputStream());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	private static void sendMessage(OutputStream out) throws IOException {
		final Scanner scanner = new Scanner(System.in);
		System.out.print("입력 > ");
		final String messageToSend = scanner.nextLine();
		out.write(messageToSend.getBytes(StandardCharsets.UTF_8));
		out.flush();
	}
}
