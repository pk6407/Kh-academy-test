<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='css/board.css'>
</head>
<body>
<div id='board'>
	<h2>일반 공지 게시판</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<input type='button' value='공지추가' id='btnInsert' />
		<input type='text' name='findStr'/>
		<input type='button' value='검색' id='btnFind' />
	</form>
	<hr/>
	
	<c:forEach var='vo' items='${list }'>
		<div class='item'>
			<span>${vo.subject }</span>
		</div>
	</c:forEach>

</div>
</body>
</html>​