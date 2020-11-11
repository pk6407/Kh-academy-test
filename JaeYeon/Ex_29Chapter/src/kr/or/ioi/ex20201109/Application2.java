package kr.or.ioi.ex20201109;

public class Application2 {

	public static void main(String[] args) throws InterruptedException {
		final move thread = new move();
		thread.start();
		thread.join();
		System.out.println(thread.getData());
	}
}