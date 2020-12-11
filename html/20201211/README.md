# 1교시

- COS
  - 문제 1 => 상업용 유료
  - 문제 2 => html5 지원불가..
  - 문제 3 => 한꺼번에 여러개의 파일 업로드 불가...
- apache
  - 문제 1 => 사용방법이 까다로움...(무료다^^,html5 지원해준다..)

.JSP(text형파일) = > JSP.java(text형파일) = > .class = > yum
    컴파일                               컴파일

C:\Users\pc\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\kh-web-20201130\org\apache\jsp
경로 가보자^^ 컴파일된것들이 잇다 눈팅 ㄱㄱ

# 2교시

throws - > try{
    catch
}

- 주석(Comments tag) = 컴파일 시 주석으로 취급하기 위한 코드 <%-- --%>
- 지시자(directive tag) = JSP 페이지 전체에 사용하기 위한 설정을 작성 <%@ %>
- 선언(declaration) = 변수와 메소드를 선언 <%! %>
- 스크립트릿(scriptlet) = 자바 코드를 기술 <% %>
- 표현식(expression) = 계산식이나 함수 리턴을 문자열 형태로 출력 <%= %>

1. 스크립트릿, Scriptlet
JSP에는 자바 코드와 HTML 코드가 섞여 있게 된다. HTML 태그는 정적인 페이지를 디자인하게
되고 자바 코드는 웹 서버에서 처리해야 할 문장들을 기술하게 된다. 이 때 사용되는 자바 언어를
서버 스크립트 언어라고 하며, JSP문서 내부에서 자바 코드를 사용하기 위해 제공되는 것이 스크
립트릿 태그이다.
스크립트릿 태그 내에 정의된 내용은 JSP코드가 서블릿으로 변환될 때 _jspService( )메소드 내부
로 들어가게 된다.

- 지시자 종류와 사용 목적
종류 - 목적
page - 해당 JSP 페이지 전반적인 환경 설정
include -  페이지에 다른 파일의 내용을 삽입
taglib - 태그 라이브러리에서 기능을 사용할 수 있도록 제공

- extends 속성
jsp페이지가 상속받을 상위 클래스를 기술
일반적으로 서블릿 컨테이너가 알아서 처리하며 개발자가 지정할 필요가 없다
<%@ page extends=”javax.servlet.jsp.HttpJspBase” %>
- import 속성
java 소스와 마찬가지로 import할 클래스의 풀네임을 기술한다
JSP는 기본적으로 javax.servlet.*, javax.servlet.hhtp.*, javax.servlet.jsp.* 3개의 패키지 내용을 import하
고 있다
<%@ page import=”java.util.Calendar” %>
- session 속성
true / false 로 설정하며 세션을 사용할지 말지를 결정하는 속성
HttpSession 객체를 사용할 것인지 결정된다
기본적으로 true로 설정되어 있으며 세션을 사용하지 않으려면 false를 지정한다
<%@ page session=”false” %>

# 3교시

> header.jsp, footer.jsp 페이지를 생성
> header,footer에서 불필요한 코드 제거(옵션)
> index.jsp에서 헤더영역의 코드를 오려내어 header.jsp에 붙여넣기
> index.jsp에서 footer영역의 코드를 오려서 footer.jsp에 붙여넣기
> header.footer에 각각 변수 a선언
> header영역에 정적삽입으로 header.jsp를 include
> footer영역에 정적삽입으로 footer.jsp를 include

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index1130</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<%
	//inc
	String inc = "intro.jsp";
 	if(request.getParameter("inc") != null) {
 		inc = request.getParameter("inc");
 	} 
 	
	//sub
 	String sub = "./jquery/menu.jsp";
 	if(request.getParameter("sub") != null){
 		sub = request.getParameter("sub");	
 	}
%>
	<div id='index'>
		<!-- header 영역 -->
		<%@include file="header.jsp" %>
		
		<section id='contents'>
			<article class ='content'>
				<jsp:include page="<%=inc %>"/>
			</article>
			<aside class ='aside'>
				<img src='http://placehold.it/150x100'/>
			<div id ='sub_menu'>
				<jsp:include page="<%=sub %>"/>
			</div>
			</aside>
			
		</section>
		<%--foot 영역 --%>
		<%@include file="footer.jsp" %>
	
	</div>
	<script>
	// 모든 기본태그의 마진, 패딩을 0
	$('*').css('margin','0');
	$('*').css('padding','0');
	// 패딩의 증가의 영향을 최소화 하기위한 조치
	$('*').css('box-sizing', 'border-box');
	//
	$('a').css('text-decoration', 'none');
	
	//index 페이지의 넓이와 중앙배치
	$('#index').css('width', '800px');
	$('#index').css('margin', 'auto');
	
	//header의 높이와 바탕색
	$('#index>#header').css('height', '150px');
	$('#index>#header').css('background-color', 'grey');
	$('#index>#header').css('margin-top', '5px');
	$('#index>#header').css('position', 'relative');
	
	
	// index > header > nav
	$('#header>#nav').css({
		'position' : 'absolute',
		'right' : '2px',
		'bottom' : '2px'
	});
	
	$('#header>#nav>ul').css({
		'list-style' : 'none'
	});
	
	$('#header>#nav>ul>li').css({
		'display' : 'inline-block',
		'padding' : '3px',
		'width' : '70px',
		'background-color' : '#99f',
		'text-align' : 'center',
		'cursor' : 'pointer'
	});
	
	$('#header>#nav>ul>li').first().css('border-radius','8px 0 0 8px');
	$('#header>#nav>ul>li').last().css('border-radius','0 8px 8px 0');
	
	
	//contents는 최소높이와 바탕색
	$('#index>#contents').css('min-height', '800px');
	$('#index>#contents').css('background-color', 'white');
	
	//footer는 높이와 바탕색
	//$('#index>#footer').css('min-height', '100px');
	//$('#index>#footer').css('background-color', 'green');
	//$('#index>#footer').css('text-align', 'center');
	//$('#index>#footer').css('line-height', '100px');
	
	//footer 높이와 바탕색 등등을 JSON 표기법으로
	$('#index>#footer').css({
		'height':'100px', 
		'background-color':'grey', 
		'text-align':'center', 
		'line-height':'100px'
		});
	
	//
	$('#index>#contents').css({
		'margin-top':'3px',
		'margin-bottom':'3px'
	});
	
	//
	$('#index>#contents>.content').css({
		'width':'650px',
		'float':'left'
	});
	
	//
	$('#index>#contents>.aside').css({
		'width':'150px',
		'float':'right'
	});
	
	//
	$('#index>#contents>.aside>#sub_menu').css({
		'width': '150px'
	});
	
	$('#index>#contents>.aside>#sub_menu>ol').css({
		'margin-left' : '17px'
	});
	
	
	
	
	
	</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id='header'>
			<nav id ='nav'>
				<ul>
					<li><a href = 'index.jsp'>HOME</a></li>
					<li><a href = 'index.jsp?sub=./jquery/menu.jsp'>JQUERY</a></li>
					<li><a href = 'index.jsp?sub=./ajax/menu.jsp'>AJAX</a></li>
					<li><a href = 'index.jsp?sub=./mybatis/menu.jsp'>MYBATIS</a></li>
					<li>방명록</li>
					<li>게시판</li>
					<li>회원관리</li>
				</ul>
			</nav>
		</header>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer id='footer'>융합S/W 개발(주)</footer>
```

# 4교시 

## 클라이언트의 요청이 있을 때 관련된 정보들을 알 수 있는 메소드
반환타입 - 메소드명 - 설명
String - getRemoteAddr( ) - 웹 서버에 연결한 클라이언트의 IP주소를 구함
long - getContentLength( ) - 클라이어트가 전송한 요청정보의 길이를 구함
String - getCharacterEncoding( ) - 클라이언트가 요청 정보를 전송할 때 사용한 캐릭터셋을
구함
String - getContentType( ) - 클라이언트가 요청 정보를 전송할 때 사용한 컨텐트 타입을 구함
String - getProtocol( ) - 클라이언트가 요청한 프로토콜을 구함
String - getMethod( ) - 데이터 전송 방식을 구함
String - getRequestURL( ) - 요청 URL을 구함
String - getContextPath( ) - JSP페이지가 속한 웹어플리케이션의 컨텍스트패스 반환
String - getServerName( ) - 연결할 때 사용한 서버이름을 구함
int - getServerPort( ) - 사용중인 프로토콜을 구함
## request 객체의 요청 파라미터 관련 메소드
반환타입 - 메소드명 - 설명
String - getParameter(String name) -지정한 이름의 파라미터가 있을 경우 첫 번째 파라미터의 값을 구함
String[ ] - getParameterValues(String name) - 지정한 이름의 파라미터가 있을 경우 지정한 이름을 가진 파라미터의 모든 값을 String[ ]으로 구함
Enumerati on - getParameterNames( ) 모든 파라미터의 이름을 구함
Map - getParameterMap( ) - 전송한 파라미터를 맵 형식으로 구함

## 내장 객체의 영역(범위, Scope)
내장 객체의 영역은 객체의 유효범위(유효기간)을 뜻한다
해당 객체가 얼마나 유지되는 지 지정해 주는 것
영역은 page, request, session, application으로 4가지로 분류된다
영역 - 설명
page - 하나의 JSP페이지를 처리할 때 사용되는 영역
request - 하나의 요청을 처리할 때 사용되는 영역
session - 하나의 브라우저와 관련된 영역
application - 하나의 웹 어플리케이션과 관련된 영역
page(페이지(JSP))<Request(요청정보)<Session(개인용(인당 발생)(로그인/로그아웃))<Application(모든유저에 공유)

- jsp폴더 생성
- menu.jsp파일 생성
- header.jsp에서 JSP 메뉴 추가

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내안에 객체잇다</title>
</head>
<body>
<h3>JSP</h3>
<ol>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/implict.jsp'>내장객체</a></li>
</ol>
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
<title>내장객체</title>
</head>
<body>
<div id='impllicet'>
<h3>1. out.print()</h3>
<ul>
	<li>result = <% out.print("hello JSP"); %></li>
	<li>result2 = <%= "hello JSP 2 " %></li>
</ul>
<h3>2. Request 내장 객체</h3>
<ul>
	<li>프로토콜 : <%=request.getProtocol() %></li>

</ul>
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
<title>Index1130</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<%
	//inc
	String inc = "intro.jsp";
 	if(request.getParameter("inc") != null) {
 		inc = request.getParameter("inc");
 	} 
 	
	//sub
 	String sub = "./jquery/menu.jsp";
 	if(request.getParameter("sub") != null){
 		sub = request.getParameter("sub");	
 	}
%>
	<div id='index'>
		<!-- header 영역 -->
		<%@include file="header.jsp" %>
		
		<section id='contents'>
			<article class ='content'>
				<jsp:include page="<%=inc %>"/>
			</article>
			<aside class ='aside'>
				<img src='http://placehold.it/150x100'/>
			<div id ='sub_menu'>
				<jsp:include page="<%=sub %>"/>
			</div>
			</aside>
			
		</section>
		<%--foot 영역 --%>
		<%@include file="footer.jsp" %>
	
	</div>
	<script>
	// 모든 기본태그의 마진, 패딩을 0
	$('*').css('margin','0');
	$('*').css('padding','0');
	// 패딩의 증가의 영향을 최소화 하기위한 조치
	$('*').css('box-sizing', 'border-box');
	//
	$('a').css('text-decoration', 'none');
	
	//index 페이지의 넓이와 중앙배치
	$('#index').css('width', '800px');
	$('#index').css('margin', 'auto');
	
	//header의 높이와 바탕색
	$('#index>#header').css('height', '150px');
	$('#index>#header').css('background-color', 'grey');
	$('#index>#header').css('margin-top', '5px');
	$('#index>#header').css('position', 'relative');
	
	
	// index > header > nav
	$('#header>#nav').css({
		'position' : 'absolute',
		'right' : '2px',
		'bottom' : '2px'
	});
	
	$('#header>#nav>ul').css({
		'list-style' : 'none'
	});
	
	$('#header>#nav>ul>li').css({
		'display' : 'inline-block',
		'padding' : '3px',
		'width' : '70px',
		'background-color' : '#99f',
		'text-align' : 'center',
		'cursor' : 'pointer'
	});
	
	$('#header>#nav>ul>li').first().css('border-radius','8px 0 0 8px');
	$('#header>#nav>ul>li').last().css('border-radius','0 8px 8px 0');
	
	
	//contents는 최소높이와 바탕색
	$('#index>#contents').css('min-height', '800px');
	$('#index>#contents').css('background-color', 'white');
	
	//footer는 높이와 바탕색
	//$('#index>#footer').css('min-height', '100px');
	//$('#index>#footer').css('background-color', 'green');
	//$('#index>#footer').css('text-align', 'center');
	//$('#index>#footer').css('line-height', '100px');
	
	//footer 높이와 바탕색 등등을 JSON 표기법으로
	$('#index>#footer').css({
		'height':'100px', 
		'background-color':'grey', 
		'text-align':'center', 
		'line-height':'100px'
		});
	
	//
	$('#index>#contents').css({
		'margin-top':'3px',
		'margin-bottom':'3px'
	});
	
	//
	$('#index>#contents>.content').css({
		'width':'650px',
		'float':'left'
	});
	
	//
	$('#index>#contents>.aside').css({
		'width':'150px',
		'float':'right'
	});
	
	//
	$('#index>#contents>.aside>#sub_menu').css({
		'width': '150px'
	});
	
	$('#index>#contents>.aside>#sub_menu>ol').css({
		'margin-left' : '17px'
	});
	
	
	
	
	
	</script>
</body>
</html>
```

# 5교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내안에 객체잇다</title>
</head>
<body>
<h3>JSP</h3>
<ol>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/implict.jsp'>내장객체</a></li>
</ol>
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
<title>내장객체</title>
</head>
<body>
<div id='impllicet'>
<h3>1. out.print()</h3>
<ul>
	<li>result = <% out.print("hello JSP"); %></li>
	<li>result2 = <%= "hello JSP 2 " %></li>
</ul>
<h3>2. Request 내장 객체</h3>
<ul>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버명 : <%=request.getServerName() %></li>
	<li>웹루트 : <%=request.getContextPath() %></li>
	<li>현재경로 : <%=request.getRequestURI() %></li>
	<li>실제경로 : <%=request.getRealPath(".") %></li>
</ul>
<h3>3. Response 내장 객체</h3>
	<input type='button' id='btnRedirect' value='Redirect' />
</div>
<script>
	$('#btnRedirect').on('click',(function(){
		<%
			response.sendRedirect("./index.jsp");
		%>
	});

</script>
</body>
</html>
```

```sql
/*  회원관리 */
CREATE TABLE members(
    mid varchar2(20),
    pwd varchar2(20),
    name varchar2(20),
    email varchar2(100),
    phone varchar2(20),
    zipcoder varchar2(10),
    address varchar2(100)
);

/* 방명록 */
CREATE TABLE guestbook(
    serial INTEGER,
    mid VARCHAR2(20),
    pwd VARCHAR2(20),
    mdate VARCHAR2(12),
    doc VARCHAR2(500)
);
```

# 6교시

- 로그인
  - members 테이블 체크
  - member 폴더 생성
  - member/loginfo.jsp(form)

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index1130</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<%
	//inc
	String inc = "intro.jsp";
 	if(request.getParameter("inc") != null) {
 		inc = request.getParameter("inc");
 	} 
 	
	//sub
 	String sub = "./jquery/menu.jsp";
 	if(request.getParameter("sub") != null){
 		sub = request.getParameter("sub");	
 	}
%>
	<div id='index'>
		<!-- header 영역 -->
		<%@include file="header.jsp" %>
		
		<section id='contents'>
			<article class ='content'>
				<jsp:include page="<%=inc %>"/>
			</article>
			<aside class ='aside'>
				<jsp:include page="./member/loginfo.jsp"/>
			<div id ='sub_menu'>
				<jsp:include page="<%=sub %>"/>
			</div>
			</aside>
			
		</section>
		<%--foot 영역 --%>
		<%@include file="footer.jsp" %>
	
	</div>
	<script>
	// 모든 기본태그의 마진, 패딩을 0
	$('*').css('margin','0');
	$('*').css('padding','0');
	// 패딩의 증가의 영향을 최소화 하기위한 조치
	$('*').css('box-sizing', 'border-box');
	//
	$('a').css('text-decoration', 'none');
	
	//index 페이지의 넓이와 중앙배치
	$('#index').css('width', '800px');
	$('#index').css('margin', 'auto');
	
	//header의 높이와 바탕색
	$('#index>#header').css('height', '150px');
	$('#index>#header').css('background-color', 'grey');
	$('#index>#header').css('margin-top', '5px');
	$('#index>#header').css('position', 'relative');
	
	
	// index > header > nav
	$('#header>#nav').css({
		'position' : 'absolute',
		'right' : '2px',
		'bottom' : '2px'
	});
	
	$('#header>#nav>ul').css({
		'list-style' : 'none'
	});
	
	$('#header>#nav>ul>li').css({
		'display' : 'inline-block',
		'padding' : '3px',
		'width' : '70px',
		'background-color' : '#99f',
		'text-align' : 'center',
		'cursor' : 'pointer'
	});
	
	$('#header>#nav>ul>li').first().css('border-radius','8px 0 0 8px');
	$('#header>#nav>ul>li').last().css('border-radius','0 8px 8px 0');
	
	
	//contents는 최소높이와 바탕색
	$('#index>#contents').css('min-height', '800px');
	$('#index>#contents').css('background-color', 'white');
	
	//footer는 높이와 바탕색
	//$('#index>#footer').css('min-height', '100px');
	//$('#index>#footer').css('background-color', 'green');
	//$('#index>#footer').css('text-align', 'center');
	//$('#index>#footer').css('line-height', '100px');
	
	//footer 높이와 바탕색 등등을 JSON 표기법으로
	$('#index>#footer').css({
		'height':'100px', 
		'background-color':'grey', 
		'text-align':'center', 
		'line-height':'100px'
		});
	
	//
	$('#index>#contents').css({
		'margin-top':'3px',
		'margin-bottom':'3px'
	});
	
	//
	$('#index>#contents>.content').css({
		'width':'650px',
		'float':'left'
	});
	
	//
	$('#index>#contents>.aside').css({
		'width':'150px',
		'float':'right'
	});
	
	//
	$('#index>#contents>.aside>#sub_menu').css({
		'width': '150px'
	});
	
	$('#index>#contents>.aside>#sub_menu>ol').css({
		'margin-left' : '17px'
	});
	
	
	
	
	
	</script>
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
<title>내장객체</title>
</head>
<body>
<div id='impllicet'>
<h3>1. out.print()</h3>
<ul>
	<li>result = <% out.print("hello JSP"); %></li>
	<li>result2 = <%= "hello JSP 2 " %></li>
</ul>
<h3>2. Request 내장 객체</h3>
<ul>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버명 : <%=request.getServerName() %></li>
	<li>웹루트 : <%=request.getContextPath() %></li>
	<li>현재경로 : <%=request.getRequestURI() %></li>
	<li>실제경로 : <%=request.getRealPath(".") %></li>
</ul>
<h3>3. Response 내장 객체</h3>
	<input type='button' id='btnRedirect' value='Redirect' />
</div>
<script>
	$('#btnRedirect').on('click',(function(){
		<%
			response.sendRedirect("./index.jsp");
		%>
	});

</script>
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
<title>내안에 객체잇다</title>
</head>
<body>
<h3>JSP</h3>
<ol>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/implict.jsp'>내장객체</a></li>
</ol>
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
<title>loginfo</title>
</head>
<body>
<div id='loginfo'>
	<%-- 로그인 이전 화면 --%>
	<form name='frm_log' method='post'>
		<label for='mid'>아이디</label>
		<input type='text' id='mid' name='mid' size='14' value='kim' />
		<br/>		
		<label for='pwd'>암호</label>
		<input type='password' id='pwd' name='pwd' value='1111' />
		<input type='button' id='btnlogin' value='로그인' />
	</form>

	<br/>
	<a href=''>아이디 | 암호 찾기</a>
	
	
	<%-- 로그인 이후 화면 --%>
	<span>[kim] 님방가</span><br/>
	<input type='button' id='btnlogout' value='로그아웃' />
	
	
	
</div>
</body>
</html>
```

```sql
/*  회원관리 */
CREATE TABLE members(
    mid varchar2(20),
    pwd varchar2(20),
    name varchar2(20),
    email varchar2(100),
    phone varchar2(20),
    zipcoder varchar2(10),
    address varchar2(100)
);

/* 방명록 */
CREATE TABLE guestbook(
    serial INTEGER,
    mid VARCHAR2(20),
    pwd VARCHAR2(20),
    mdate VARCHAR2(12),
    doc VARCHAR2(500)
);

/* 회원관리 테이블에 테스트용 자료 입력*/
INSERT INTO members VALUES('kim','1111','김씨','kim@jobtc.kr','010-1111-1111','11-111','서울');
INSERT INTO members VALUES('lee','1111','이씨','lee@jobtc.kr','010-1111-1111','11-222','부산');
INSERT INTO members VALUES('park','1111','박씨','park@jobtc.kr','010-1111-1111','11-333','대구');
commit;
```

# 7교시

- 폴더 생성 : css,js
  - JavaScript에서 javascript file 로 만들기

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginfo</title>
</head>
<body>
<div id='loginfo'>
	<%
		//session.setAttribute("mid","kim");
		session.removeAttribute("mid");
		if( session.getAttribute("mid") == null){
	%>
	<%-- 로그인 이전 화면 --%>
	<form name='frm_log' method='post' id='frm_log'>
		<label for='mid'>아이디</label><br/>
		<input type='text' id='mid' name='mid' size='14' value='kim' />
		<br/>		
		<label for='pwd'>암호</label><br/>
		<input type='password' id='pwd' name='pwd' size='14' value='1111' />
		<br/>
		<input type='button' id='btnlogin' value='로그인' />
	</form>

	<br/>
	<a href=''>아이디 | 암호 찾기</a>
	
	<% } else { %>
	
	<%-- 로그인 이후 화면 --%>
	<span>[<%=session.getAttribute("mid") %>] 님방가</span><br/>
	<input type='button' id='btnlogout' value='로그아웃' />
	
	<% } %>
	
</div>
</body>
</html>
```

```js
/**
 * login / logout을 위한 스크립트
 * 작성일 : 2020.12.11
 * 작성자 : 김남호^^
 */

var logInOut = function(){
	$('#btnLogin').on('click',function(){
		$('#frm_log').action = "./member/login.jsp";
		$('#frm_log').submit();
	});
	
	$('#btnLogout').on('click',function(){
		$('#frm_log').action = "./member/logout.jsp";
		$('#frm_log').submit();
	});
	
	// javascript version
	var btnLogin = document.getElementById('btnLogin');
	var btnLogout = document.getElementById('btnLogout');

	btnLogin.onclick = function(){
		var frm = document.frm_log;
		frm.action = './member/login.jsp';
		frm.submit();
	}
	
	btnLogout.onclick = function(){
		var frm = document.frm_log;
		frm.action = './member/logout.jsp';
		frm.submit();
	}
	
	
}
```

# 마지막 교시^^

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginfo</title>
<script src='./js/login.js'></script>
</head>
<body>
<div id='loginfo'>
	<%
		//session.setAttribute("mid","kim");
		session.removeAttribute("mid");
		if( session.getAttribute("mid") == null){
	%>
	<%-- 로그인 이전 화면 --%>
	<form name='frm_log' method='post' id='frm_log'>
		<label for='mid'>아이디</label><br/>
		<input type='text' id='mid' name='mid' size='14' value='kim' />
		<br/>		
		<label for='pwd'>암호</label><br/>
		<input type='password' id='pwd' name='pwd' size='14' value='1111' />
		<br/>
		<input type='button' id='btnlogin' value='로그인' />
	</form>

	<br/>
	<a href=''>아이디 | 암호 찾기</a>
	
	<% } else { %>
	
	<%-- 로그인 이후 화면 --%>
	<span>[<%=session.getAttribute("mid") %>] 님방가</span><br/>
	<input type='button' id='btnlogout' value='로그아웃' />
	
	<% } %>
	
</div>
<script>logInOut()</script>
</body>
</html>
```

```js
/**
 * login / logout을 위한 스크립트
 * 작성일 : 2020.12.11
 * 작성자 : 김남호^^
 */

var logInOut = function(){
	$('#btnLogin').on('click',function(){
		$('#frm_log').action = "./member/login.jsp";
		$('#frm_log').submit();
	});
	
	$('#btnLogout').on('click',function(){
		$('#frm_log').action = "./member/logout.jsp";
		$('#frm_log').submit();
	});

/*	
	// javascript version
	var btnLogin = document.getElementById('btnLogin');
	var btnLogout = document.getElementById('btnLogout');

	if(btnLogin != null){
		btnLogin.onclick = function(){
			var frm = document.frm_log;
			frm.action = './member/login.jsp';
			frm.submit();
		}
	}
	if(btnLogout != null){
		btnLogout.onclick = function(){
			location.href = './member/logout.jsp';
		}
	}
*/	
	
}
```

```jsp
<%page import="bean.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	// database에 존재 유무
	
	MemberDao dao = new MemberDao();
	boolean b = dao.log(mid,pwd);
	
	if(b){
	session.setAttribute("mid",mid);
	response.sendRedirect("../index.jsp");
	}else{
		//로그인 실패
	}
%>
```

```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDao() {
		conn = new Application().getConn();
	}
	
	public boolean login(String mid, String pwd) {
		boolean b = true;
		try {
			String sql = "select * from member where mid=? and pwd=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				b=true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
}
```