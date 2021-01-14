package di_step2;

public class Main {

	public Main() {
		// 김씨
		OracleDB db = new OracleDB();
		System.out.println(db.select("kim"));
		
		// 박씨
		Database db2 = new Database();
		System.out.println(db2.select("park"));
		
		// 이씨
		MyDB db3 = new MyDB();
		System.out.println(db3.select("lee"));
	
	}
	
	public static void main(String[] args) {
		new Main();

	}

}
