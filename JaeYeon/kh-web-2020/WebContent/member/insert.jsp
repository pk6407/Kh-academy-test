<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required/><br/>
		
		<label>성명</label>
		<input type='text' name='name'size='12' required/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' required/>
		<input type='button' name='btnZipcode' value='우편번호검색' />
		<br/>
		<label>주소</label>
		<input type='text' name='address' size='60' required/><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/140x160' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='저장' id='btnSave' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>