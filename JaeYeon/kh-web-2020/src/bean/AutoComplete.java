package bean;
// java에서 bean 이란 부품화 된 하나의 객체?로 생각하면 된다.
// bean으로 이름 지어서 각 class들이 하나의 부품화 시켜 객체지향적으로 코드를 작성하는 습관필요

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AutoComplete {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public AutoComplete() {
		conn = new Application().getConn();
	}
	
	
	// ['java','jara','jagopa','jsp','javascript','like','love','life']
	// => JSON 처리 방법 ''(X), ""(O)
	public String getData() {
		StringBuffer sb = new StringBuffer();
		
		try {
			String sql = "select first_name from hr.employees";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); 
			// CRUD(insert(create), select(read), update(update), delete(delete))
			
			sb.append("[");
			rs.next();
			sb.append("'" + rs.getString("first_name") + "'");
			
			while(rs.next()) {
				sb.append(",'" + rs.getString("first_name")+"'");
			}
			sb.append("]");
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			String temp = sb.toString();
			temp = temp.replaceAll("'", "\"");
			//java에서 "" 안에 " 넣으면 에러가 나기 때문에 "" 안에 "를 넣으려면 \" 이렇게 넣어줘야지 인식이 된다.
			// \"에서 \는 코드 상에서 영향을 주지는 않는 아무런 의미없는 코드이다.
			return temp;
		}
	}
}
