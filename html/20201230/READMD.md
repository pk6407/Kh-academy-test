# 1교시
- 파일 미리보기

span태그에 display:inline-block주면 장점
 넓이 조절가능 옆에 태그하나를 둘수잇음

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
		<input type='text' name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage } ' />
		<input type='text' name='serial' value='0'/>
		<div class='find'>
			<input type='text' name='findStr' id='findStr' value='${param.findStr }'>
			<input type='button' name='btnFind' id='btnFind' value='조회'/>
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
				<span class='no'>${vo}</span>
				<span class='subject'>제목(10)</span>
				<span class='mid'>Park Wyan gi</span>
				<span class='mdate'>2020-12-30</span>
				<span class='hit'>999,999</span>
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

```css
@charset "UTF-8";

/*-----------공통부분--------------*/
#board{
	width:100%;
	padding:20px;
	box-sizing: border-box;
}
#boadr span{
	display: inline-block;
}

/* select ----------------------*/
#board>form>.find{
	display:inline-block;
	float:right;
}
#board .title{
	clear:both;
	background-color:#777;
	margin-top:3px;
	color:#fff;
	padding:2px;
	box-sizing: border-box;
}
#board .no { width:70px;text-align:rigth;}
#board .subject { width:250px;}
#board .mid{ width:90px;}
#board .mdate{ width:100px;}
#board .hit{ width:70px;text-align:rigth;}

#board .btns{
	border-top: 2px solid #aaa;
	margin-top:3px;
	padding-top:10px;
	text-align:center;
}
```

# 2교시

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
	<form name='frm_board' method='post' class='frm_msg'>
		<input type='button' value='목록' id='btnSelect' />
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
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
		<input type='text' name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage } ' />
		<input type='text' name='serial' value='0'/>
		<div class='find'>
			<input type='text' name='findStr' id='findStr' value='${param.findStr }'>
			<input type='button' name='btnFind' id='btnFind' value='조회'/>
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
				<span class='no'>${vo}</span>
				<span class='subject'>제목(10)</span>
				<span class='mid'>Park Wyan gi</span>
				<span class='mdate'>2020-12-30</span>
				<span class='hit'>999,999</span>
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

```css
@charset "UTF-8";

/*-----------공통부분--------------*/
#board{
	width:100%;
	padding:20px;
	box-sizing: border-box;
}
#board span{
	display: inline-block;
}

#board input[type=button]{
	border-radius: 12px;
	border : 1px solid #bbb;
	font-size:0.8em;
}

#board>form label{
	display: inline-block;
	width:60px;
	text-align:right;
}

#board #attach_zone{
	margin-top:7px;
	display: inline-block;
	
}
/* select ----------------------*/
#board>form>.find{
	display:inline-block;
	float:right;
}
#board .title{
	clear:both;
	background-color:#777;
	margin-top:3px;
	color:#fff;
	padding:2px;
	box-sizing: border-box;
}
#board .no { width:70px;text-align:right;}
#board .subject { width:250px;}
#board .mid{ width:90px;}
#board .mdate{ width:100px;}
#board .hit{ width:70px;text-align:right;}

#board .btns{
	border-top: 2px solid #aaa;
	margin-top:3px;
	padding-top:10px;
	text-align: center;
}

/* insert -------------------------*/
#board form input[name=subject]{
	width:500px;	
}
#board form textarea[name=doc]{
	padding-top:0px;
	margin-top:4px;
	width:500px;
	height:150px;
}

/* result ------------------------*/

#board #msg{
	width:300px;
	margin:auto;
	background-color:#eee;
	border:2px solid #ccc;
	box-shadow: 2px 2px 3px #bbb;
	text-align: center;
	padding:30px;
	box-sizing:border-box;
	border-radius:15px;
}

#board .frm_msg{
	margin-top:20px;
	text-align: center;
}
```

# 3교시 

- 첨부 이미지 미리보기 기능 구현
  - 기존 이미지를 클릭하면 파일 선택상자를 표시
  - 이미지가 추가되면 추가된 이미지를 삭제 하는 기능
  - 첨부 파일의 수는 제한이 없이 추가 가능하도록

```js
/**
 * 파일 첨부및 이미지 미리보기
 * 작성일 : 2020.12.30
 * 작성자 : 구른다?
 */
var fileUpload = function(attZone){
				  
	var zone = document.getElementById(attZone);
	
	append(zone);
}

function append(zone){
	var style_div = "border:1px solid #00f;width:120px;height:100px;"
		+ "display:inline-block;position:relative;margin-right:4px;";
	var style_delBtn = "position:absolute;bottom:2px;right:2px;border-width:0;";
		+ "font-size:40px;color:#f00;opacity:0.5;background-color:rgba(0,0,0,0)";
	//이미지, file tag, button을 포함하고 있는 div
	var div = document.createElement("div");
	div.setAttribute("style", style_div);
	div.onclick = function(){
		append(zone);
	}
	zone.appendChild(div);
	
	var delBtn = document.createElement("input");
	delBtn.setAttribute("type", "button");
	delBtn.setAttribute("value", "X");
	delBtn.setAttribute("style", style_delBtn);
	
	div.appendChild(delBtn);
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
```
