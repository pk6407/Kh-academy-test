package bean;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test {

	public static void main(String[] args) throws SQLException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin@localhost:1521:xe";
		String user = "system";
		String password = "oracle";
		try {
			Class.forName(driver);
			System.out.println("jdbc driver 로딩 성공");
			DriverManager.getConnection(url, user, password);
			System.out.println("오라클 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("jdbc driver 로딩 실패");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패");
		}
	}
}