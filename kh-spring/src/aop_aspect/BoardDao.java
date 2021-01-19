package aop_aspect;

import java.util.ArrayList;
import java.util.List;

public class BoardDao implements Dao{

	public BoardDao() {
	}

	@Override
	public List<String> select() {
		List<String>list = new ArrayList<String>();
		list.add("kim");
		list.add("lee");
		list.add("park");
		System.out.println("BoardDao Select()");
		return list;
	}

	@Override
	public String insert() {
		return "BoardDao.insert()";
	}

	@Override
	public String update() {
		return "BoardDao.update()";
	}

	@Override
	public String delete() {
		return "BoardDao.delete()";
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
