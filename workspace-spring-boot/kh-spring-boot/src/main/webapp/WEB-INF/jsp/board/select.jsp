<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='css/board.css'>

<script src='js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판1</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<input type='button' id='btnInsert' value='입력'>
		<input type='hidden' name='nowPage' value='${(empty page.nowPage)? 1 : page.nowPage }' />
		<input type='hidden' name='serial'  value='0'/>
		<div class='find'>
			<input type='text' name='findStr' id='findStr' value='${page.findStr }'>
			<input type='button' name='btnFind' id='btnFind' value='조회'/>
		</div>
	</form>

	<div class='title'>
		<span class='no'>NO</span>
		<span class='subject'>제목</span>
		<span class='mid'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<div class='items'>
		<c:forEach var='vo' items='${list }'>
			<div class='item' onclick="brd.view(${vo.serial})">
				<span class='no'>${vo.serial}</span>
				<span class='subject'>${vo.subject }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='mdate'>${vo.mdate }</span>
				<span class='hit'>${vo.hit }</span>
			</div>					
		</c:forEach>
	</div>	
	
	<div class='btns'>
		<input type='button' value='맨점' onclick='brd.goPage(1)'>
		<input type='button' value='이전' onclick='brd.goPage(${page.startPage-1})'>
		
		<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
				<input type='button' value='${i }' onclick='brd.goPage(${i})'>
		</c:forEach>

		<input type='button' value='다음' onclick = 'brd.goPage(${page.endPage+1})'>
		<input type='button' value='맨끝' onclick = 'brd.goPage(${page.totPage})'>
	</div>
</div>

<script>brd()</script>
</body>
</html>​