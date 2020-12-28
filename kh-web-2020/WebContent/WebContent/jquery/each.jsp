<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>each</title>
</head>
<body>
<div id='each'>
	<div id='source'>
		<div><font color='red'>가</font></div>
		<div>나</div>
		<div>다</div>
		<div>라</div>
	</div>
	
	<div id='target'>추가</div>
	
	<div id ='btns'>
		<input type='button' value='LENGTH' id='btnLength'/>
		<input type='button' value='TEXT' id='btnText'/>
		<input type='button' value='HTML' id='btnHtml'/>
		<input type='button' value='EACH' id='btnEach'/>
	</div>
</div>
<script>
/*
$(document).ready(function(){
	code... 이렇게 쓰는거는 head 부분에 script 넣어서 작업할 때 이벤트 처리 코드방식
	(head부분이 먼저 로드되고 그 후에 body 부분이 로드되기 때문에 document가 전부 ready가 끝났으니 이벤트 처리를 하라는 식의 코드)
	
});*/

/*
$(function(){
	위 코드의 축약형 head부분에서는 위 방식으로 사용 body 부분에서는 축약형 가능?
	body 부분에서는 이 축약형 조차 생략하고 바로 사용 가능하다.
});*/

// $('#each #btnSize') - 이는 > 사용하지 않고 sp로 바로 지정하는데 이는 후손(sp 사용)이기 때문이다. 
// 아래 방식도 결국 같은 처리는 하지만 >를 사용해서 정석 루트로 자손(> 사용)을 따라가면서 표기를 한 것이다.
$('#target').css({
	'border':'2px solid #aaa'
});


$('#each #btnLength')[0].onclick = function(){
	var len = $('#each>#source>div').length; //.length
	$('#each>#target').html('div 개수:' + len);
};

$('#each #btnText')[0].onclick = function(){
	
	//var div = $('#each>#source>div:first');
	//var div = $('#each>#source>div').first();
	var div = $('#each>#source>div').get(1);
	var text = $(div).text();
	$('#each>#target').text(text);	
};

$('#each #btnHtml')[0].onclick = function(){
	let div = $('#each>#source>div:first');
	let html = $(div).html();
	$('#each>#target').html(html);	
};


$('#each #btnEach')[0].onclick = function(){
	let bg = ['#00f', '#44f', '#88f', '#aaf'];
	$('#each>#target').each(function(){
		$(this).css('background-color', bg[1]);
	});
	
	$('#each>#source>div').each(function(index){
		$(this).css('background-color',bg[index])
	});
	//for(d in(of) divs){...} => javascript
	//for(d : divs){...} => java 향상된 for문
	//each => jQuery
};


</script>
</body>
</html>