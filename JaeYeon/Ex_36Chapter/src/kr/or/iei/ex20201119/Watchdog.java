package kr.or.iei.ex20201119;

public class Watchdog extends Thread {

    // ������ ������
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
                System.out.println("���� ����");
                break;
            }

            try {
                Thread.sleep(400);
            } catch (InterruptedException ignore) {}
        }
    }
}
