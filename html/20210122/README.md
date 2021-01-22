# 1교시

- Spring MVC로 구현한 회원관리
- mybatis 사용 복습

# 2교시

어제한거 복습...

# 3교시

- WEB-INF안에 merer폴더안에 select.jsp만듬

# 점심후 4교시

MemberController.java

```java
package member;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao;
	
	public MemberController() {}
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(value="insert.mem", method=RequestMethod.GET)
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert");	// WEB-INF/member/insert.jsp
		
		return mv;
	}
	
	@RequestMapping(value="insertR.mem", method=RequestMethod.POST)
	public ModelAndView insertR(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("-------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("insert_result");	//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", "회원 정보가 정상적으로 저장되었습니다.");
		
		return mv;
	
	}
	@RequestMapping(value="select.mem", method=RequestMethod.GET)
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("select");//WEB-INF/member/insert_result.jsp
		
		return mv;
		
	}
}
```

WEB-INF안에 member폴더안에 select.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<link rel='stylesheet' type='text/css' href='./css/member.css' />
</head>
<body>
<div id='member' class='select'>
	<h2>회원관리</h2>
	<div id='findZone'>
		<form name='frmMember' id='frmMember' method='post' action='insertR.mem'>
			<input type='button' id='btnInsert' value='입력'/>
			<div>
				<input type='search' name='findStr' />
				<input type='button' value='검색' id='btnFind' />
			</div>
		</form>
	</div>

	<hr/>
	
	<div id='listItems'>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		
	</div>
	
	<div id='btnZone'>
		<input type='button' value='맨첨' id='btnFirest'/>
		<input type='button' value='이전' id='btnPrev'/>
		
		<input type='button' value='1' />
		<input type='button' value='2' />
		<input type='button' value='3' />
		<input type='button' value='4' />
		<input type='button' value='5' />
		
		<input type='button' value='이전' id='btnNext'/>
		<input type='button' value='맨끝' id='btnLast'/>
		
	</div>
	
	
</div>
</body>
</html>
```

WebContent안에 css폴더 만들고 member.css생성

```css
@charset "UTF-8";

#member{
	width:1000px;
	margin:5px auto;
}

#btnZone{
	border-top: 1px solid #aaa;
	padding-top : 10px;
	text-align: center;
}
#btnZone>input[type=button]{
	border-radius: 14px;
	border:1px solid #aaa;
}


/* select ---------------------------*/
#findZone{
	height:60px;
}
#findZone>form{
	position: relative;
}

#findZone>form > div{
	display:inline-block;
	position: absolute;
	right:0;
}

#listItems{
	text-align: center;
}

#listItems .item{
	width: 300px;
	display: inline-block;
	margin-bottom:10px;
	text-align: left;
	font-size:10pt;
}
```

# 5교시

Spring 과 mybatis 연결 방법
- xml
- DI
- boot

DI 사용해서 연결 하는 방법

- https://mvnrepository.com/artifact/org.mybatis/mybatis/3.4.6 가서 복사해서 pox.xml에 붙여넣기 함

만약 cofing.xml 파일이 WEB-INF/classes 에 있다면 경로 표시는 어떻게 해야되나요? =>config.xml 치면된다. 
WEB-INF안의 classes폴더는 경로의 기본 베이스임

bean패키지 만들고 MemberFactory.java 만듬

```java
package bean;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("momber/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
```

member패키지안에 config.xml 만듬

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE configuration
   PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-config.dtd">
      
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver"   value="oracle.jdbc.driver.OracleDriver"/>			
				<property name="url"      value="jdbc:oracle:thin:@localhost:1521:XE"/>			
				<property name="username" value="system"/>			
				<property name="password" value="oracle"/>			
			</dataSource>			
		</environment>
	</environments>

	<mappers>
		<mapper resource="member/member.xml"/>
	</mappers>

</configuration>       
```

member패키지안에 member.xml 만듬

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">


	


</mapper>   
```

member패키지안에 MemberDao.java

```java
package member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;

	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		sqlSession = f.getFactory().openSession();
	}
	
	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVo> select(Page p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo view(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

}
```

Web-Content안에 WEB-INF안에 test안에 member-servlet.xml

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
      
	<context:annotation-config />
	
	<bean id='myda' class='bean.MemberFactory' />
	<bean id='mDao' class='member.MemberDao'>
		<constructor-arg ref='myba'/>
	</bean>
	
	<bean id='mController' class='member.MemberController' >
		<constructor-arg ref="mDao"/>
	</bean>
	
	
	<bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
		<property name='prefix' value='/WEB-INF/member/' />
		<property name='suffix' value='.jsp' />
	</bean>

</beans>
```

# 마지막 교시

List<MemberVo> list = sqlSession.selectList("member.select",p);
=>
sqlSeesion.selectList("member.select",p);이안에 member 이게 xml에서 <mapper namespace="member"> 쓰고 select는 <select id="select" resultType="member.MemberVo" parameterType="member.Page">
	</select> 안에 Select id="select"라고 씀

<typeAliases>
		<typeAlias type="member.Page" alias="page"/>
		<typeAlias type="member.MemberVo" alias="mVo"/>
	</typeAliases>

    type 안에 패키지명과 클래스 명 적으면됨
    alias 는 별칭

    <select id="select" parameterType="page" resultType="mVo">
    무분별하게 사용금지,누군지 판단하기 힘듬..

config.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE configuration
   PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-config.dtd">
      
<configuration>
	<typeAliases>
		<typeAlias type="member.Page" alias="page"/>
		<typeAlias type="member.MemberVo" alias="mVo"/>
	</typeAliases>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver"   value="oracle.jdbc.driver.OracleDriver"/>			
				<property name="url"      value="jdbc:oracle:thin:@localhost:1521:XE"/>			
				<property name="username" value="system"/>			
				<property name="password" value="oracle"/>			
			</dataSource>			
		</environment>
	</environments>




	<mappers>
		<mapper resource="member/member.xml"/>
	</mappers>

</configuration>    
```

member-servlet.xml

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
      
	<context:annotation-config />
	
	<bean id='myda' class='bean.MemberFactory' />
	<bean id='mDao' class='member.MemberDao'>
		<constructor-arg ref='myba'/>
	</bean>
	
	<bean id='mController' class='member.MemberController' >
		<constructor-arg ref="mDao"/>
	</bean>
	
	
	<bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
		<property name='prefix' value='/WEB-INF/member/' />
		<property name='suffix' value='.jsp' />
	</bean>

</beans>
```

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

	<!-- 테이블의 컬럼명과 vo 객체의 필드명이 서로 다른경우 -->
	<!-- column : 테이블의 컬럼명, property : vo의필드명 -->
	<resultMap type="mVo" id="m_vo">
		<result column="m_id" property="mId"/>
		<result column="m_name" property="mName"/>
	</resultMap>

	<!-- resultMap  -->
	<!--  <select id="temp_select" parameterType="page" resultMap="m_vo">
	table의 칼럼명과 java의 field명이 서로 다른경우, 자동화
	</select>	-->
	<!-- typeAliases -->
	<select id="select" parameterType="page" resultType="mVo">
	
	</select>


</mapper>   
```

MemberDao.java

```java
package member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;

	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		sqlSession = f.getFactory().openSession();
	}
	
	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVo> select(Page p) {
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		
		
		return null;
	}

	@Override
	public String insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo view(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

}
```

