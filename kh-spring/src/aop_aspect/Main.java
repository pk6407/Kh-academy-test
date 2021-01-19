package aop_aspect;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_aspect/aop_aspect.xml");

		Dao dao =(Dao)context.getBean("bDao");
		List<String> r = dao.select();
		System.out.println(r);
		
		String str = dao.insert();
		System.out.println(str);
	
	
		
	

	}
		
	public static void main(String[] args) {
		new Main();
	}
}
