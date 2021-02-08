# 1교시

Spring 마무리
Spring Ajax 전환

[프로젝트]
- 와이어 프레임 체크

[공지]
2/9(화) 면접 특강 : 1:30 ~ 2:20

저번주 금요일 에러 때문에 확인중.

@Before("execution(* kr.jobtc.*.*(..))")
excution()괄호 사이에 패키지 명,클래스명 넣으면된다

BoardDao.java

```java
package kr.jobtc.board;

public class BoardDao {
	
	public void select() {
		System.out.println("BoardDao.select()...........");
	}
}
```

AppCofig.java

```java
package kr.jobtc;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;

//Spring boot에서 DI를 구성하는 또다른 방법

@Aspect
@Configuration
public class AppConfig {
	
	Logger logger = LoggerFactory.getLogger(AppConfig.class);
	BoardVo boardVo;

	// <bean id='boardVo' class='kr.jobtc.BoardVo'/>
	@Bean
	public BoardDao getBoardDao() {
		return new BoardDao();
	}
	
	@Before("execution(* kr.jobtc.board.*.*(..))")
	public void before(JoinPoint point) {
		System.out.println("실행 메서드 이전에 처리될 내용");
		logger.info("1111");
	}
	
}
```

MainController.java

```java
package kr.jobtc.controller;

import java.util.List;

 

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

 

import kr.jobtc.board.BoardVo;

import kr.jobtc.mybatis.BoardService;

@RestController
public class MainController {

@Autowired
	BoardService service;

@RequestMapping("/")
	public ModelAndView index() {
	ModelAndView mv = new ModelAndView();

		

		mv.setViewName("index");

		

		return mv;

	}

	

	@RequestMapping(value="/bSelect" , method= {RequestMethod.GET , RequestMethod.POST})

	public ModelAndView select() {

		ModelAndView mv = new ModelAndView();

		

		List<BoardVo> list = service.select();

		

		mv.addObject("list", list);

		mv.setViewName("board/select");



		return mv;

	}

	

	

}
```

BoardService.java

```java
package kr.jobtc.mybatis;

 

import java.util.List;

 

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

 

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.Page;

 

@Service

@Transactional

public class BoardService { // Mapper를 실행시킴

	@Autowired

	BoardMapper mapper;
	@Autowired
	BoardDao BoardDao;
	public List<BoardVo> select(){

		Page page = new Page();

		page.setFindStr("");

		List<BoardVo> list = mapper.select(page);

		System.out.println("BoardService.select()......");
		/*
		for(BoardVo v : list) {

			System.out.println(v.getSubject());

		}

		*/

		return list;

	}

	

}
```

BoardVo.java

```java
package kr.jobtc.board;

public class BoardVo {
	
	String subject;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
```

# 2~3교시

select.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='css/board.css'>
</head>
<body>
<div id='board'>
	<h2>일반 공지 게시판</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<input type='button' value='공지추가' id='btnInsert' />
		<input type='text' name='findStr'/>
		<input type='button' value='검색' id='btnFind' />
	</form>
	<hr/>
	
	<c:forEach var='vo' items='${list }'>
		<div class='item'>
			<span>${vo.subject }</span>
		</div>
	</c:forEach>

</div>
</body>
</html>
```

index.js

```js
/* index.js */


function goURL(url){
	$('#here').load(url);

}
```

applcation.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle

# mybatis mapper
mybatis.type-aliases-package=kr.jobtc.mybatis
mybatis.mapper-locations=static/mapper/*.xml

# connection pool(TomcatCP)
#spring.datasource.tomcat.max-active=100
#spring.datasource.tomcat.max-idle=50
#spring.datasource.tomcat.initial-size=10

# spring boot 2.x connection pool(HikariCP) 1/1000
spring.datasource.hikari.maxPoolSize=20
spring.datasource.hikari.connectionTimeout=60000
```

index.css

```css
@charset "UTF-8";

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#index{
	width: 1000px;
	margin:10px auto;
	border: 1px solid #aaa;
	min-height: 100px;
}

#index ul{
	list-style: none;
}

#index ul li{
	width:120px;
	padding:4px 0;
	text-align: center;
}

#index ul li hover{
	background-color: block;
}

#index #header{
	height: 150px;
	background-color: #ccc;
}
#index #menu{
	padding: 10px;
	background-color: #bbb;
}

#index #here{
	min-height: 200px;
	padding: 15px;
}

#index #footer{
	background-color: #aaa;
	padding: 40px;
	text-align: center;
}
```

index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel='stylesheet' type='text/css' href='css/index.css'/>
<html>
<head>
<meta charset="UTF-8">
<title>Spring boot final example</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
	        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
 	        crossorigin="anonymous"></script>
 	        
<script src='js/index.js'></script>

</head>
<body>
<div id='index'>
	<header id='header'>
	<h2>Spring boot final example</h2>
 	</header>
 	<nav id='menu'>
 		<ul>
 			<li><a href='#' onclick="goURL('/bSelect')">공지사항</a></li>
 		</ul>
 	</nav>
 	<section id='here'>
 	
 	</section>
 	
 	<footer id='footer'>
 		좋은 우리 주식회사
 	</footer>
 	
</div>


</body>
</html>
```

# 점심시간 후는 프로젝트 회의함