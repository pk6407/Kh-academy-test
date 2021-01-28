package di_step5;

public class MemberDao {
	DB db;
	
	//생성자를 통한 주입.
	public MemberDao(DB db) {
		this.db = db;
		System.out.println(db.select(""));
	}
}
