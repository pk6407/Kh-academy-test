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
		<input type='text' name='mid' readonly value='${vo.mid }' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' value='${vo.subject }'/><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80'>${vo.doc }</textarea><br/>
		
		
		<label></label>
		<div class='inner'>
			<c:forEach items="${vo.attList }" var="att">
				<div class='attach_old'>
					<img src='./upload/${att.sysFile }' width='120px' height='100px'/>
					<input type='checkbox' name='delFiles'  value='${att.sysFile }'/>
				</div>
			</c:forEach>
		</div>
		<br/>
		
		<label>추가</label>
		<div id='attach_zone' class='inner'></div>
		<br/>
		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }' />
		<input type='hidden' name='serial'  value='${param.serial }'/>
		<input type='hidden' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
	</form>
</div>


<script>
	board();
	fileUpload('attach_zone');	
</script>
</body>
</html>