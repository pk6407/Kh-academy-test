package kr.or.iei;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.sound.midi.SysexMessage;

public class Application {

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "oracle";
	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 클래스 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//2. 데이터 베이스에 접속

		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {


			final  String sql = "SELECT * FROM  jbdc_example = 4";
			final PreparedStatement pstmt= conn.prepareStatement(sql);
			final  ResultSet rs = pstmt.executeQuery(); 
			rs.next();

			final int id = rs.getInt(1);
			final String name = rs.getString(2);
			final LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
			final String email = rs.getString("email");


			System.out.println( id); 
			System.out.println(name); 
			System.out.println( time ); 
			System.out.println( email);
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

// ## READ 

// BOF
// 1. chwon 20/11/93 10:52
// 2. 
// 3. 




// ## 실행 단계

//1. SQL 구문 분석
//2. 컴파일
//3. 실행

//statement는 1~3단계 매번 실행
//prepared statement는 1~3단계 캐시 이후에 생략

// ## 트랜잭션 관련 메소드

//Connection 객체

//commit()
//rollback()
//

