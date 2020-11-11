package test;

public class Application {

	public static void main(String[] args) {
//		Super testA = new Sub();
//		Sub testB = new Sub();
//		System.out.println(((Sub)testA).data);
//		System.out.println(testB.data);
		final String name = Singleton.getInstance().getName();
		System.out.println(name);
		Singleton.getInstance().addToList("1");
		Singleton.getInstance().addToList("2");
		Singleton.getInstance().addToList("3");
		Singleton.getInstance().showList();
	}

}
