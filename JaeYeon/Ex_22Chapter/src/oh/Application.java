package oh;

public class Application {

	public static void main(String[] args) {
        /*final StickCoffee sc1 = new StickCoffee("maxim", 1000);
        final StickCoffee sc2 = new StickCoffee("maxim", 1000);
        System.out.println(sc1 == sc2);     // false
        System.out.println(sc1.equals("abc")); // true
        System.out.println(sc1.getClass());*/
        final StickCoffee sc1 = new StickCoffee("maxim", 1000);
        final StickCoffee sc2 = new StickCoffee("maxim", 1000);
        final StickCoffee sc3 = new StickCoffee("maxim", 1000);
        final HashMap<StickCoffee, Integer> map = new HashMap<>();
        map.put(sc1, 100);
        map.put(sc2, 200);
        map.put(sc3, 300);
        System.out.println(1081127135 % 128);
        System.out.println("++++++++++++++++");
        System.out.println(sc1 == sc2); // 동일한 객체인가?
        System.out.println(sc1.equals(sc2));    // 동등성 (값이 완전하게 같음?)
        System.out.println(sc1.hashCode());
        System.out.println(sc2.hashCode());
        System.out.println(sc3.hashCode());
        System.out.println("=================================\n\n\n\n");
        System.out.println(map.get(sc1));   //
        System.out.println(map.get(sc2));   //
        System.out.println(map.get(sc3));   //
    }
}