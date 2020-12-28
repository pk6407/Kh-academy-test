package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class Application {
   // Connection conn을 만약 static으로 선언했다면 여기 멤버필드에서 선언 불가하고
   // 생성자 안에 static Connection conn 으로 선언한 후 사용해야 하며 
   // 아래의 public Connection getConn 메소드도 static(정적)으로 선언해야 사용가능하다.
	Connection conn;
	String userName = "system";
	String userPwd = "oracle";
	public Application() {
		connect();
	}
	
	public Application(String u, String p) {
		this.userName = u;
		this.userPwd = p;
		connect();
	}
	
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", 
					userName, userPwd );
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public Connection getConn() {
		return conn;
	}
}