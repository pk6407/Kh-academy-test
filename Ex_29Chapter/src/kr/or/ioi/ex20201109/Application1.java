package kr.or.ioi.ex20201109;

public class Application1 {

    public static void main(String[] args) {
        final Thread thread = new Thread(new WorkerThread());
        new Watchdog(thread).start();
    }
}

