<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter Test</title>
</head>
<body>
<div id='filter_test'>
	<h3>Filter Test</h3>
	<form name='frm' method='post' action='/kh-web-20201130/filter.do'>
		<label>답글 내용</label><br/>
		<textarea rows="5" cols="50" name='doc'>${doc }</textarea>
		<p/>
		<input type='submit' value='저장'/>
	</form>
	<hr/>
	<h3>저장 내용 출력</h3>
	${doc }
</div>
</body>
</html>