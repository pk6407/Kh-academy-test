package kr.or.iei.ex20201119.p2pchat.client;

import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

import kr.or.iei.ex20201119.p2pchat.server.*;
/**
 * ���� ���ø����̼�
 */
public class Application {

    private static final int PORT = 12345;

    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            System.out.println("���� ��� ��");
            final Socket socket = serverSocket.accept();
            System.out.println("����!");
            final ListenerThread listener = new ListenerThread(socket.getInputStream());
            listener.start();

            while (true) {
                writeMessage(socket.getOutputStream());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private static void writeMessage(OutputStream outputStream) throws IOException {
        final Scanner scanner = new Scanner(System.in);
        System.out.print("�Է� > ");
        final String messageToSend = scanner.nextLine();
        final byte[] raw = messageToSend.getBytes(StandardCharsets.UTF_8);
        outputStream.write(raw);
    }
}
