package aop_aspect;

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
		return "SaleDao.insert()";
	}

	@Override
	public String update() {
		return "SaleDao.update()";
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
