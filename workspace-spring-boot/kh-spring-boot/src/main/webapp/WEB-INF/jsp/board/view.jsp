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
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' disabled value='${vo.mid }'/><br/>
		
		<label>제목</label>
		<input type='text' name='subject' disabled value='${vo.subject }' /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80' disabled>${vo.doc }</textarea><br/>
		
		<label>첨부</label>
		<div id='attach_zone'>
			<c:forEach items="${vo.attList }" var="att">
				<img src='./upload/${att.sysFile }' width='120px' height='100px'/>
			</c:forEach>
		
		</div>
	
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='댓글' id='btnRepl' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${page.findStr }'/>
		<input type='text' name='nowPage' value='${page.nowPage }'/>
		<input type='text' name='serial'  value='${vo.serial }'/>
		<input type='hidden' name='pwd' />
	</form>
</div>


<script>brd()</script>
</body>
</html>