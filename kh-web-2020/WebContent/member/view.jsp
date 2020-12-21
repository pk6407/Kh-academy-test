<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='view'>
		<label>아이디</label>
		<input type='text' name='mid' disabled size='10'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' disabled size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60' /> <br/>
		
		<label></label>
		<img src='http://placehold.it/200x140' />
		<hr/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
	</form>

</div>
<script>member()</script>
</body>
</html>