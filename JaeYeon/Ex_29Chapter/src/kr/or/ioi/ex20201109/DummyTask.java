package kr.or.ioi.ex20201109;

public class DummyTask implements Runnable{

	@Override
	public void run() {
		while (true) {
			try {
				final String threadName = Thread.currentThread().getName();
				System.out.println(threadName + " - message");
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

