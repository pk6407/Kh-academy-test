package com.github.hyeyoom;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class FileReadApplication {

    // localhost:8888
    private static final int PORT = 8888;

    public static void main(String[] args) {
        try {
            final ServerSocket serverSocket = new ServerSocket(PORT);
            Socket socket;
            while ((socket = serverSocket.accept()) != null) {
                // 1. 요청을 읽어서 화면에 출력
                final InputStream in = socket.getInputStream();
                final BufferedReader br = new BufferedReader(new InputStreamReader(in));
                String line;
                while (!(line = br.readLine()).equals("")) {
                    System.out.println(line);
                }

                // 2. 응답 생성
                // 2.1. 상태 라인 작성
                final String statusLine = "HTTP/1.1 200 OK \r\n";

                // 2.2. 메세지 헤더
                final Map<String, String> headers = new HashMap<>();
                headers.put("Content-Type", "image/png; image/jpeg;");
                final File file = new File("C:\\Users\\pc\\Desktop\\dog.png");
                final long contentLength = file.length();
                headers.put("Content-Length", String.valueOf(contentLength));

                // 2.3. 메세지 바디
                final OutputStream out = socket.getOutputStream();
                // 1. 상태 라인 쓰기
                out.write(statusLine.getBytes(StandardCharsets.UTF_8));
                // 2. 응답 헤더 쓰기
                for (Map.Entry<String, String> e : headers.entrySet()) {
                    final String header =
                            String.format("%s: %s \r\n", e.getKey(), e.getValue());
                    out.write(header.getBytes(StandardCharsets.UTF_8));
                }
                // 3. 응답 바디
                out.write("\r\n".getBytes(StandardCharsets.UTF_8));

                try(final InputStream fis = new FileInputStream(file)) {
                    int readBytes;
                    final byte[] buf = new byte[4096];
                    while ((readBytes = fis.read(buf)) != -1) {
                        out.write(buf);
                    }
                }

                out.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}