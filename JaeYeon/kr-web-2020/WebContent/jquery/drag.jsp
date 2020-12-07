<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
<title>drag</title>
<style>
#drag>div{
	width:250px;
	height:250px;
	background:#88f;
	opacity:0.5;	
}
</style>
</head>
<body>
<div id='drag'>
	<div id='target1'>이곳을 끌어 보세용~</div>
	<div id='target2'>이곳을 끌어 봐랑~</div>
</div>
<script>
	$('#target1').draggable();
	$('#target2').draggable();
</script>

</body>
</html>