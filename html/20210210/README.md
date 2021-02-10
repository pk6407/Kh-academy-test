# 1교시

[프로젝트]Full time

- spring boot 게시판 코드를 완성-> 우리반 게시판에 게시
- 스토리보드 완성해봐라 꼭 -> 와이어프레임으로 

mybatis작업시 Transaction부분 이 빠져잇엇음.
[Transaction 처리절차]
1. application.properties에 추가
- spring.datasource.auto-commit=false
2. Service class에서
a) 필드 추가
@Autowired
Platform TransactionManager manager
b) insert,update,delete 작업시
TranssactionStatus status = manager.getTransaction(new DefaultTransactionDefinition());
//insert,update,delete 수행
manager.commit() or manager.rollback(status)

application.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

#spring.mvc.static-locations=
#spring.mvc.static-path-pattern=/resources/**

# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle
spring.datasource.auto-commit=false

# mybatis mapper
mybatis.type-aliases-package=kr.jobtc.mybatis, kr.jobtc.board
mybatis.mapper-locations=static/mapper/*.xml

# connection pool(TomcatCP)
#spring.datasource.tomcat.max-active=100
#spring.datasource.tomcat.max-idle=50
#spring.datasource.tomcat.initial-size=10

# spring boot 2.x connection pool(HikariCP) 1/1000
spring.datasource.hikari.maxPoolSize=20
spring.datasource.hikari.connectionTimeout=60000

#file upload
spring.servlet.multipart.max-request-size=300MB
spring.servlet.multipart.max-file-size=50MB
```

board.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
   
<mapper namespace="kr.jobtc.mybatis.BoardMapper">
	<select id="view" resultType="BoardVo" parameterType="int">
		select * from board where serial = #{_parameter}
	</select>
	
	
	<select id="selectAtt" resultType="BoardAttVo" parameterType="int">
		select * from boardAtt where pserial = #{_parameter}
	</select>
	
	<select id="totListSize" resultType='int' parameterType="Page">
		select count(serial) from board
		where subject like '%${findStr}%' or doc like '%${findStr}%'
	</select>
	<select id="select" resultType="BoardVo" parameterType="Page">
		<![CDATA[
		select * from (
			select rownum rno, m.* from
			   ( select b.serial , b.mid, b.mdate, b.hit,
			    	   lpad(' ', (level-1)*6+1, '&nbsp;&nbsp;') || decode(level, 1, '', '└ ') || b.subject subject,
			    	(select count(serial) cnt from boardAtt where pserial=b.serial) attCnt 
				from board b where subject like '%${findStr}%' or doc like '%${findStr}%' 
				connect by prior serial = pserial
				start with pserial is null
				order siblings by serial desc ) m
		) where rno between #{startNo} and #{endNo}
		]]>	 
	</select>

	<select id='replCheck' parameterType='Integer' resultType='Integer'>
		select count(serial) from board where pserial = #{_parameter}
	</select>
	


	<insert id="insert" parameterType="BoardVo">
		insert all
		into board(serial, mid, pwd, subject, doc, mdate, hit) 
		values(seq_board.nextval, #{mid} , #{pwd},  #{subject} , #{doc}, sysdate, 0 )
		<if test="attList != null">
			<foreach collection="attList" item="att">
				into boardAtt(serial, pserial, sysfile, orifile)
				values(getBoardAttSeq(), seq_board.currval, #{att.sysFile}, #{att.oriFile} )
			</foreach>
		</if>
		select * from dual
	</insert>

	<insert id="insertRepl" parameterType="BoardVo">
		insert all
		into board(serial, mid, pwd, subject, doc, mdate, hit, pSerial) 
		values(seq_board.nextval, #{mid} , #{pwd},  #{subject} , #{doc}, sysdate, 0, #{pSerial} )
		<if test="attList != null">
			<foreach collection="attList" item="att">
				into boardAtt(serial, pserial, sysfile, orifile)
				values(getBoardAttSeq(), seq_board.currval, #{att.sysFile}, #{att.oriFile} )
			</foreach>
		</if>
		select * from dual
	</insert>

	<insert id="insertAtt" parameterType="BoardVo">
		insert all
		<foreach collection="attList" item="att">
			into boardAtt(serial, pserial, sysfile, orifile)
			values(getBoardAttSeq(), #{serial}, #{att.sysFile}, #{att.oriFile} )
		</foreach>	
		select * from dual
	</insert>


	<update id="update" parameterType="BoardVo">
		update board set subject=#{subject}, doc=#{doc} where serial = #{serial} and pwd=#{pwd}
	</update>

	<delete id="delete" parameterType="BoardVo">
		delete from board where serial=#{serial} and pwd=#{pwd}
	</delete>
	
	<delete id="deleteAttPserial" parameterType="Integer">
		delete from boardAtt where pSerial = #{_parameter}
	</delete>
	
	<delete id="deleteAtt" parameterType="BoardVo">
		delete from boardAtt
		<where>
			<foreach collection="delFiles" item="att" separator="or">
				sysfile = #{att.sysFile}
			</foreach>
		</where>
	</delete>
	


</mapper> 
```

file_upload.js

```js
/**
 * 파일 첨부및 이미지 미리보기
 * 작성일 :2020.12.30
 * 작성자 : 김남호
 */

var fileAttCnt =1;
var fileUpload = function(attZone){
	var zone = document.getElementById(attZone);
	append(zone);
}
function append(zone){
	var style_div = "border:1px solid #00f;width:120px;height:100px;"
		+ "display:inline-block;position:relative;margin-right:4px;";
	var style_delBtn = "position:absolute;bottom:2px;right:2px;border-width:0;"
		+ "font-size:40px;color:#f00;opacity:0.3;background-color:rgba(0,0,0,0)";

	//이미지, file tag, button을 포함하고 있는 div
	var div = document.createElement("div");
	div.setAttribute("style", style_div);

	var img = document.createElement("img");
	img.setAttribute("src", "http://placehold.it/120x100");
	img.setAttribute("width", "120px");
	img.setAttribute("height", "100px");
	div.appendChild(img);
	img.onclick = function(ev){
		imagePreView(zone,ev);
	}
	
	var file = document.createElement("input");
	file.setAttribute("type", "file");
	file.setAttribute("name", "attfile" + fileAttCnt);
	file.setAttribute("style" , "display:none;");
	file.setAttribute("modify", "no"); //파일의 선택여부를 체크
	file.setAttribute("class", "attfile");
	fileAttCnt++;
	
	
	var delBtn = document.createElement("input");
	delBtn.setAttribute("type", "button");
	delBtn.setAttribute("value", "X");
	delBtn.setAttribute("style", style_delBtn);
	delBtn.onclick = function(ev){
		if(zone.childNodes.length <=1) return;
		
		var ele = ev.srcElement; //이벤트가 발생한 태그
		var p = ele.parentNode;
		var file = p.getElementsByClassName("attfile").item(0);
		if(file.getAttribute("modify") == "yes"){
			zone.removeChild(p);
		}
	}
	
	div.appendChild(file);
	div.appendChild(delBtn);
	
	zone.appendChild(div);
}
function imagePreView(zone, ev){
	var tag = ev.srcElement;
	var pDiv = tag.parentNode;
	var file = pDiv.getElementsByClassName("attfile").item(0);
	file.click();
	
	file.onchange = function(ev2){
		if(file.getAttribute("modify") == "no"){
			append(zone);
		}
		
		var url = ev2.srcElement.files[0];
		var reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload = function(ev3){
			tag.src = ev3.target.result;
			file.setAttribute("modify", "yes");
		}
	}
}
```

board.js

```js
/**
 * 게시판에서 사용하는 스크립트
 * date : 2021.02.09
 */
//즉시 실행하는 함수

brd = function() {
	$('#btnFind').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();

		$.ajax({
			url      : '/bSelect',
			data     : param,
			dataType : 'html',
			method   : 'post',
			success  : function(data)  {
				$('#here').html(data)
			}

		});

	});


	$('#btnSelect').on('click', function() {
		var param = $('#frm_board').serialize();
		$('#here').load('/bSelect', param);
	});



	$('#btnInsert').on('click', function()  {
		var param = $('#frm_board').serialize();
		$('#here').load('/bInsert', param);

	});

	$('#btnSave').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.enctype  = 'multipart/form-data';

		var data = new FormData(frm);

		$.ajax({
			url        : '/bInsertR',
			data       : data,
			dataType   : 'html',
			method     : 'post',
			processData: false,
			contentType: false,
			success: function(data) {
				$('#here').html(data)
			}

		});

	});


	$('#btnReplSave').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.enctype = 'multipart/form-data';

		var data = new FormData(frm);

		$.ajax({
			url        : '/bReplR',
			data       : data,
			dataType   : 'html',
			method     : 'post',
			processData: false,
			contentType: false,
			success: function(data) {
				$('#here').html(data)
			}

		});

	});


	$('#btnRepl').on('click', function() {
		var param = $('#frm_board').serialize();
		$('#here').load('/bRepl', param);

	});


	$('#btnModifyR').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.enctype = 'multipart/form-data';
		var pwd = prompt("수정하려면 암호를 입력하세요");

		if (pwd != null) {
			frm.pwd.value = pwd;
			var data = new FormData(frm);

			$.ajax({
				url        : '/bModifyR',
				data       : data,
				dataType   : 'html',
				method     : 'post',
				processData: false,
				contentType: false,
				success: function(data) {
					$('#here').html(data)
				}

			});
		}
	});


	$('#btnModify').on('click', function() {
		var param = $('#frm_board').serialize();
		$('#here').load('/bModify', param);

	});

	$('#btnDelete').on('click', function() {
		var frm = $('#frm_board')[0];
		var pwd = prompt("정말 삭제하시려면 암호를 ???");
		if (pwd != null) {
			frm.pwd.value = pwd;
			var param = $('#frm_board').serialize();
			$('#here').load('/bDelete', param);
		}

	});



};


brd.goPage = function goPage(page) {
	var frm = $('#frm_board')[0];
	frm.nowPage.value = page;
	var param = $(frm).serialize();

	$('#here').load('/bSelect', param);


}

brd.view = function view(serial) {
	var frm = $('#frm_board')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();

	$.ajax({
		url: '/bView',
		data: param,
		method: 'post',
		success: function(data) {
			$('#here').html(data);
		}
	})

}
```

index.css

```css
@charset "UTF-8";

*{
	margin:0;
	padding:0;
	box-sizing: border-box;
}

#index{
	width: 1000px;
	margin:10px auto;
	border:1px solid #aaa;
	min-height:100px;
}

#index ul{
	list-style: none;
}

#index a{
	text-decoration: none;
}

#index ul li{
	width:120px;
	padding:4px 0;
	text-align: center;	
}
#index ul li:hover{
	background-color:#666;
	color:#fff;
}

#index #header{
	height: 150px;
	background-color: #ccc;
}
#index #menu{
	padding:10px;
	background-color:#bbb;
}

#index #here{
	min-height: 200px;
	padding:15px;
}

#index #footer{
	background-color: #aaa;	
	padding:40px;
	text-align: center;
}
```

board.css

```css
@charset "UTF-8";

/*--------- 공통 부분 -------------- */
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
	text-align: right;
}

#board #attach_zone{
	margin-top:7px;
	display: inline-block;
	
}
/* select -------------------*/
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
#board .no { width:55px;text-align:right;margin-right:15px;font-size:10pt;}
#board .subject { width:250px;}
#board .mid{ width:90px;}
#board .mdate{width:100px;}
#board .hit{ width:70px;text-align:right}

#board .btns{
	border-top: 2px solid #aaa;
	margin-top:3px;
	padding-top:10px;
	text-align: center;
}


#board .item:hover{
	background-color:#eee;
	cursor: pointer;
}

/* insert ----------------- */
#board form input[name=subject]{
	width: 500px;
}
#board form textarea[name=doc]{
	padding-top:0px;
	margin-top:4px;
	width: 500px;
	height:150px;
}

/* update ------------*/
#board form .inner{
	display: inline-block;
}

#board .attach_old{
	position: relative;
	width:120px;
	height:100px;
}
#board .attach_old input[type=checkbox]{
	position: absolute;
	right:3px;
	bottom:3px;
	width:30px;
	height:30px;
	opacity:0.3;
}
/* result -------------*/

#board #msg{
	width:300px;
	margin:auto;
	background-color:#eee;
	border:2px solid #ccc;
	box-shadow: 2px 2px 3px #bbb;
	text-align: center;
	padding:30px;
	box-sizing: border-box;
	border-radius:15px;
}

#board .frm_msg{
	margin-top:20px;
	text-align: center;
}
```

view.jsp

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
```

update.jsp

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
	<form name='frm_board' id='frm_board' method='post'>
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
	brd();
	fileUpload('attach_zone');	
</script>
</body>
</html>
```

select.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='css/board.css'>

<script src='js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판1</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<input type='button' id='btnInsert' value='입력'>
		<input type='hidden' name='nowPage' value='${(empty page.nowPage)? 1 : page.nowPage }' />
		<input type='hidden' name='serial'  value='0'/>
		<div class='find'>
			<input type='text' name='findStr' id='findStr' value='${page.findStr }'>
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
		<c:forEach var='vo' items='${list }'>
			<div class='item' onclick="brd.view(${vo.serial})">
				<span class='no'>${vo.serial}</span>
				<span class='subject'>${vo.subject }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='mdate'>${vo.mdate }</span>
				<span class='hit'>${vo.hit }</span>
			</div>					
		</c:forEach>
	</div>	
	
	<div class='btns'>
		<input type='button' value='맨점' onclick='brd.goPage(1)'>
		<input type='button' value='이전' onclick='brd.goPage(${page.startPage-1})'>
		
		<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
				<input type='button' value='${i }' onclick='brd.goPage(${i})'>
		</c:forEach>

		<input type='button' value='다음' onclick = 'brd.goPage(${page.endPage+1})'>
		<input type='button' value='맨끝' onclick = 'brd.goPage(${page.totPage})'>
	</div>
</div>

<script>brd()</script>
</body>
</html>
```

result.jsp

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
		${msg }
	</div>
	<form name='frm_board' id='frm_board' method='post' class='frm_msg'>
		<input type='button' value='목록' id='btnSelect' />
		<input type='hidden' name='findStr' value='${page.findStr }' />
		<input type='hidden' name='nowPage' value='${page.nowPage }' />
	</form>
</div>

<script>brd()</script>
</body>
</html>
```

repl.jsp

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
	<form name='frm_board' id='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80'></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>첨부</label>
		<div id='attach_zone'></div>
	
		<div class='btns'>
			<input type='button' value='댓글저장' id='btnReplSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${page.findStr }'/>
		<input type='hidden' name='nowPage' value='${page.nowPage }'/>
		<input type='hidden' name='serial'  value='${vo.serial }'/>
		
	</form>
</div>


<script>
	brd();
	fileUpload('attach_zone');	
</script>
</body>
</html>
```

insert.jsp

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
<script src='./js/file_upload.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' value='${sessionScope.mid }' 
		       placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc' te></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label></label>
		<div id='attach_zone'></div>
	
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${page.findStr }'/>
		<input type='hidden' name='nowPage' value='${page.nowPage }' />
		
	</form>
</div>


<script>
	brd()
	fileUpload('attach_zone');	
</script>
</body>
</html>
```

index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring boot final Example</title>
<link rel='stylesheet' type='text/css' href='css/index.css'/>
<link rel='stylesheet' type='text/css' href='css/board.css'>



<script src="https://code.jquery.com/jquery-3.5.1.js" 
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
        crossorigin="anonymous"></script>

<script src='js/index.js'></script>
<script src='js/board.js'></script>

</head>
<body>
<div id='index'>
	<header id='header'>
		<h2>Spring boot final Example</h2>
	</header>
	<nav id='menu'>
		<ul>
			<li><a href='#' onclick="goURL('/bSelect')">공지사항</a></li>
		</ul>
	</nav>
	<section id='here'>
	
	</section>

	<footer id='footer'>
		좋은우리 주식회사
	</footer>

</div>


</body>
</html>
```

FileUploadController.java

```java
package kr.jobtc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardAttVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@Service
public class FileUploadController {
	public static String saveDir = "C:\\Users\\asdas\\workspace-spring-boot\\kh-spring-boot\\src\\main\\webapp\\WEB-INF\\upload\\";

	public List<BoardAttVo> upload(List<MultipartFile> mul) {
		String msg = "";
		List<BoardAttVo> attFiles = new ArrayList<BoardAttVo>();
		
		
		try {
			for(MultipartFile m : mul) {
				File oriFile = new File(saveDir + m.getOriginalFilename());
				System.out.println(oriFile.toString());
				//file upload
				m.transferTo(oriFile);
				
				BoardAttVo v = new BoardAttVo();
				v.setOriFile(m.getOriginalFilename());

				attFiles.add(v);
				
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return attFiles;
	}
	
}
```

MainController.java

```java
package kr.jobtc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardDao;

@RestController
public class MainController {

	@Autowired
	BoardDao dao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
}
```

BoardController.java

```java
package kr.jobtc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardAttVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@RestController
public class BoardController {
	
	//@Autowired
	//BoardService service; /* 중간 단계 하나 생략 ^^ */
	
	// BoardService에서 바로 BoardDao로 연결
	@Autowired
	BoardDao boardDao;
	@Autowired
	FileUploadController fc;

	@RequestMapping(value="/bSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = boardDao.select(page);

		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));

		mv.setViewName("board/select");
		
		return mv;
	}
	
	@RequestMapping(value="/bView" , method= {RequestMethod.POST})
	public ModelAndView view(BoardVo v, Page page) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = boardDao.view(v.getSerial());

		System.out.println("BoardController.view()..........................");
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		

		
		mv.addObject("vo", vo);		
		mv.addObject("page", page);
		mv.setViewName("board/view");
		return mv;
	}
	
	
		
	
	@RequestMapping(value="/bInsert" , method= {RequestMethod.GET})
	public ModelAndView insert(Page page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		mv.setViewName("board/insert");
		return mv;
	}
	
	@RequestMapping(value="/bInsertR", method=RequestMethod.POST)
	public ModelAndView insertR(@RequestParam("attFile") List<MultipartFile> mul, 
								@ModelAttribute BoardVo vo, @ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<BoardAttVo> attList = fc.upload(mul);
		
		vo.setAttList(attList);
		
		msg = boardDao.insert(vo);
		
		
		return mv;
	}
	

	@RequestMapping(value="/bModify" , method= {RequestMethod.GET})
	public ModelAndView modify(BoardVo v, Page page) {
		ModelAndView mv = new ModelAndView();
		
		BoardVo vo = boardDao.view(v.getSerial());
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board/update");
		return mv;
	}
	
	@RequestMapping(value="/bModifyR" , method= {RequestMethod.POST})
	public ModelAndView modifyR(@RequestParam("attFile") List<MultipartFile> mul, 
								@ModelAttribute BoardVo vo, @ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardAttVo> attList = fc.upload(mul);
		vo.setAttList(attList);
		
		String msg = boardDao.update(vo);
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}

	
	@RequestMapping(value="/bDelete" , method= {RequestMethod.POST})
	public ModelAndView deleteR(BoardVo vo, Page page) {
		ModelAndView mv = new ModelAndView();
		
		String msg = boardDao.delete(vo);
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}
	

	@RequestMapping(value="/bRepl" , method= {RequestMethod.GET})
	public ModelAndView repl(BoardVo v, Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", v);
		mv.addObject("page", page);
		mv.setViewName("board/repl");
		return mv;
	}
	
	@RequestMapping(value="/bReplR" , method= {RequestMethod.POST})
	public ModelAndView replR(@RequestParam("attFile") List<MultipartFile> mul, 
								@ModelAttribute BoardVo vo, @ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardAttVo> attList = fc.upload(mul);
		vo.setAttList(attList);
		
		
		String msg = boardDao.insertRepl(vo);
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}
	
	
}
```

BoardService.java

```java
/* 
 * package kr.jobtc.mybatis;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.stereotype.Service; import
 * org.springframework.transaction.annotation.Transactional;
 * 
 * import kr.jobtc.board.BoardDao; import kr.jobtc.board.BoardVo; import
 * kr.jobtc.board.Page;
 * 
 * @Service
 * 
 * @Transactional public class BoardService { // Mapper를 실행시킴
 * 
 * @Autowired BoardMapper mapper;
 * 
 * @Autowired BoardDao dao;
 * 
 * public List<BoardVo> select(Page page){ int totListSize =
 * mapper.totListSize(page); page.setTotListSize(totListSize);
 * page.pageCompute();
 * 
 * List<BoardVo> list = mapper.select(page);
 * System.out.println("BoardService.select()......");
 * 
 * for(BoardVo v : list) { System.out.println(v.getSubject()); }
 * 
 * return list; }
 * 
 * public String insert(BoardVo vo) { String msg = "게시물이 정상적으로 입력됨."; int cnt =
 * mapper.insert(vo);
 * 
 * return msg; }
 * 
 * }
 */
```

BoardMapper.java

```java
package kr.jobtc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.jobtc.board.BoardAttVo;
import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@Repository
@Mapper
public interface BoardMapper {
	public BoardVo view(int serial);
	
	// List<String> list = sqlSession.selectList("kr.jobtc.mybatis.BoardMapper.select", "hong");
	public List<BoardVo> select(Page page);
	public List<BoardAttVo> selectAtt(int pSerial);
	public int totListSize(Page page);
	public int replCheck(int pSerial);
	
	public int insert(BoardVo vo);
	public int insertRepl(BoardVo vo);
	public int insertAtt(BoardVo vo);
	
	public int update(BoardVo vo);
	
	public int delete(BoardVo vo);
	public int deleteAttPserial(int pSerial);
	public int deleteAtt(BoardVo vo);
}
```

BoardAttVo.java

```java
package kr.jobtc.board;

public class BoardAttVo {
	int serial;
	int pSerial;
	String oriFile;
	String sysFile;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public String getOriFile() {
		return oriFile;
	}
	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}
	public String getSysFile() {
		return sysFile;
	}
	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}
	
	
}
```

AppConfig.java

```java
package kr.jobtc;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;

//Spring boot에서 DI를 구성하는 또다른 방법

@Aspect
@Configuration
public class AppConfig {

	Logger logger = LoggerFactory.getLogger(AppConfig.class);
	BoardVo boardVo;
	
	// <bean id='boardDao' class='kr.jobtc.BoardDao'/>

	@Before("execution(* kr.jobtc.board.*.*(..))")
	public void before(JoinPoint point) {
		//일단 주석~
		//System.out.println("실행 메서드 이전에 처리될 내용");
		//logger.info("llll");
	}
	
}
```

BoardDao.java

```java
package kr.jobtc.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.jobtc.controller.FileUploadController;
import kr.jobtc.mybatis.BoardMapper;


@Service
@Transactional
public class BoardDao {

	@Autowired
	BoardMapper mapper;

	//transaction
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;

	/*
	 * public BoardDao() throws Exception { status = manager.getTransaction(new
	 * DefaultTransactionDefinition()); }
	 */	
	
	// insert -> att insert -> 오류시 첨부 파일 삭제
	public String insert(BoardVo vo) {
		String msg = "게시물이 저장되었습니다.";
		try {
			int cnt = mapper.insert(vo);
			
			if(cnt<1) {
				throw new Exception("게시물 저장중 오류 발생");
			}
			
		} catch (Exception ex) {
			manager.rollback(status);
			msg = ex.getMessage();
			
			delFile(vo.getAttList());
		} finally {
			manager.commit(status);
			return msg;
		}
	}
	
	// insert -> att insert -> 오류시 첨부파일 삭제
	public String insertRepl(BoardVo vo) {
		String msg = "댓글이 저장되었습니다.";
		try {
			int cnt = mapper.insertRepl(vo);
			
			if(cnt<1) {
				throw new Exception("댓글 저장중 오류 발생");
			}
			
		} catch (Exception ex) {
			manager.rollback(status);
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			manager.commit(status);
			return msg;
		}
	}

	// update -> att insert -> att delete -> file delete
	public String update(BoardVo vo) {
		String msg = "게시물이 수정되었습니다.";
		try {
			int cnt = mapper.update(vo);
			if(cnt>0) {
				if(vo.getAttList() != null) {
					cnt = mapper.insertAtt(vo);
					if(cnt<1) throw new Exception("첨부 저장중 오류 발생");
				}
				if(vo.getDelFiles() != null) {
					cnt = mapper.deleteAtt(vo);
					if(cnt<1) throw new Exception("첨부 파일 삭제중 오류 발생"); 
					delFile(vo.getDelFiles());
				}
			}else {
				throw new Exception("수정중 오류 발생");
			}
		} catch (Exception ex) {
			manager.rollback(status);
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			manager.commit(status);
			return msg;
		}
	}

	// 댓글 여부 체크
	// delete -> att delete -> file delete
	public String delete(BoardVo vo) {
		String msg = "게시물이 삭제되었습니다.";
		List<BoardAttVo> attList = null;
		try {
			attList = mapper.selectAtt(vo.getSerial());
			int cnt = mapper.delete(vo);
			if(cnt>0) {
				if(attList.size()>0) {
					cnt = mapper.deleteAttPserial(vo.getSerial());
					if(cnt<1) throw new Exception("게시물 첨부 삭제중 오류 발생");
					delFile(attList);
				}
			}else {
				throw new Exception("게시물 삭제중 오류 발생");
			}

		} catch (Exception ex) {
			msg = ex.getMessage();
			manager.rollback(status);
		} finally {
			manager.commit(status);
			return msg;
		}
	}


	public Map<String, Object> select(Page page) {
		
		System.out.println("BoardDao.select()..........................1");
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardVo> list = null;
		try {
			int totListSize = mapper.totListSize(page);
			page.setTotListSize(totListSize);
			page.pageCompute();

			System.out.println("BoardDao.select()..........................2");
			System.out.println(page.getNowPage());
			System.out.println(page.getFindStr());

			
			
			list = mapper.select(page);
			map.put("page", page);
			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return map;
		}
	}

	public BoardVo view(int serial) {
		BoardVo vo = null;
		List<BoardAttVo> attList = null;
		try {
			vo = mapper.view(serial);
			attList = mapper.selectAtt(serial);
			vo.setAttList(attList);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}

	public void delFile(List<BoardAttVo> delList) {
		System.out.println("delFile");
		for(BoardAttVo v : delList) {
			System.out.println(v.getSysFile());
			File f = new File(FileUploadController.saveDir + v.getSysFile());
			if(f.exists()) f.delete();
		}
	}
	


}
```
