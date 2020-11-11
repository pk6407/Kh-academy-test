package kr.or.ioi.ex20201109;


public class ThreadPriority implements Thread{

	public ThreadPriority(String threadName) {
        setName(threadName);
    }

    @Override
    public void run(){
        long sum = 0;
        final long t1 =System.currentTimeMillis();
        for(int i = 0; i< 20_0000_0000; i++){
            sum+=i;
        }
        final long t2 =System.currentTimeMillis();

        System.out.printf("%s 종료, (%d)< 수행시간 %d ms>\n",
                getName(),
                getPriority(),
                t2 - t1);
    }
}