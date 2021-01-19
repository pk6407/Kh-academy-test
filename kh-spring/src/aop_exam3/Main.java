package aop_exam3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_exam3/aop_exam3.xml");
		
		Product p = (Product)context.getBean("tv");
		
		System.out.println("------------------");
		
		//System.out.println(((TVProduct)p).name);
		
		int i = p.insert("");
		
		System.out.println("------------------");
		p.update("");
		
		System.out.println("------------------");
		p.delete(1);
		
		System.out.println("------------------");
		p.select("");
		
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}