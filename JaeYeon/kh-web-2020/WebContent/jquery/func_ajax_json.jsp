<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>func_ajax</title>
</head>
<body>
<div id ='func_ajax'>
	<h2>ajax in jQuery을 사용한 구구단(JSON)</h2>
	<form id = 'frm' name='frm' method='post'>
		<label>단수를 입력하세요 : </label>
		<input type='text' size ='4' name='dan' value='9'/>
		<input type='button' value='구구단 실행' id = 'btnRun' />	
	</form>
	
	<div id = 'result'></div>

</div>
<script>

$('#btnRun').on('click', function(){
	
	let param = $('#frm').serialize();
	$.ajax({
	type : 'get',
	url : './jquery/gugudan_json.jsp',
	data : param,
	
	dataType : 'json',
	success : function(json, status){
		var temp = '';
		for(var i=0; i<json.length; i++){
			temp += json[i] + '<br/>'
		}
		$('#result').html(temp);
	},
	error : function(xhr, status, error){ 		
		alert(status);
	}
	
	});

});
</script>
</body>
</html>