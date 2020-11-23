<%@page import="java.util.Optional"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>환경설정넘모어렵다</title>
</head>
<body>
	<form action="todo.jsp" method="post">
		<label for="whattodo">할 일: </label>
		<input type="text" id="whattodo" name="whattodo"/>
		<label for="myname">이름: </label>
		<input type="text" id="myname" name="myname"/>
		<input type="submit"/>
	</form>
</body>
</html>