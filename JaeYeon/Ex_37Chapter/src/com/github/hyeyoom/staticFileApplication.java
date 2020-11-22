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
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;

/*
* 1. 요청 라인에서 URI 추출
* 2. 파일 절대 경로 추출
* 3. 파일로 부터 mime type 추출
* 4. 파일 길이 추출
* 5. 파일 byte 배열로 변환
*/
public class staticFileApplication {
	
	private static final int PORT = 12345;
    private static final String ROOT_PATH = "C:\\Users\\pc\\Desktop\\공부";

    public static void main(String[] args) {
        try {
            final ServerSocket serverSocket = new ServerSocket(PORT);
            Socket socket;
            while ((socket = serverSocket.accept()) != null) {
                final InputStream in = socket.getInputStream();
                final InputStreamReader isr = new InputStreamReader(in);
                final BufferedReader br = new BufferedReader(isr);

                final String requestLine = br.readLine();
                String line;
                while (!"".equals((line = br.readLine()))) {
                    System.out.println(line);
                }

                // 응답 만들기 
                final OutputStream out = socket.getOutputStream();
                final String statusLine = "HTTP/1.1 200 OK \r\n";
                out.write(convertStringToBytes(statusLine));

                final String uri = extractURIFromRequestLine(requestLine);
                final String absolutePath = getAbsolutePath(uri);
                final String contentType = getContentTypeFromFilePath(absolutePath);
                final String ctHeader = "Content-Type: " + contentType + "\r\n";
                out.write(convertStringToBytes(ctHeader));

                final File fileToResponse = new File(absolutePath);
                final long contentLength = fileToResponse.length();
                final String clHeader = "Content-Length: " + contentLength + "\r\n";
                out.write(convertStringToBytes(clHeader));
                out.write(convertStringToBytes("\r\n"));

                try(final FileInputStream fis = new FileInputStream(fileToResponse)) {
                    final byte[] buffer = new byte[4096];
                    int readBytes;
                    while ((readBytes = fis.read(buffer)) != -1) {
                        out.write(buffer);
                    }
                } catch (IOException ignore) {
                }
                out.flush();
            }
        } catch (IOException e) {

        }
    }

    private static String getContentTypeFromFilePath(String absolutePath) {
        return URLConnection.guessContentTypeFromName(absolutePath);
    }

    private static String getAbsolutePath(String uri) {
        // uri
        // abc.txt, think-twice.png
        final Path path = Paths.get(ROOT_PATH);
        final String filename = uri.substring(1);
        final Path fileAbsolutePath = path.resolve(filename);
        return fileAbsolutePath.toString();  // 파일 절대 경로
    }

    private static String extractURIFromRequestLine(String requestLine) {
        // GET / HTTP/1.1
        // splitted[0] GET
        // splitted[1] /
        // splitted[2] HTTP/1.1
        final String[] splitted = requestLine.split(" ");
        return splitted[1];
    }

    private static byte[] convertStringToBytes(String strToConvert) {
        return strToConvert.getBytes(StandardCharsets.UTF_8);
    }
}
