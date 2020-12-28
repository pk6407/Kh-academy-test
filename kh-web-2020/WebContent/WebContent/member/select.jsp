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
		<c:set var='no' value='${page.startNo }'/>
		<c:forEach var='vo' items="${list }">
			<div class='item' onclick="view('${vo.mid}')">
				<span class='no'>${no }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='name'>${vo.name }</span>
				<span class='email'>${vo.email }</span>
				<span class='mdate'>${vo.mdate }</span>
			</div>
			<c:set var='no' value = '${no=no+1 }'/>
		</c:forEach>
	</div>
	
	<div class='paging'>
		<c:if test="${page.startPage>1 }">
			<input type='button' value='맨첨' id='btnFirst' onclick='goPage(1)'/>
			<input type='button' value='이전' id='btnPrev' onclick='goPage(${page.startPage-1})'/>
		</c:if>
		
		<c:forEach var="i" begin='${page.startPage }' end='${page.endPage }'>	
			<input type='button' value='${i }' 
				${(param.nowPage==i)? 'disabled' : '' }  
				onclick='goPage(${i})' />
		</c:forEach>
	
		<c:if test="${page.endPage<page.totPage }">
			<input type='button' value='다음' id='btnNext' onclick='goPage(${page.endPage+1})'/>
			<input type='button' value='맨끝' id='btnLast' onclick='goPage(${page.totPage})'/>
		</c:if>	
	</div>
	
</div>
<script>member()</script>	
</body>
</html>
