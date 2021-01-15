package di_step6;

public class MemberDao {
	DB db;
	
	// 생성자를 통한 주입
	
	public MemberDao() {}
	public MemberDao(DB db) {
		this.db = db;
	}

	public DB getDb() {
		return db;
	}

	public void setDb(DB db) {
		this.db = db;
		System.out.println("메서드를 통해 주입 받음...........");
		System.out.println(db.select(""));
	}
	
}
