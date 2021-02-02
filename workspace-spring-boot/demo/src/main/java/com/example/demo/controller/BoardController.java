package com.example.demo.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BoardController {
	JdbcTemplate jdbcTemp;
	
	@Autowired
	public BoardController(JdbcTemplate jdbcTemp) {
		this.jdbcTemp = jdbcTemp;
	}
	
	
	@RequestMapping(value="board_select", method=RequestMethod.GET)
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
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	
		
		return str;
	}
}
