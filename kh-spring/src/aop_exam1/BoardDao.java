package aop_exam1;

public class BoardDao implements Dao{

	public BoardDao() {

	}

	@Override
	public void select() {
		System.out.println("BoardDao.select()");
	}
}
