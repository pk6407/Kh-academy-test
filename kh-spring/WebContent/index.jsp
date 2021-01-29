<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
	        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
 	        crossorigin="anonymous"></script>
<script src='./js/index.js'></script>
</head>
<body>
<div id='index'>
	<h2>Spring Framework</h2>
	<div class='menu'>
		<a href='test.ddd'>Srping MVC Test</a>
		<a href='gugudan.ddd'>Spring MVC를 사용한 구구단</a>
		<a href='sum.ddd'>두수의 합</a>
		<a href='insert.mem'>회원가입</a>
		<a href='#' onclick='member.select()'>회원조회</a>
	</div>
	<div id='here'></div>
	
	<h4 class='footer'>디지털 웹 콘텐츠 융합 응용 SW 개발사</h4>
</div>
<script>member()</script>
</body>
</html>







