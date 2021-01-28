package di_step2;

public class Main {

	public Main() {
		// 김씨
		DB db = new OracleDB();
		System.out.println(db.select("kim"));
		
		//박씨
		db = new Database();
		System.out.println(db.select("park"));
		
		//이씨
		db = new MyDB();
		System.out.println(db.select("lee"));
		
	}
	
	public static void main(String[] args) {
		new Main();

	}

}
