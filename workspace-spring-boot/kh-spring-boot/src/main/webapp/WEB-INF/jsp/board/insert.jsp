<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='board'>
	<form name='frm_board' id='frm_board' method='post'>
		<label>작성자</label>
		<input type='text' name='mid' value='kim n.h'/>
		<br/>
		<label>제목</label>
		<input type='text' name='subject' value='하이...방가루....'/>
		<br/>
		<label>파일첨부</label>
		<input type='file' name='attFile' multiple='multiple'/>
		<p/>
		<input type='button' value='저장' id='btnSave'/>
		<input type='button' value='목록으로' id='btnList'/>
		<input type='hidden' name='nowPage' value='5'/>
		<input type='hidden' name='serial' value='123'/>
		
	</form>

</div>
<script>board()</script>
</body>
</html>