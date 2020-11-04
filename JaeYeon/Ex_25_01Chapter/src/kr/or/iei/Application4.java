package kr.or.iei;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Application4 {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASS = "oracle";

    public static void main(String[] args) throws ClassNotFoundException {
        // 1. Ŭ���� �ε�
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 2. �����ͺ��̽��� ����
        try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

            // 3. �����ͺ��̽� �۾�
            final String sql = "SELECT * FROM jdbc_example";
            final PreparedStatement pstmt = conn.prepareStatement(sql);
            final ResultSet rs = pstmt.executeQuery();

            final List<JdbcExample> list = new ArrayList<>();
            while (rs.next()) {
                final JdbcExample jdbcExample = read(rs);
                list.add(jdbcExample);
            }

            // for-each
            for (JdbcExample jdbcExample : list) {
                System.out.println(jdbcExample);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private static JdbcExample read(ResultSet rs) throws SQLException {
        final long id = rs.getLong("id");
        final String name = rs.getString("name");
        final LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
        final String email = rs.getString("email");
        return new JdbcExample(id, name, time, email);
    }
}