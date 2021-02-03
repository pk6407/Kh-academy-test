package com.example.demo.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.member.MemberVo;

@RestController
public class BoardController {
	JdbcTemplate jdbcTemp;
	
	@Autowired
	public BoardController(JdbcTemplate jdbcTemp) {
		this.jdbcTemp = jdbcTemp;
	}
	
	
	@RequestMapping(value="board_select", method = RequestMethod.GET)
	   public String select() {
	      String str = "";
	      
	      try {
	         PreparedStatement ps = null;
	         ResultSet rs = null;
	         Connection conn = jdbcTemp.getDataSource().getConnection();
	         String sql = "select mid from board";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();
	         while(rs.next()) {
	            str += rs.getNString("mid") + "<br/>";
	         }     
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return str;
	   }
	
	@RequestMapping(value="select", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectMember(String findStr) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo>list = new ArrayList<MemberVo>();
		String str = ""; 
	      try {
	         PreparedStatement ps = null;
	         ResultSet rs = null;
	         Connection conn = jdbcTemp.getDataSource().getConnection();
	         String sql = "select * from members where mid like ? or name like ? or phone like ? or email like ? ";
	         ps = conn.prepareStatement(sql);
	         ps.setNString(1, "%" + findStr + "%");
	         ps.setNString(2, "%" + findStr + "%");
	         ps.setNString(3, "%" + findStr + "%");
	         ps.setNString(4, "%" + findStr + "%");
	         
	         rs = ps.executeQuery();
	         while(rs.next()) {
	            MemberVo vo = new MemberVo();
	            vo.setMid(rs.getString("mid"));
	            vo.setName(rs.getString("mid"));
	            vo.setPhone(rs.getString("mid"));
	            vo.setEmail(rs.getString("mid"));
	            list.add(vo);
	         }
	         conn.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      mv.addObject("list",list);
	      mv.setViewName("member/select");
	      
	      return mv;
	}
}