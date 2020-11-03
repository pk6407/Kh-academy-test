package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Application {

	public static void main(String[] args) throws ClassNotFoundException {
		// 1. jvm�� Ŭ���� �ε� (Oracle JDBC Driver)
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. ����̹� �Ŵ����κ��� Ŀ�ؼ� ����
		try (final Connection conn = 
				DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE",
						"system","1234"
						);
				// 3. �����ͺ��̽� �۾�
				final PreparedStatement pstmt = 
						conn.prepareStatement("SELECT 1 FROM dual");
				){
			final ResultSet rs =	//query ����� ��� ��ü
					pstmt.executeQuery();	// query ����
			rs.next();
			int value = rs.getInt(1);
			System.out.println(value);
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

// ## 