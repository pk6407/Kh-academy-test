# 1교시

2/4(목)
Spring DBCP,Mybatis 연결
DI,AOP 설정 방법
오후:애플리케이션 설계
7교시 보강

[프로젝트]
와이어 프레임(개발 범위 전체 페이지)

[공지]
2/9(화):면접특강(1:30~2:20)

# 2교시

Hikari CP(Connection Pool)

새로운 프로젝트 만듬
kh-spring-boot이라는 스프링 프로젝트만들고
oracle 드라이버,마이바티스 프레임워크,스프링 부트 툴,스프링 데이터JDBC,스프링 웹ㄱㄱ

- https://mvnrepository.com/artifact/javax.servlet/jstl 추가 ㄱㄱ

weapp폴더안에 WEB-INF폴더만들고 lib만들고 ojdbc8-21.1.0.0.jar넣고

상단 메뉴 window에서 preferencse에서 enc 쳐서 utf-8되잇는지 확인(text),workspace,CSS,HTML,JSP,XML

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
	<groupId>kr.jobtc</groupId>
	<artifactId>kh-spring-boot</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>
	<name>kh-spring-boot</name>
	<description>kh spring boot example</description>
	<properties>
		<java.version>1.8</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jdbc</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>org.mybatis.spring.boot</groupId>
			<artifactId>mybatis-spring-boot-starter</artifactId>
			<version>2.1.4</version>
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
			<scope>runtime</scope>
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
		<!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
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

application.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/main/
spring.mvc.view.suffix=.jsp


# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle
```

# 3교시

spring boot final example

메인 컨트롤로:Main Controller

>url정보가"/"로 들어오면 WEB-INF/jsp/index.jsp페이지가 보이도록 RequestMapping 처리하시오
>method 타입은 GET 또는 POST 모두 사용되도록.

tip:css,js,html 등등의 파일들의 경로 설정(application.properties)
spring.mvc.static-path-pattern=/resources/**

# 점심후 시험!