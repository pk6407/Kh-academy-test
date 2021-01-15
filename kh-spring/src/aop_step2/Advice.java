package aop_step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Advice {
	Dao dao;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	public Advice(Dao dao) {
		this.dao = dao;
	}
	
	
	public String logOut() {
		String r = sdf.format(new Date());
		
		return r;
	}
	
	public String before() { //Before Advice
		String log = logOut();
		System.out.println(log);
		
		String r = dao.delete();
		System.out.println(r);
		return r;
	}
	
	public String after() { //after Advice
		String r = dao.delete();
		System.out.println(r);
		
		String log = logOut();
		System.out.println(log);
		
		return r;
	
	}
	
	public void around() {
		String log = logOut();
		System.out.println(log);
		
		String r = dao.delete();
		System.out.println(r);
		
		String log2 = logOut();
		System.out.println(log2);

	
	
	}
	
	
	
}
