<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form</title>
<style>
#items>div{
	display : inline-block;
	width: 200px;
	height:200px;
	border:1px solid #ccc;
	padding:5px;
	box-shadow:2px 2px 3px #999;
	border-radius:9px;
}
</style>
</head>
<body>
<div id='emp_search_form'>
	<form name='frm' method='post' id='frm'>
		<label>검색어를 입력하세요 </label>
		<input type='text' name='findStr' />
		<input type='button' value='검색' id='btnFind'/>
	</form>
	<hr/>
	<div id='items'></div>
</div>
<script>
$('#btnFind').on('click', function(){
	let param = $('#frm').serialize();
	let req = new XMLHttpRequest();
	req.open('get', './ajax/emp_search.jsp?' + param);
	req.onreadystatechange=function(){
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			$('#items').html(req.responseText);
		}
	}
	req.send();
})
</script>
</body>
</html>