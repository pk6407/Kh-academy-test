package gb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Application;

public class GuestBookDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public GuestBookDao() {
		conn = new Application().getConn();
	}
	
	public List<GuestBookVo> select(String findStr){
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		
		try {
			String sql = " select serial, mid, mdate, doc from guestbook where mid like ? or doc like ? "
					   + " order by serial desc ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				GuestBookVo gb = new GuestBookVo();
				gb.setSerial(rs.getInt("serial"));
				gb.setMid(rs.getString("mid"));
				gb.setMdate(rs.getString("mdate"));
				gb.setDoc(rs.getString("doc"));
				
				list.add(gb);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
	
	/*
	update(){
		
	}
	
	insert(){
		
	}
	
	delete(){
		
	}
	
	
	*/
	
}