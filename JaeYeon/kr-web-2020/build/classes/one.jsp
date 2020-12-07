<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>one</title>
<style>
#one>#result{
	border:1px solid #44f;
	width:300px;height:120px;
	text-align: center;
	line-height: 120px;
}
#one>#btnSend{
	width:70px;
	height:30px;
}
.btn_none{display:none;}
</style>
</head>
<body>
<div id='one'>
	<div id='result'>송금 버튼을 클릭하시면 송금됩니다.</div>
	<input type='button' value='송금' id='btnSend' />
	<div>하단내용 입니다..</div>
</div>
<script>
	let cnt=0;	//전송 횟수
	$('#btnSend').click(function(){
		if(cnt==1) return false;
		cnt++;
		$('#result').html(cnt + " 회 송금됨.");
		$(this).attr('class', 'btn_none');
	})
	
	/*
	$('#btnSend').click(function(){
		cnt++;
		$('#result').html(cnt + "회 송금됨.");
		$(this).attr('disabled', 'disabled');
	})
	
	$('#btnSend').one('click', function(){
		cnt++;
		$('#result').html(cnt + " 회 송금됨.");
	})
	*/
	
</script>
</body>
</html>