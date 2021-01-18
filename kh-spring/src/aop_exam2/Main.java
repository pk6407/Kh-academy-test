package aop_exam2;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_exam2/aop_exam2.xml");
		
		Product p = (Product)context.getBean("job");
		List<String> r = p.select("abc");
		p.insert("abc");
		p.update("abc");
		p.delete(100);
	}
	
	public static void main(String[] args) {
		new Main();
	}
}