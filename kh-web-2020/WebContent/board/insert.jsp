<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
<script src='./js/file_upload.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' value='${sessionScope.mid }'
		placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc'></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>첨부</label>
		<div id='attach_zone'></div>
	
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		
	</form>
</div>


<script>
	board()
	fileUpload('attach_zone');
</script>
</body>
</html>