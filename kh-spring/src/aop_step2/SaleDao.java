package aop_step2;

import java.util.List;

public class SaleDao implements Dao{
	
	public SaleDao() {
	}

	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() {
		return "SaleDao.delete()";
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
