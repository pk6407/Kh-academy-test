package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Log{

	public BoardDao() {
		System.out.println(logOut());
	}
	
	@Override
	public String logOut() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
}
