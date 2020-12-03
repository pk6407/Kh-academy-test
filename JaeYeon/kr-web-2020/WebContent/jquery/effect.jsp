<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect</title>
<style>
#parent{
	height: 210px;
}
#target{
	background-image:url(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdTgf8J%2FbtqJZoqrhTI%2FFMGhTl7Rd8dxB6r8VK6L4k%2Fimg.jpg);
	background-size:100% 100%;
	border-radius:10px;
	width:90%;
	height:200px;
}
</style>
</head>
<body>
<div id='effect'>
	<div id='parent'>
		<div id='target'></div>
	</div>
	
	<div id='btns'>
		<input type='button' value='SHOW' 			id='btnShow' />	
		<input type='button' value='HIDE' 			id='btnHide' />	
		<input type='button' value='TOGGLE' 		id='btnToggle' />	
		<input type='button' value='SLIDE DOWN' 	id='btnSlideDown' />	
		<input type='button' value='SLIDE UP' 		id='btnSlideUp' />	
		<input type='button' value='SLIDE TOGGLE' 	id='btnSlideToggle' />	
		<input type='button' value='FADE IN' 		id='btnFadeIn' />	
		<input type='button' value='FADE OUT' 		id='btnFadeOut' />	
		<input type='button' value='ANI' 			id='btnAni' />
		</div>

</div>
<script>
$('#btnShow').on('click', function(){
	$('#target').show(2000,function(){alert('난간다!')});
})
$('#btnHide').on('click',function(){
	$('#target').hide(2000,function(){alert('나도 간다')});
})
$('#btnToggle').on('click',function(){
	$('#target').toggle(700,function(){alert('토클눌럿다오!')});
})
$('#btnSlideDown').on('click',function(){
	$('#target').slideDown(1000,function(){alert('아주좋아욘!')});
})
$('#btnSlideUp').on('click',function(){
	$('#target').slideUp(1000,function(){alert('아주싫어욘!')});
})
$('#btnSlideToggle').on('click',function(){
	$('#target').slideToggle(700,function(){alert('누르지마!')});
})
$('#btnFadeIn').on('click',function(){
	$('#target').fadeIn(1000,function(){alert('누르지마라!')})
})
$('#btnFadeOut').on('click',function(){
	$('#target').fadeOut(1000,function(){alert('누르지마 제발!')})
})
$('#btnAni').on('click',function(){
	$('#target').animate({
		'width' : 'toggle',
		'opacity' : 'toggle',
		'height' : 'toggle'
	});
})
/*
$('#btnShow').click(function(){
	$('#target').show();
})
*/
</script>
</body>
</html>