package kr.or.iei.ex20201119;

public class Application1 {
 
    public static void main(String[] args) throws InterruptedException {
        final FactorialThread thread = new FactorialThread();
        thread.start();
        System.out.println("start ��");
        thread.join();
        System.out.println("join ��");
        final long result = thread.getData();
        System.out.println(result);
    }
}
