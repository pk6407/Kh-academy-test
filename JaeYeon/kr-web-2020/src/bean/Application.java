package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class Application {
	Connection conn;
	public Application() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", 
					"system", "oracle"
					);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	public Connection getConn() {
		return conn;
	}
}