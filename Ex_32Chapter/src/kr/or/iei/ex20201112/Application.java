package kr.or.iei.ex20201112;

public class Application {

    public static void main(String[] args) {
        final List<Integer> list = new LinkedList<>();
        list.add(5);
        list.add(7);
        list.add(2);
        list.add(15);
        System.out.println(list.size());
        System.out.println(list.get(1));
        list.remove(5);
        System.out.println(list.size());
    }
}
