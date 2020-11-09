package kr.or.ioi.ex20201109;

import java.util.Scanner;

public class Application {

	public static void main(String[] args) {
		final DummyTask task = new DummyTask();
		final Thread thread = new Thread(task);

		thread.start();

		final Scanner scanner = new Scanner(System.in);
		while (true) {
			final int i = scanner.nextInt();
			final String threadName = Thread.currentThread().getName();
			System.out.println(threadName + ": " + i);
		}
	}
}

