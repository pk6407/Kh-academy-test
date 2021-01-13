# 1교시

- https://mvnrepository.com/artifact/com.google.code.gson/gson/2.8.6
  - 들어가서 jar파일 받자...gson이다..
  - https://mvnrepository.com 에서 찾는게 만능이구먼?

```jsp
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json test</title>
</head>
<body>
<script>
/*
  json은 데이터 형식이 기본적으로 문자열 패턴을 갖고 있다.
 
  json 의 기본적인 데이터 구조
  1) map 구조 : {"key" : "value" , ...}
  2) 배열 구조 : ["value", ...]
  3) 혼합 구조 : {[]} or [{}] or {{}} or [[]]  ajax - > json.parse()
  */
</script>
<%
	//1) gson 라이브러리 jar설치(구글)

	//2) gson을 사용하여 json의 object 생성하기
	JsonObject obj1 = new JsonObject();
	obj1.addProperty("mid","a001");
	obj1.addProperty("name","송씨");
	obj1.addProperty("addresss","부산");
	obj1.addProperty("phone","010-1111-1111");
	obj1.addProperty("age",18);
	obj1.addProperty("mdate", new Date().toGMTString());
	
	out.print("<h3>gson으로 만든 Object </h3>");
	out.print(obj1);
	
%>
</body>
</html>
```

# 2교시

```jsp
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json test</title>
</head>
<body>
<script>
/*
  json은 데이터 형식이 기본적으로 문자열 패턴을 갖고 있다.
 
  json 의 기본적인 데이터 구조
  1)map 구조 : {"key" : "value" , ...}
  2)배열 구조 : ["value", ...]
  3)혼합 구조 : {[]} or [{}] or {{}} or [[]]  ajax - > json.parse()
  */
</script>
<%
	//1) gson 라이브러리 jar설치(구글)

	//2) gson을 사용하여 json의 object 생성하기
	JsonObject obj1 = new JsonObject();
	obj1.addProperty("mid","a001");
	obj1.addProperty("name","송씨");
	obj1.addProperty("addresss","부산");
	obj1.addProperty("phone","010-1111-1111");
	obj1.addProperty("age",18);
	obj1.addProperty("mdate", new Date().toGMTString());
	
	out.print("<h3>gson으로 만든 Object </h3>");
	out.print(obj1 + "<hr/>");
	out.print("<li>mid : " + obj1.get("mid"));
	out.print("<li>name : " + obj1.get("name"));
	out.print("<li>address : " + obj1.get("address"));
	out.print("<li>phone : " + obj1.get("phone"));
	out.print("<li>age : " + obj1.get("age"));
	out.print("<li>mdate : " + obj1.get("mdate"));
	
	// gson 라이브러리의 json 배열 구조
	JsonArray array = new JsonArray();
	JsonObject obj2 = new JsonObject();
	obj2.addProperty("mid", "b001");
	obj2.addProperty("name", "김씨 아저씨");
	
	array.add(obj2);
	
	JsonObject obj3 = new JsonObject();
	obj3.addProperty("mid", "c001");
	obj3.addProperty("name", "박씨 총각");
	
	array.add(obj3);
	
	out.print("<h3>gson 라이브러리를 사용한 Object 배열</h3>");
	out.print(array);
	
	
	JsonElement ele = array.get(0);
	out.print("<li>mid : " + ele.getAsJsonObject().get("mid"));
	out.print("<li>name : " + ele.getAsJsonObject().get("name"));
	
%>
</body>
</html>
```

```jsp
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bean.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json_toJson</title>
</head>
<body>
<div id='json_toJson'>
	<h3>Java Vo를 GSON 라이브러리를 사용하여 json 구조로 변경</h3>
	<%
		MemberVo vo = new MemberVo();
		vo.setMid("김씨");
		vo.setEmail("kim@jobtc.kr");
		vo.setPhoto("kim.png");
		
		Gson gson = new Gson();
		String str = gson.toJson(vo);
		out.print("vo to json : " + str);
		
		// 문자열로 되어 있는 JSON구조를 JSON Object로 변환
		JsonParser parser = new JsonParser();		
		JsonElement ele = parser.parse(str);
		JsonObject obj = ele.getAsJsonObject();
		out.print("<hr/>");
		out.print("<li>mid : " + obj.get("mid"));
		out.print("<li>email : " + obj.get("email"));
		out.print("<li>photo : " + obj.get("photo"));
		
		// List<MemberVo>를 생성하여 GSON을 사용한 배열 처리
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo vo1 = new MemberVo();
		vo1.setMid("park");
		vo1.setName("박씨 공방");
		
		list.add(vo1);
		
		MemberVo vo2 = new MemberVo();
		vo2.setMid("lee");
		vo2.setName("키다리 이씨");
		
		list.add(vo2);
		
		
		
	%>

</div>
</body>
</html>
```

# 3교시

```jsp
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bean.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json_toJson</title>
</head>
<body>
<div id='json_toJson'>
	<h3>Java Vo를 GSON 라이브러리를 사용하여 json 구조로 변경</h3>
	<%
		MemberVo vo = new MemberVo();
		vo.setMid("김씨");
		vo.setEmail("kim@jobtc.kr");
		vo.setPhoto("kim.png");
		
		Gson gson = new Gson();
		String str = gson.toJson(vo);
		out.print("vo to json : " + str);
		
		// 문자열로 되어 있는 JSON구조를 JSON Object로 변환
		JsonParser parser = new JsonParser();		
		JsonElement ele = parser.parse(str);
		JsonObject obj = ele.getAsJsonObject();
		out.print("<hr/>");
		out.print("<li>mid : " + obj.get("mid"));
		out.print("<li>email : " + obj.get("email"));
		out.print("<li>photo : " + obj.get("photo"));
		
		// List<MemberVo>를 생성하여 GSON을 사용한 배열 처리
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo vo1 = new MemberVo();
		vo1.setMid("park");
		vo1.setName("박씨 공방");
		
		list.add(vo1);
		
		MemberVo vo2 = new MemberVo();
		vo2.setMid("lee");
		vo2.setName("키다리 이씨");
		
		list.add(vo2);
		
		str = gson.toJson(list);
		out.print("<hr/>");
		out.print("List to JSON : " + str);
		
		ele = parser.parse(str);
		JsonArray array = ele.getAsJsonArray();
		
		JsonElement ele2 = array.get(0);
		JsonObject obj2 = ele2.getAsJsonObject();
		out.print("<li>mid : " + obj2.get("mid"));
		out.print("<li>name : " + obj2.get("name"));
		
	%>

</div>
</body>
</html>
```

```jsp
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="bean.MemberVo"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json_toClass</title>
</head>
<body>
<div id ='json_to_class'>
	<h3>json to class</h3>
	<%
		String json = "{'mid': 'hong' , 'name' : '홍길동'}".replaceAll("'", "\"");
		
		Gson gson = new Gson();
		MemberVo vo = gson.fromJson(json, MemberVo.class);
		out.print("<li>mid : " + vo.getMid());
		out.print("<li>name : " + vo.getName());
		
		
		String jsonArray = "[{'phone' : '010-1111-1111'}, {'phone' : '010-2222-2222'}]".replaceAll("'", "\"");
		MemberVo[] voArray = gson.fromJson(jsonArray, MemberVo[].class);
		List<MemberVo> list = Arrays.asList(voArray);
		
		vo = list.get(0);
		out.print("<h3>json array to List</h3>");
		out.print("<li>phone : " + vo.getPhone());
		
		
		
	%>

</div>

</body>
</html>
```

# 4~6교시 시험봄

# 7교시 

통합구현 PDF 읽어봐라

1. 프레임워크란?
Framework 란, 개발자가 소프트웨어를 개발함에 있어 코드를 구현하는 개발 시간을 줄이고, 코드의 재사용성을 증가시키기 위해 일련의 클래스 묶음이나 뼈대, 틀을 제공하는 공통 라이브러리를 구현해 놓은 것을 말한다.

2. 프레임워크의 필요성
현재 웹프로그래밍의 추세는 엄청난 규모의 프로젝트가 많다. 또한 클라이언트 애플리케이션을 웹으로 옮기려는 시도는 끊이지 않고 있다.
거대하고 복잡도가 높은 프로젝트를 하기 위해서 많은 사람들이 필요하게 되고 그에 따라 개발자들이 통일성 있게 빠르고 안정적으로 개발하기 위한
가이드가 될 수 있는 프레임워크란 매우 좋은 하나의 틀을 제공한다.
또한 이로 인해 생산성 향상에도 한 몫을 하고 있다. 그 이유는 중복되고 뒷단을 처리하는 부분을 프레임워크에서 처리해주고 개발자는 비지니스 모델에만 집중할 수 있는 구조를 갖추고 있기 때문이다.
빠른 생산성과 보장된 품질을 기대할 수 있다는 차원에서의 프레임워크는 작업하는 프로젝트의 높은 안정성을 보장 할 수 있기에 이제는 거의 대 다수의 개발자가 프레임워크를 사용해서 개발하고 있다.

3. 프레임워크의 특징
이러한 장점들을 가지는 프레임워크의 특징들은 다음과 같다.
- 1. 개발자가 따라야 하는 가이드를 제공한다.
- 2. 개발할 수 있는 범위가 정해져 있다.
- 3. 개발자를 위한 다양한 도구, 플러그인을 지원한다.
즉, 프레임워크를 통해 개발을 하게 되면 개발에 대한 방법론을 강제하는 것이라 말할 수 있다.
자유롭게 설계하고 코딩하는 것이 아니라 프레임워크가 제공 하는 가이드 대로 설계하고 코딩을 해야 하기 때문이다.
이러한 프레임워크 지향의 개발의 장.단점은 다음과 같다.
장 점 - 개발 시간을 줄일 수 있음
- 정형화 되어 있어 일정수준 이상의 품질을 기대할 수 있음
- 유지 보수가 쉬움
단 점 - 너무 의존하면 개발자들의 능력이 떨어져서
스스로 직접 개발하는 것이 어려워짐
- 습득에 걸리는 시간이 오래 걸림

4. 프레임워크의 특징
위에서 설명한 프레임워크도 다양한 종류가 있는데, 이러한 종류에 대해 간략히 표로 정리하였다.
구분 설 명 종류
영속성 Framework
데이터의 저장, 조회, 변경, 삭제를 다루는 클래스 및 설정 파일들을 라이브러리화하여 구현한 프레임워크
- Mybatis
- Hibernate
자바 Framework
Java EE 를 통한 웹 어플리케이션 개발에 초점을 맞추어 필요한 요소들을 모듈화하여 제공하는 프레임워크
- Spring Framework
- 전자정부표준-Spring
- Struts
화면 구현 Framework
Front-End를 보다 쉽게 구현할 수 있게 틀을 제공하는 프레임워크
- Bootstrap
- Foundation
- MDL
기능 및 지원 Framework
특정 기능이나 업무 수행에 도움을 줄 수 있는 기능을 제공하는 프레임워크
- Log4j
- JUnit 5
- ANT

# 마지막 교시요!

1. Spring이란?
스프링 프레임워크는 엔터프라이즈급 애플리케이션을 만들기 위한 많은 기능을 제공하는 솔루션이다. 필요한 부분만 가져다 사용할 수 있도록 모듈화되어 있다. 자바 애플리케이션 개발을 위한 포괄적인 하부 구조를 제공하는 자바 플랫폼이며 애플리케이션에 집중할 수 있도록 하부 구조를 다룬다.
EJB의 단점을 보완한 프레임 워크이며 DI(의존성 주입)와 AOP(관점 지향 프로그래밍)가 지원되는 경량 컨테이너이며 프레임워크이다.

2. Spring의 주요 기능

2.1. Spring DI(Dependency Injection) – 의존성 주입
Spring Framework는 설정 파일이나 어노테이션을 통해 객체간 의존 관계를 설정하여 직접 의존하는 객체를 생성할 필요가 없다.

2.2 Spring AOP(Aspect Oriented Programming) – 관점 지향 프로그래밍 
Database의 트랜잭션처리나 로깅처리와 같이 여러 모듈에서 공통으로 필요로 하는 기능의 경우 해당 기능을 분리하여 관리한다.

2.3 Spring JDBC – 영속성 프레임워크 지원
Mybatis나 Hibernate 등의 데이터베이스를 처리하는 라이브러리와 연결할 수 있는 인터페이스를 제공한다.

2.4 Spring MVC
Spring MVC 디자인 패턴을 통해 웹 어플리케이션의 Model, View,Controller 사이의 의존 관계를 DI 컨테이너에서 관리하고 통일된 유연한 웹 어플리케이션을 구축할 수 있다.

3. Spring의 구성 모듈
스프링 프레임워크는 약 20개의 모듈로 구성되어있으며, 모듈들은 코어 컨테이너, 데이터 접근/통합 웹, AOP(관점지향 프로그래밍),Instrumentation, 테스트로 그룹을 나눌 수 있다.

3.1 코어 컨테이너
Spring 프레임워크의 근간이 되는 IoC(또는 DI) 기능읕 지원하는 영역읕 담당하고 있다.
BeanFactory를 기반으로 Bean 클래스들읕 제어할 수 있는 기능을 지원한다. BeanFactory을 사용하면 프로그래밍 적으로 싱글톤을 구현할 필요가 없고 실제 프로그램 로직에서 의존성에 대한 설정과 명세를 분리할 수 있다.
코어(Core), 빈즈(Beans), 컨텍스트(Context), 표현언어 (Expression Language) 모듈로 이루어졌다.

3.2 데이터 접근/통합 계층
JDBC, ORM, OXM, JMC, 트랜잭션 모듈로 이루어져 있다. JDBC모듈은 JDBC 추상화 계층을 제공한다. JDBC 코딩과 데이터베이스 벤더에 따라 다른 오류코드를 파싱할 필요가 없다.
ORM 모듈은 JPA, JDO , Hibernate, iBatis를 포함하는 인기 있는 객체-관계 매핑 API에 대한 통합 계층을 제공한다. OXM 모듈은 JAXB, Castor, XMLBeans, JiBX, XStream에 대한 객체/XML매핑 구현을 지원하는 계층이다.
자바 메시징 서비스(JMS) 모듈은 메시지를 생산하고 소비하는 기능을 포함한다.
트랜잭션 모듈은 특별한 인터페이스와 모든 POJO (plain old Java objects)의 클래스에 대한 트랜잭션 관리를 지원한다. 트랜잭션 관리는 프로그래밍적으로 하거나 선언적으로 할 수 있다.

3.3 웹 계층
Spring 프레임워크에서 독립적으로 Web UI Layer에 Modd-View-Controller를 지원하기 위한 기능이다. 지금까지 Struts, Webwork가 담당했던 기능들을 Spring Web MVC를 이용하여 대체하는 것이 가능하다. 또한 Velocity, Excel, PDF와 같은 다양한 UI 기술들을 사용하기 위한 API를 제공하고 있다.
웹 계층은 웹, 웹-서블릿, 웹-스트러츠, 웹-포틀릿 모듈로 이루어졌다. 웹-서블릿 모듈은 웹 어플리케이션을 위한 스프링의 모델-뷰-컨트롤러 (MVC) 구현을 포함한다. 웹-스트러츠(Web-Struts) 모듈은 스프링 어플리케이션에서 전통적인 스트러츠 웹티어를 통합을 지원하는 클래스를 포함한다.
이 지원은 스프링 3.0에서는 폐기되었다. 웹-포틀릿(Web-Portlet) 모듈은 포틀릿 환경에서 사용되는 MVC 구현과 웹-서블릿 모듈 기능의 미러 기능을 제공한다.

3.4 AOP 계층
Spring 프레임워크에 Aspect Oriented Programming읕 지원하는 기능이다. 이 기능은 AOP Alliance 기반 하에서 개발되었다.