<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect</title>
<style>
#parent{
	height:240px;
}

 #target{
 	 background-image:url('./images/think-twice.png');
 	 background-size:100% 100%;
 	 border-radius:10px;
 	 width:90%;
 	 height:200px;
 }

</style>
</head>
<body>
<div id = 'effect'>
	<div id ='parent'>
		<div id = 'target'></div>	
	</div>
	<div id = 'btns'>
		<input type="button" value='SHOW' id='btnShow' />
		<input type="button" value='HIDE' id='btnHide' />
		<input type="button" value='TOGGLE' id='btnToggle' />
		<input type="button" value='SLIDE DOWN' id='btnSlideDown' />
		<input type="button" value='SLIDE UP' id='btnSlideUp' />
		<input type="button" value='SLIDE TOGGLE' id='btnSlideToggle' />
		<input type="button" value='FADE IN' id='btnFadeIn' />
		<input type="button" value='FADE OUT' id='btnFadeOut' />
		<input type="button" value='ANI' id='btnAni' />
	</div>
</div>
<script>
$('#btnShow').on('click',function(){
	$('#target').show(2000);
});

$('#btnHide').on('click',function(){
	$('#target').hide(2000);
});

$('#btnToggle').on('click',function(){
	$('#target').toggle(500);
});

$('#btnSlideDown').on('click', function(){
	$('#target').hide();
	$('#target').slideDown(500);
});

$('#btnSlideUp').on('click', function(){
	$('#target').slideUp(500);
});

$('#btnSlideToggle').on('click', function(){
	$('#target').slideToggle(500);
});

$('#btnFadeIn').on('click', function(){
	$('#target').fadeIn(500);
});

$('#btnFadeOut').on('click', function(){
	$('#target').fadeOut(500);
});

$('#btnAni').on('click', function(){
	$('#target').animate({width:'toggle', opacity:'toggle', height : 'toggle'}, 2000);
});

</script>
</body>
</html>