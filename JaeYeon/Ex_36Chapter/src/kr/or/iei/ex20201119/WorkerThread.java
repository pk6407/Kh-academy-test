package kr.or.iei.ex20201119;

public class WorkerThread extends Thread {

    @Override
    public void run() {
        long sum = 0;
        for (int i = 0; i < 20_0000_0000; i++) {
            sum += i;
        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException ignore) {        }
        for (int i = 0; i < 20_0000_0000; i++) {
            sum += i;
        }
    }
}

