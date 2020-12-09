<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form</title>
<style type='text/css'>
#items>div{
	display : inline-block;
	width : 200px;
	height : 150px;
	border : 1px solid #ccc;
	box-sizing : border-box;
	padding : 5px;
	box-shadow : 2px 2px 4px #aaa;
	border-radius:12px;
	margin-right:7px;
}
.emp>div:first-child{
	color:#00f;
	border-bottom: 1px dotted #555;
}
.emp>div:nth-child(2){
	font-weight:bolder;
}
</style>
</head>
<body>
<div id ='emp_search_form'>
	<form name='frm'method='post' id='frm'>
		<label>검색어를 입력하세요</label>
		<input type="text" name='findStr'placeholder='성명,이메일,연락처로 검색'/>
		<input type="button" value='검색' id='btnFind' />
	</form>
	<hr/>
	<div id='items'></div>
</div>
<script>

$('#btnFind').on('click', function(){
	let param = $('#frm').serialize(); //form에 있는 값을 직렬화시킨다. findStr=123;
	let req = new XMLHttpRequest();
	req.open('get', './ajax/emp_search.jsp?' + param); //''여기서는 안에 빈 공백이 있으면 안된다.
	req.onreadystatechange = function(){
		
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			$('#items').html(req.responseText);
		}
	}
	req.send();
	
});

</script>
</body>
</html>