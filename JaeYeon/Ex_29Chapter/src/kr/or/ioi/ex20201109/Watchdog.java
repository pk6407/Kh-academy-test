package kr.or.ioi.ex20201109;

public class Watchdog extends Thread {

    private final Thread target;

    public Watchdog(Thread target) {
        this.target = target;
    }

    @Override
    public void run() {
        while (true) {
            final Thread.State state = target.getState();
            System.out.println("target thread state: " + state);

            if (state == State.NEW) {
                target.start();
            }

            if (state == State.TERMINATED) {
                break;
            }

            try {
                Thread.sleep(300);
            } catch (InterruptedException ignore) {
            }
        }
    }
}

