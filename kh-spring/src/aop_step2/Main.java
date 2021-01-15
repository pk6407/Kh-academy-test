package aop_step2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_step2/aop_step2.xml");
		Advice advice = (Advice)context.getBean("advice");
		advice.around();
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
