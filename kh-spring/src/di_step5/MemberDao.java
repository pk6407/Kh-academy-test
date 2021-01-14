package di_step5;

public class MemberDao {
	DB db;
	
	public MemberDao(DB db) {
		this.db = db;
		System.out.println(db.select(""));
	}
}
