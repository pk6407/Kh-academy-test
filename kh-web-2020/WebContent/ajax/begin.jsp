<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>begin</title>
<head>
<style>
#result {
	width:400px;
	height:250px;
	background-color : #eee;
}
</style>
</head>
<body>
<div id ='begin'>
	<fieldset>
		<legend>Ajax의 특징</legend>
		<ul>
			<li>별도의 외부 플러그인이나 라이브러리, ActiveX와 같은 API 프로그램들이 필요 없다.</li>
			<li>브라우저 내부에 있는 자바스크립트 만으로도 처리 가능하다.</li>
			<li>비동기방식으로 서버와 통신하며, 브라우저의 새로고침 없이 특정 영역의 내용을 동적으로 변경할 수 있다.</li>
			<li>프로그램 방식을 Web방식에서 App방식으로 처리할 수 있다.</li>
			<li>AJAX(Asynchronous JavaScript XML)의 약자</li>
			<li>Ajax의 가장 중추적인 역할을 하는 객체는 XMLHttpRequest 이다.</li>
			<li>ajax를 통해 전체 페이지가 새로고침되는 현상을 피할 수 있다. 전체 페이지가 새로고침되지 않도록 하는 것이 ajax를 사용하는 목적이다.</li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>AJAX를 통해 전체 페이지가 새로고침되게 하지 않으려면</legend>
		<ul>
			<li>1) 서버에서 처리할 내용을 UI에서 분리를 할 필요가 있다.</li>
			<li>2) 서버는 처리된 내용을 화면에 출력하는 로직을 추가한다.</li>
			<li>3) UI단에서는 XMLHttpRequest 객체를 사용하여 서버의 처리 결과를 가져온다.</li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>AJAX Example1 > EmpVo.java, EmpDao.java</legend>
		<ul>
			<li>emp_search_form.jsp / emp_search.jsp  / EmpDao.java / EmpVo.java</li>
			<li>검색어를 입력하여 first_name or email or phone_number에 포함되어 있으면</li>
			<li>employee_id, first_name, email, phone_number를 화면에 표시하시오.</li>
		</ul>
	</fieldset>	
	
	
	<h3>홀짝수 체크</h3>
	<p>간단 테스트(서버의 결과를 표시해 주기 위해 전체 화면이 새로고침 되느냐 아니면 필요한 부분만 새로고침되느냐)</p>
	<% 	
		// odd_even_check로 전부 이동(AJAX 실습을 위해서.)	
	/* 	// 서버단 java 언어 코드 입력
		String temp = request.getParameter("su");
		String msg = ""; // 결과메시지
		int su = 0;
		if(temp !=null && !temp.equals("")){
			su = Integer.parseInt(temp); 
			// "5" -> 5 Wrapper Class "5" 정수형을을 5 정수값으로 변환
			if(su%2==0){
				msg = su + "는 짝수입니다.";
			} else {
				msg = su + "는 홀수입니다.";
			}
		} */
	
	%>
	<form name='frm' method='post'>
		<label>정수를 입력하세요</label>
		<!-- <input type='text' size='6' name='su'/> -->
		<input type='text' size='6' name='su' value='${param.su}'/>
		<input type='submit' value='Check' />
	</form>
	<div id = 'result'>
		<!-- 이 코드도 odd_even_check로 서버단 코드가 넘어갔기 때문에 이제 필요없어짐. -->
		<%-- <%=msg %> --%>
	</div>
</div>
<script>
	// ajax를 통해 서버의 처리 결과를 result에 표시
	
	var frm = document.frm;
	frm.onsubmit = function(){
	var param = "?su=" + frm.su.value;
		
	var req = new XMLHttpRequest();
	req.open('get', './ajax/odd_even_check.jsp' + param); // 요청정보를 생성
	req.onreadystatechange = function(){
		//req.status==200 => 정상요청됨, req.readyState==4 => 정상응답.
		if(req.status==200 && req.readyState==4){	// 요청, 응답이 모두 정상일 때를 확인하기 위해.
			
			//javascript로 했을 시 코드 <결과 수신
			var r = document.getElementById('result');
			r.innerHTML = req.responseText;
			
			// $('#result').html(req.responseText); jQuery로 하면 위의 두 코드 필요없어짐.
			}
		}
		req.send(); // 요청 정보를 서버에 전송	
	
		return false; //submit 고유의 기능을 취소
	}
</script>
</body>
</html>



