package kr.or.iei.ex20201120.multichat.client;

import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * 1. InputStream을 읽어서
 * 2. 화면에 출력함
 */
public class ListenerThread extends Thread {

    private final Socket socket;

    public ListenerThread(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        // 1. InputStream 읽기
        // 2. 화면에 출력
        try {
            final InputStream in = socket.getInputStream();
            final byte[] buffer = new byte[4096];   // 메세지 담을 곳
            int readBytes;  // 읽은 메세지 바이트 수
            while ((readBytes = in.read(buffer)) != -1) {
                final String message = new String(buffer, StandardCharsets.UTF_8);
                System.out.println(message);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
