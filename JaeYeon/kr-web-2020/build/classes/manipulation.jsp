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
			<input type='button' value='WRAP' id='btnWrap' onclick='abc(this)' />
			<input type='button' value='APPEND' id='btnAppend' /> 
			<input type='button' value='PREPEND' id='btnPrepend' />
		</div>
	</div>

	<script>
		// WRAP 버튼에 click event 처리
		function abc(button) {
			//console.log(button.id);
			var wrap = "<label><input type='checkbox'>확인</label>";
			$('#main>#target').wrap(wrap);
			
		}
		var btnAppend = $('#btnAppend')[0];
		btnAppend.onclick = function() {
			//console.log($(this).val());
			var wrap = "<label><input type='checkbox'>확인</label>";
			for(var i =0;i<5;i++){
				$('#main>#target').append(wrap);
			}
		}
		var btnPrepend = document.getElementById('btnPrepend');
		btnPrepend.onclick = function() {
			//console.log(this.value)
			var wrap = "<label><input type='checkbox'>확인</label>";
			$('#main>#target').prepend(wrap);
		}
		
		
	</script>

</body>
</html>