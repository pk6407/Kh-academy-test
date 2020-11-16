package kr.or.iei.ex20201113;

public class Application {

	public static void main(String[] args) {
		final Queue<Integer> queue = new ArrayQueue<>();
		queue.enqueue(10);
		queue.enqueue(20);
		queue.enqueue(30);
		queue.enqueue(40);
		

		System.out.println(queue.dequeue());
		System.out.println(queue.dequeue());
	}

}
