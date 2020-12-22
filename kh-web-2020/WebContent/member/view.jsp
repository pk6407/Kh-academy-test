<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='view'>
		<label>아이디</label>
		<input type='text' name='mid' disabled size='10' value='${vo.mid }'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12' value='${vo.name }'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35'  value='${vo.email }'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' disabled size='15'  value='${vo.phone }'/><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6'  value='${vo.zipcode }'/><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60'  value='${vo.address }'/> <br/>
		
		<label></label>
		
			<c:choose>
				<c:when test="${empty vo.photo }">
					<img src='http:/;placehold.it/200X140' width='200px' height='140px' />
				</c:when>
				<c:otherwise>
				<img src='./upload/${vo.photo }' width='200px' height='140px' />
			</c:otherwise>
		</c:choose>
		
		<hr/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='delFile' value='${vo.photo }' />
		<input type='text' name='pwd' />
	</form>

</div>
<script>member()</script>
</body>
</html>