<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' disabled /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' disabled /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80' disabled></textarea><br/>
		
		<label>첨부</label>
		<div id='attach_zone'>
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
		</div>
	
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='댓글' id='btnRepl' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
	</form>
</div>


<script>board()</script>
</body>
</html>