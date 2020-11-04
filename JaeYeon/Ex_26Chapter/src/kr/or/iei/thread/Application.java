package kr.or.iei.thread;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;



public class Application {

    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(1905)) {
            Socket client;
            System.out.println("while 바깥");
            while ((client = serverSocket.accept()) != null) {
                System.out.println("사용자 옴");
                final RequestHandler handler = new RequestHandler(client);  // runnable
                final Thread thread = new Thread(handler);
                thread.start();
                System.out.println("스레드에게 위임");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}