package di_step3;

public class Main {
	DB db;
	// 이부분은 외부에 노출되면 안되는 코드임.
	// 생성자를 통한 의존성 주입
	public Main(DB db) {
		this.db = db;
		System.out.println(db.select("kim"));
		
	}
	
	// 메서드를 통한 의존성 주입
	public void method(DB db) {
		this.db = db;
		System.out.println(db.select("your"));
	}
	
	
	public static void main(String[] args) {
		Assembler ass = new Assembler();
		DB db = ass.getDb();
		Main m = new Main(db);
		
		m.method(db);
		
		
		

	}

}
