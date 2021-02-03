<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
</head>
<body>
<div id='member'>
	<h2>회원조회</h2>
	
	<form name='frm' method='post' action='select'>
		<input type='text' name='findStr' value='${param.findStr }'>
		<input type='submit'>
	</form>
	
	<div class='item,title'>
		<span>NO</span>
		<span>아이디</span>
		<span>성명</span>
		<span>연락처</span>
		<span>이메일</span>
	</div>
	
	<div id='result'>
		<c:forEach items="${list}" var="vo" varStatus="i">
			<div class='item'>
				<span>${i.index + 1 }</span>
				<span>${vo.mid }</span>
				<span>${vo.name }</span>
				<span>${vo.phone }</span>
				<span>${vo.email }</span>
			</div>
		</c:forEach>
		
	</div>
	
</div>
</body>
</html>