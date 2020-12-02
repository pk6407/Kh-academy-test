<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serialize</title>
</head>
<body>
<div id='serialize'>
	<form name='frm_seriㅁlize' method='post' id='frm_seriㅁlize'>
		<label>아이디</label>
		<input type='text' name='mid' value='pk6407'><br/>
		<lable>이름</lable>
		<input type='text' name='mName' value='김남호' /><br/>
		<label>연락처</label>
		<input type='text' name='phone' value='010-5030-3181'><br/>
		
		<input type='submit' value="전송">
	</form>
</div>
<script>
	//$('frm_serialize')[0].onsubmit = function(){ } //js
	$('frm_serialize').submit(function(){
		let data = $(this).serialize();
		console.log(data);
		return false;	//submit 기능 중지
	})	//jq
	
</script>




</body>
</html>