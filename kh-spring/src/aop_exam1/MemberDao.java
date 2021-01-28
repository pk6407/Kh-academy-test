package aop_exam1;

public class MemberDao implements Dao{
	
	public MemberDao() {
	}

	@Override
	public void select() {
		System.out.println("MemberDao.select()");
	
	}
}
