package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDao implements Log{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	public MemberDao() {
		System.out.println(logOut());
	}
	
	@Override
	public String logOut() {
		String r = sdf.format(new Date());
		return r;
	}
	
}
