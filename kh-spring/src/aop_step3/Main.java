package aop_step3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_step3/aop_step3.xml");

		Dao dao =(Dao)context.getBean("proxy");
		String r = dao.update();
		System.out.println(r);
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
