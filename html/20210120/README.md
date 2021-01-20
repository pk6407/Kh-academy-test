# 1교시

어...이야기햇다..어...어....그래..파이널...어..

# 2교시

- AOP
  - POJO(순수자바) => X
  - Spring AOP => 고도화 -> 리뉴얼
  - AspectJ AOP => 일반적인 프로그램 작성 AOP률 적용됨
  - Annotaion => AspectJ의 xml 코드보다 간단해짐(최근 트랜디한 패턴이란다..)

aop_anno라는 패키지만들고 작업한다

```java
package aop_anno;

import org.aspectj.lang.JoinPoint;

public class AfterAdvice{

	public Object log(JoinPoint point) {
		TVProduct p = (TVProduct)point.getTarget();
		System.out.println("AfterAdvice:log" + p.name);
		System.out.println("after 형태로 log를 출력하였습니다.......");
		
		return null;
	}
	
}
```

```java
package aop_anno;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAdvice {
	
	@Before("execution(* insert(..))")
	public Object check(JoinPoint point) {
		TVProduct p = (TVProduct)point.getTarget();
		System.out.println("BeforeAdvice : " + p.name);
		p.name = "KNH";
		System.out.println("사전에 로그인 체크를 마쳤습니다....");
		return p;
	}

}
```

```java
package aop_anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_anno/aop_anno.xml");
		
		Product p = (Product)context.getBean("tv");
		
		System.out.println("------------------");
		
		System.out.println("advice에서 전달된 객체를 casting....");
		System.out.println("casting: " + ((TVProduct)p).name);
		
		int i = p.insert("");
		
		System.out.println("------------------");
		p.update("");
		
		System.out.println("------------------");
		p.delete(1);
		
		System.out.println("------------------");
		p.select("");
		
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```interface
package aop_anno;

import java.util.List;

public interface Product {
	public List<String>select(String findStr);
	public int insert(String name);
	public int update(String name);
	public int delete(int serial);
}
```

```java
package aop_anno;

import java.util.ArrayList;
import java.util.List;

public class RadioProduct implements Product{

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("RadioProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("RadioProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("RadioProduct.delete()");
		return 3;
	}
}
```

```java
package aop_anno;

import java.util.ArrayList;
import java.util.List;

public class SmartTVProduct implements Product {

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("SmartTVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("SmartTVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("SmartTVProduct.delete()");
		return 3;
	}
}
```

```java
package aop_anno;

import java.util.ArrayList;
import java.util.List;

public class TVProduct implements Product{
	String name = "kim";
	
	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		System.out.println("TVProduct.select()");
		this.name = "lee";
		return list;
	}
	@Override
	public int insert(String name) {
		this.name = name;
		System.out.println("TVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("TVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("TVProduct.delete()");
		return 3;
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      
      ">
      
      <context:annotation-config/>
      
      <bean id="tv" class="aop_anno.TVProduct"/>
      <bean id="radio" class="aop_anno.RadioProduct"/>
      <bean id="smart" class="aop_anno.SmartTVProduct"/>
       
      <bean id='beforeAdvice' class='aop_anno.BeforeAdvice'/>
      <bean id='afterAdvice' class='aop_anno.AfterAdvice'/>
      	 
   <!-- aspectj aop -->
   <aop:aspectj-autoproxy proxy-target-class="true"/>
   
</beans>
```

```file
---------------------------------------------
Spring aspectj library를 사용한 AOP annotaion 작업
---------------------------------------------
>aop_exam3에 작성된 코드를 재사용하고 필요한 부분만 수정
>xml 코드에 annotaion을 사용할 수 있는 코드 추가

<aop:aspectj-autoproxy proxy-target-class='true'/>

> aspectj에서 필요한 <aop:config/>와 관련된 코드가 모두 제거되고 아래의 코드가 추가된다.

<context:annotaion-config/>
```

# 3교시

1)Before 타입으로 insert또는 update 또는 delete 메서드가 실행되면 check() 가 실행되도록 annotaion을 지정하세요.
2)사후처리는 @After입니다.log()를 만들어 select() 실행되면 사후처리 되도록 조치해 주세요.

```java
package aop_anno;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAdvice {
	
	@Before("execution(* insert(..))||"
			+ "execution(* update(..))||"
			+ "execution(* delete(..))")
	public Object check(JoinPoint point) {
		TVProduct p = (TVProduct)point.getTarget();
		System.out.println("BeforeAdvice : " + p.name);
		p.name = "KNH";
		System.out.println("사전에 로그인 체크를 마쳤습니다....");
		return p;
	}

	@After("execution(* select(..))")
	public Object log(JoinPoint point) {
		System.out.println("AfterAdvice : ");
		return null;
	}
}
```

# 점심후 4~5교시

Spring MVC - 다변화
=> Controller
=> 각종 library추가
- jdbc
  - spring type
  - user type
- mybatis => 필수

통합구현 PDF 50쪽 의 스프링 MVC의 클라이언트 요청 처리과정에 대해 한번 보자

57쪽 까지..쭉..

- https://mvnrepository.com/artifact/org.springframework/spring-webmvc 검색 ㄱㄱ

- https://mvnrepository.com/artifact/org.springframework/spring-webmvc/5.2.12.RELEASE 이거 받는다

-https://mvnrepository.com/artifact/javax.servlet/jstl/1.2 이것도 받는다

pom.xml에 붙여넣기한다

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>kh-spring</groupId>
  <artifactId>kh-spring</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>war</packaging>
  <build>
    <sourceDirectory>src</sourceDirectory>
    <plugins>
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
      <plugin>
        <artifactId>maven-war-plugin</artifactId>
        <version>3.2.3</version>
        <configuration>
          <warSourceDirectory>WebContent</warSourceDirectory>
        </configuration>
      </plugin>
    </plugins>
  </build>
  
  <dependencies>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.2.12.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-aop</artifactId>
    <version>5.2.12.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>1.9.6</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.2.12.RELEASE</version>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>

  </dependencies>
  
  
  
</project>
```

이렇게

# 마지막 교시

WebContent - WEB-INF 안에 web.xml 파일 생성하고 

<servlet-name>hello</servlet-name>
이소리는 hello - servlet.xml 이 필요하다는 소리

- web.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app>
	<servlet>
		<servlet-name>hello</servlet-name>
		<servlet-class>
		org.springframework.web.servlet.DispatcherServlet
		</servlet-class>	
	</servlet>

	<servlet-mapping>
		<servlet-name>hello</servlet-name>
		<url-pattern>*.ddd</url-pattern>
	</servlet-mapping>


</web-app>
```

- hello-servlet.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans
   xmlns:context = "http://www.springframework.org/schema/context"
  >

	<context:annotaion-config/>
	
	<bean id='hello' class='mvc.Hello' />

</beans>
```

- WebContent에 index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<div id='index'>
	<h2>Spring Framework</h2>
	<hr/>
	
	<a href='test.ddd'>Spring MVC Test</a>
</div>
</body>
</html>
```

- MVC 패키지안에 Hello.java
```java
package mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Hello {
	
	@RequestMapping(value="test.ddd", method= RequestMethod.GET)
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("myname");
		mv.addObject("message","하이~~~ 방가워");
		
		return mv;
	}
}
```