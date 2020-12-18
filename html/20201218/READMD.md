# 1교시

어....어....복습햇다...어...그렇다...어...

# 2교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MENU</title>
</head>
<body>
<h3>JSP</h3>
<ol>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/implict.jsp'>내장객체</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/parameterValues.jsp'>PARAMETER</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/scope.jsp'>SCOPE</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/el_test.jsp'>EL_TEST</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/jstl_test.jsp'>JSTL_TEST</a></li>
	
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/servlet_test.jsp'>Servelt(GET|POST)</a></li>
	
</ol>
</body>
</html>
```

```java
package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/test.do")
public class FirstServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet()에 의해서 실행된 코드입니다.");
		
		//	test.do?mid=hong&phone=010-1111-1111	*/
		System.out.println(req.getParameter("mid"));
		System.out.println(req.getParameter("phone"));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost()에 의해서 실행된 코드입니다.");
		/* <form method='post' /> */
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("address"));
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
<title>servlet test</title>
</head>
<body>
<div id='servlet_test'>
	<h3>Servelt Test(GET|POST)</h3>
	<div>
		이클립스의 콘솔창을 확인하세요.
	</div>
	<ul>
		<li><a href='test.do?mid=hong&phone=010-1111-1111'>GET Test</a>
	</ul>
	<form name='frm' method='post' action='test.do'>
		<label>이름</label>
		<input type='text' name='name' value='김씨~' />
		<br/>
		<label>주소</label>
		<input type='text' name='address' value='서울 부근' />
		<br/>
		<input type='submit' value='POST 타입 전송' />
	</form>
	
</div>
</body>
</html>
```

# 3교시

- 회원관리(Servlet)
  - 1) member/
    - MemberServlet.java
    - MemberVo.java
    - MemberDao.java
    - fuleUpload.java
  - 2) WebContent/member
    - insert.jsp
    - update.jsp
    - delete.jsp
    - select.jsp
    - view.jsp
    - result.jsp(입력/수정/삭제결과 페이지)
  - 3) etc
    - js/member.js
    - css/member.css


# 점심후 4교시

- 회원관리
  - 요구분석 -> 스토리보드,DB설계 -> 와이어프레임(HTML,CSS) -> script(이벤트처리) -> back-end

# 5교시

```jps
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
					<li><a href = 'index.jsp?inc=./member/select.jsp'>회원관리</a></li>
					<li>게시판</li>
				</ul>
			</nav>
		</header>
<%
	//int a= 222222220;

%>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리조회(select)</title>
</head>
<body>
<div id="member">
	<h3>회원관리</h3>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr'/>
			<input type='button' value='검색' id='btnFind' />
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
		<div class='item'>
			<span class='no'>1</span>
			<span class='mid'>hong</span>
			<span class='name'>홍길동</span>
			<span class='email'>hong@jobt.kr</span>
			<span class='mdate'>2020-01-01</span>
		</div>
		<div class='item'>
			<span class='no'>2</span>
			<span class='mid'>Kim</span>
			<span class='name'>김부자</span>
			<span class='email'>Kim@jobt.kr</span>
			<span class='mdate'>2020-02-01</span>
		</div>
		<div class='item'>
			<span class='no'>3</span>
			<span class='mid'>lee</span>
			<span class='name'>이기자</span>
			<span class='email'>lee@jobt.kr</span>
			<span class='mdate'>2020-03-01</span>
		</div>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' />
		<input type='button' value='이전' id='btnPrev' />
		
		<input type='button' value='1' />
		<input type='button' value='2' />
		<input type='button' value='3' />
		<input type='button' value='4' />
		<input type='button' value='5' />
		
		<input type='button' value='다음' id='btnNext' />
		<input type='button' value='맨끝' id='btnLast' />
	
	</div>

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
<title>회원관리(insert)</title>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' /><br/>
		
		<label>성명</label>
		<input type='text' name='name'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' /><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' /><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='50' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='30' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='80' /><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/150x200' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='저장' id='btnSave' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>
```

# 6교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 결과(result)</title>
</head>
<body>
<div id='member'>
	<div class='result_msg'>
		작업이 처리 되었습니다.
	</div>

	<input type='button' value='목록으로' id='btnlist' />
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
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h3>회원관리</h3>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr'/>
			<input type='button' value='검색' id='btnFind' />
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
		<div class='item'>
			<span class='no'>1</span>
			<span class='mid'>hong</span>
			<span class='name'>홍길동</span>
			<span class='email'>hong@jobt.kr</span>
			<span class='mdate'>2020-01-01</span>
		</div>
		<div class='item'>
			<span class='no'>2</span>
			<span class='mid'>Kim</span>
			<span class='name'>김부자</span>
			<span class='email'>Kim@jobt.kr</span>
			<span class='mdate'>2020-02-01</span>
		</div>
		<div class='item'>
			<span class='no'>3</span>
			<span class='mid'>lee</span>
			<span class='name'>이기자</span>
			<span class='email'>lee@jobt.kr</span>
			<span class='mdate'>2020-03-01</span>
		</div>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' />
		<input type='button' value='이전' id='btnPrev' />
		
		<input type='button' value='1' />
		<input type='button' value='2' />
		<input type='button' value='3' />
		<input type='button' value='4' />
		<input type='button' value='5' />
		
		<input type='button' value='다음' id='btnNext' />
		<input type='button' value='맨끝' id='btnLast' />
	
	</div>

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
<title>회원관리(Update)</title>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' /><br/>
		
		<label>성명</label>
		<input type='text' name='name'/><br/>
			
		<label>이메일</label>
		<input type='email' name='email' size='50' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='30' /><br/>
		
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='80' /><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/150x200' />
		<hr/>
		
		<input type='hidden' name='pwd' /><br/>
		
	 	<div class='btns'>
	 		<input type='button' value='수정' id='btnUpdate' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
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
<title>회원관리(view)</title>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' /><br/>
		
		<label>성명</label>
		<input type='text' name='name'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='50' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='30' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='80' /><br/>
	
		<img src='http://placehold.it/150x200' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='수정' id='btnModify' />
	 		<input type='button' value='삭제' id='btnDelete' />
	 		<input type='button' value='목록으로' id='btnselect' />
	 		
	 	</div>
	</form>
	
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
<title>회원관리(insert)</title>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' /><br/>
		
		<label>성명</label>
		<input type='text' name='name'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' /><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' /><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='50' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='30' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='80' /><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/150x200' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='저장' id='btnSave' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>
```

```css
@charset "UTF-8";

#member{
	width:100%;
	padding-right:20px;
	box-sizing:border-box;
}

#member #frm_member input{
	border:1px solid #bbb;
	border-radius:10px;
}

#member #frm_member>div{
	display: inline-block;
	float:right;
}

#member .title{
	margin-top:6px;
	background-color:#555;
	padding:4px 0;
	color:#fff;
}
#member span{
	display:inline-block;
}
#member .no{width:70px;}
#member .mid{width:100px;}
#member .name{width:120px;}
#member .email{width:200px;}
#member .mdate{width:110px;}

#member .items>div{
	line-height:25px;
}
#member .items>div:hover{
	background-color:#bbb;
	cursor:pointer;
}

#member .items>div:last-child{
	border-bottom:2px solid #aaa;
	margin-bottom:10px;
}

#member .paging{
	text-align:center;
}
#member .paging>input{
	border:1px sloid #eee;
	border-radius:10px;
}
```

# 7교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required/><br/>
		
		<label>성명</label>
		<input type='text' name='name'size='12' required/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' required/>
		<input type='button' name='btnZipcode' value='우편번호검색' />
		<br/>
		<label>주소</label>
		<input type='text' name='address' size='60' required/><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/140x160' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='저장' id='btnSave' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
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
<title>회원관리(Update)</title>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12' required/><br/>
			
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' required/><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='44' required/><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/200x140' />
		<hr/>
		
		<input type='hidden' name='pwd' /><br/>
		
	 	<div class='btns'>
	 		<input type='button' value='수정' id='btnUpdate' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
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
<title>회원관리(view)</title>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' /><br/>
		
		<label>성명</label>
		<input type='text' name='name'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='50' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='30' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='80' /><br/>
	
		<img src='http://placehold.it/150x200' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='수정' id='btnModify' />
	 		<input type='button' value='삭제' id='btnDelete' />
	 		<input type='button' value='목록으로' id='btnselect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>
```

```css
@charset "UTF-8";

/*--------------공통부분----------------*/
#member .btns{
	text-align:center;
}
#member .btns>input{
	border:1px solid #ddc;
	border-radius:10px;
}


#member{
	width:100%;
	padding-right:20px;
	box-sizing:border-box;
}

#member #frm_member input{
	border:1px solid #bbb;
	border-radius:10px;
}

#member #frm_member>div{
	display: inline-block;
	float:right;
}

#member .title{
	margin-top:6px;
	background-color:#555;
	padding:4px 0;
	color:#fff;
}
#member span{
	display:inline-block;
}
#member .no{width:70px;}
#member .mid{width:100px;}
#member .name{width:120px;}
#member .email{width:200px;}
#member .mdate{width:110px;}

#member .items>div{
	line-height:25px;
}
#member .items>div:hover{
	background-color:#bbb;
	cursor:pointer;
}

#member .items>div:last-child{
	border-bottom:2px solid #aaa;
	margin-bottom:10px;
}

#member .paging{
	text-align:center;
}
#member .paging>input{
	border:1px sloid #eee;
	border-radius:10px;
}

#member .paging>input:hover{
	cursor:pointer;
}

/*------------insert-----------------*/
#member .insert{
	position:relative;
}
#member .insert>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .insert>img{
	position:absolute;
	top:5px;
	right:25px;
}


/*-----------update-------------------*/

#member .update>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .update img{
	margin-top : 10px;
}
```

# 라스트 8교시^^

혼란하다 혼란해..
재시험...시스템에 아주 문제가 잇다...

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reg_exp</title>
</head>
<body>
<script>
	function msg(reg, str){
		var temp = '<li><b>' + reg + <'/b> : ' + str + '---> ' + reg.test(str) + '</li>';
		return temp;
	}

	try{
		//테스트용 문자열
		var str1 = '123';
		var str2 = 'abc123';
		var str3 = 'abc';
		var str4 = '#$%#';
		var str5 = '가나다';
		var str6 = '가나다abc123';
		var str7 = 'Abc123';
		
		//숫자만
		reg = /^[0-9]+$/;
		document.write(msg(reg, str1));
		document.write(msg(reg, str2));
		document.write(msg(reg, str3));
		document.write(msg(reg, str4));
		document.write(msg(reg, str5));
		document.write(msg(reg, str6));
		document.write("<hr/>");
		
		//영문자
		reg = /^[a-zA-Z]+$/;
		document.write(msg(reg, str1));
		document.write(msg(reg, str2));
		document.write(msg(reg, str3));
		document.write(msg(reg, str4));
		document.write(msg(reg, str5));
		document.write(msg(reg, str6));
		document.write("<hr/>");
		
		//첫글자는 무조건 대문자이고 영숫자
		reg = /^[A-Z][a-zA-Z0-9]+$/;
		document.write(msg(reg, str1));
		document.write(msg(reg, str2));
		document.write(msg(reg, str3));
		document.write(msg(reg, str4));
		document.write(msg(reg, str5));
		document.write(msg(reg, str6));
		document.write(msg(reg, str7));
		document.write("<hr/>");
		
		//한글만 입력
		reg = /^[가-힣]$/;
		document.write(msg(reg, str1));
		document.write(msg(reg, str2));
		document.write(msg(reg, str3));
		document.write(msg(reg, str4));
		document.write(msg(reg, str5));
		document.write(msg(reg, str6));
		document.write(msg(reg, str7));
		document.write("<hr/>");
		
		//연락처()
		var str1 = '02-123';//(x)
		var str2 = '02-123-1234'; //(o)
		var str3 = '031-12-1111'; //(x)
		var str4 = '031-123-1234'; //(o)
		var str5 = '031-1234-123'; //(x)
		var str6 = '017-123-1234'; //(o)
		var str7 = '010-1234-234'; //(x)
		
		reg=/\d{2,3}-\d{3,4}-\d{4}]/
		
		document.write(msg(reg, str1));
		document.write(msg(reg, str2));
		document.write(msg(reg, str3));
		document.write(msg(reg, str4));
		document.write(msg(reg, str5));
		document.write(msg(reg, str6));
		document.write(msg(reg, str7));
		document.write("<hr/>");
		
	}catch(err){
		alert(err);
	}
	
</script>
</body>
</html>
```

난왜 출력이 안되는가 오탈자잇나봐야긋다..