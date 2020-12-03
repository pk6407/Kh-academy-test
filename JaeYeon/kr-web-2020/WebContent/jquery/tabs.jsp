<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tabs</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
</head>
<body>
<div id='tabs'>
	<!-- 상단 탭 메뉴 -->
	<ul>
	<li><a href='#web'>WEB</a></li>
	<li><a href='#app'>APP</a></li>
	<li><a href='#framework'>FrameWork</a></li>
	<li><a href='#office'>Office</a></li>
	<li><a href='#bigData'>Big Data</a></li>
	</ul>
	
	<!-- 각 탭에 해당하는 컨텐츠 내용들 --> 
	<div id='web'>web 이란..</div>
	<div id='app'>app 이란...</div>
	<div id='framework'>framework 이란..</div>
	<div id='office'>office 이란..</div>
	<div id='bigData'>bigData 이란..</div>
	
</div>

<script>
	$('#tabs').tabs();
</script>
</body>
</html>