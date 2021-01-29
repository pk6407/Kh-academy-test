<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<link rel='stylesheet' type='text/css' href='./css/member.css' />
<script src='./js/member.js'></script>
</head>
<body>
<div id='member' class='select'>
	<h2>회원관리</h2>
	<div id='findZone'>
		<form name='frm_member' id='frm_member' method='post' action='insertR.mem'>
			<input type='button' id='btnInsert' value='입력'/>
			<div>
				<input type='search' name='findStr' value='${param.findStr }'/>
				<input type='button' value='검색' id='btnFind'/>
				<input type='hidden'   name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage }' />
				<input type='hidden'   name='mid'/>
			</div>
		</form>
	</div>
	
	<hr/>
	
	<div id='listItems'>
		<c:forEach var='v' items="${list }">
			<div class='item' onclick="member.view('${v.mid}')">
				<c:choose>
					<c:when test="${empty v.photo }">
						<img src='./image/annony.png' align='left'>
					</c:when>
				<c:otherwise>
					<img src='./upload/${v.photo }' align='left'>
				</c:otherwise>
				</c:choose>
				
				<span>${v.mid }</span><br/>
				<span>${v.name }</span><br/>
				<span>${v.phone }</span><br/>
				<span>${v.email }</span>
			</div>
		</c:forEach>		
	
	</div>

	<div id='btnZone'>
		<c:if test="${page.startPage>1 }">
			<input type='button' value='맨첨' id='btnFirst' onclick='member.goPage(1)'/>
			<input type='button' value='이전' id='btnPrev'  onclick='member.goPage(${page.startPage-1})'/>
		</c:if>
	
		<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
			<input type='button' value='${i }' onclick='member.goPage(${i })'/>
		</c:forEach>	

		<c:if test="${page.endPage<page.totPage }">
			<input type='button' value='다음' id='btnNext'  onclick='member.goPage(${page.endPage+1 })'/>
			<input type='button' value='맨끝' id='btnLast'  onclick='member.goPage(${page.totPage})'/>
		</c:if>
	
	</div>	
</div>
<script>member()</script>
</body>
</html>


















