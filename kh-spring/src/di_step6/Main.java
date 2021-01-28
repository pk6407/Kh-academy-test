package di_step6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/di_step6/di_step6.xml");
			
		// or dao = (MemberDao)context.getBean("dao");	
		MemberDao dao = context.getBean("dao", MemberDao.class); 
	}

}
