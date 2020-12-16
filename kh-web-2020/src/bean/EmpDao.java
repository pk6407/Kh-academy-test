package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


// DAO or DTO(네트워크기능 있을시) = 보통 구별안하고 사용하기도 한다.
// MVC 중 Controll과 관련한 각종 제어 구조를 담당한다. (DAO, DTO)
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
			//띄어쓰기 중요하다. 아니면 문자열이 이상하게 들어가게 된다.
			String sql = " select * from hr.employees "	
					   + " where first_name like ? "
					   + " or 	email like ? "
					   + " or 	phone_number like ? ";
			
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
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
	}
}
