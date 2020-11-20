package kr.or.iei.ex20201119;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Application3 {
    public static void main(String[] args) {
        try {
            // ���� ���� ����
            final ServerSocket serverSocket = new ServerSocket(12345);
            // �ܺ��� ������ ���
            final Socket socket = serverSocket.accept();
            
            // 1. ������ Ŭ���̾�Ʈ���� �޼����� �ϳ� ����
            recvMessage(socket.getInputStream());
            
            // 2. ������ Ŭ���̾�Ʈ���� �޼����� ����
            sendMessage(socket.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void recvMessage(InputStream is) throws IOException {
        final byte[] buffer = new byte[4096];
        int readBytes;

        while ((readBytes = is.read(buffer)) != -1) {
            final String messageFromClient = new String(buffer);
            System.out.println(messageFromClient);
        }
    }

    private static void sendMessage(OutputStream os) {
        
    }
}
