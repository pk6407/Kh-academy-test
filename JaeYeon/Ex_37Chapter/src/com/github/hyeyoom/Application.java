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

	// 로컬 호스트 : 8081 사용
	private static final int PORT = 8081;
	public static void main(String[] args) {


		try {
			final ServerSocket serverSocket = new ServerSocket(PORT);
			System.out.println("접속 대기중");
			Socket socket;
			while ((socket = serverSocket.accept()) != null) {
				// 1. 요청을 읽어서 화면에 출력
				final InputStream in = socket.getInputStream();
				/*int readBytes; // 얼마나 read 헀는지
                final byte[] buffer = new byte[4096]; // 담을 곳
                while ((readBytes = in.read(buffer)) != -1) {
                    final String line = new String(buffer, StandardCharsets.UTF_8);
                    System.out.println(line);
                }*/

				final BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String line;
				while (!(line = br.readLine()).equals("")) {
					System.out.println(line);
				}


				// 2. 응답에 대한 부분
				// Method SP Request-URI SP HTTP-Version CRLF


				// 2.1 상태 라인 작성
				final String statusLine = "HTTP/1.1 200 OK\r\n";
				// 2.2 메세지 헤더
				final Map<String, String> headers = new HashMap<>();
				headers.put("Content-Type", "text/html; charset=UTF-8");
				final int contentLength = getMessageBody().length();
				headers.put("Content-Length", String.valueOf(contentLength));
				// 2.3 메세지 바디

				final OutputStream out = socket.getOutputStream();
				out.write(statusLine.getBytes(StandardCharsets.UTF_8));
				for (Map.Entry<String, String> e : headers.entrySet()) {
					final String header =
							String.format("%s: %s\r\n", e.getKey(), e.getValue());
					out.write(header.getBytes(StandardCharsets.UTF_8));
				}
				// 3. 응답바디
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
				"        <h1>제목이고</h1>\n" +
				"        <p>내용이야</p>\n" +
				"    </body>\n" +
				"</html>";
	}
}