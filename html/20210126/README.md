# 1교시

member dao -> member myatis 용으로 리뉴얼(하고 Spring boot으로 넘어갈꺼임)
~29(금) : 8교시
2/1 ~ 2/22 : 6교시

[프로젝트]
~28 : 자료조사 및 밴치마킹 사이트 선정,개인 프로젝트 주제 및 컨셉트 제출

2/4 평가
애플리케이션 설계(Spring 관련 시험임)

2/15 ~ 28 : 취업상담
2/23 : 실전대비 면접

오늘 ~ 6,8교시 프로젝트 회의
jsp => API 공공DB

어제 한거 이어져서 한다

신규프로젝트 => Spring boot
유지보수 => Spring

# 2교시

like = '%(value)%'
like연산자 쓸때는 '%${value}%'

#{endNo} => 필드명X, getEndNo()

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
		
		if(page==null) {
			page = new Page();
			page.setNowPage(1);
		}
	
		List<MemberVo> list = dao.select(page);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("select");//WEB-INF/member/insert_result.jsp
		
		return mv;
		
	}
}
```

Page.java

```java
package member;

public class Page {
	int totListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize=20;
	int blockSize=5;
	
	String findStr;
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}
	
	public void pageCompute() {
		totPage = (int)(Math.ceil(totListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo -listSize + 1;
		if(endNo>totListSize) endNo = totListSize;
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
		if(endPage>totPage) endPage = totPage;
	}

	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
}
```

# 3교시

줄표시기 옆에 오른쪽 클릭하고 Toggle Breakpoint라고 잇음..

- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc8/21.1.0.0 다운 ㄱㄱ

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
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p.getFindStr());
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
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
	
		if(page != null) {
			System.out.println("controller.select()..............");
			System.out.println("nowPage : " + page.getNowPage());
		}else {
			System.out.println("page is null");
		}
				
		List<MemberVo> list = dao.select(page);
		
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("select");//WEB-INF/member/insert_result.jsp
		return mv;
		
	}
}
```

pom.xml

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

<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.4.6</version>
</dependency>

<dependency>
    <groupId>com.oracle.database.jdbc</groupId>
    <artifactId>ojdbc8</artifactId>
    <version>21.1.0.0</version>
</dependency>


  </dependencies>
  
  
  
</project>
```

# 점심후 4교시

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace='member'>

	<!-- 테이블의 컬럼명과 vo 객체의 필드명이 서로 다른경우 -->
	<!-- column : 테이블의 컬럼명, property : vo의필드명 -->
	<resultMap type='mVo' id='m_vo'>
		<result column='m_id' property='mId'/>
		<result column='m_name' property='mName'/>
	</resultMap>

	
	<select id='temp_select' parameterType='page' resultMap='m_vo'>
	
	</select>
	
	<select id='tot_list_size' parameterType='String' resultType='Integer'>
		select count(mid) cnt from members 
		where mid like '%${_parameter}%' or email like '%${_parameter}%' 
		or phone like '%${_parameter}%'  or address like '%${_parameter}%'
	</select>
	
	
	<select id='select' parameterType='page' resultType='mVo'>
		select * from (
		select rownum no, m.* from (
		select * from members
		where mid like '%${findStr}%' or email like '%${findStr}%' 
		or phone like '%${findStr}%' or address like '%${findStr}%'
		order by name asc) m
		) where no between #{startNo} and #{endNo}
	</select>

	<insert id='insert' parameterType='mVo'>
		insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
		values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
	</insert>

	<update id='update' parameterType='mVo'>
		update members set 
		name = #{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}
	
	<if test="#{photo} != null">
		,photo= #{photo}
	</if>
	
		where mid=#{mid} and pwd=#{pwd}
	
	</update>

	<delete id='delete' parameterType='mVo'>
		delete from members where mid=#{mid} and pwd=#{pwd}
	</delete>
	
	<select id='view' parameterType='String' resultType='mVo'>
		select * from members where mid=#{_parameter}
	</select>
	
</mapper>   
```

MemberController.java

```java
package member;

import java.util.List;
import java.util.Map;

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
		List<MemberVo> list = null;
		
		if(page != null) {
			System.out.println("controller.select()..............");
			System.out.println("nowPage : " + page.getNowPage());
		}else {
			System.out.println("page is null");
		}
				
		Map<String,Object> map= dao.select(page);
		page = (Page)map.get("page");
		list = (List<MemberVo>)map.get("list");
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("select");//WEB-INF/member/insert_result.jsp
		return mv;
		
	}
}
```

MemberDao.java

```java
package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map<String,Object> select(Page p) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p.getFindStr());
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		return map;
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

Dao.interface

```interface
package member;

import java.util.Map;

public interface Dao {
	public boolean log(String mid, String pwd);
	public int getTotListSize(String findStr);
	public Map<String,Object>select(Page p);
	public String insert(MemberVo vo);
	public String update(MemberVo vo);
	public String delete(MemberVo vo);
	public MemberVo view(String mid);
}
```

Page.java

```java
package member;

public class Page {
	int totListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize=20;
	int blockSize=5;
	
	String findStr;
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}
	
	public void pageCompute() {
		totPage = (int)(Math.ceil(totListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo -listSize + 1;
		if(endNo>totListSize) endNo = totListSize;
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
		if(endPage>totPage) endPage = totPage;
	}

	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
}
```

select.jsp

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
				<input type='search' name='findStr' value='${param.findStr }'/>
				<input type='button' value='검색' id='btnFind' />
				<input type='text' name='nowPage' value='${(empty nowPage)? 1 : nowPage }'/>
				<input type='text' name='mid'/>
			</div>
		</form>
	</div>

	<hr/>
	
	<div id='listItems'>
		<c:forEach var='v' items="${list }">
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>${v.mid }</span><br/>
			<span>${v.name }</span><br/>
			<span>${v.phone }</span><br/>
			<span>${v.email }</span>
		</div>
		</c:forEach>
		
		</div>
	
	<div id='btnZone'>
		<c:if test="${page.startPage>1 }">
		<input type='button' value='맨첨' id='btnFirest'/>
		<input type='button' value='이전' id='btnPrev'/>
		</c:if>
		
		<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
		<input type='button' value='${i }' />
		</c:forEach>
		<c:if test="${page.endPage<page.totPage }">
		<input type='button' value='이전' id='btnNext'/>
		<input type='button' value='맨끝' id='btnLast'/>
		</c:if>
		
	</div>
	
	
</div>
</body>
</html>
```

# 5교시

MemberFactory.java

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
         Reader reader = Resources.getResourceAsReader("member/config.xml");
         factory = new SqlSessionFactoryBuilder().build(reader);
         
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }

   public static SqlSessionFactory getFactory() {
      return factory;
   }
}
```

config.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
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
            <property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
            <property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
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

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

   <!-- 테이블의 컬러명과 vo 객체의 필드명이 서로 다른 경우  -->
   <!-- column : 테이블의 컬럼명, property : vodml 필드명  -->
   <resultMap type="mVo" id="m_vo">
      <result column="m_id" property="mId"/>
      <result column="m_name" property="mName"/>
   </resultMap>

   <select id="temp_select" parameterType="page" resultMap="m_vo">
   
   </select>
   
   <select id="tot_list_size" parameterType="String" resultType="Integer">
      select count(mid) cnt from members 
      where mid like '%${_parameter}%' or email like '%${_parameter}%' 
      or phone like '%${_parameter}%' or address like '%${_parameter}%'
   </select>
   

   <!-- config.xml에서 typeAliases로 별칭을 등록해서 패키지명,클래스명을 단순화 시킬 수 있다.  -->
   <!--<select id="select" parameterType="member.Page" resultType="member.MemberVo">-->
   <select id="select" parameterType="page" resultType="mVo">
       select * from (
        select rownum no, m.* from (
           select * from members 
              where mid like '%${findStr}%' or email like '%${findStr}%' 
              or phone like '%${findStr}%' or address like '%${findStr}%' 
              order by name asc) m 
        ) where no between #{startNo} and #{endNo}
   </select>
   
   <insert id="insert" parameterType="mVo">
      insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
      values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
   </insert>
   
   <update id="update" parameterType="mVo">
      update members set
      name=#{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}   
      <if test="#{photo} != null">
         , photo= #{photo}
      </if>
      where mid=#{mid} and pwd=#{pwd}
   </update>
   
   <delete id="delete" parameterType="mVo">
      delete from members where mid=#{mid} and pwd=#{pwd}
   </delete>
   
   <select id="view" parameterType="String" resultType="mVo">
      select * from members where mid=#{_parameter}
   </select>
   
   
   
</mapper> 
```

member-servlet.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context="http://www.springframework.org/schema/context"
   xmlns:aop="http://www.springframework.org/schema/aop"
   
   xsi:schemaLocation="
         http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
         
         http://www.springframework.org/schema/context
         http://www.springframework.org/schema/context/spring-context-4.0.xsd
         
         http://www.springframework.org/schema/aop
         http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
         
         ">
          
   <context:annotation-config/>
   
   <bean id="myba" class="bean.MemberFactory"/>
   <bean id='mDao' class="member.MemberDao">
      <constructor-arg ref="myba"/>
   </bean>
   <bean id='mController' class='member.MemberController'>
      <constructor-arg ref="mDao"/>
   </bean>
   
   <bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
      <property name='prefix' value='/WEB-INF/member/'  />
      <property name='suffix' value='.jsp' />
   </bean>

</beans>
```

MemberController.java

```java
package member;

import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value="select.mem", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> list = null;
		
		if(page != null) {
			System.out.println("controller.select()..............");
			System.out.println("nowPage : " + page.getNowPage());
		}else {
			System.out.println("page is null");
		}
				
		Map<String,Object> map= dao.select(page);
		page = (Page)map.get("page");
		list = (List<MemberVo>)map.get("list");
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("select");//WEB-INF/member/insert_result.jsp
		return mv;
		
	}
}
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
<title>회원 조회</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<script type="text/javascript" src="./js/member.js"></script>
</head>
<body>
 <div id="member" class="select">
    <h2>회원 관리</h2>
    <div id="findZone">
       <form action="insertR.mem" name="frm_member" id="frmMember" method="post">
          <input type="button" id="btnInsert" value="입력"/>
          <div>
             <input type="search" name="findStr" value="${param.findStr }">
             <input type="button" value="검색" id="btnFind">
             <input type="text" name="nowPage" value="${(empty param.nowPage)? 1 : param.nowPage }">
             <input type="text" name="mid">
          </div>
       </form>
    </div>
    <hr/>
    
    <div id="listItems">
    
     <c:forEach var="v" items="${list }">
       <div class="item" onclick="view('${v.mid}')">
          <img align="left" src="http://placehold.it/150x200">
          <span>${v.mid }</span><br/>
          <span>${v.name }</span><br/>
          <span>${v.phone }</span><br/>
          <span>${v.email }</span>
       </div>
     </c:forEach>
       
   </div>
    
    <div id="btnZone">
       <c:if test="${page.startPage > 1 }">
          <input type="button" value="맨처음" id="btnFirst" onclick="goPage(1)"/>
          <input type="button" value="이전" id="btnPrev" onclick="goPage(${page.startPage-1})"/>
       </c:if>
       
       <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
         <input type="button" value="${i }" onclick="goPage(${i})"/>
       </c:forEach>
      
      <c:if test="${page.endPage < page.totPage }">
          <input type="button" value="다음" id="btnNext" onclick="goPage(${page.endPage+1})"/>
          <input type="button" value="맨끝" id="btnLast" onclick="goPage(${page.totPage})"/>
      </c:if>
    </div>
    
   <br><br>
   <a href="index.jsp">HOME</a>
        
 </div>
<script>member()</script>
</body>
</html>
```

# 6교시

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

   <!-- 테이블의 컬러명과 vo 객체의 필드명이 서로 다른 경우  -->
   <!-- column : 테이블의 컬럼명, property : vodml 필드명  -->
   <resultMap type="mVo" id="m_vo">
      <result column="m_id" property="mId"/>
      <result column="m_name" property="mName"/>
   </resultMap>

   <select id="temp_select" parameterType="page" resultMap="m_vo">
   
   </select>
   
   <select id="tot_list_size" parameterType="String" resultType="Integer">
      select count(mid) cnt from members
      <where> 
      	<foreach collection='미정' item='v' open='(' close=')' separator='or'>
      		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where>
   </select>
   

   <!-- config.xml에서 typeAliases로 별칭을 등록해서 패키지명,클래스명을 단순화 시킬 수 있다.  -->
   <!--<select id="select" parameterType="member.Page" resultType="member.MemberVo">-->
   <select id="select" parameterType="page" resultType="mVo">
       select * from (
        select rownum no, m.* from (
           select * from members 
           <where> 
      	<foreach collection='미정' item='v' open='(' close=')' separator='or'>
     		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where> 
           order by name asc) m 
        ) where no between #{startNo} and #{endNo}
   </select>
   
   <insert id="insert" parameterType="mVo">
      insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
      values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
   </insert>
   
   <update id="update" parameterType="mVo">
      update members set
      name=#{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}   
      <if test="#{photo} != null">
         , photo= #{photo}
      </if>
      where mid=#{mid} and pwd=#{pwd}
   </update>
   
   <delete id="delete" parameterType="mVo">
      delete from members where mid=#{mid} and pwd=#{pwd}
   </delete>
   
   <select id="view" parameterType="String" resultType="mVo">
      select * from members where mid=#{_parameter}
   </select>
   
   
   
</mapper> 
```

# 7교시

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

   <!-- 테이블의 컬러명과 vo 객체의 필드명이 서로 다른 경우  -->
   <!-- column : 테이블의 컬럼명, property : vodml 필드명  -->
   <resultMap type="mVo" id="m_vo">
      <result column="m_id" property="mId"/>
      <result column="m_name" property="mName"/>
   </resultMap>

   <select id="temp_select" parameterType="page" resultMap="m_vo">
   
   </select>
   
   <select id="tot_list_size" parameterType="page" resultType="Integer">
      select count(mid) cnt from members
      <where> 
      	<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
      		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where>
   </select>
   
   <!-- config.xml에서 typeAliases로 별칭을 등록해서 패키지명,클래스명을 단순화 시킬 수 있다.  -->
   <!--<select id="select" parameterType="member.Page" resultType="member.MemberVo">-->
   <select id="select" parameterType="page" resultType="mVo">
       select * from (
        select rownum no, m.* from (
           select * from members 
           <where> 
      	<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
     		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where> 
           order by name asc) m 
        ) where no between #{startNo} and #{endNo}
   </select>
   
   <insert id="insert" parameterType="mVo">
      insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
      values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
   </insert>
   
   <update id="update" parameterType="mVo">
      update members set
      name=#{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}   
      <if test="#{photo} != null">
         , photo= #{photo}
      </if>
      where mid=#{mid} and pwd=#{pwd}
   </update>
   
   <delete id="delete" parameterType="mVo">
      delete from members where mid=#{mid} and pwd=#{pwd}
   </delete>
   
   <select id="view" parameterType="String" resultType="mVo">
      select * from members where mid=#{_parameter}
   </select>
   
   
   
</mapper> 
```

Page.java

```java
package member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Page {
	int totListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize=12;
	int blockSize=5;
	
	String findStr;
	
	List<String> findStrList = new ArrayList<String>();
	
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}
	
	public void pageCompute() {
		totPage = (int)(Math.ceil(totListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo -listSize + 1;
		if(endNo>totListSize) endNo = totListSize;
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
		if(endPage>totPage) endPage = totPage;
	}

	
	
	public List<String> getFindStrList() {
		if(findStr != null) {
			String[] temp = findStr.split("");
			findStrList.addAll(Arrays.asList(temp));
		}
		
		return findStrList;
	}
	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
}
```

MemberDao.java

```java
package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map<String,Object> select(Page p) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		return map;
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

index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
</head>
<body>
<div id='index'>
	<h2>Spring Framework</h2>
	<hr/>
	<div class='menu'>
		<a href='test.ddd'>Spring MVC Test</a>
		<a href='gugudan.ddd'>Spring MVC를 사용한 구구단</a>
		<a href='sum.ddd'>두수의 합</a>
		<a href='insert.mem'>회원가입</a>
		<a href='select.mem'>회원조회</a>
	</div>
</div>
</body>
</html>
```

index.css

```css
@charset "UTF-8";
*{
	box-sizing:border-box;
	padding:0;
	margin:0;		
}

#index{
	width: 1000px;
	margin: 10px auto;
	
}

#index > h2{
	background-color: #333;
	padding: 20px;
	color: #fff;
	
}
#index >.menu{
	text-align: rigth;
	background-color: #ccc;
	
}
#index >.menu > a{
	text-decoration: none;
	list-style: none;
	display: inline-block;
	margin-left:-6px;
	font-size:10pt;
	padding: 5px 10px;
}

#index >.menu> a:hover {
	background-color: #555;
	color: #ff0;
}
```

# 마지막 프로젝트 미팅 하라하신당.