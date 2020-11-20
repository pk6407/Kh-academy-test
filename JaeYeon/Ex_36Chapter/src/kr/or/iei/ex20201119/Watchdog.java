package kr.or.iei.ex20201119;

public class Watchdog extends Thread {

    // 감시할 스레드
    private final Thread target;

    public Watchdog(Thread target) {
        this.target = target;
    }

    @Override
    public void run() {
        while (true) {
            final State state = target.getState();
            System.out.println("target thread state: " + state);

            if (State.NEW.equals(state)) {
                target.start();
            }

            if (State.TERMINATED.equals(state)) {
                System.out.println("감시 종료");
                break;
            }

            try {
                Thread.sleep(400);
            } catch (InterruptedException ignore) {}
        }
    }
}
