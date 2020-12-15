# 1교시

- jsp:useBean , jsp:setProperty
- MVC Model2 방식 이해(pdf:26)
- MemberVo, MemberDao 제작
- jstl 라이브러리 설치 및 사용 예(pdf:134)
- 방명록
  - GuestBookVo,GuestBookDao 제작(4대쿼리:CRUD)

```jsp
<%@page import="java.io.PrintWriter" %>
<%@page import="bean.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dao" class="bean.MemberDao"/>
<jsp:useBean id="vo" class="bean.MemberVo"/>

<%-- vo객체가 가지고 있는 모든 setter를 사용하여 값을 대입 --%>    
<jsp:setProperty property="*" name="vo"/>


<%
	//vo.setMid(request.getParameter("mid"));	
	//vo.setPwd(request.getParameter("pwd"));

	//response.setContentType("text/html;charset=utf-8");
	//String mid = request.getParameter("mid");
	//String pwd = request.getParameter("pwd");
	
	
	
	
	
	// database에 존재 유무
	
	//session.setAttribute("mid",mid);
	//response.sendRedirect("../index.jsp");
	
	
	//MemberDao dao = new MemberDao();
	//boolean b = dao.login(mid, pwd);
	boolean b = dao.login(vo.getMid(), vo.getPwd());
	
	if(b){
	session.setAttribute("mid",vo.getMid());
	response.sendRedirect("../index.jsp");
	}else{
		//로그인 실패
		%>
		<script>
			alert('fail');
			location.href='../index.jsp';
		</script>
	
<% } %>
```

- 1 MODEL 1 방식의 웹 개발
  - 디자인코드인 HTML과 비즈니스 로직인 자바코드를 따로 구분하지 않고 하나의 JSP파일 내에 함께 기술하는 방식을 말한다. 모델 1 방식의 개발 형태를 보면 JSP/Servlet만으로 개발 된 경우, JSP + Java Bean을 이용한 경우, JSP + Custom Tag를 이용한 경우, 이 모든 것을 섞어 개발한 경우가있다. 과거에 많이 사용되었던 웹 개발 아키텍처이고 또한 현재에도 많은 개발자들이 사용하고 있으며 간단한 페이지를 구성할 때 어울리는 방식이다.
  - 하지만 JSP페이지가 너무 복잡해지는 경우고 있고 개발자와 디자이너 간의 의사소통이 어려운 점 등 때문에 프로젝트 규모가 커지는 경우에는 쓰이지 않으며, 모델 2 개발 방식을 많이 취하게 된다.
- 1.1 모델 1 방식의 장점
  - 개발 속도가 빠르다
  - 구조가 단순하여 익히기 쉽다
  - 개발자의 스킬이 낮아도 배우기 쉽고 빠르게 적용 가능하다
  - 중소형 프로젝트에 적합하다
- 1.2 모델 1 방식의 단점
  - 표현 코드(디자인)과 비즈니스 로직이 하나의 JSP페이지에 표현되므로 코드가 복잡해진다
  - 하나의 코드에 디자인코드와 로직코드가 혼재하게 되어 개발자와 디자이너의 분리 작업이 힘들어 진다
  - JSP파일이 복잡해짐으로 유지보수가 어려워진다
  - 비즈니스 로직의 재사용성이 떨어진다

# 2~3교시

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
					<li><a href = 'index.jsp?sub=./jsp/menu.jsp'>JSP</a></li>
					<li><a href = 'index.jsp?inc=./guestbook/select.jsp'>방명록</a></li>
					<li>게시판</li>
					<li>회원관리</li>
				</ul>
			</nav>
		</header>
```

sub라고하면 서브 메뉴로 표시되고
inc는 주바디창

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css' >
<script src='./js/guestbook.js'></script>
</head>
<body>
<div id='guestbook'>
	<h2>방명록</h2>
	
	<%-- 검색바 --%>
	
	<form name='frm_gb' id='frm_gb' method='post'>
		<input type='search' name='findStr' size='30' placeholder='작성자나 내용으로 검색'>
		<input type='button' value='검색' id='btnFind'/>
	</form>
	
	<%-- 방명록 list --%>
	<div id='list'>
		<div id='item'>
			<label>작성자</label>
			<output class='mid'></output>
			<label>작성일자</label>
			<output class='mdate'></output>
			<br/>
			<textarea rows="5" cols="80"></textarea>
			<br/>
			<div class='btns'>
				<input type='button' value='수정' id='btnUpdate' />
				<input type='button' value='삭제' id='bunDelete' />
 			</div>
	
	</div>


	
</div>
	
	
</div>	
</body>
</html>
```

# 점심후 4교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css' >
<script src='./js/guestbook.js'></script>
</head>
<body>
<div id='guestbook'>
	<h2>방명록</h2>
	
	<%-- 검색바 --%>
	<form name='frm_gb' id='frm_gb' method='post'>
		<input type='search' name='findStr' size='30' placeholder='작성자나 내용으로 검색'>
		<input type='button' value='검색' id='btnFind'/>
	</form>
	
	<%-- 방명록 list --%>
	<div id='list'>
	<% for(int i=0; i<10; i++){ %>
		<div id='item'>
			<label>작성자</label>
			<output class='mid'>김남호</output>
			<label>작성일자</label>
			<output class='mdate'>2020-12-15 13:50</output>
			<br/>
			<textarea rows="5" cols="80"></textarea>
			<br/>
			<div class='btns'>
				<input type='button' value='수정' id='btnUpdate' />
				<input type='button' value='삭제' id='bunDelete' />
 			</div>
	
	</div>
	<%} %>

	
</div>
	
	
</div>	
</body>
</html>
```

```css
@charset "UTF-8";
/* 방명록과 관련한 레이아웃 */

#guestbook{
	width:550px;
	margin:auto;
}

#guestbook>#frm_gb{
	margin-bottom:25px;
	text-align:right;
}

#guestbook>#list .mid{
	display:inline-block;
	width:270px;
	font-size:10pt;
	color:#555;
}

#guestbook>#list .mdate{
	display:inline-block;
	width:150px;
	font-size:10pt;
	color:#555;
}

#guestbook>#list textarea{
	width:560px;
}
#guestbook>#list .btns{
	text-align:right;
}

#guestbook>#list .btns>input[type=button]{
	font-size:9pt;
	color:#555;
	border-radius:15px;
	border:1px solid #aaa;
}
```

https://tomcat.apache.org/download-taglibs.cgi 가서
밑에 jar files 4개 다운받고 WEB-INF 안에 lib안에 복사 붙여넣기 합니다

# 5~6교시

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
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/ParameterValues.jsp'>Parameter</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/scope.jsp'>Scope</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/el_test.jsp'>EL</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/jstl_test.jsp'>JST_TEST</a></li>
</ol>
</body> 
</html>
```

```css
@charset "UTF-8";
/* 방명록과 관련한 레이아웃 */

#guestbook{
	width:550px;
	margin:auto;
}

#guestbook>#frm_gb{
	margin-bottom:25px;
	text-align:right;
}

#guestbook>#list .mid{
	display:inline-block;
	width:270px;
	font-size:10pt;
	color:#555;
}

#guestbook>#list .mdate{
	display:inline-block;
	width:150px;
	font-size:10pt;
	color:#555;
}

#guestbook>#list textarea{
	width:560px;
}
#guestbook>#list .btns{
	text-align:right;
}

#guestbook>#list .btns>input[type=button]{
	font-size:9pt;
	color:#555;
	border-radius:15px;
	border:1px solid #aaa;
}
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css' >
<script src='./js/guestbook.js'></script>
</head>
<body>
<div id='guestbook'>
	<h2>방명록</h2>
	
	<%-- 검색바 --%>
	<form name='frm_gb' id='frm_gb' method='post'>
		<input type='search' name='findStr' size='30' placeholder='작성자나 내용으로 검색'>
		<input type='button' value='검색' id='btnFind'/>
	</form>
	
	<%-- 방명록 list --%>
	<div id='list'>
	<% for(int i=0; i<10; i++){ %>
		<div id='item'>
			<label>작성자</label>
			<output class='mid'>김남호</output>
			<label>작성일자</label>
			<output class='mdate'>2020-12-15 13:50</output>
			<br/>
			<textarea rows="5" cols="80"></textarea>
			<br/>
			<div class='btns'>
				<input type='button' value='수정' id='btnUpdate' />
				<input type='button' value='삭제' id='bunDelete' />
 			</div>
	
	</div>
	<%} %>

	
</div>
	
	
</div>	
</body>
</html>
```

```jsp
<%@page import="bean.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test</title>
</head>
<body>
<div id='jstl_ctrl'>
	<h2>jstl(Java Standard Tag Library)의 제어문</h2>
	<%
		String name="hong gil dong";
		int score = 80;
		
		pageContext.setAttribute("page_name", name);
		pageContext.setAttribute("page_score", score);
		
		request.setAttribute("req_name",name);
		request.setAttribute("req_score", score);
	%>
	
	<h3>c:out ==>jstl을 사용한 출력문</h3>
	<li>Name : <c:out value='${pageScope.page_name }' default='이름을 입력하세요' /></li>
	<li>Score : <c:out value='${pageScope.page_score} ' default='빵점' /></li>
	<li>Name(req) : <c:out value='${requestScope.req_name }' /></li>
	<li>Score(req) : <c:out value='${requestScope.req_score }' /></li>
	<li>Name : <c:out value='${page_name }' /></li>
	<li>Score : <c:out value='${page_score }' /></li>

	<h3>c:set | c:remove | c:out</h3>
	
	<c:set var='score' value='100' />
	<li>Score1 : <c:out value='${score }' /></li>
	<c:remove var='score' />
	<li>Score2 : <c:out value='${score }' default='변수가 삭제됨.'/></li> 

	<h3>c:if</h3>
	<c:if test='${req_score>=90 }'>
		<li>
			<font color='red'>장학생</font>
		</li>
	</c:if>
	
	<fieldset>
		<h3>c:if 사용하여 해결</h3>
		<div>
			kor, eng변수에 임의 값을 대입하여 request영역에 저장한 후 두수의 합이 180이상이면 '우등생'을 출력하시오.
		</div>	
		<hr/>
		<c:set var='kor' value='100' />
		<c:set var='eng' value='90' />
		<c:if test='${(kor+eng)>=180 }'>
			<font color='blue'>우등생</font>
		</c:if>
	</fieldset>
	
	<h3>c:choose | c:when | c:otherwise </h3>
	<xmp>
		[c:choose]
			[c:when test='조건식']T[/c:when]
			[c:when test='조건식']T[/c:when]
			...
			[c:otherwise]
				맞는 조건식이 없을 경우 처리
			[/c:otherwise]
		[/c:choose]
	</xmp>
	<fieldset>
		<div>
			구매수량, 단가를 임의의 변수에 저장하여scope담고, 구매금액(구매수량*단가)에 따라 사은품이 지급되도록
			choose문을 기술하시오.<br/>
			- 1000원 이상 : 화장지<br/>
			- 10000원 이상 : 자전거<br/>
			- 100000원 이상 : 아파트<br/>
		</div>
		<hr/>
		<h5>방법1(JSP)</h5>
		<%
			int ea = 1;	//구매수량
			int price = 500;	//단가
			int amt = ea*price;
			
			request.setAttribute("amt", amt);
		%>
		<c:choose>
			<c:when test='${amt>=100000 }'>
				축하합니다 아파트 당첨입니다.
			</c:when>
			<c:when test='${amt>=10000 }'>
				자전거 받아가세용.
			</c:when>
			
			<c:when test='${amt>=1000 }'>
				화장지 한가득^^
			</c:when>
			
			<c:otherwise>
				다음기회에는 1000원 이상 구매 하세용
			</c:otherwise>
			
		</c:choose>
		
		<h5>방법2</h5>
		<c:set var='ea' value='100' />
		<c:set var='price' value='500' />
		<c:set var='amt' value='${ea*price }'/>	
		<c:choose>
			<c:when test='${amt>=100000 }'>
				축하합니다 아파트 당첨입니다.2
			</c:when>
			<c:when test='${amt>=10000 }'>
				자전거 받아가세용.2
			</c:when>
			
			<c:when test='${amt>=1000 }'>
				화장지 한가득^^2
			</c:when>
			
			<c:otherwise>
				다음기회에는 1000원 이상 구매 하세용2
			</c:otherwise>
		</c:choose>	
	</fieldset>
	
	<h3>c:forTokens</h3>
	<xmp>
	[c:forTokens var='변수명' items='토큰문자열' delims='구분자']
	
	[/c:forTokens]
	</xmp>
	<c:forTokens var='item' items="개나리,진달래,코스모스,장미,국화,수국화,연꽃,무궁화,해바라기,동백꽃" delims=",">
		<li><c:out value='${item }'/></li>
	</c:forTokens>
	
	<h3>c:forEach</h3>
	<xmp>
		[c:forEach var='변수명' items='배열 | Collection' begin='시작값' end='끝값' step='증가값' varStatus='상태값']
			...
		[/c:forEach]
	</xmp>
	
	<fieldset>
		<legend>
			forEach를 사용하여 1~100까지의 홀수를 출력하시오.
		</legend>
		<c:forEach var='i' begin='1' end='100' step='2'>
			<c:out value='${i }'/>( ${i } )
		</c:forEach>
	</fieldset>
	
	<fieldset>
		<legend>
			List[MemberVo] 타입의 데이터를 scope에 저장하고 forEach문을 사용하여 화면에 출력하시오.
		</legend>
	</fieldset>
	<%
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo v1 = new MemberVo();
		v1.setMid("Park");
		v1.setPhone("010-6351-3491");
		list.add(v1);
		
		v1 = new MemberVo();
		v1.setMid("Kim");
		v1.setPhone("010-1111-2222");
		list.add(v1);
		
		v1 = new MemberVo();
		v1.setMid("Hong");
		v1.setPhone("010-4444-4444");
		list.add(v1);
		
		request.setAttribute("list", list);
	
	%>
	
	
	
	
	
	
</div>
</body>
</html>
```

# 7교시 

```java
package gb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestBookDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet re;
	
	public GuestBookDao() {
		
	}
	
	public List<GuestBookVo> select(String findStr){
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
	
		try {
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
	
	/*
	update(){
		
	}
	
	insert(){
		
	}
	
	delete(){
		
	}
	
	
	
*/	
}
```

```java
package gb;

public class GuestBookVo {
	int serial;
	String mid;
	String pwd;
	String mdate;
	String doc;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
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
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
}
```

```jsp
<%@page import="bean.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test</title>
</head>
<body>
<div id='jstl_ctrl'>
	<h2>jstl(Java Standard Tag Library)의 제어문</h2>
	<%
		String name="hong gil dong";
		int score = 80;
		
		pageContext.setAttribute("page_name", name);
		pageContext.setAttribute("page_score", score);
		
		request.setAttribute("req_name",name);
		request.setAttribute("req_score", score);
	%>
	
	<h3>c:out ==>jstl을 사용한 출력문</h3>
	<li>Name : <c:out value='${pageScope.page_name }' default='이름을 입력하세요' /></li>
	<li>Score : <c:out value='${pageScope.page_score} ' default='빵점' /></li>
	<li>Name(req) : <c:out value='${requestScope.req_name }' /></li>
	<li>Score(req) : <c:out value='${requestScope.req_score }' /></li>
	<li>Name : <c:out value='${page_name }' /></li>
	<li>Score : <c:out value='${page_score }' /></li>

	<h3>c:set | c:remove | c:out</h3>
	
	<c:set var='score' value='100' />
	<li>Score1 : <c:out value='${score }' /></li>
	<c:remove var='score' />
	<li>Score2 : <c:out value='${score }' default='변수가 삭제됨.'/></li> 

	<h3>c:if</h3>
	<c:if test='${req_score>=90 }'>
		<li>
			<font color='red'>장학생</font>
		</li>
	</c:if>
	
	<fieldset>
		<h3>c:if 사용하여 해결</h3>
		<div>
			kor, eng변수에 임의 값을 대입하여 request영역에 저장한 후 두수의 합이 180이상이면 '우등생'을 출력하시오.
		</div>	
		<hr/>
		<c:set var='kor' value='100' />
		<c:set var='eng' value='90' />
		<c:if test='${(kor+eng)>=180 }'>
			<font color='blue'>우등생</font>
		</c:if>
	</fieldset>
	
	<h3>c:choose | c:when | c:otherwise </h3>
	<xmp>
		[c:choose]
			[c:when test='조건식']T[/c:when]
			[c:when test='조건식']T[/c:when]
			...
			[c:otherwise]
				맞는 조건식이 없을 경우 처리
			[/c:otherwise]
		[/c:choose]
	</xmp>
	<fieldset>
		<div>
			구매수량, 단가를 임의의 변수에 저장하여scope담고, 구매금액(구매수량*단가)에 따라 사은품이 지급되도록
			choose문을 기술하시오.<br/>
			- 1000원 이상 : 화장지<br/>
			- 10000원 이상 : 자전거<br/>
			- 100000원 이상 : 아파트<br/>
		</div>
		<hr/>
		<h5>방법1(JSP)</h5>
		<%
			int ea = 1;	//구매수량
			int price = 500;	//단가
			int amt = ea*price;
			
			request.setAttribute("amt", amt);
		%>
		<c:choose>
			<c:when test='${amt>=100000 }'>
				축하합니다 아파트 당첨입니다.
			</c:when>
			<c:when test='${amt>=10000 }'>
				자전거 받아가세용.
			</c:when>
			
			<c:when test='${amt>=1000 }'>
				화장지 한가득^^
			</c:when>
			
			<c:otherwise>
				다음기회에는 1000원 이상 구매 하세용
			</c:otherwise>
			
		</c:choose>
		
		<h5>방법2</h5>
		<c:set var='ea' value='100' />
		<c:set var='price' value='500' />
		<c:set var='amt' value='${ea*price }'/>	
		<c:choose>
			<c:when test='${amt>=100000 }'>
				축하합니다 아파트 당첨입니다.2
			</c:when>
			<c:when test='${amt>=10000 }'>
				자전거 받아가세용.2
			</c:when>
			
			<c:when test='${amt>=1000 }'>
				화장지 한가득^^2
			</c:when>
			
			<c:otherwise>
				다음기회에는 1000원 이상 구매 하세용2
			</c:otherwise>
		</c:choose>	
	</fieldset>
	
	<h3>c:forTokens</h3>
	<xmp>
	[c:forTokens var='변수명' items='토큰문자열' delims='구분자']
	
	[/c:forTokens]
	</xmp>
	<c:forTokens var='item' items="개나리,진달래,코스모스,장미,국화,수국화,연꽃,무궁화,해바라기,동백꽃" delims=",">
		<li><c:out value='${item }'/></li>
	</c:forTokens>
	
	<h3>c:forEach</h3>
	<xmp>
		[c:forEach var='변수명' items='배열 | Collection' begin='시작값' end='끝값' step='증가값' varStatus='상태값']
			...
		[/c:forEach]
	</xmp>
	
	<fieldset>
		<legend>
			forEach를 사용하여 1~100까지의 홀수를 출력하시오.
		</legend>
		<c:forEach var='i' begin='1' end='100' step='2'>
			<c:out value='${i }'/>( ${i } )
		</c:forEach>
	</fieldset>
	
	<fieldset>
		<legend>
			List[MemberVo] 타입의 데이터를 scope에 저장하고 forEach문을 사용하여 화면에 출력하시오.
		</legend>
	<%
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo v1 = new MemberVo();
		v1.setMid("Park");
		v1.setPhone("010-6351-3491");
		list.add(v1);
		
		v1 = new MemberVo();
		v1.setMid("Kim");
		v1.setPhone("010-1111-2222");
		list.add(v1);
		
		v1 = new MemberVo();
		v1.setMid("Hong");
		v1.setPhone("010-4444-4444");
		list.add(v1);
		
		request.setAttribute("list", list);
	
	%>
	<c:forEach var='vo' items='${list }'>
		<li>${vo.mid } : ${vo.phone }</li>
	</c:forEach>
	
	</fieldset>
	
	
	
	
	
	
	
	
</div>
</body>
</html>
```

# 8교시 마지막이요!

```jsp
<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css' >
<script src='./js/guestbook.js'></script>
</head>
<body>
<jsp:useBean id="dao" class="gb.GuestBookDao"/>

<div id='guestbook'>
	<h2>방명록</h2>

	<%-- 검색바 --%>
	<form name='frm_gb' id='frm_gb' method='post'>
		<input type='search' name='findStr' value='${param.findStr }'
				size='30' placeholder='작성자나 내용으로 검색'>
		<input type='submit' value='검색' id='btnFind' />
	</form>
	<%
		String findStr = "";
		if(request.getParameter("findStr") != null){
			findStr = request.getParameter("findStr");	
		}
			
		List<GuestBookVo> list = dao.select(findStr);
		request.setAttribute("list", list);
	%>
	<%-- 방명록 list --%>
	<div id='list'>
		<c:forEach var='vo' items='${list }'>
			<div id='item'>
				<label>작성자</label>
				<output class='mid'>${vo.mid }</output>
				<label>작성일자</label>
				<output class='mdate'>${vo.mdate }</output>
				<br/>
				<textarea rows="5" cols="80" disabled>${vo.doc }</textarea>
				<br/>
				<div class='btns'>
					<input type='button' value='수정' id='btnUpdate' />
					<input type='button' value='삭제' id='btnDelete' />
				</div>
			</div>	
		</c:forEach>
	</div>	
</div>
</body>
</html>
```

