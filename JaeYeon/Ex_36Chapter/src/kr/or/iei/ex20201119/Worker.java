package kr.or.iei.ex20201119;

public class Worker extends Thread {

    private final CriticalSection cs;

    public Worker(CriticalSection cs) {
        this.cs = cs;
    }

    @Override
    public void run() {
        while (cs.getData() > 0) {
            // 100 ~ 300 ������ ���� �������� ����
            final int value = (int) (Math.random() * 3 + 1) * 100;
            if (cs.extractData(value)) {
                System.out.printf("[%s] %d ������. (cs:%d\n)",
                        getName(), value, cs.getData()
                );
            }
        }
    }
}
