package kr.or.iei.ex20201119;

public class Application {

    public static void main(String[] args) {
        
        // 감시 받을 스레드
        final WorkerThread thread = new WorkerThread();
        
        // 감시 할 스레드
        final Watchdog watchdog = new Watchdog(thread);
        watchdog.start();
    }
}
