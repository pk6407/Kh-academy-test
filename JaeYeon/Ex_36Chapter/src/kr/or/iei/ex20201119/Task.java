package kr.or.iei.ex20201119;

/**
 * �������� �����ڷ� �Ѿ(passing)
 */
public class Task implements Runnable {

    /**
     * �����尡 ���� �� �۾��� �ۼ�
     */
    @Override
    public void run() {
        while (true) {
            System.out.println("�ȳ�");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ignore) {
            }
        }
    }
}

