# 오전 세미 발표 긁적..

# 4교시

## Filter
    Filter는 Servlet 실행전 사전 작업이 필요한 경우 아주 유용하게 사용할 수 있는 요소이다. 예를 들어 로그인 여부를 체크하거나 인코딩 부분을 사전에 처리해 준다던가 하는 작업들이다. 서버단에서
    굳이해야할 일들은 아니지만, 입력항목들에 대한 validation도 가능하다.
    Filter의 구동 과정은 아래와 같다.
1. 웹 어플리케이션 구동되면 등록된 필터의 인스턴스를 생성하고 init()를 호출한다. 이 때 init()메서드는 여러 번의 요청이 들어와도 한번만 호출 된다.
1. 클라이언트의 요청 정보가 들어요면 Filer의 doFilter()를 호출한다. 요청 정보가 여러 개인경우 doFilter()는 요청정보를 모두 처리할 때까지 재귀호출된다.
2. 모든 필터가 처리되면 Servelt의 service()를 호출한다.
3. 사용자에게 응답정보를 보낸다.
4. 웹 어플리케이션이 종료되기전 destroy()를 호출하여 마무리 작업을 한다.

- Sping
  - DI(의존성 주입)
  - AOP(횡단적 관심사의 처리)[filter가 능력함] - 처리과정중에 사전이든 사후든 반드시 해야되는일들을 따로 뽑아 독립적인 형태를 만드는것을 횡단적 관심사의 분리 라고함.
    - 분리 해놓고 특정 지역에 다시 적용하는 작업을
  - MVC

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
<div id='filter_test'>
	<h3>Filter Test</h3>
	<form name='frm' method='post' action='/kh-web-20201130/filter.do'>
		<label>답글 내용</label><br/>
		<textarea rows="5" cols="50" name='doc'>filter를 사용하여 한글 encoding을 테스트하고 있습니다.</textarea>
		<p/>
		<input type='submit' value='저장'/>
	</form>
	<hr/>
	<h3>저장 내용 출력</h3>
	<%=request.getAttribute("doc") %>
</div>
</body>
</html>
```

# 5교시

```java
package myfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(urlPatterns = "/filter.do")
public class EncodingFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException{
		System.out.println("웹 어플리케이션이 시작되면 처음 한번만 실행됩니다.");
	
	
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException{
		
		chain.doFilter(request, response);	//LIFO(마지막에 들어오는애가 먼저 나감)

		RequestDispatcher rd = request.getRequestDispatcher("./filter/filter_test.jsp");
		rd.forward(request, response);
		
	}
	
	@Override
	public void destroy() {
		System.out.println("웹 어플리케이션 서버가 종료되었습니다.");

	}
}
```

```java
package myfilter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/filter.do")
public class FilterTestServelt extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String doc = req.getParameter("doc");
		System.out.println("servlet doc : " + doc);
		req.setAttribute("doc", doc);
	}

}
```

# 6교시

```java
package myfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = "/filter.do", initParams = {
				@WebInitParam(name="encoding", value="utf-8")
			})	// 필수 아님(옵션임:한글쓸때는 넣어야됨)
public class EncodingFilter implements Filter{	//implements => 추상메서드 -> prototype -> {}
	FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException{
		System.out.println("웹 어플리케이션이 시작되면 처음 한번만 실행됩니다.");
		this.config = filterConfig;
	
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException{
		
		request.setCharacterEncoding(config.getInitParameter("encoding"));
		chain.doFilter(request, response);	//LIFO(마지막에 들어오는애가 먼저 나감)

		RequestDispatcher rd = request.getRequestDispatcher("./filter/filter_test.jsp");
		rd.forward(request, response);
		
	}
	
	@Override
	public void destroy() {
		System.out.println("웹 어플리케이션 서버가 종료되었습니다.");

	}
}
```

- 필터 응용
    - 세션 정보를 체크하여 로그인 여부를 Filter를 사용하여 체크해 보도록 하겠다.
    - 테스트용 파일(WebContent/s_filter)
- 파일명                    내용
filter_main.jsp             filter 테스트 메인
member_select.jsp           회원 주요 정보 조회(관리자 로그인 필요)
sale_select.jsp             판매 정보 조회(관리자 로그인 필요)
login_fail.jsp              관리자 로그인 실패시 출력 페이지
MemberFilterServlet.java    회원조회 Servlet
SaleFilterServlet.java      판매조회 Servlet
ManagerFilter.java          관리자 로그인 체크 필터

# 7교시 

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter main</title>
</head>
<body>
	<%
		session.setAttribute("mid","manager");	//매너지 아이디로 로그인했다 인정
		session.removeAttribute("mid");
		
	%>
	<div id='filter_main'>
		<h3>Filter를 사용한 관리자 로그인 체크</h3>
		<a href='member_select.jsp'>회원조회</a>
		<a href='sale_select.jsp'>판매조회</a>
	
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
<title>member_select</title>
</head>
<body>
	<div id='member_select'>
		<h3>회원정보</h3>
		<form name='frm' method='post' action='/kh-web-20201130/member.kim'>
			<input type='submit' value='조회' />
			<a href='/kh-web-20201130/filter/filter_main.jsp'>HOME</a>	
		</form>
		<hr/>
		${msg }
		
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
<title>sale select</title>
</head>
<body>
	<div id='sale_select'>
	<h3>판매 실적 조회</h3>
	<form name='frm' method='post' action='/kh-web-20201130/sale.park'>
		<input type='submit' value='조회' />
		<a href='/kh-web/20201130/filter/filter_main.jsp'>HOME</a>
	</form>
	<hr/>
	${msg }
	
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
<title>login fail</title>
<style>
	#login_fail{
		border: 1px solid #f00;
		padding:20px;
		width:300px;
		margin:200px auto;
	}
</style>
</head>
<body>
	<div id='login_fail'>
		<label>으음 안타깝기도하지..관리자가 아니여서</label>
		<p/>
		<a href='/kh-web-20201130/filter/filter_main.jsp'>HOME</a>
	</div>
</body>
</html>
```

```java
package myfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ManagerFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("manager login filter가 구동되었습니다.");
	
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		
		//	request 객체에 있는 session 가져오기
		HttpSession session = ((HttpServletRequest)request).getSession();
		RequestDispatcher rd = null;
		
		// 요청 url
		String url = ((HttpServletRequest)request).getRequestURI().toString();
		String mid = (String)session.getAttribute("mid");
		
		if(mid == null || ! mid.contentEquals("manager")) {
			rd = request.getRequestDispatcher("./filter/login_fail.jsp");
		}else { // manager 아이디로 로그인 한 경우
			if(url.indexOf("member")>=0) {
				
			}else if(url.lastIndexOf("sale")>=0) {
				
			}
		}
		
		rd.forward(request, response);
		
		
	}

	@Override
	public void destroy() {
		System.out.println("manager login filter가 종료되었습니다.");
		
	}

	
}
```

# 마지막 교시용

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sale select</title>
</head>
<body>
	<div id='sale_select'>
	<h3>판매 실적 조회</h3>
	<form name='frm' method='post' action='/kh-web-20201130/sale.park'>
		<input type='submit' value='조회' />
		<a href='/kh-web-20201130/filter/filter_main.jsp'>HOME</a>
	</form>
	<hr/>
	${msg }
	
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
<title>member_select</title>
</head>
<body>
	<div id='member_select'>
		<h3>회원정보</h3>
		<form name='frm' method='post' action='/kh-web-20201130/member.kim'>
			<input type='submit' value='조회' />
			<a href='/kh-web-20201130/filter/filter_main.jsp'>HOME</a>	
		</form>
		<hr/>
		${msg }
		
	</div>
</body>
</html>
```

```java
package myfilter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/member.kim")
public class MemberFilterServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", "주요 회원 정보가 조회되었습니다.");
	}

}
```

```java
package myfilter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/sale.park")
public class SaleFilterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", "주요 판매 실적이 조회되었습니다.");
		
	}

	
}
```

```java
package myfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = "/filter.do", initParams = {
				@WebInitParam(name="encoding", value="utf-8")
			})	// 필수 아님(옵션임:한글쓸때는 넣어야됨)
public class EncodingFilter implements Filter{	//implements => 추상메서드 -> prototype -> {}
	FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException{
		System.out.println("웹 어플리케이션이 시작되면 처음 한번만 실행됩니다.");
		this.config = filterConfig;
	
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException{
		
		request.setCharacterEncoding(config.getInitParameter("encoding"));
		chain.doFilter(request, response);	//LIFO(마지막에 들어오는애가 먼저 나감)

		RequestDispatcher rd = request.getRequestDispatcher("./filter/filter_test.jsp");
		rd.forward(request, response);
		
	}
	
	@Override
	public void destroy() {
		System.out.println("웹 어플리케이션 서버가 종료되었습니다.");

	}
}
```