package kr.or.iei;

import java.sql.*;

public class Application {

    public static void main(String[] args) throws ClassNotFoundException {
        // 1. jvm�� Ŭ���� �ε� (Oracle JDBC Driver)
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 2. ����̹� �Ŵ����κ��� Ŀ�ؼ� ����
        try (final Connection conn =
                     DriverManager.getConnection(
                             "jdbc:oracle:thin:@localhost:1521:XE",
                             "system", "oracle"
                     );
             // 3. �����ͺ��̽� �۾�
             final PreparedStatement pstmt =
                     conn.prepareStatement("SELECT 1 FROM dual");
        ) {

            final ResultSet rs =    // query ����� ��� ��ü
                    pstmt.executeQuery();    // query ����
            rs.next();
            int value = rs.getInt(1);
            System.out.println(value);
        } catch (SQLException e) {
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
//setAutoCommit(boolean)


