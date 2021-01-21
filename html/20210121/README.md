# 1교시

어제 한거 복습한다 쓱싹..

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

servlet와 servlet-mapping 은 한세트다.

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
	
	<bean id='hello' class='mvc.Hello' />

</beans>
```

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

# 2교시

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
	
	<bean id='hello' class='mvc.Hello' />
	<bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
		<property name='prefix' value='/WEB-INF/test/' />
		<property name='suffix' value='.jsp' />
	</bean>

</beans>
```

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

WEB-INF 안에 test라는 폴더생성후 myname.jsp만듬

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myname</title>
</head>
<body>
	<div id='myname'>
		<h2>Result</h2>
		${message }
	</div>
</body>
</html>
```

index.jsp를 서버 돌리면

Spring Framework
--------------------------
Spring MVC Test

이렇게 출력되고 spring MVC test 누르면

Result
하이~~~ 방가워

이렇게 출력된다.

# 3교시 

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
	
	@RequestMapping(value="gugudan.ddd", method=RequestMethod.GET)
	public ModelAndView abc() {
		ModelAndView mv = new ModelAndView();
		StringBuffer sb = new StringBuffer();
		
		int dan=9;
		for(int i=1; i<10; i++) {
			String str = String.format("%d * %d = %d <br/>", dan, i, (dan*i));
			sb.append(str);
		}
		
		mv.setViewName("gugudan_result");
		mv.addObject("gu",sb.toString());
		
		
		return mv;
	}
}
```

WEB-INF폴더안에 test폴더안에 gugudan_result.jsp만든다

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan_result</title>
</head>
<body>
<div id='gugudan_result'>
	<h2>구구단</h2>
	${gu }

</div>
</body>
</html>
```

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
	<a href='gugudan.ddd'>Spring MVC를 사용한 구구단</a>
</div>
</body>
</html>
```

# 점심후 4교시

spring MVC 응용

<a href='sum.ddd'>두수의 합</a>

이란 링크를 index.jsp에 추가한 후 링크를 클릭하면 임의의 두수의 합이 리턴 되로록 작업
작업 결과는 sum_result에 전달
기타 매팅 작업등은 개발자 임의로 지정

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
	
	@RequestMapping(value="gugudan.ddd", method=RequestMethod.GET)
	public ModelAndView abc() {
		ModelAndView mv = new ModelAndView();
		StringBuffer sb = new StringBuffer();
		
		int dan=9;
		for(int i=1; i<10; i++) {
			String str = String.format("%d * %d = %d <br/>", dan, i, (dan*i));
			sb.append(str);
		}
		
		mv.setViewName("gugudan_result");
		mv.addObject("gu",sb.toString());
		
		
		return mv;
	}
	
	@RequestMapping(value="sum.ddd",method=RequestMethod.GET)
	public ModelAndView sum() {
		ModelAndView mv = new ModelAndView();
		int a = 10;
		int b = 20;
		int r= a+b;
		
		mv.setViewName("sum_result");
		mv.addObject("a",a);
		mv.addObject("b",b);
		mv.addObject("r",r);
		
		return mv;
	}

}
```

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
	<a href='gugudan.ddd'>Spring MVC를 사용한 구구단</a>
	<a href='sum.ddd'>두수의 합</a>
</div>
</body>
</html>
```


WEB-INF폴더안에 test폴더안에 sum_result.jsp만든다

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sum_result</title>
</head>
<body>
<div id='sum_result'>
	<h2>두 수 합</h2>
	${a } + ${b } = ${r }
</div>
</body>
</html>
```

MemberVo - 폼작성

회원 관리에 해당하는 MVC

1. member.MemberVo.java,member.MemberDao.java
2. Controller -> MemberController.java
3. dispater -> member-servlet.xml
4. view -> WEB-INF/member/*.jsp
5. mapping -> mem

web.xml에 추가하셈

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

	<!-- member -->
	<servlet>
		<servlet-name>member</servlet-name>
		<servlet-class>
		org.springframework.web.servlet.DispatcherServlet
		</servlet-class>	
	</servlet>

	<servlet-mapping>
		<servlet-name>member</servlet-name>
		<url-pattern>*.mem</url-pattern>
	</servlet-mapping>
	
</web-app>
```

WEB-INF 안에 member-servlet.xml만들고

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
	
	<bean id='mController' class='member.MemberController' />
	<bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
		<property name='prefix' value='/WEB-INF/member/' />
		<property name='suffix' value='.jsp' />
	</bean>

</beans>
```

# 5교시 

member란 패키지만들고 그안에 MemberController.java 만든다

```java
package member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	
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
}

```

memberVo.java

```java
package member;

public class MemberVo {
	String mid;
	String pwd;
	String name;
	String email;
	String phone;
	String zipcode;
	String address;
	String photo;
	String delFile;
	String mdate;
	
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDelFile() {
		return delFile;
	}
	public void setDelFile(String delFile) {
		this.delFile = delFile;
	}
	
	
}
```

WEB-INF 안에 member란 폴더만들고 그안에 insert.jsp 만듬

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div id='member' class='insert'>
	<h2>회원가입</h2>
	<form name='frm_member' id='frm_member' method='post' action='insertR.mem'>
		<label>아이디</label>
		<input type='text' name='mid' value='a001'/>
		<br/>
		<label>암호</label>
		<input type='password' name='pwd' value='1111'/>
		<br/>
		<label>연락처</label>
		<input type='text' name='phone' value='010-1111-1111'/>
		
		<input type='submit' value='전송' id='btnInsertR' />
	</form>

</div>
</body>
</html>
```

# 마지막 교시

member폴더안에 insert_result.jsp 만듬

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_result</title>
</head>
<body>
<div id='member'>
	<h2>처리결과</h2>
	${msg }
</div>
</body>
</html>
```

member패키지안에 MemberDao.java 추가 

```java
package member;

import java.util.List;

public class MemberDao implements Dao{

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

member패키지안에 Dao.interface추가

```interface
package member;

import java.util.List;

public interface Dao {
	public boolean log(String mid, String pwd);
	public int getTotListSize(String findStr);
	public List<MemberVo>select(Page p);
	public String insert(MemberVo vo);
	public String update(MemberVo vo);
	public String delete(MemberVo vo);
	public MemberVo view(String mid);
}
```

WebContent 안에 WEB-INF안에 member-servlet.xml

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
	
	<bean id='mDao' class='member.MemberDao'/>
	<bean id='mController' class='member.MemberController' >
		<constructor-arg ref="mDao"/>
	</bean>
	
	
	<bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
		<property name='prefix' value='/WEB-INF/member/' />
		<property name='suffix' value='.jsp' />
	</bean>

</beans>
```

