package aop_step3;

import java.util.List;

public class MemberDao implements Dao{
	
	public MemberDao() {
	}

	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		return "MemberDao.insert()";
	}

	@Override
	public String update() {
		return "MemberDao.update()";
	}

	@Override
	public String delete() {
		return "MemberDao.delete()";
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
