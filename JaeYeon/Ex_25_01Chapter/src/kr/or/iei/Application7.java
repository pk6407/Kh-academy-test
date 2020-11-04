package kr.or.iei;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Application7 {
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASS = "oracle";

    public static void main(String[] args) throws ClassNotFoundException {
        // 1. Ŭ���� �ε�
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 2. �����ͺ��̽��� ����
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
            final boolean ����_Ŀ�ؼ���_autocommit_�������� = conn.getAutoCommit();
            conn.setAutoCommit(false);

            String sql1 = "UPDATE bank_account SET money = 0 WHERE username = 'A'";
            String sql2 = "UPDATE bank_account SET money = 1000 WHERE username = 'B'";

            // A�� ���¸� 0����
            final PreparedStatement pstmt1 = conn.prepareStatement(sql1);
            final int affectedRows1 = pstmt1.executeUpdate();
            System.out.println("1: " + affectedRows1);

            // B�� ���¸� 1000����
            final PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            final int affectedRows2 = pstmt2.executeUpdate();
            System.out.println("2: " + affectedRows2);

            conn.commit();
            conn.setAutoCommit(����_Ŀ�ؼ���_autocommit_��������);
        } catch (SQLException throwables) {
            if (conn != null) {
                try {
                    System.out.println("���� �ѹ�");
                    conn.rollback();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            throwables.printStackTrace();
        } finally {
            close(conn);
        }
    }

    private static void �����߻���() throws SQLException {
        if (System.currentTimeMillis() > 0) {
            throw new SQLException("�ѹ� �׽�Ʈ");
        }
    }

    private static void close(AutoCloseable closeable) {
        try {
            closeable.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}