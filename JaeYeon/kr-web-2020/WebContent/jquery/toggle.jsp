<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toggle</title>

<style>

	#target{
	broder:2px solid #bbb;
	width:250px;height:100px;
	font-weight:bolder;
	text-align: center;
	line-height:100px;
	}
	
	#btnToggle{
		width:120px;
		height:30px;
		line-height:30px;
	}
	
	.target_on{
	background-color:#ff0;
	color:#f00;
	visibility: visible;
	display: block;
	}
	
	.target_off{
	background-color:#000;
	color:#fff;
	}
	 
</style>
</head>
<body>

<div id='toggle'>
	<div id='target'></div>
	<br/>
	<input type='button' value='ON/OFF' id='btnToggle' />

</div>
<script>
	$('#btnToggle').on('click', function(){
	$('#target').toggle(even, odd);
	})
	
	function even(){
		$('#target').attr('class', 'target_on');
	}
	
	function odd(){
		$('#target').attr('class', 'target_off');
	}
	
</script>
</body>
</html>