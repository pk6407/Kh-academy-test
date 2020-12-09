<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manipulation</title>
</head>
<body>
<div id='main'>
	<div id='target'>TARGET</div>
	
	<div id='btn_zone'>
		<input type='button' value='WRAP' id='btnWrap' onclick='abc(this)'/>
		<input type='button' value='APPEND' id='btnAppend'/>
		<input type='button' value='PREPEND' id='btnPrepend'/>
	</div>
</div>

<script>

	//버튼 3개에 각각 click event 처리
	/*
	$(function(){
		$('#btnWrap').on("click", function(){
			$('#target').css('color', 'red');
		});
	});
	$(function(){
		$('#btnAppend').on("click", function(){
			$('#target').css('color', 'blue');
		});
	});
	$(function(){
		$('#btnPrepend').on("click", function(){
			$('#target').css('color', 'green');
		});
	});
	*/
	
	
	//input에 onclick='abc(this)' 이벤트명을 지정한 후 매개변수 명 파라미터 필요
	function abc(button){
		console.log(button.value);
		console.log(button.id);
		var wrap = "<label><input type='checkbox'/>확인</label>"
		$('#main>#target').wrap(wrap);
	}
	
	
	//jQuery
	var btnAppend = $('#btnAppend')[0];
	btnAppend.onclick = function() {
		console.log($(this).val());
		var wrap = "<br/><label><input type='checkbox'/>확인</label>"
		for(var i =0; i<5; i++){
		$('#main>#target').append(wrap);			
		}	
	}
	
	
	//javaScript
	var btnPrepend = document.getElementById('btnPrepend');
	btnPrepend.onclick = function() {
		console.log(this.value);
		var wrap = "<label><input type='checkbox'/>확인</label>"
			for(var i =0; i<5; i++){
			$('#main>#target').prepend(wrap);			
			}	
	}
	
	/* 위의 javaScript를 jQuery로
	var btnPrepend = document.getElementById('btnPrepend');
	$(btnPrepend)[0].onclick = function() {
		console.log(this.value);
	}
	*/
	
	
</script>
</body>
</html>