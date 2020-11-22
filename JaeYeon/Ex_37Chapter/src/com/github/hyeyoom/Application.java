package com.github.hyeyoom;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class Application {

	// ���� ȣ��Ʈ : 8081 ���
	private static final int PORT = 8081;
	public static void main(String[] args) {


		try {
			final ServerSocket serverSocket = new ServerSocket(PORT);
			System.out.println("���� �����");
			Socket socket;
			while ((socket = serverSocket.accept()) != null) {
				// 1. ��û�� �о ȭ�鿡 ���
				final InputStream in = socket.getInputStream();
				/*int readBytes; // �󸶳� read ������
                final byte[] buffer = new byte[4096]; // ���� ��
                while ((readBytes = in.read(buffer)) != -1) {
                    final String line = new String(buffer, StandardCharsets.UTF_8);
                    System.out.println(line);
                }*/

				final BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String line;
				while (!(line = br.readLine()).equals("")) {
					System.out.println(line);
				}


				// 2. ���信 ���� �κ�
				// Method SP Request-URI SP HTTP-Version CRLF


				// 2.1 ���� ���� �ۼ�
				final String statusLine = "HTTP/1.1 200 OK\r\n";
				// 2.2 �޼��� ���
				final Map<String, String> headers = new HashMap<>();
				headers.put("Content-Type", "text/html; charset=UTF-8");
				final int contentLength = getMessageBody().length();
				headers.put("Content-Length", String.valueOf(contentLength));
				// 2.3 �޼��� �ٵ�

				final OutputStream out = socket.getOutputStream();
				out.write(statusLine.getBytes(StandardCharsets.UTF_8));
				for (Map.Entry<String, String> e : headers.entrySet()) {
					final String header =
							String.format("%s: %s\r\n", e.getKey(), e.getValue());
					out.write(header.getBytes(StandardCharsets.UTF_8));
				}
				// 3. ����ٵ�
				out.write("\r\n".getBytes(StandardCharsets.UTF_8));
				final String body = getMessageBody();
				out.write(body.getBytes(StandardCharsets.UTF_8));
				out.flush();

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static String getMessageBody() {
		return "<!DOCTYPE html>\n" +
				"<html>\n" +
				"    <head>\n" +
				"        <title>Hello HTTP Server!</title>\n" +
				"    </head>\n" +
				"    <body>\n" +
				"        <h1>�����̰�</h1>\n" +
				"        <p>�����̾�</p>\n" +
				"    </body>\n" +
				"</html>";
	}
}