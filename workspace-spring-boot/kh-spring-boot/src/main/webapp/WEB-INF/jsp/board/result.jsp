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
	<div id='msg'>
		${msg }
	</div>
	<form name='frm_board' id='frm_board' method='post' class='frm_msg'>
		<input type='button' value='목록' id='btnSelect' />
		<input type='hidden' name='findStr' value='${page.findStr }' />
		<input type='hidden' name='nowPage' value='${page.nowPage }' />
	</form>
</div>

<script>brd()</script>
</body>
</html>