package ex01;

import java.sql.*;
import java.time.LocalDateTime;

public class Application1 {

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "oracle";
	
	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 클래스 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. 데이터베이스에 접속
		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
     
			// 3. 데이터베이스 작업
			final String sql = "SELECT * FROM jdbc_example WHERE id = 4";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			final ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			final int id = rs.getInt(1);
			final String name = rs.getString(2);
			final LocalDateTime time = rs.getTimestamp(3).toLocalDateTime();
			final String email = rs.getString(4);
			
		} catch (SQLException throwables) {
            throwables.printStackTrace();
 
	}

}
}
