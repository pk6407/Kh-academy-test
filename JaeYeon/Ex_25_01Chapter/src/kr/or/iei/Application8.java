package kr.or.iei;

import java.sql.*;

public class Application8 {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASS = "oracle";

    public static void main(String[] args) throws ClassNotFoundException {
        // 1. ����̹� Ŭ���� �ε�
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 2. Ŀ�ؼ��� ��´� - DB�� ����(����)
        try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // 3. �����ͺ��̽� �۾�
                // 1. executeQuery - ResultSet
            test1(conn);
                // 2. executeUpdate - int (���� ���� ���� ��)
            test2(conn);
                // 3. Ʈ����� ����
            test3(conn);
            // 4. ���� ����
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private static void test3(Connection conn) throws SQLException {
        conn.setAutoCommit(false);  // auto commit ����. true�� ��.
        conn.commit();  // commit - �������� ����ҿ� �ݿ���
        conn.rollback();    // rollback - �ݿ��� ������� ��ҵ�
        conn.getAutoCommit();   // ���� auto commit ���� ���¸� ��Ÿ��. true�� ���� ����.
    }

    private static void test2(Connection conn) throws SQLException {
        // 1. �Ķ���� ���� - setXXXXX(�Ķ���͹�ȣ, ��)
        // 2. executeUpdate�� ����� ���� ���� ���� ������ ��Ÿ��
        final String sql = "INSERT INTO bank_account VALUES (?, ?, ?)";
        final PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setLong(1, 10);
        pstmt.setString(2, "chwon");
        pstmt.setLong(3, 10000);
        final int affectedRows = pstmt.executeUpdate();
        System.out.println(affectedRows);
    }

    private static void test1(Connection conn) throws SQLException {
        // 1. prepared statement
        // 2. executeQuery�� SELECT�� ����
        // 3. �� ����� ResultSet��
        // 4. cursor
        final String sql = "SELECT * FROM bank_account";
        final PreparedStatement pstmt = conn.prepareStatement(sql);
        final ResultSet resultSet = pstmt.executeQuery();

        while(resultSet.next()) {
            final int id = resultSet.getInt("id");
            final String username = resultSet.getString("username");
            final int money = resultSet.getInt("money");
            System.out.println(id);
            System.out.println(username);
            System.out.println(money);
            System.out.println("---------------------");
        }
    }
}