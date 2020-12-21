<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h3>회원관리</h3>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr' value='${param.findStr }'>
			<input type='button' value='검색' id='btnFind'/>
			<input type='text' name='nowPage' value='${param.nowPage }'/>
			<input type='text' name='mid' />
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
		<c:forEach var='vo' begin='1' end='10'>
			<div class='item' onclick="view('${vo}')">
				<span class='no'>${vo }</span>
				<span class='mid'>hong</span>
				<span class='name'>홍길동</span>
				<span class='email'>hong@jobt.kr</span>
				<span class='mdate'>2020-01-01</span>
			</div>
		</c:forEach>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' onclick='goPage(1)'/>
		<input type='button' value='이전' id='btnPrev' onclick='goPage()'/>
	
		<c:forEach var="i" begin='1' end='5'>	
			<input type='button' value='${i }' 
				"${(param.nowPage==i)? 'disabled' : '' }"  
				onclick='goPage(${i})' />
		</c:forEach>
		
		<input type='button' value='다음' id='btnNext' onclick='goPage()'/>
		<input type='button' value='맨끝' id='btnLast' onclick='goPage()'/>
	
	</div>
	
</div>
<script>member()</script>	
</body>
</html>
