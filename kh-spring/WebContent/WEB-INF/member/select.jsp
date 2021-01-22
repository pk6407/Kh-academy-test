<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<link rel='stylesheet' type='text/css' href='./css/member.css' />
</head>
<body>
<div id='member' class='select'>
	<h2>회원관리</h2>
	<div id='findZone'>
		<form name='frmMember' id='frmMember' method='post' action='insertR.mem'>
			<input type='button' id='btnInsert' value='입력'/>
			<div>
				<input type='search' name='findStr' />
				<input type='button' value='검색' id='btnFind' />
			</div>
		</form>
	</div>

	<hr/>
	
	<div id='listItems'>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		<div class='item'>
			<img src='http://placehold.it/150x200' align='left'>
			<span>아이디</span><br/>
			<span>성명</span><br/>
			<span>연락처</span><br/>
			<span>이메일</span><br/>
		</div>
		
	</div>
	
	<div id='btnZone'>
		<input type='button' value='맨첨' id='btnFirest'/>
		<input type='button' value='이전' id='btnPrev'/>
		
		<input type='button' value='1' />
		<input type='button' value='2' />
		<input type='button' value='3' />
		<input type='button' value='4' />
		<input type='button' value='5' />
		
		<input type='button' value='이전' id='btnNext'/>
		<input type='button' value='맨끝' id='btnLast'/>
		
	</div>
	
	
</div>
</body>
</html>