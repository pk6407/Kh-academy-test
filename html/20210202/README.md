# 1교시

Spring boot MVC 설정 - DI, AOP, 회원관리(CRUD), 게시판(CRUD)

[프로젝트]
개발범위 및 담당자, 사용할 기술에 대한 내용을 오늘 중으로 단톡에 올려주세요.

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Spring boot MVC를 사용한 구구단</h2>
${gugu }
</body>
</html>
```

${gugu } => request.getAutter(gugu);

# 2교시

- https://mvnrepository.com/artifact/org.apache.tomcat.embed/tomcat-embed-jasper 복사 ㄱㄱ pom.xml에 추가

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
		
		<!-- https://mvnrepository.com/artifact/org.apache.tomcat.embed/tomcat-embed-jasper -->
		<dependency>
    		<groupId>org.apache.tomcat.embed</groupId>
   		 	<artifactId>tomcat-embed-jasper</artifactId>
   		 	<version>10.0.0</version>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
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

디펜더시 추가하는법 프로젝트 오른쪽 클릭후 spring -> add starters 누르면됨

- https://mvnrepository.com/artifact/javax.servlet/jstl/1.2 추가 ㄱㄱ

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

# 3교시

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

TestController.java

```java
package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestController {
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() {
		String msg = "hi...spring boot controller test";
		return msg;
	}
	
	@RequestMapping(value="/gugudan", method=RequestMethod.GET)
	public ModelAndView gugudan() {
		ModelAndView mv = new ModelAndView();
		String dan = "<h3>3단.....</h3>";
		int su = 3;
		for(int i = 1; i<10; i++) {
			String temp = String.format("%d * %d = %d<br/>", su,i, (su*i));
			dan += temp;
		}
		
		
		//2단 출력(TODO)
		System.out.println(dan);
		
		mv.addObject("gugu",dan);
		mv.setViewName("gugudan");
		return mv;
	}
}
```

[spring mvc 응용 요구 조건]
1. com.example.demo.member.MemberVo 클래스 생성(필드는 mid,pwd)
2. TestController 사용
- mapping 정보가 GET타입의 /login 이고 파라메터로 mid,pwd가 임의의 값으로 전달됨.
- mid,pwd가 각각 "hong","1234"이면 "로그인 성공"메세지를 아니면 "로그인 실패"메세지를 반환
3. 웹 페이지(View)
/WEB-INF/jsp/login_result.jsp

# 점심후 4교시

login_result.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 결과</h2>
${msg }
</body>
</html>
```

TestController.java

```java
package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.member.MemberVo;

@RestController
public class TestController {
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() {
		String msg = "hi...spring boot controller test";
		return msg;
	}
	
	@RequestMapping(value="/gugudan", method=RequestMethod.GET)
	public ModelAndView gugudan() {
		ModelAndView mv = new ModelAndView();
		String dan = "<h3>3단.....</h3>";
		int su = 3;
		for(int i = 1; i<10; i++) {
			String temp = String.format("%d * %d = %d<br/>", su,i, (su*i));
			dan += temp;
		}
		
		
		//2단 출력(TODO)
		System.out.println(dan);
		
		mv.addObject("gugu",dan);
		mv.setViewName("gugudan");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	   public ModelAndView login(MemberVo vo) {
	      ModelAndView mv = new ModelAndView();
	      String msg = "로그인 실패";
	      if ((vo.getMid().equals("hong")) && (vo.getPwd().equals("1234"))) {
	         msg = "로그인 성공";
	      }
	      mv.addObject("msg", msg);
	      mv.setViewName("login_result");
	      return mv;
	   }
}
```

MemberVo.java

```java
package com.example.demo.member;

public class MemberVo {
	
	String mid;
	String pwd;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
```

***기능 확장
1. WEB-INF/jsp/login_jsp폼을 사용하여 아이디와 암호 전달
2. mapping 이 /login 이면 로그인 폼 페이지 표시

# 5교시

TestController.java

```java
package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.member.MemberVo;

@RestController
public class TestController {
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() {
		String msg = "hi...spring boot controller test";
		return msg;
	}
	
	@RequestMapping(value="/gugudan", method=RequestMethod.GET)
	public ModelAndView gugudan() {
		ModelAndView mv = new ModelAndView();
		String dan = "<h3>3단.....</h3>";
		int su = 3;
		for(int i = 1; i<10; i++) {
			String temp = String.format("%d * %d = %d<br/>", su,i, (su*i));
			dan += temp;
		}
		
		
		//2단 출력(TODO)
		System.out.println(dan);
		
		mv.addObject("gugu",dan);
		mv.setViewName("gugudan");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	   public ModelAndView login(MemberVo vo) {
	      ModelAndView mv = new ModelAndView();
	      String msg = "로그인 실패";
	      if ((vo.getMid().equals("hong")) && (vo.getPwd().equals("1234"))) {
	         msg = "로그인 성공";
	      }
	      mv.addObject("msg", msg);
	      mv.setViewName("login_result");
	      return mv;
	   }
	
	@RequestMapping(value="/loginR", method=RequestMethod.POST)
	public ModelAndView loginR(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
	      String msg = "로그인 실패";
	      if ((vo.getMid().equals("hong")) && (vo.getPwd().equals("1234"))) {
	         msg = "로그인 성공";
	      }
	      mv.addObject("msg", msg);
	      mv.setViewName("login");
	      return mv;                                         
	}
}
```

login.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form id='frm_login' name='frm_login' method='post' action='/loginR'>
	<input type='text' name='mid'/>
	<input type='password' name='pwd'/>
	<input type='submit' value='로그인'/>
</form>
</div>
</body>
</html>
```

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
프로젝트 오른쪽 클릭후 spring -> addStart 
spring Boot DevTools,spring Data JDBC,spring Web추가

application.properties

```properties
# server port
server.port=7788

#viewwresolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp


#oracle connection
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle
```

BoardController.java

```java
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
```

# 6교시

프로젝트 이야기하라한당..
