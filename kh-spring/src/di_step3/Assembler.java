package di_step3;

// 외부에 노출되는 코드
// 외부 조립기라 표현한다.
public class Assembler {
	DB db;

	public DB getDb() {
		db = new YourDB();
		return db;
	}
	
	
}
