# 1교시

Spring + Mybatis => ajax로 변환

[프로젝트]
- 개발범위 확정 및 업무 분장
- 사용 기술 및 framework 선택

# 2교시

스프링에서 ajax 사용하기.pdf를 봐라..

# 3교시

index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
	        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
 	        crossorigin="anonymous"></script>
<script src='./js/index.js'></script>
</head>
<body>
<div id='index'>
	<h2>Spring Framework</h2>
	<div class='menu'>
		<a href='test.ddd'>Srping MVC Test</a>
		<a href='gugudan.ddd'>Spring MVC를 사용한 구구단</a>
		<a href='sum.ddd'>두수의 합</a>
		<a href='insert.mem'>회원가입</a>
		<a href='#' onclick='member.select()'>회원조회</a>
	</div>
	<div id='here'></div>
	
	<h4 class='footer'>디지털 웹 콘텐츠 융합 응용 SW 개발사</h4>
</div>
<script>member()</script>
</body>
</html>
```

member.js

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	
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
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
			
				if(frm.pwd.value != ''){
					frm.action = 'deleteR.mem';
					frm.mid.disabled=false;
					frm.submit();
				}
			}
			
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
				if(frm.pwd.value != ''){
					frm.enctype = 'multipart/form-data';
					frm.action = 'modifyR.mem'; //수정된 정보를 저장
					frm.submit();
				}
			}
		
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			frm.action = 'modify.mem';//수정화면이동
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
			var checkFlag=true;
			
			/*
			if(!frm.mid.checkValidity()){
				alert('mid');
				checkFlag=false;
			}else if(!frm.name.checkValidity()){
				alert('name');
				checkFlag=false;
			}else if(!frm.pwd.checkValidity()){
				alert('pwd');
				checkFlag=false;
			}else if(!frm.email.checkValidity()){
				alert('email');
				checkFlag=false;
			}else if(!frm.phone.checkValidity()){
				alert('phone');
				checkFlag=false;
			}
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			*/
			if(checkFlag){
				frm.enctype = 'multipart/form-data';
				frm.action = 'insertR.mem';
				alert(frm.mid.value);
				frm.submit();
			}
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'select.mem';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "select.mem";
			frm.nowPage.value = 1;
			member.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'insert.mem';
			frm.submit();
		}
	}
}//end of member()

member.goPage=function(page){
	var frm = document.frm_member;
	frm.action = 'select.mem';
	frm.nowPage.value = page;
	frm.submit();
}

member.view=function(mid){
	var frm = document.frm_member;
	frm.action = 'view.mem';
	frm.mid.value = mid;
	frm.submit();
}

// spring - > ajax로 호출
member.select = function(){
	$param = $('#frm_member').serialize();
	$.ajax({
		url	:	'select.mem',
		data	:	$param,
		dataType	:	'html', /*응답 데이터 */
		method	:	'POST',
		success	:	function(data){
			$('#here').html(data);
		}
	});
}
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
			<div class='item' onclick="view('${v.mid}')">
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
			<input type='button' value='맨첨' id='btnFirst' onclick='goPage(1)'/>
			<input type='button' value='이전' id='btnPrev'  onclick='goPage(${page.startPage-1})'/>
		</c:if>
	
		<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
			<input type='button' value='${i }' onclick='member.goPage(${i })'/>
		</c:forEach>	

		<c:if test="${page.endPage<page.totPage }">
			<input type='button' value='다음' id='btnNext'  onclick='goPage(${page.endPage+1 })'/>
			<input type='button' value='맨끝' id='btnLast'  onclick='goPage(${page.totPage})'/>
		</c:if>
	
	</div>	
</div>
<script>member()</script>
</body>
</html>
```

# 4교시

member.js

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	
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
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
			
				if(frm.pwd.value != ''){
					frm.action = 'deleteR.mem';
					frm.mid.disabled=false;
					frm.submit();
				}
			}
			
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
				if(frm.pwd.value != ''){
					frm.enctype = 'multipart/form-data';
					frm.action = 'modifyR.mem'; //수정된 정보를 저장
					frm.submit();
				}
			}
		
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			member.select('modify.mem');
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
			var checkFlag=true;
			
			/*
			if(!frm.mid.checkValidity()){
				alert('mid');
				checkFlag=false;
			}else if(!frm.name.checkValidity()){
				alert('name');
				checkFlag=false;
			}else if(!frm.pwd.checkValidity()){
				alert('pwd');
				checkFlag=false;
			}else if(!frm.email.checkValidity()){
				alert('email');
				checkFlag=false;
			}else if(!frm.phone.checkValidity()){
				alert('phone');
				checkFlag=false;
			}
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			*/
			if(checkFlag){
				frm.enctype = 'multipart/form-data';
				frm.action = 'insertR.mem';
				alert(frm.mid.value);
				frm.submit();
			}
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			member.select('select.mem');
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "select.mem";
			frm.nowPage.value = 1;
			member.select();
		}
	}
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			member.select('insert.mem');
		}
	}
}//end of member()

member.goPage=function(page){
	var frm = document.frm_member;
	frm.nowPage.value = page;
	member.select();
}

member.view=function(mid){
	var frm = document.frm_member;
	frm.mid.value = mid;
	member.select('view.mem');
}

// spring - > ajax로 호출
member.select = function(url){

	if(url ==null){
		url = 'select.mem';
	}
	
	$param = $('#frm_member').serialize();
	$.ajax({
		url : url,
		data : $param,
		dataType : 'html', /*응답 데이터*/
		method : 'POST',
		success : function(data){
			$('#here').html(data);
		}
	});
}
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
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' id='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' maxlength='10' required pattern='[\w!\-$]{3,10}'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required pattern='[a-zA-Z가-힣]{2,20}'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'  required pattern='[\w!\-$]{4,10}'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14' /><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' pattern='[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}'/><br/>
		
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

view.jsp

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
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' id='frm_member' method='post' class='view'>
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
					<img src='http://placehold.it/200X140' width='200px' height='140px' />
				</c:when>
				<c:otherwise>
					<a href='./upload/${vo.photo }' download = '${vo.photo }'>
						<img src='./upload/${vo.photo }' width='200px' height='140px'/>
					</a>
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
		
		<div id='password_zone'>
			<div>
				<input type='password' name='pwd' />
				<input type='button' value='입력' id='btnPassword' />
			</div>
		</div>		
		
		
	</form>

</div>
<script>member()</script>
</body>
</html>
```

modify.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(수정)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>

</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' id='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' readOnly required value='${vo.mid }'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required value='${vo.name }'/><br/>
		
		
		<label>이메일</label>
		<input type='email' name='email' size='35' value='${vo.email }'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' value='${vo.phone }'/><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required value='${vo.zipcode }'/>
		<input type='button' value='우편번호 검색' name='btnZipcode' id='btnFindZip' />
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required value='${vo.address }'/> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'/><br/>
		<label></label>
			<c:choose>
				<c:when test="${empty vo.photo }">
					<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
				</c:when>
				<c:otherwise>
					<img src='./upload/${vo.photo }' id='photo' width='200px' height='140px'/>
				</c:otherwise>
			</c:choose>
		<hr/>

		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		
		<div id='password_zone'>
			<div>
				<input type='password' name='pwd' />
				<input type='button' value='입력' id='btnPassword' />
			</div>
		</div>		

		<input type='hidden' name='delFile' value='${vo.photo }' />
		
	</form>

</div>
<script>member()</script>
</body>
</html>
```

# 5교시

member.js

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	
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
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
			
				if(frm.pwd.value != ''){
					frm.mid.disabled=false;
					member.delete('deleteR.mem');
					
				}
			}
			
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
				if(frm.pwd.value != ''){
					member.update = ('modifyR.mem'); //수정된 정보를 저장
				}
			}
		
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			member.select('modify.mem');
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
			var checkFlag=true;
			
			/*
			if(!frm.mid.checkValidity()){
				alert('mid');
				checkFlag=false;
			}else if(!frm.name.checkValidity()){
				alert('name');
				checkFlag=false;
			}else if(!frm.pwd.checkValidity()){
				alert('pwd');
				checkFlag=false;
			}else if(!frm.email.checkValidity()){
				alert('email');
				checkFlag=false;
			}else if(!frm.phone.checkValidity()){
				alert('phone');
				checkFlag=false;
			}
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			*/
			if(checkFlag){
				member.update('updateR.mem');
			}
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			member.select('select.mem');
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "select.mem";
			frm.nowPage.value = 1;
			member.select();
		}
	}
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			member.select('insert.mem');
		}
	}
}//end of member()

member.goPage=function(page){
	var frm = document.frm_member;
	frm.nowPage.value = page;
	member.select();
}

member.view=function(mid){
	var frm = document.frm_member;
	frm.mid.value = mid;
	member.select('view.mem');
}

// spring - > ajax로 호출
member.select = function(url){

	if(url ==null){
		url = 'select.mem';
	}
	
	$param = $('#frm_member').serialize();
	$.ajax({
		url : url,
		data : $param,
		dataType : 'html', /*응답 데이터*/
		method : 'POST',
		success : function(data){
			$('#here').html(data);
		}
	});
}

member.delete = function(url){

	if(url ==null){
		url = 'select.mem';
	}
	
	$param = $('#frm_member').serialize();
	$.ajax({
		url : url,
		data : $param,
		dataType : 'html', /*응답 데이터*/
		method : 'POST',
		success : function(data){
			$('#here').html(data);
		}
	});
}

// 입력하기, 수정하기
member.update = function(url){
	var formData = new FormData($('#frm_member')[0]);
	
	$.ajax({
		url : url,
		data : frmData,
		dataType : 'html',
		method : 'POST',
		enctype : 'multipart/form-data',
		contentType : false,
		processData : false,
		success : function(data){
			$('#here').html(data);
		}
	})
	
}
```

# 5교시~ 마지막 교시

프로젝트 회의햇움