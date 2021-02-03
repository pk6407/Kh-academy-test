# 1교시

Spring boot DBCP(Commecyian Pool),Mybatis 연결
DI,AOP 적용

[프로젝트]
- 각조 개발범위, 컨텐츠 설정

(dependency)를 통해 주입된 의존성에서 오라클 드라이버 인식문제가 발생했을 때 조치 방법 -> 
<dependency>
		<groupId>com.oracle.database.jdbc</groupId>
		<artifactId>ojdbc8</artifactId>
		<scope>runtime</scope>
</dependency>
삭제

mvnrepository 사이트에서 ojdbc와 관련된 <dependency/>와 jar 를 가져와야 함.
* ojdbc의 jar의 버전과의 트러블은 거의 없다.
- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc8/21.1.0.0 여기서 jar파일 다운

pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.4.2</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.example</groupId>
	<artifactId>demo</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>
	<name>demo</name>
	<description>spring boot project example</description>
	<properties>
		<java.version>1.8</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-tomcat</artifactId>
			<scope>provided</scope>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	
		<dependency>
   			<groupId>javax.servlet</groupId>
    		<artifactId>jstl</artifactId>
    		<version>1.2</version>
		</dependency>

		<dependency>
    		<groupId>org.apache.tomcat.embed</groupId>
   		 	<artifactId>tomcat-embed-jasper</artifactId>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		
<dependency>
    <groupId>com.oracle.database.jdbc</groupId>
    <artifactId>ojdbc8</artifactId>
    <version>21.1.0.0</version>
    <scope>system</scope>
    <systemPath>
    	${basedir}/src/main/webapp/WEB-INF/lib/ojdbc8-21.1.0.0.jar
    </systemPath>
</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jdbc</artifactId>
		</dependency>
		</dependencies>
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>
```

# 2교시

[오라클 연결 응용 요구조건]

WEB-INF/jsp/member/select.jsp페이지 생성 --> view
- 검색어를 입력한 뒤 검색된 결과를 표시함.
  - 아이디,성명,연락처,이메일 : UI는 자유.
- Controller: BoardController 사용

# 3교시

select.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
</head>
<body>
<div id='member'>
	<h2>회원조회</h2>
	
	<form name='frm' method='post' action='select'>
		<input type='text' name='findStr' value='${param.findStr }'>
		<input type='submit'>
	</form>
	
	<div class='item,title'>
		<span>NO</span>
		<span>아이디</span>
		<span>성명</span>
		<span>연락처</span>
		<span>이메일</span>
	</div>
	
	<div id='result'>
		<c:forEach items="${list}" var="vo" varStatus="i">
			<div class='item'>
				<span>${i.index + 1 }</span>
				<span>${vo.mid }</span>
				<span>${vo.name }</span>
				<span>${vo.phone }</span>
				<span>${vo.email }</span>
			</div>
		</c:forEach>
		
	</div>
	
</div>
</body>
</html>
```

BoardController.java

```java
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
```
