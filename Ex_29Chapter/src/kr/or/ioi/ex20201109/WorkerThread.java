package kr.or.ioi.ex20201109;

public class WorkerThread implements Runnable {

    @Override
    public void run() {
        long sum = 0;
        for (int i = 0; i < 20_0000_0000; i++) {
            sum += i;
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        for (int i = 0; i < 20_0000_0000; i++) {
            sum += i;
        }
    }
}
