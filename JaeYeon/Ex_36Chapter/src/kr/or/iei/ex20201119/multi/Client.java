package kr.or.iei.ex20201119.multi;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * 1. ������(�ܺ��� ������ �ް�(InputStream �б�) ȭ�鿡 ���)
 * 2. ����(OutputStream�� ����)
 */
public class Client extends Thread {

    private final Socket socket;
    private final String clientIp;

 // Ŭ���̾�Ʈ���� �����ϱ� ���� output stream
    private OutputStream out;

    // ������
    public Client(Socket socket) {
        this.socket = socket;
        clientIp = socket.getInetAddress().getHostAddress();
    }

    @Override
    public void run() {
        System.out.println("Ŭ���̾�Ʈ ������ ���۵�: " + clientIp);
        try (
                InputStream in = socket.getInputStream();
                OutputStream out = socket.getOutputStream();
        ) {
            this.out = out;
            final byte[] bytes = new byte[4096];
            int readCount;
            while ((readCount = in.read(bytes)) != -1) {
                final String message = new String(bytes, 0, readCount, StandardCharsets.UTF_8);
                final String msg = String.format("[%s]: %s", clientIp, message);
                ClientManager.getInstance().broadcast(msg);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getClientIp() {
        return clientIp;
    }

    public void send(String message) {
        final OutputStreamWriter osw = new OutputStreamWriter(out);
        try {
            osw.write(message);
            osw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
