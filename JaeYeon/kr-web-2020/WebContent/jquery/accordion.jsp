<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accordion</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
</head>
<body>
<div id='accordion'>
		<h2>html5</h2>
		<div>
			<ul>
				<li>웹표준의 시작</li>
				<li>현재 5버전이지만 대중화된 버전은4.x대 버전</li>
				<li>canvas나 localStorage등과 같은 기술이 있지만 국내에서는 아직은...</li>
			</ul>
		</div>
		
		<h2>css3</h2>
		<div>
			<img src='./images/bg.png' width='200px' height='120px' />
		</div>
		<h2>javascript</h2>
		<h2>java</h2>
		<h2>jdbc</h2>
		<h2>jquery</h2>
		<h2>ajax</h2>
		<h2>mybatis</h2>
		<h2>jsp</h2>
		<h2>spring boot</h2>
		<h2>final project</h2>
</div>
<script>
	$('#accordion').accordion();
</script>
</body>
</html>