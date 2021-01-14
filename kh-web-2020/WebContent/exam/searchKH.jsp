<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 조회 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
	        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
 	        crossorigin="anonymous"></script>
 	        
</head>
<body>
<h2>학원 정보 조회하기</h2>
<hr/>
<form name='frm'>
	<input type='text' name='findStr' id='findStr' value='옹'/>
	<input type='button' value='조회하기' id='btn'/>
</form>
<div id='result'></div>

<script>
var findStr = $('#findStr').val();
var sendData = {'findStr' : findStr}

${'#btn'}.on('click',function(){
	$.ajax({
		url : 'searchKH',
		data : sendData,
		type : 'get',
		dataType : 'json',
		success : function(data){
			console.log(data);
			var result = "<ul><li>" + data.kh_no
					   + "<li>" + data.kh_name
					   + "<li>" + data.addr
					   + "<li>" + data.fax
					   + "</ul>";
			${'#result'}.html(result);
		}
	});
})

</script>
</body>
</html>