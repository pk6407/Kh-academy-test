package di_step6;

import java.util.List;
import java.util.Vector;

// 개발자 이씨
public class MyDB implements DB{

	List<String> kkk = new Vector<String>();
	@Override
	public List<String> select(String findStr) {
		kkk.add("오라클에서 검색된 결과입니다.");
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
