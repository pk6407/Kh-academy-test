package di_step4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Assembler {
	DB db;

	public DB getDb() {
		ApplicationContext context =
			new FileSystemXmlApplicationContext("src/di_step4/di_step4.xml");
		
		db = context.getBean("db", DB.class); // or db = (DB)context.getBean("db");
		return db;
	}
	
	
}
