<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div id='member' class='insert'>
	<h2>회원가입</h2>
	<form name='frm_member' id='frm_member' method='post' action='insertR.mem'>
		<label>아이디</label>
		<input type='text' name='mid' value='a001'/>
		<br/>
		<label>암호</label>
		<input type='password' name='pwd' value='1111'/>
		<br/>
		<label>연락처</label>
		<input type='text' name='phone' value='010-1111-1111'/>
		
		<input type='submit' value='전송' id='btnInsertR' />
	</form>

</div>
</body>
</html>