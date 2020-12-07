package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public EmpDao() {
		conn = new Application().getConn();
	}
	
	public List<EmpVo> search(String findStr){
		List<EmpVo> list = new ArrayList<EmpVo>();

		try {
			String sql = " select * from hr.employees "
					   + " where  first_name like ? "
					   + " or     email like ? "
					   + " or     phone_number like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				EmpVo vo = new EmpVo();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("first_name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone_number(rs.getString("phone_number"));
				vo.setSalary(rs.getDouble("salary"));
				
				list.add(vo);
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
}