<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sale select</title>
</head>
<body>
	<div id='sale_select'>
	<h3>판매 실적 조회</h3>
	<form name='frm' method='post' action='/kh-web-20201130/sale.park'>
		<input type='submit' value='조회' />
		<a href='/kh-web-20201130/filter/filter_main.jsp'>HOME</a>
	</form>
	<hr/>
	${msg }
	
	</div>
</body>
</html>