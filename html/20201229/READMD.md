# 1교시

- board 
  - CRUD
  - servlet
  - mybatis
- board(spring(게시판))
  - CRUD
  - servlet -> spring([DI]의존성주입,[AOP]관심사의분리,[MVC])
  - mybatis
- gustbook
  - CRUP
- member
  - CRUP
  - servlet
  
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
	<form name='frm_board' method='post' enctype='multipart/form-data'>
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
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		
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
	<div id='msg'>
		입력|수정|삭제|댓글 처리가 됨
	</div>
	<form name='frm_board' method='post'>
		<input type='button' value='목록' id='btnSelect' />
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
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

# 2교시

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

function goPage(page){
	var frm = document.frm_board;
	frm.nowPage.value = page;
	frm.action = 'index.jsp?inc=./board/select.jsp';
	frm.submit();
}
function view(serial){
	var frm = document.frm_board;
	frm.serial.value = serial;
	frm.action = 'index.jsp?inc=./board/view.jsp';
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
	<form name='frm_board' method='post' enctype='multipart/form-data'>
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
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		
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
	<div id='msg'>
		입력|수정|삭제|댓글 처리가 됨
	</div>
	<form name='frm_board' method='post'>
		<input type='button' value='목록' id='btnSelect' />
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
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
			<input type='text' name='serial' value='0'/>
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
			<div class='item' onclick="view(${vo})">
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
				<input type='button' value='${i }' onclick='goPage(${i})'>
		</c:forEach>

		<input type='button' value='다음'>
		<input type='button' value='맨끝'>
	</div>
</div>

<script>board()</script>
</body>
</html>
```

# 3교시 

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
	var btnFind = getID('btnFind');
	var btnDelete = getID('btnDelete');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnRepl = getID('btnRepl');
	var btnReplSave = getID('btnReplSave');
	
	if(btnReplSave != null){
		btnReplSave.onclick = function(){
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	if(btnRepl != null){
		btnRepl.onclick = function(){
			frm.action = url + 'repl.jsp';
			frm.submit();
		}
	}
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var pwd = prompt("수정하려면 암호를 입력하세요.");
			if(pwd != null){
				frm.pwd.value = pwd;
				frm.action = url + 'result.jsp';
				frm.submit();
			}
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			frm.action = url + 'update.jsp';
			frm.submit(); 
		}
	}	
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var yn = confirm("정말 삭제하시겠습니까???");
			if(yn){
				frm.action = url + 'result.jsp';
				frm.submit();
			}	
		}
	}
	
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

function goPage(page){
	var frm = document.frm_board;
	frm.nowPage.value = page;
	frm.action = 'index.jsp?inc=./board/select.jsp';
	frm.submit();
}
function view(serial){
	var frm = document.frm_board;
	frm.serial.value = serial;
	frm.action = 'index.jsp?inc=./board/view.jsp';
	frm.submit();
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
			<input type='button' value='댓글저장' id='btnReplSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='text' name='frndStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${ param.nowPage}'/>
		<input type='text' name='serial' value='${param.serial }'/>
		
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
		<label>아이디</label>
		<input type='text' name='mid' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80'></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>첨부</label>
		<div>
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
		</div>
		
		<label>새첨부</label>
		<div id='attach_zone'>
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
		</div>
	
		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='serial' value='${param.serial }'/>
		
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
		<label>아이디</label>
		<input type='text' name='mid' disabled /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' disabled /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80' disabled></textarea><br/>
		
		<label>첨부</label>
		<div id='attach_zone'>
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
			<img src='http://placehold.it/120x100' />
		</div>
	
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='댓글' id='btnRepl' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='serial' value='${param.serial }'/>
	</form>
</div>


<script>board()</script>
</body>
</html>
```