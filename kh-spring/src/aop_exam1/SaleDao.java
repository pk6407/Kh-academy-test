package aop_exam1;

public class SaleDao implements Dao {

	public SaleDao() {
	}

	@Override
	public void select() {
		System.out.println("SaleDao.select()");
	}
	
}
