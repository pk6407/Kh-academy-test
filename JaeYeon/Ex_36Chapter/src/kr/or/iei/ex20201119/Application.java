package kr.or.iei.ex20201119;

public class Application {

    public static void main(String[] args) {
        
        // ���� ���� ������
        final WorkerThread thread = new WorkerThread();
        
        // ���� �� ������
        final Watchdog watchdog = new Watchdog(thread);
        watchdog.start();
    }
}
