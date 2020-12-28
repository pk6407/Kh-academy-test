# 오늘 하루종일 시험봣다^^ 

마지막 교시에만 수업함

- 목록
  - 입력
    - 입력화면
      - 저장
        - 결과화면
          - 목록으로
  - 조회
    - 목록으로
  - 페이지이동
    - 목록으로
  - 상세보기
    - 목록으로
    - 삭제
      - 삭제결과
        - 목록으로
    - 수정
      - 수정화면
        - 수정된내용저장
          - 결과
            - 목록으로
        - 목록으로
    - 댓글
      - 댓글입력화면
        - 목록으로
        - 댓글저장
          - 결과
            - 목록으로

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : it여행자
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var board = function(){
	var frm = document.frm_board;
	var url = 'index.jsp?inc=./board/';	//'board.do?job=
	
	var btnInsert = getID('btnInsert');
	var btnSelect = getID('btnSelect');
	var btnSave = getID('btnSave');
	var btnFile = getID('btnFind');
	
	if(btnFind != null){
		btnFind.onclick = function(){
			frm.nowPage.value = 1;
			frm.action = url + 'select.jsp';
			frm.submit();
		}
	}
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			frm.action = url + 'select.jsp';
			frm.submit();
		}
	}
	
	if(btnInsert != null){
		btnInsert.onclick = function(){
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}
```

```jsp
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
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80'></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>첨부</label>
		<div id='attach_zone'>
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
		</div>
	
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
	</form>
</div>


<script>board()</script>
</body>
</html>
```

```jsp
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
	<form name='frm_board' method='post'>
		<input type='button' id='btnInsert' value='입력'>
		<div>
			<input type='text' name='findStr' id='findStr' value='${param.findStr }'>
			<input type='button' name='btnFind' id='btnFind' value='조회'/>
			<input type='text' name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage } ' />
		</div>
	</form>

	<div class='title'>
		<span class='no'>NO</span>
		<span class='subject'>제목</span>
		<span class='mid'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<div class='items'>
		<c:forEach var='vo' begin='1' end='12'>
			<div class='item'>
				<span class='no'>NO${vo}</span>
				<span class='subject'>제목(10)</span>
				<span class='mid'>작성자</span>
				<span class='mdate'>작성일</span>
				<span class='hit'>조회수</span>
			</div>					
		</c:forEach>
	</div>	
	
	<div class='btns'>
		<input type='button' value='맨점'>
		<input type='button' value='이전'>
		
		<c:forEach var='i' begin='1' end='5'>
				<input type='button' value='${i }'>
		</c:forEach>

		<input type='button' value='다음'>
		<input type='button' value='맨끝'>
	</div>
</div>

<script>board()</script>
</body>
</html>
```

