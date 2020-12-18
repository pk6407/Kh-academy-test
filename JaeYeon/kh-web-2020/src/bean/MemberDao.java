package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	Connection conn;	//database의 연결정보
	PreparedStatement ps;	//문자열로 되어 있는 sql 문장을 sql 실행문장
	ResultSet rs;	// select문의 실행 결과
	public MemberDao() {
		
		conn = new Application().getConn();
		
	}
	
	public boolean login(String mid, String pwd) {
		boolean b = false;
		try {
			String sql = "select count(mid) cnt from members where mid=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt >=1) {
					b=true;
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	
	}
}
