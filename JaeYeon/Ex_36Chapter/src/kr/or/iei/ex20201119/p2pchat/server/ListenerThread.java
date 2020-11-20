package kr.or.iei.ex20201119.p2pchat.server;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

public class ListenerThread extends Thread {

    private InputStream in;

    public ListenerThread(InputStream in) {
        this.in = in;
    }

    @Override
    public void run() {
        System.out.println("리스너 시작됨");
        while (true) {
            try {
                byte[] bytes = new byte[4096];
                int readCount;
                while ((readCount = in.read(bytes)) != -1) {
                    final String message = new String(bytes, 0, readCount, StandardCharsets.UTF_8);
                    System.out.println(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
                break;
            }
        }
    }
}
