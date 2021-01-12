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
		session.setAttribute("mid","manager");	//매니저 아이디로 로그인 했다 인정
		//session.removeAttribute("mid");	//매니저 아이디로 로그인 안햇다 인정
		
	%>
	<div id='filter_main'>
		<h3>Filter를 사용한 관리자 로그인 체크</h3>
		<a href='member_select.jsp'>회원조회</a>
		<a href='sale_select.jsp'>판매조회</a>
	
	</div>
	
	
</body>
</html>