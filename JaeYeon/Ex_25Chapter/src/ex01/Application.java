package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Application {

	public static void main(String[] args) throws ClassNotFoundException {
		// 1. jvm에 클래스 로드 (Oracle JDBC Driver)
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. 드라이버 매니저로부터 커넥션 얻어옴
		try (final Connection conn = 
				DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE",
						"system","1234"
						);
				// 3. 데이터베이스 작업
				final PreparedStatement pstmt = 
						conn.prepareStatement("SELECT 1 FROM dual");
				){
			final ResultSet rs =	//query 결과를 담는 객체
					pstmt.executeQuery();	// query 실행
			rs.next();
			int value = rs.getInt(1);
			System.out.println(value);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
// # JDBC 객체
// DriverManager : 드라이버 관리
// connection : 특정 DB에 대한 커넥션(세션).
// DB 작업을 위한 객체
// 1. Statement
// 2. PreparedStatement
// ResultSet : 쿼리 결과를 받아서 저장하는 객체

// # Statement, PreparedStatement
// executeQuery : 반환을 ResultSet, DQL (SELECT)
// executeUpdate : 반환은 int, 영향 받은 행 수. DML(insert, update, delete)

// 차이점
// prepared statment는 캐시

// # ResultSet
// DQL 수행 결과 저장
// get타입(int columnIndex);
// get타입(String columnLabel);

// # CRUD
// Create(insert) Read(select) Update(update) Delete(delete)

// ## Create

// ## 