<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginfo</title>
<script src = './js/login.js'></script>
</head>
<body>
<div id = 'loginfo'>
	<%
		// session.setAttribute("mid", "Hong");
		// session.removeAttribute("mid");
		if( session.getAttribute("mid") == null){
	%>
	<!--로그인 이전 화면  -->
	<!-- mid 정규식 설정 표현 pattern='^[A-Z][A-Za-z0-9]{8,20}$' -->
	<form name='frm_log' method='post' id='frm_log'>
		<label for='mid'>아이디</label>
		<input type="text" id='mid' name='mid' value='kim' size='12' /><br />
		<label for="pwd">암호</label>
		<input type="password" id='pwd' name='pwd' value='1111'size='12' /><br />
		<br />
		<input type="button" id='btnLogin' value='로그인' /><br />
	</form>
	<a href="">아이디 | 암호 찾기</a>
	
	<% } else { %>
	
	<%--로그인 이후 화면 --%>
	<span>[<%=session.getAttribute("mid") %>]님 방가</span>
	<input type="button" id='btnLogout' value='로그아웃'/>
	
	 <% } %>
</div>
<script>logInOut()</script>
</body>
</html>