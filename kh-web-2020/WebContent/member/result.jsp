<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 결과(result)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<div class='result_msg'>
		작업이 처리 되었습니다.
	</div>
	<form name='frm_member' method='post'>
		<input type='hidden' name='findStr' value='${page.findStr }'/>
		<input type='hidden' name='nowPage' value='${page.nowPage }'/>
	
		<div class='btns'>
			<input type='button' value='목록으로' id='btnSelect' />
		</div>		
	</form>
</div>
<script>member()</script>
</body>
</html>