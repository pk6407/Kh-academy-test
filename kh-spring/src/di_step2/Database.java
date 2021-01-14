package di_step2;

import java.util.ArrayList;
import java.util.List;

//개발자 박씨
public class Database implements DB{

	@Override
	public List<String> select(String findStr) {
		List<String> aaa = new ArrayList<String>();
		aaa.add("오라클에서 처리된 결과.");
		
		
		return aaa;
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
