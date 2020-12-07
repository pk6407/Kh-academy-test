<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bigin</title>
<style>
#result {
	width: 400px;
	height: 250px;
	background-color: #eee;
}
</style>
</head>
<body>
	<div id='begin'>
		<fieldset>
			<legend>Ajax 의특징</legend>
			<ul>
				<li>별도의 외부 플러그인이나 라이브러리, API , Activex 와같은 API</li>
				<li>브라우저 내부에있는 자바스크립트 만으로 처리가 가능하다.</li>
				<li>비동기방식으로 서버와 통신하며, 브라우저에 새로고침없이 특정 영역의 내용을 동적으로 변경할 수 있다.</li>
				<li>프로그램 방식을 web 방식에서 App 방식으로 처리할 수 있다 .</li>
				<li>Ajax (Asynchronus javaScript XML)의약자</li>
				<li>Ajax 의 가장 중추적인 역활을 하는 객체는 XMLHttpRequest 이다</li>
			</ul>
		</fieldset>

		<h3>홀짝수 체크</h3>
		<p>간단테스트 (서버의 결과를 표시해 주기 위해 전체 화면의 새로고침 되느냐 아니면 필요한 부분만 새로고침 되느냐)</p>
		<% 
  
   
   		%>
		<form name='frm' method='post'>
			<label>정수를 입력하세요</label> <input type='text' size='6' name='su' value='${param.su}'/>
			<input type='submit' value='check' />
		</form>
		<div id='result'>
			
		</div>
</div>
<script>
	// ajax를 통해 서버의 처리 결과를 result에 표시
	
	var frm = document.frm;
	frm.onsubmit = function(){
		var param = "?su=" + frm.su.value;
		var req = new XMLHttpRequest();
		req.open('get', './ajax/odd_even_check.jsp' + param);//요청 정보를 생성
		req.onreadystatechange=function(){
			//req.status==200 => 정상요청됨, req.readyState==4 => 정상응답.
			if(req.status==200 && req.readyState==4){
				var r = document.getElementById('result');
				r.innerHTML = req.responseText;
				
				//$('#result').html(req.responseText);
			}
		}
		req.send();//요청 정보를 서버에 전송
		
		return false;//submit 고유의 기능을 취소
	}
	
</script>
</body>
</html>