package di_step6;

import java.util.List;
import java.util.Vector;

public class MyDB implements DB{

	List<String> kkk = new Vector<String>();
	@Override
	public List<String> select(String findStr) {
		System.out.println("오라클DB에서 출력됨.");
		return kkk;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
