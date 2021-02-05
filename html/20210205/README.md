# 1교시

spring MVC,DBCP,MYbatis연결
spring boot DI,AOP

[프로젝트]
-업무분장
2/8까지 스토리보드(와이어프레임)
설이후 각조는 최대 5명 이하로 학원에 한번은 오셔야 함.(일정은 추후 결정)

application.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

#spring.mvc.static-locations=
#spring.mvc.static-path-pattern=/resources/**


# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle
```

MainController.java

```java
package kr.jobtc.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
	@RequestMapping("/")
		public ModelAndView index(){
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			
			return mv;
		}
	
	
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
</head>
<body>
<div id='index'>
	<h2>Spring boot final example</h2>
 

</div>
</body>
</html>
```

# 2교시

 chk = function(){
	
}
반드시 미리선언해야됨

function chk(){
	
}
미리선언하지 않아도됨 언제든지 선언가능

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
<script src='js/index.js'></script>

</head>
<body>
<div id='index'>
	<h2>Spring boot final example</h2>
 
 	<p/>
 	<input type='button' value='static_location_check' onclick='chk()'/>
 
</div>


</body>
</html>
```

MainController.java

```java
package kr.jobtc.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
	@RequestMapping("/")
		public ModelAndView index(){
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			
			return mv;
		}
	
	
}
```

index.js

```js
chk = function(){
	console.log('hi............');
		
}



```

# 3교시

[Mybatis연결작업절차]
1. mybatis driver 에 대한 <dependency/>추가
- pom.xml에 있나확인
  - <dependency>
			<groupId>org.mybatis.spring.boot</groupId>
			<artifactId>mybatis-spring-boot-starter</artifactId>
			<version>2.1.4</version>
		</dependency>
2. 사용하려는 DB의 연결정보 설정(application.properties)
- # oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle
3. mybatis mapper 지정(application.properties)
- mybatis.type-aliases-package=kr.jobtc.mybatis
- mybatis.mapper=locations=mapper/*xml

application.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

#spring.mvc.static-locations=
#spring.mvc.static-path-pattern=/resources/**


# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle

#mybatis mapper
mybatis.type-aliases-package=kr.jobtc.mybatis
mybatis.mapper-locations=static/mapper/*xml
```

board.js

```js
/** 
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var board = function(){
	var frm = document.frm_board;
	var url = 'index.jsp?inc=./board/';	//'board.do?job=
	
	var btnInsert = getID('btnInsert');
	var btnSelect = getID('btnSelect');
	var btnSave = getID('btnSave');
	var btnFile = getID('btnFind');
	
	if(btnFind != null){
		btnFind.onclick = function(){
			frm.nowPage.value = 1;
			frm.action = url + 'select.jsp';
			frm.submit();
		}
	}
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			frm.action = url + 'select.jsp';
			frm.submit();	
		}
	}
	
	if(btnInsert != null){
		btnInsert.onclick = function(){
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}
```

board.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
   
<mapper namespace="kr.jobtc.mybatis.BoardMapper">

	<select id='select' resultType='String' parameterType='String'>
		select subject from board where subject like '%${_parameter}%'
	</select>
	<select id='sel2' resultType='BoardVo' parameterType='Page'>
		select ...
	</select>
</mapper>
```

BoardMapper.java

```java
package kr.jobtc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardMapper {
	// List<String> list = sqlSession.selectList("kr.jobtc.mybatis.BoardMapper.select","hong");
	public List<String> select(String findStr);
	
	public List<BoardVo> sel2(Page page);
	
}
```

1. xml id 해당하는 추상메서드 정의
2. resultType해당하는 반환형을 가져야함.
3. parameterType에 해당하는 매개변수를 가져야 한다.
4. Mapper에 따른 interface를 구현해야 함.
5. Serice 생성
6. Controller 작업
7. Dao 작업 -> 비즈니스 로직(실제 업무로직)

# 점심후 4교시

kr.jobtc.board패키지 생성후 BoardVo.java,Page.java 추가
kr.jobtc.mybatis패키지안에 BoardService.java추가

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
		public ModelAndView index(){
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			
			return mv;
		}
	
	@RequestMapping(value="/bSelect", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVo> list = service.select();
		
		mv.addObject("list",list);
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
import kr.jobtc.board.Page;

@Service
@Transactional
public class BoardService { // Mapper를 실행시킴
	@Autowired
	BoardMapper mapper;
	
	public List<BoardVo> select(){
		Page page = new Page();
		
		List<BoardVo> list = mapper.select(page);
		System.out.println("BoardService.select().....");
		for(BoardVo v : list) {
			System.out.println(v.getSubject());
		}
		
		return list;
	}
}
```

Page.java

```java
package kr.jobtc.board;

public class Page {
	String findStr;

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
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

# 5교시

application.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

#spring.mvc.static-locations=
#spring.mvc.static-path-pattern=/resources/**


# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle

#mybatis mapper
mybatis.type-aliases-package=kr.jobtc.mybatis
mybatis.mapper-locations=static/mapper/*xml

# connection pool(HikariCP)
spring.datasource.tomcat.max-active=100
spring.datasource.tomcat.max-idle=50
spring.datasource.tomcat.initial-size=10
```

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
	<c:forEach var='vo' items='${list }'>
			<div>${vo.subject }</div>
	</c:forEach>

 

</div>
</body>
</html>
```

# 마지막 6교시

AppConfig.java

```java
package kr.jobtc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.board.BoardVo;

//Spring boot에서 DI를 구성하는 또다른 방법

@Configuration
public class AppConfig {
	
	BoardVo boardVo;

	// <bean id='boardVo' class='kr.jobtc.BoardVo'/>
	@Bean
	public BoardVo getBoardVo() {
		return new BoardVo();
	}
}
```

new로 생성하면 항상 새로운 객체를 만드는 거고 저렇게 Bean을 등록하면 싱글톤

싱글톤 문제점 -> 동기화 트러블에 고안,상호 배려적 동기화 A,B,C순으로 동기화를 한다치면 A에서 100초걸리고 B에서 100초걸렷다치면 C에서는 200초 걸린다.

spring boot에서 AOP 설정하기

1. aspectJ에 해당하는 <de/>추가:weaver,jrt

- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver
- https://mvnrepository.com/artifact/org.aspectj/aspectjrt/1.9.6

추가한다

2. 메인 Application 클래스에서 aspectJ를 활성화시킴

KhSpringBootApplication.java

```java
package kr.jobtc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class KhSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(KhSpringBootApplication.class, args);
	}

}
```

3. Config파일에서 AOP의 JoinPoint를 선언한다.

AppConfig.java

```java
package kr.jobtc;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.board.BoardVo;

//Spring boot에서 DI를 구성하는 또다른 방법

@Aspect
@Configuration
public class AppConfig {
	
	BoardVo boardVo;

	// <bean id='boardVo' class='kr.jobtc.BoardVo'/>
	@Bean
	public BoardVo getBoardVo() {
		return new BoardVo();
	}
	
	@Before("execution(* kr.jobtc.*.*(..))")
	public void before(Joinpoint point) {
		System.out.println("실행 메서드 이전에 처리될 내용");
	}
	
	@Around("execution(* kr.jobtc.*.*(..))")
	public void around(ProceedingJoinPoint point) throws Throwable {
		//메서드를 실행하려면
		Object o = point.proceed();
	}
}

```