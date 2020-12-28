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
	<form name='frm_serialize' method='post' id='frm_serialize'>
		<label>아이디</label>
		<input type="text" name='mid' value='a001'/><br/>
		<label>이름</label>
		<input type="text" name='mName' value='jacob'/><br/>
		<label>연락처</label>
		<input type="text" name='phone' value='010-1234-5678'/><br/>
		
		
		<input type="submit" value='전송' />
	</form>
</div>
<script>
	//javascript style (callback 부분이 완전히 다른걸로 처리되어진다.)
	//$('#frm_serialize')[0].onclick = function(){}
	
	//jQuery style (배열에 대한 부분 언급없이 function이 매개변수화 되어서 처리되어진다.)
	$('#frm_serialize').submit(function(){
		let data = $(this).serialize();
		console.log(data);
		return false;  //submit 기능 중지.(한 번만 작동되도록 하는 것)
	});
	
	/*
	$('#frm_serialize').on('submit', function(){
		let data = $(this).serialize();
		console.log(data);
		return false;
	});*/



</script>
</body>
</html>