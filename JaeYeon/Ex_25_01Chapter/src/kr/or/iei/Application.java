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
		// 1. Ŭ���� �ε�
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//2. ������ ���̽��� ����

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
// # JDBC ��ü
// DriverManager : ����̹� ����
// connection : Ư�� DB�� ���� Ŀ�ؼ�(����).
// DB �۾��� ���� ��ü
// 1. Statement
// 2. PreparedStatement
// ResultSet : ���� ����� �޾Ƽ� �����ϴ� ��ü

// # Statement, PreparedStatement
// executeQuery : ��ȯ�� ResultSet, DQL (SELECT)
// executeUpdate : ��ȯ�� int, ���� ���� �� ��. DML(insert, update, delete)

// ������
// prepared statment�� ĳ��

// # ResultSet
// DQL ���� ��� ����
// getŸ��(int columnIndex);
// getŸ��(String columnLabel);

// # CRUD
// Create(insert) Read(select) Update(update) Delete(delete)

// ## Create

// ## READ 

// BOF
// 1. chwon 20/11/93 10:52
// 2. 
// 3. 




// ## ���� �ܰ�

//1. SQL ���� �м�
//2. ������
//3. ����

//statement�� 1~3�ܰ� �Ź� ����
//prepared statement�� 1~3�ܰ� ĳ�� ���Ŀ� ����

// ## Ʈ����� ���� �޼ҵ�

//Connection ��ü

//commit()
//rollback()
//

