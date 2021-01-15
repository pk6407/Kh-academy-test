package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SaleDao implements Log{
	public SaleDao() {
		System.out.println(logOut());
	}
	
	@Override
	public String logOut() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String rst = sdf.format(new Date());
		return rst;
	}
	
}
