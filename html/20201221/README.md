# 1교시

- 퍼블리싱 마무리
- 스크립팅(이벤트처리,이미지 미리보기)
- 조회 기능
- 입력 기능(파일 업로드)

F-E(프론트엔드)
  - 디자이너(웹)
  - 퍼블리셔
  - 스트립터
  
B-E(백엔드)
  - 스트립트
  - Server

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(view)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='view'>
		<label>아이디</label>
		<input type='text' name='mid' disabled size='10'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' disabled size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60' /><br/>
		
		<label></label>
		<img src='http://placehold.it/150x200' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='수정' id='btnModify' />
	 		<input type='button' value='삭제' id='btnDelete' />
	 		<input type='button' value='목록으로' id='btnselect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(Update)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' readOnly required/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12' required/><br/>
			
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' required/><br/>
		
		<label>주소</label>
		<input type='text' name='address' size='44' required/><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/200x140' />
		<hr/>
		
		<input type='hidden' name='pwd' /><br/>
		
	 	<div class='btns'>
	 		<input type='button' value='수정' id='btnUpdate' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr'/>
			<input type='button' value='검색' id='btnFind' />
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
		<div class='item'>
			<span class='no'>1</span>
			<span class='mid'>hong</span>
			<span class='name'>홍길동</span>
			<span class='email'>hong@jobt.kr</span>
			<span class='mdate'>2020-01-01</span>
		</div>
		<div class='item'>
			<span class='no'>2</span>
			<span class='mid'>Kim</span>
			<span class='name'>김부자</span>
			<span class='email'>Kim@jobt.kr</span>
			<span class='mdate'>2020-02-01</span>
		</div>
		<div class='item'>
			<span class='no'>3</span>
			<span class='mid'>lee</span>
			<span class='name'>이기자</span>
			<span class='email'>lee@jobt.kr</span>
			<span class='mdate'>2020-03-01</span>
		</div>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' />
		<input type='button' value='이전' id='btnPrev' />
		
		<input type='button' value='1' />
		<input type='button' value='2' />
		<input type='button' value='3' />
		<input type='button' value='4' />
		<input type='button' value='5' />
		
		<input type='button' value='다음' id='btnNext' />
		<input type='button' value='맨끝' id='btnLast' />
	
	</div>

</div>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 결과(result)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<div class='result_msg'>
		작업이 처리 되었습니다.
	</div>

	<input type='button' value='목록으로' id='btnlist' />
</div>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required/><br/>
		
		<label>성명</label>
		<input type='text' name='name'size='12' required/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' required/>
		<input type='button' name='btnZipcode' value='우편번호검색' />
		<br/>
		<label>주소</label>
		<input type='text' name='address' size='60' required/><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/140x160' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='저장' id='btnSave' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 	</div>
	</form>
	
</div>
</body>
</html>
```

```css
@charset "UTF-8";

/*--------------공통부분----------------*/
#member .btns{
	text-align:center;
}
#member .btns>input{
	border:1px solid #ddc;
	border-radius:10px;
}


#member{
	width:100%;
	padding-right:20px;
	box-sizing:border-box;
}

#member #frm_member input{
	border:1px solid #bbb;
	border-radius:10px;
}

#member #frm_member>div{
	display: inline-block;
	float:right;
}

#member .title{
	margin-top:6px;
	background-color:#555;
	padding:4px 0;
	color:#fff;
}
#member span{
	display:inline-block;
}
#member .no{width:70px;}
#member .mid{width:100px;}
#member .name{width:120px;}
#member .email{width:200px;}
#member .mdate{width:110px;}

#member .items>div{
	line-height:25px;
}
#member .items>div:hover{
	background-color:#bbb;
	cursor:pointer;
}

#member .items>div:last-child{
	border-bottom:2px solid #aaa;
	margin-bottom:10px;
}

#member .paging{
	text-align:center;
}
#member .paging>input{
	border:1px sloid #eee;
	border-radius:10px;
}

#member .paging>input:hover{
	cursor:pointer;
}

/*------------insert-----------------*/
#member .insert{
	position:relative;
}
#member .insert>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .insert>img{
	position:absolute;
	top:5px;
	right:25px;
}


/*-----------update-------------------*/
#member .update>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .update img{
	margin-top : 10px;
}

/*----------view--------------------*/
#member .view>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}
#member .view img{
	margin-top:10px;
}
```

# 2교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr' value='${param.findStr }'/>
			<input type='button' value='검색' id='btnFind' />
			<input type='text' name='nowPage' value='${param.nowPage }'/>
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
		<div class='item'>
			<span class='no'>1</span>
			<span class='mid'>hong</span>
			<span class='name'>홍길동</span>
			<span class='email'>hong@jobt.kr</span>
			<span class='mdate'>2020-01-01</span>
		</div>
		<div class='item'>
			<span class='no'>2</span>
			<span class='mid'>Kim</span>
			<span class='name'>김부자</span>
			<span class='email'>Kim@jobt.kr</span>
			<span class='mdate'>2020-02-01</span>
		</div>
		<div class='item'>
			<span class='no'>3</span>
			<span class='mid'>lee</span>
			<span class='name'>이기자</span>
			<span class='email'>lee@jobt.kr</span>
			<span class='mdate'>2020-03-01</span>
		</div>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' onclick = 'goPage(1)' />
		<input type='button' value='이전' id='btnPrev' onclick = 'goPage()'/>
		
		<c:forEach var="i"begin='1' end='5'>
		<input type='button' value='${i }' "${(param.nowPage==i)? 'disabled' : '' }"
			onclick='goPage(${i})' />
		</c:forEach>
		
		<input type='button' value='다음' id='btnNext' onclick = 'goPage()'/>
		<input type='button' value='맨끝' id='btnLast' onclick = 'goPage()'/>
	
	</div>

</div>
<script>member()</script>
</body>
</html>
```

```css
@charset "UTF-8";

/*--------------공통부분----------------*/
#member .btns{
	text-align:center;
}
#member .btns>input{
	border:1px solid #ddc;
	border-radius:10px;
}

#member{
	width:100%;
	padding-right:20px;
	box-sizing:border-box;
}

#member #frm_member input{
	border:1px solid #bbb;
	border-radius:10px;
}

#member #frm_member>div{
	display: inline-block;
	float:right;
}

#member .title{
	margin-top:6px;
	background-color:#555;
	padding:4px 0;
	color:#fff;
}
#member span{
	display:inline-block;
}
#member .no{width:70px;}
#member .mid{width:100px;}
#member .name{width:120px;}
#member .email{width:200px;}
#member .mdate{width:110px;}

#member .items>div{
	line-height:25px;
}
#member .items>div:hover{
	background-color:#bbb;
	cursor:pointer;
}

#member .items>div:last-child{
	border-bottom:2px solid #aaa;
	margin-bottom:10px;
}

#member .paging{
	text-align:center;
}
#member .paging>input{
	border:1px sloid #eee;
	border-radius:10px;
}

#member .paging>input:hover{
	cursor:pointer;
}

/*------------insert-----------------*/
#member .insert{
	position:relative;
}
#member .insert>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .insert>img{
	position:absolute;
	top:5px;
	right:25px;
}


/*-----------update-------------------*/
#member .update>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .update img{
	margin-top : 10px;
}

/*----------view--------------------*/
#member .view>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}
#member .view img{
	margin-top:10px;
}
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
 function getID(id){ return document.getElementById(id)}
 
 var member = function(){
 	let url = 'index.jsp?inc=./member/';
 	
 	var btnInsert = getId('btnInsert');
 	var btnFind = getId('btnFind');
 	
 	if(btnFind != null){
 		btnFind.onclick = function(){
 			var frm = document.frm_member;
 			frm.action = url + 'select.jsp';
 			frm.nowPage.value = 1;
 			frm.submit();
 		}
 	}
 	
 	
 	//$('#btnInsert').on('click',function(){...});
 	if(btnInsert != null){
 	 btnInsert.onclick = function(){
 	 		var frm = document.frm_member;
 	 		frm.action = url + 'insert.jsp';
 	 		frm.submit();	
 		}
 	}
 }
 ```

 # 3교시

 ```jsp
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" url="http://java.sun.com/jstl/core_rt"%>
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
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required/><br/>
		
		<label>성명</label>
		<input type='text' name='name'size='12' required/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6' required/>
		<input type='button' name='btnZipcode' value='우편번호검색' />
		<br/>
		<label>주소</label>
		<input type='text' name='address' size='60' required/><br/>
		
		<label>사진</label>	
		<input type='file' name='photo' />
		<img src='http://placehold.it/200x140' />
		<hr/>
		
	 	<div class='btns'>
	 		<input type='button' value='저장' id='btnSave' />
	 		<input type='button' value='목록으로' id='btnSelect' />
	 		
	 		<input type='text' name='findStr' value='${param.findStr }' />
	 		<input type='text' name='nowPage' value='${param.nowPage }' />
	 		
	 	</div>
	</form>
	
</div>
<script>member()</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" url="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr' value='${param.findStr }'/>
			<input type='button' value='검색' id='btnFind' />
			<input type='text' name='nowPage' value='${param.nowPage }'/>
			<input type="text" name='mid' />
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
	<c:forEach var='vo' begin='1' end='10'>
		<div class='item' onclick="view('${vo}')">
			<span class='no'>${vo }</span>
			<span class='mid'>hong</span>
			<span class='name'>홍길동</span>
			<span class='email'>hong@jobt.kr</span>
			<span class='mdate'>2020-01-01</span>
		</div>
	</c:forEach>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' onclick = 'goPage(1)' />
		<input type='button' value='이전' id='btnPrev' onclick = 'goPage()'/>
		
		<c:forEach var="i" begin='1' end='5'>
		<input type='button' value='${i }' 
		"${(param.nowPage==i)? 'disabled' : '' }"
			onclick='goPage(${i})' />
		</c:forEach>
		
		<input type='button' value='다음' id='btnNext' onclick = 'goPage()'/>
		<input type='button' value='맨끝' id='btnLast' onclick = 'goPage()'/>
	
	</div>

</div>
<script>member()</script>
</body>
</html>
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
 function getID(id){ return document.getElementById(id)}
 
 var member = function(){
 	let url = 'index.jsp?inc=./member/';
 	
 	var btnInsert = getID('btnInsert');
 	var btnFind = getID('btnFind');
 	var btnSelect = getID('btnSelect');
 	
 	if(btnSelect |= null){
 		btnSelect.onclick = function(){
 			var frm = document.frm_member;
 			frm.action = url + 'select.jsp';
 			frm.submit();
 		}
 	}
 	
 	
 	if(btnFind != null){
 		btnFind.onclick = function(){
 			var frm = document.frm_member;
 			frm.action = url + 'select.jsp';
 			frm.nowPage.value = 1;
 			frm.submit();
 		}
 	}
 	
 	
 	//$('#btnInsert').on('click',function(){...});
 	if(btnInsert != null){
 	 btnInsert.onclick = function(){
 	 		var frm = document.frm_member;
 	 		frm.action = url + 'insert.jsp';
 	 		frm.submit();	
 		}
 	}
 }
 
 function goPage(page){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/select.jsp';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/view.jsp';
	frm.mid.value = mid;
	frm.submit();
}
```

# 점심후 4교시

```jsp
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
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required /><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required /><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'  required /><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14' /><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required />
		<input type='button' name='btnZipcode' value='우편번호검색' id='btnFindZip'/>
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required /> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' />
		<img src='http://placehold.it/200x140' />
		<hr/>
		
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록으로' id='btnSelect' />
			
			<input type='text' name='findStr' value='${param.findStr }' />
			<input type='text' name='nowPage' value='${param.nowPage }' />
			
		</div>
	</form>

</div>
<script>member()</script>
</body>
</html>
```

```jsp
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
		<div class='btns'>
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
	</form>
</div>
<script>member()</script>
</body>
</html>
```

```css
@charset "UTF-8";

/*--------------공통부분----------------*/
#member .btns{
	text-align:center;
}
#member .btns>input{
	border:1px solid #ddc;
	border-radius:10px;
}

#member .result_msg{
	margin:60px auto;
	width:400px;
	border:2px solid #f55;
	border-radius:20px;
	padding:20px;
	box-sizing:border-box;
	text-align:center;
	box-shadow:3px 3px 7px #999;
}


#member{
	width:100%;
	padding-right:20px;
	box-sizing:border-box;
}

#member #frm_member input{
	border:1px solid #bbb;
	border-radius:10px;
}

#member #frm_member>div{
	display: inline-block;
	float:right;
}

#member .title{
	margin-top:6px;
	background-color:#555;
	padding:4px 0;
	color:#fff;
}
#member span{
	display:inline-block;
}
#member .no{width:70px;}
#member .mid{width:100px;}
#member .name{width:120px;}
#member .email{width:200px;}
#member .mdate{width:110px;}

#member .items>div{
	line-height:25px;
}
#member .items>div:hover{
	background-color:#bbb;
	cursor:pointer;
}

#member .items>div:last-child{
	border-bottom:2px solid #aaa;
	margin-bottom:10px;
}

#member .paging{
	text-align:center;
}
#member .paging>input{
	border:1px sloid #eee;
	border-radius:10px;
}

#member .paging>input:hover{
	cursor:pointer;
}

/*------------insert-----------------*/
#member .insert{
	position:relative;
}
#member .insert>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .insert>img{
	position:absolute;
	top:5px;
	right:25px;
}


/*-----------update-------------------*/
#member .update>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .update img{
	margin-top : 10px;
}

/*----------view--------------------*/
#member .view>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}
#member .view img{
	margin-top:10px;
}
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
 function getID(id){ return document.getElementById(id)}
 
 var member = function(){
 	let url = 'index.jsp?inc=./member/';
 	
 	var btnInsert = getID('btnInsert');
 	var btnFind = getID('btnFind');
 	var btnSelect = getID('btnSelect');
 	var btnSave = getID('btnSave');
 	var btnFindZip = getID('btnFindZip');
 	
 	// 다음 우편번호 검색 API를 사용한 주소 찾기
 	if(btnFindZip != null){
 		btnFindZip.onclick = function(){
 			var frm = document.frm_member;
 			new daum.Postcode({
 				oncomplete : function(data){
 					frm.zipcode.value = data.zonecode;
 					frm.address.value = data.address;
 				}
 			}).open();
 		}
 	}
 	
 	
 	
 	
 	if(btnSelect != null){
 		btnSelect.onclick = function(){
 			var frm = document.frm_member;
 			//frm.enctype = 'multipart/form-data;
 			frm.action = url + 'select.jsp';
 			frm.submit();
 		}
 	}
 	
 	
 	if(btnFind != null){
 		btnFind.onclick = function(){
 			var frm = document.frm_member;
 			frm.action = url + 'select.jsp';
 			frm.nowPage.value = 1;
 			frm.submit();
 		}
 	}
 	
 	
 	//$('#btnInsert').on('click',function(){...});
 	if(btnInsert != null){
 	 btnInsert.onclick = function(){
 	 		var frm = document.frm_member;
 	 		frm.action = url + 'insert.jsp';
 	 		frm.submit();	
 		}
 	}
 }
 
 function goPage(page){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/select.jsp';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/view.jsp';
	frm.mid.value = mid;
	frm.submit();
}
```

졸리다;;;으엉..

# 5교시

```jsp
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
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required /><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required /><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'  required /><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14' /><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required />
		<input type='button' name='btnZipcode' value='우편번호검색' id='btnFindZip'/>
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required /> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'/>
		<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
		<hr/>
		
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록으로' id='btnSelect' />
			
			<input type='text' name='findStr' value='${param.findStr }' />
			<input type='text' name='nowPage' value='${param.nowPage }' />
			
		</div>
	</form>

</div>
<script>member()</script>
</body>
</html>
```

```jsp
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
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		
		<div class='btns'>
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
	</form>
</div>
<script>member()</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form name='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' readOnly required/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  reddquired/><br/>
		
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required />
		<input type='button' name='btnZipcode' value='우편번호검색' id='btnFindZip'/>
		<br/>
	
		<label>주소</label>
		<input type='text' name='address' size='60'  required /> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' /><br/>
		<label></label>
		<img src='http://placehold.it/200x140' id='photo' width='200px'height='140px'/>
		<hr/>

		<input type='hidden' name='pwd' /><br/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		
	</form>

</div>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<input type='text' name='mid' disabled size='10'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' disabled size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60' /> <br/>
		
		<label></label>
		<img src='http://placehold.it/200x140' />
		<hr/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='목록으로' id='btnSelect' />	
		</div>
	
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
	</form>

</div>
<script>member()</script>
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
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h3>회원관리</h3>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr' value='${param.findStr }'>
			<input type='button' value='검색' id='btnFind'/>
			<input type='text' name='nowPage' value='${param.nowPage }'/>
			<input type='text' name='mid' />
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
		<c:forEach var='vo' begin='1' end='10'>
			<div class='item' onclick="view('${vo}')">
				<span class='no'>${vo }</span>
				<span class='mid'>hong</span>
				<span class='name'>홍길동</span>
				<span class='email'>hong@jobt.kr</span>
				<span class='mdate'>2020-01-01</span>
			</div>
		</c:forEach>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' onclick='goPage(1)'/>
		<input type='button' value='이전' id='btnPrev' onclick='goPage()'/>
	
		<c:forEach var="i" begin='1' end='5'>	
			<input type='button' value='${i }' 
				"${(param.nowPage==i)? 'disabled' : '' }"  
				onclick='goPage(${i})' />
		</c:forEach>
		
		<input type='button' value='다음' id='btnNext' onclick='goPage()'/>
		<input type='button' value='맨끝' id='btnLast' onclick='goPage()'/>
	
	</div>
	
</div>
<script>member()</script>	
</body>
</html>
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
 function getID(id){ return document.getElementById(id)}
 
 var member = function(){
 	let url = 'index.jsp?inc=./member/';
 	
 	var btnInsert = getID('btnInsert');
 	var btnFind = getID('btnFind');
 	var btnSelect = getID('btnSelect');
 	var btnSave = getID('btnSave');
 	var btnFindZip = getID('btnFindZip');
 	var btnPhoto = getID('btnPhoto');
 	var btnModify = getID('btnModify');
 	var btnUpdate = getID('btnUpdate');
 	
 	if(btnUpdate != null){
 		btnUpdate.onclick = function(){
 		//frm.enctype = 'multipart/form-date';
 			var frm = document.frm_member;
 			frm.action = url + 'result.jsp';
 			frm.submit();
 		}
	}

 			
 	
 	if(btnModify != null){
 		btnModify.onclick = function(){
 			var frm = document.frm_member;
 			frm.action = url + 'updata.jsp';
 			frm.submit();
 		}
 	}
 	
 	// 이미지 파일 미리보기
 	if(btnPhoto != null){
 		btnPhoto.onchange = function(){
 			var tag = ev.srcElment; // 이벤트 발생한 태그
 			var url = tag.files[0]; // 태그의 이름
 			var reader = new FileReader();
 			reader.readAsDataURL(url);
 			reader.onload = function(e){
 				var img = new Image();
 				img.src = e.target.result;
 				var photo = getID('photo');
 				photo.src = img.src;			
 			}
 		}
 	}
 	
 	
 	
 	
 	// 다음 우편번호 검색 API를 사용한 주소 찾기
 	if(btnFindZip != null){
 		btnFindZip.onclick = function(){
 			var frm = document.frm_member;
 			new daum.Postcode({
 				oncomplete : function(data){
 					frm.zipcode.value = data.zonecode;
 					frm.address.value = data.address;
 				}
 			}).open();
 		}
 	}
 	
 	
 	
 	
 	if(btnSave != null){
 		btnSave.onclick = function(){
 			var frm = document.frm_member;
 			//frm.enctype = 'multipart/form-data;
 			frm.action = url + 'select.jsp';
 			frm.submit();
 		}
 	}
 	
 	
 	if(btnFind != null){
 		btnFind.onclick = function(){
 			var frm = document.frm_member;
 			frm.action = url + 'select.jsp';
 			frm.nowPage.value = 1;
 			frm.submit();
 		}
 	}
 	
 	
 	//$('#btnInsert').on('click',function(){...});
 	if(btnInsert != null){
 	 btnInsert.onclick = function(){
 	 		var frm = document.frm_member;
 	 		frm.action = url + 'insert.jsp';
 	 		frm.submit();	
 		}
 	}
 }
 
 function goPage(page){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/select.jsp';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/view.jsp';
	frm.mid.value = mid;
	frm.submit();
}
```

# 6교시

디버깅으로만 30분 보냄^^

```java
package bean;

public class MemberVo {
	String mid;
	String pwd;
	String name;
	String email;
	String phone;
	String zipcode;
	String address;
	String photo;
	String delFile;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDelFile() {
		return delFile;
	}
	public void setDelFile(String delFile) {
		this.delFile = delFile;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>

</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' readOnly required/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  reddquired/><br/>
		
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required/>
		<input type='button' value='우편번호 검색' name='btnZipcode' id='btnFindZip' />
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required /> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'/><br/>
		<label></label>
		<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
		<hr/>

		<input type='hidden' name='pwd' /><br/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		
	</form>

</div>
<script>member()</script>
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
<title>회원관리조회(select)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h3>회원관리</h3>
	<form name='frm_member' method='post' id='frm_member'>
		<input type='button' value='입력' id='btnInsert' />
		<div>
			<input type='text' name='findStr' class='findStr' value='${param.findStr }'>
			<input type='button' value='검색' id='btnFind'/>
			<input type='text' name='nowPage' value='${param.nowPage }'/>
			<input type='text' name='mid' />
		</div>
	</form>
	<div class='title'>
		<span class='no'>NO</span>
		<span class='mid'>아이디</span>
		<span class='name'>성명</span>
		<span class='email'>이메일</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='items'>
		<c:forEach var='vo' begin='1' end='10'>
			<div class='item' onclick="view('${vo}')">
				<span class='no'>${vo }</span>
				<span class='mid'>hong</span>
				<span class='name'>홍길동</span>
				<span class='email'>hong@jobt.kr</span>
				<span class='mdate'>2020-01-01</span>
			</div>
		</c:forEach>
	</div>
	
	<div class='paging'>
		<input type='button' value='맨첨' id='btnFirst' onclick='goPage(1)'/>
		<input type='button' value='이전' id='btnPrev' onclick='goPage()'/>
	
		<c:forEach var="i" begin='1' end='5'>	
			<input type='button' value='${i }' 
				"${(param.nowPage==i)? 'disabled' : '' }"  
				onclick='goPage(${i})' />
		</c:forEach>
		
		<input type='button' value='다음' id='btnNext' onclick='goPage()'/>
		<input type='button' value='맨끝' id='btnLast' onclick='goPage()'/>
	
	</div>
	
</div>
<script>member()</script>	
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>

</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' readOnly required/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  reddquired/><br/>
		
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required/>
		<input type='button' value='우편번호 검색' name='btnZipcode' id='btnFindZip' />
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required /> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'/><br/>
		<label></label>
		<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
		<hr/>

		<input type='hidden' name='pwd' /><br/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		
	</form>

</div>
<script>member()</script>
</body>
</html>
```

```jsp
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
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
	
		<div class='btns'>
			<input type='button' value='목록으로' id='btnSelect' />
		</div>		
	</form>
</div>
<script>member()</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<input type='text' name='mid' disabled size='10'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' disabled size='15' /><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6' /><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60' /> <br/>
		
		<label></label>
		<img src='http://placehold.it/200x140' />
		<hr/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
	</form>

</div>
<script>member()</script>
</body>
</html>
```

```css
@charset "UTF-8";

/*--------------공통부분----------------*/
#member .btns{
	text-align:center;
}
#member .btns>input{
	border:1px solid #ddc;
	border-radius:10px;
}

#member .result_msg{
	margin:60px auto;
	width:400px;
	border:2px solid #f55;
	border-radius:20px;
	padding:20px;
	box-sizing:border-box;
	text-align:center;
	box-shadow:3px 3px 7px #999;
}


#member{
	width:100%;
	padding-right:20px;
	box-sizing:border-box;
}

#member #frm_member input{
	border:1px solid #bbb;
	border-radius:10px;
}

#member #frm_member>div{
	display: inline-block;
	float:right;
}

#member .title{
	margin-top:6px;
	background-color:#555;
	padding:4px 0;
	color:#fff;
}
#member span{
	display:inline-block;
}
#member .no{width:70px;}
#member .mid{width:100px;}
#member .name{width:120px;}
#member .email{width:200px;}
#member .mdate{width:110px;}

#member .items>div{
	line-height:25px;
}
#member .items>div:hover{
	background-color:#bbb;
	cursor:pointer;
}

#member .items>div:last-child{
	border-bottom:2px solid #aaa;
	margin-bottom:10px;
}

#member .paging{
	text-align:center;
}
#member .paging>input{
	border:1px sloid #eee;
	border-radius:10px;
}

#member .paging>input:hover{
	cursor:pointer;
}

/*------------insert-----------------*/
#member .insert{
	position:relative;
}
#member .insert>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .insert>img{
	position:absolute;
	top:5px;
	right:25px;
}


/*-----------update-------------------*/
#member .update>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}

#member .update img{
	margin-top : 10px;
}

/*----------view--------------------*/
#member .view>label{
	display:inline-block;
	width:90px;
	text-align:right;
	line-height:24px;
}
#member .view img{
	margin-top:10px;
}
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
 function getID(id){ return document.getElementById(id)}

var member = function(){
	let url = 'index.jsp?inc=./member/';
	
	var btnInsert = getID('btnInsert');
	var btnFind   = getID('btnFind');
	var btnSelect = getID('btnSelect');
	var btnSave   = getID('btnSave');
	var btnFindZip = getID('btnFindZip');
	var btnPhoto  = getID('btnPhoto');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnDelete = getID('btnDelete');
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var frm = document.frm_member;
			var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요");
			if(pwd != null){
				frm.action = url + 'result.jsp';
				frm.submit();
			}
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			//frm.enctype = 'multipart/form-data';
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'update.jsp';
			frm.submit();
		}
	}
	
	
	
	// 이미지 파일 미리보기
	if(btnPhoto != null){
		btnPhoto.onchange = function(ev){
			var tag = ev.srcElement; // 이벤트 발생한 태그
			var url = tag.files[0]; // 선택된 파일명
			var reader = new FileReader();
			reader.readAsDataURL(url);
			reader.onload = function(e){
				var img = new Image();
				img.src = e.target.result;
				var photo = getID('photo');
				photo.src = img.src;
			}
		}
	}
	
	
	
	
	// 다음 우편번호 검색 API를 사용한 주소 찾기
	if(btnFindZip != null){
		btnFindZip.onclick = function(){
			var frm = document.frm_member;
			new daum.Postcode({
				oncomplete : function(data){
					frm.zipcode.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			var frm = document.frm_member;
			//frm.enctype = 'multipart/form-data';
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'select.jsp';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'select.jsp';
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/select.jsp';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'index.jsp?inc=./member/view.jsp';
	frm.mid.value = mid;
	frm.submit();
}
```

```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	Connection conn;	//database의 연결정보
	PreparedStatement ps;	//문자열로 되어 있는 sql 문장을 sql 실행문장
	ResultSet rs;	// select문의 실행 결과
	public MemberDao() {
		
		conn = new Application().getConn();
		
	}
	public boolean login(String mid, String pwd) {
		boolean b = false;
		try {
			String sql = "select count(mid) cnt from members where mid=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt >=1) {
					b=true;
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
	insert(){  }
	update(){  }
	delete(){  }
	select(){  }
	view(){    }
	
	
	
}
```

# 7교시 

```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	Connection conn;	//database의 연결정보
	PreparedStatement ps;	//문자열로 되어 있는 sql 문장을 sql 실행문장
	ResultSet rs;	// select문의 실행 결과
	public MemberDao() {
		
		conn = new Application().getConn();
		
	}
	public boolean login(String mid, String pwd) {
		boolean b = false;
		try {
			String sql = "select count(mid) cnt from members where mid=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt >=1) {
					b=true;
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
	public List<MemberVo> select(){
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	/*
	insert(){  }
	update(){  }
	delete(){  }
	select(){  }
	view(){    }
	*/
	
	
}
```

```java
package bean;

public class Page {
	int totListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize=10;
	int blockSize=5;
	
	String findStr;
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}

	public void pageCompute() {
		totPage = (int)(Math.ceil(totListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = 
	}
	
	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	
	
	
	
}
```

# 마지막 8교시 ~오예

```java
package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/member.do")
public class MemberServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}

}
```

```java
package bean;

public class Page {
	int totListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize=10;
	int blockSize=5;
	
	String findStr;
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}

	public void pageCompute() {
		totPage = (int)(Math.ceil(totListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if(endNo>totListSize) endNo = totListSize;
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
		if(endPage>totPage) endPage = totPage;
	}
	
	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	
	
	
	
}
```

```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	Connection conn;	//database의 연결정보
	PreparedStatement ps;	//문자열로 되어 있는 sql 문장을 sql 실행문장
	ResultSet rs;	// select문의 실행 결과
	public MemberDao() {
		
		conn = new Application().getConn();
		
	}
	public boolean login(String mid, String pwd) {
		boolean b = false;
		try {
			String sql = "select count(mid) cnt from members where mid=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt >=1) {
					b=true;
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
	public List<MemberVo> select(){
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public String insert(MemberVo vo){
		String msg = "회원 정보가 정상적으로 저장되었습니다.";
		try {
			
		}catch (Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}
	public String update(MemberVo vo){
		String msg = "회원 정보가 정상적으로 수정되었습니다.";
		try {
			
		}catch (Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}
	
	public String delete(MemberVo vo){
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		try {
			
		}catch (Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}
	public MemberVo view(String mid) {
		MemberVo vo = new MemberVo();
		try {
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	
	
}
```