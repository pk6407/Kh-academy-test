package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.FileUpload;

public class MemberDao {
	Connection conn; //database의 연결 정보
	PreparedStatement ps; // 문자열로 되어 있는 sql문장을 sql 실행문장
	ResultSet rs; // select문의 실행결과
	
	public MemberDao() {
		conn = new Application().getConn();
	}
	
	public boolean login(String mid, String pwd) {
		boolean b = false;
		try {
			String sql = "select count(mid) cnt from members where mid=? and pwd=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  mid);
			ps.setString(2,  pwd);
			
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
	
	public int getTotListSize(String findStr) throws Exception{
		int totListSize = 0;
		String sql = "select count(mid) cnt from members where mid like ? or email like ? or phone like ? or address like ? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1,  "%" + findStr + "%");
		ps.setString(2,  "%" + findStr + "%");
		ps.setString(3,  "%" + findStr + "%");
		ps.setString(4,  "%" + findStr + "%");
		
		rs = ps.executeQuery();
		if(rs.next()) {
			totListSize = rs.getInt("cnt");
		}
		return totListSize;
		
	}
	
	
	
	public List<MemberVo> select(Page page){
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			//넘겨받은 검색어를 사용하여 totListSize값을 구해야함.
			String f = page.getFindStr();
			page.setTotListSize(getTotListSize(f));
			page.pageCompute();
			
			String sql = " select * from ("
			           + "   select rownum no, m.* from ("
			           + "     select * from members "
					   + "     where mid like ? or email like ? or phone like ? or address like ? "
					   + "     order by name asc) m   "
					   + " ) where no between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,  "%" + page.getFindStr() + "%");
			ps.setString(2,  "%" + page.getFindStr() + "%");
			ps.setString(3,  "%" + page.getFindStr() + "%");
			ps.setString(4,  "%" + page.getFindStr() + "%");			
			ps.setInt(5, page.getStartNo());
			ps.setInt(6, page.getEndNo());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setMid(rs.getString("mid"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setPhoto(rs.getString("photo"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setMdate(rs.getString("mdate"));
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConn();
			return list;
		}
	}

	public String insert(MemberVo vo){
		String msg = "회원 정보가 정상적으로 저장되었습니다.";
		try {
			String sql = " insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate) "
					   + " values(?, ?, ?, ?, ?, ?, ?, ?, sysdate )";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getZipcode());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getPhoto());
						
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				msg = "회원정보 입력중 오류 발생....";
				throw new Exception(msg);
			}
					
		}catch(Exception ex) {
			msg = ex.getMessage();
			
			// 이미 업로드된 파일 삭제
			File file = new File(FileUpload.saveDir + vo.getPhoto());
			if(file.exists()) {
				file.delete();
			}
			
		}finally {
			disConn();
			return msg;
		}
	}
	
	public String update(MemberVo vo){
		String msg = "회원 정보가 정상적으로 수정되었습니다.";
		try {
			
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			disConn();
			return msg;
		}
	}

	public String delete(MemberVo vo){
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		try {
			String sql = "delete from members where mid=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());
			
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				throw new Exception("회원 정보 삭제중 오류 발생");
			}
			
			//첨부 파일 삭제
			File file = new File(FileUpload.saveDir + vo.getDelFile());
			if(file.exists()) {
				file.delete();
			}
			
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			disConn();
			return msg;
		}
	}
	
	public MemberVo view(String mid){
		MemberVo vo = new MemberVo();
		try {
			String sql = "select * from members where mid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setMid(rs.getString("mid"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setPhoto(rs.getString("photo"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setMdate(rs.getString("mdate"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConn();
			return vo;
		}
	}

	public void disConn() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}