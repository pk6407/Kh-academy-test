# 1교시 

- 어제 꺼 복습

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form_xml</title>
<style>
#items>div{
	display : inline-block;
	width: 200px;
	min-height:150px;
	border:1px solid #ccc;
	padding:15px;
	box-sizing : border-box;
	box-shadow:2px 2px 4px #aaa;
	border-radius:12px;
	margin-right:7px;
	margin-bottom:6px;
	background-color:#fee;
}

.emp>div:first-child{
	color:#00f;
	border-bottom:1px dotted #555;
}

.emp>div:nth-child(2){
	font-weight:bolder;
}
</style>
</head>
<body>
<div id='emp_search_form'>
	<h2>사원조회XML</h2>
	<form name='frm' method='post' id='frm'>
		<label>검색어를 입력하세요 </label>
		<input type='text' size='30' name='findStr' placeholder='성명, 이메일, 연락처로 검색'/>
		<input type='button' value='검색' id='btnFind'/>
	</form>
	<hr/>
	<div id='items'></div>
</div>
<script>
$('#btnFind').on('click', function(){
	let param = $('#frm').serialize();
	let req = new XMLHttpRequest();
	req.open('get', './ajax/emp_search_xml.jsp?' + param);
	req.onreadystatechange=function(){
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			let xml = req.responseXML;
			let emps = xml.getElementsByTagName("emp");
			
			for(var i=0; i<emps.length; i++){
				var emp = emps.item(i);
				var id = emp.getElementsByTagName("id").item(0).firstChild.nodeValue;
				var name = emp.getElementsByTagName("name").item(0).firstchild.nodeValue;
				var email = emp.getElementsByTagName("email").item(0).firstChild.nodeValue;
				var phone = emp.getElementsByTagName("phone").item(0).firstChild.nodeValue;
				var salary = emp.getElementsByTagName("salary").item(0).firstChild.nodeValue;
				
				rst += "<div class='emp'>"
					+ "	<div>" + id + "</div>"
					+ " 	<div>" + name + "</div>"
					+ "	<div>" + email + "</div>"
					+ "	<div>" + phone + "</div>"
					+ "	<div>" + salary + "</div>"
					+ "</div>";
			}
	}
	req.send();
})


</script>
</body>
</html>
```

 req.open('get', './ajax/emp_search_xml.jsp?' + param); 
 req.open (필요하다. ajax/emp_search_xml.jsp이것이 + param)
  - ?(파라미터 시작
  - &(파라미터의 연결) 
 let xml = req.responseXML;
 - 응답 정보를 xml로 

rst += "<div class='emp'>"
					+ "	<div>" + id + "</div>"
					+ " 	<div>" + name + "</div>"
					+ "	<div>" + email + "</div>"
					+ "	<div>" + phone + "</div>"
					+ "	<div>" + salary + "</div>"
					+ "</div>";
			}

 - xml 를 html로 뿌리는 형식
  
```jsp
<?xml version='1.0' encoding='UTF-8' ?>
<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import='bean.EmpDao'%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String findStr = request.getParameter("findStr");
	EmpDao dao = new EmpDao();
	List<EmpVo> list = dao.search(findStr);

%>
<emps>
	<%for(EmpVo vo: list){ %>
		<emp>
			<id><%=vo.getEmployee_id()%></id>
			<name><%=vo.getFirst_name()%></name>
			<email><%=vo.getEmail()%></email>
			<phone><%=vo.getPhone_number()%></phone>
			<salary><%=vo.getSalary()%></salary>
		</emp>
	<% } %>
</emps>
```

1. <?xml version='1.0' encoding='UTF-8' ?> xml방식이라고 명명해줘야됨 버전도 같이^^
2. <%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    text지만html가 아니고 xml이야 라고 알려주기
3. <emps>
	<%for(EmpVo vo: list){ %>
		<emp>
			<id><%=vo.getEmployee_id()%></id>
			<name><%=vo.getFirst_name()%></name>
			<email><%=vo.getEmail()%></email>
			<phone><%=vo.getPhone_number()%></phone>
			<salary><%=vo.getSalary()%></salary>
		</emp>
	<% } %>
</emps>
Root NoDe 써주기

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form_json</title>
<style>
#items>div{
	display : inline-block;
	width: 200px;
	min-height:150px;
	border:1px solid #ccc;
	padding:15px;
	box-sizing : border-box;
	box-shadow:2px 2px 4px #aaa;
	border-radius:0 20px 0 20px;
	margin-right:7px;
	margin-bottom:6px;
	background-color:#fee;
}
.emp>div:first-child{
	color:#00f;
	border-bottom:1px dotted #555;
}
.emp>div:nth-child(2){
	font-weight:bolder;
}
</style>
</head>
<body>
<div id='emp_search_form'>
	<h2>사원조회(JSON)</h2>
	<form name='frm' method='post' id='frm'>
		<label>검색어를 입력하세요 </label>
		<input type='text' size='30' name='findStr' placeholder='성명, 이메일, 연락처로 검색'/>
		<input type='button' value='검색' id='btnFind'/>
	</form>
	<hr/>
	<div id='items'></div>
</div>
<script>
$('#btnFind').on('click', function(){
	let param = $('#frm').serialize();
	let req = new XMLHttpRequest();
	req.open('get', './ajax/emp_search_json.jsp?' + param);
	req.onreadystatechange=function(){
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			let data = JSON.parse(req.responseText);
			let doc = '';
			for(var i=0; i<doc.length; i++){
				doc += "<div class='emp'>"
					+ "		<div>" + data[i].id + "</div>"
					+ "		<div>" + data[i].name + "</div>"
					+ "		<div>" + data[i].email + "</div>"
					+ "		<div>" + data[i].phone + "</div>"
					+ "		<div>" + data[i].salary + "</div>"
					+ "</div>";
			}
			$('#items').html(doc);
		}
	}
	req.send();
})
</script>
</body>
</html>
```

req.open('get', './ajax/emp_search_json.jsp?' + param); JSON구조이다
let data = JSON.parse(req.responseText); - 문자열
JSON.parse() <={'a':'hong'} 괄호안에 들어감 

```jsp
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.EmpDao"%>
<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //사용자의 요청정보를 dao에 전달한 후 그 결과를 다시 사용자에게 반환
   String findStr = request.getParameter("findStr");

   EmpDao dao = new EmpDao();
   List<EmpVo> list = dao.search(findStr);
   List<String> sb = new ArrayList<String>();
   
   /*
   String fmt = "<div class='emp'>"
              + "  <div>사번:%d</div>"
              + "  <div>성명:%s</div>"
              + "  <div>이메일:%s</div>"
              + "  <div>연락처:%s</div>"
              + "  <div>급여:%10.1f</div>"
              + "</div>";
     */         
	//[{'id : '%d', 'name' : '%s', 'email' : '%s', 'phone' : '%s', 'salary' : '%f'} , {}]
   String fmt = "{"
              + "  'id' : '%d' , "
              + "  'name' : '%s' , "
              + "  'email' : '%s' , "
              + "  'phone' : '%s' , "
              + "  'salary' : '%10.1f' "
              + "}";
	
   for(EmpVo vo : list){
		String str = String.format(fmt, 
				vo.getEmployee_id(), 
				vo.getFirst_name(),
				vo.getEmail(),
				vo.getPhone_number(),
				vo.getSalary()
				);
		str = str.replaceAll("'","\"");
		sb.add(str);
   }
   
   out.print(Arrays.toString(sb.toArray()));
   
%>
```

("'","\""); - 변환 ' 를 "로 문자 "를 알려주기위해 \ 를 써주는거임^^
 out.print(Arrays.toString(sb.toArray())); -  sb = {A ...}
                                                    {B ...}
                                                    {C ...}
                                                    {D ....}
이런식으로 넣는다 
그리고 출력결과를 리턴

# 2교시

## 에러 코드

status(요청상태)
- 403 : 접근 거부
- 404 : 페이지가 없는 경우
- 500 : 서버 오류
- 200 : 정상 요청이 된 경우(OK)

readystate(응답상태)
- 0 : 응답이 만들어지지 않은 상태
- 1 : loading
- 2 : loaded(응답정보가 수신되지 않은 상태)
- 3 : 응답의 일부분 받은 상태
- 4 : 응답이 모두 도착한 상태

open(method,url,sync_method,userName,userPassword)
method : get,post,delete,put,head...
url : ajax는 기본적으로 동일한 도메인의 주소만 허용 - 200.200.200.200(jobte.kr) --> 보안상의 이유
sync_method : true(비동기방식, 기본값),false(동기방식)

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form_json</title>
<style>
#items>div{
	display : inline-block;
	width: 200px;
	min-height:150px;
	border:1px solid #ccc;
	padding:15px;
	box-sizing : border-box;
	box-shadow:2px 2px 4px #aaa;
	border-radius:0 20px 0 20px;
	margin-right:7px;
	margin-bottom:6px;
	background-color:#fee;
}
.emp>div:first-child{
	color:#00f;
	border-bottom:1px dotted #555;
}
.emp>div:nth-child(2){
	font-weight:bolder;
}
</style>
</head>
<body>
<div id='emp_search_form'>
	<h2>사원조회(JSON)</h2>
	<form name='frm' method='post' id='frm'>
		<label>검색어를 입력하세요 </label>
		<input type='text' size='30' name='findStr' placeholder='성명, 이메일, 연락처로 검색'/>
		<input type='button' value='검색' id='btnFind'/>
	</form>
	<hr/>
	<div id='items'></div>
</div>
<script>
$('#btnFind').on('click', function(){
	let param = $('#frm').serialize();
	let req = new XMLHttpRequest();
	req.open('get', './ajax/emp_search_json.jsp?' + param);
	
	/*
	req.open('post','./ajax/emp_search_json.jsp');
	req.setRequestHeader('Content-type','application/x-www-form-urlencoded;charset=utf-8');
	req.send(parm);
	*/
	req.onreadystatechange=function(){
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			let data = JSON.parse(req.responseText);
			let doc = '';
			for(var i=0; i<doc.length; i++){
				doc += "<div class='emp'>"
					+ "		<div>" + data[i].id + "</div>"
					+ "		<div>" + data[i].name + "</div>"
					+ "		<div>" + data[i].email + "</div>"
					+ "		<div>" + data[i].phone + "</div>"
					+ "		<div>" + data[i].salary + "</div>"
					+ "</div>";
			}
			$('#items').html(doc);
		}
	}
	req.send();
})
</script>
</body>
</html>
```
/*~*/부분의 이런 방법도 잇다^^

- js의 고수들
- class A{}
- object 생성
  - function A(){...}
    var a = new A();
    var b = new B();
().() --> 람다식??? 자바 8버전 이상 . 현장 호환성 문제
화살표함수 ()->()
arrowfunction() - > javascript

ajax process flow
- 요청 성공시 callback 순서
  - start -> send -> success -> complete -> stop
- 요청 실패시 callback 순서
  - start -> send -> error -> complete -> stop

ajax 함수 중 가장 많이 쓰이는것
load() 라는 함수 ->많이 좋지만 다양성이 떨어짐,편리하고 단순함

# 3교시 ^^

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 파라미터 dan을 전달 받아 해당 구구단을 출력하는 코드
	String temp = request.getParameter("dan");
	if(temp != null && !temp.equals("")){
		int dan = Integer.parseInt(temp);
		
		for(int i = 1; i <10; i++){
			out.print(dan + "*" + i + "=" + (dan*i));
		}
		
	}
	
	
	
%>
```

# 점심후 1교시^^?

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 파라미터 dan을 전달 받아 해당 구구단을 출력하는 코드
	String temp = request.getParameter("dan");
	if(temp != null && !temp.equals("")){
		int dan = Integer.parseInt(temp);
		
		out.print("<h3>이지현</h3>");
		for(int i = 1; i <10; i++){
			out.print(dan + "*" + i + "=" + (dan*i));
		}
		
		out.print("<h3>김민진</h3>");
		for(int i= 1; i <10; i++){
			out.print(dan +" x " + i + "= " + (dan*i));
		} 
		
		out.print("<h3>김종구</h3>");
		for(int i = 1; i < 10; i++){
			String str = dan + " X " + i + " = " + dan*i + " <br/>";
			out.print(str);

		}
	out.print(" ");
	}
	
	
%>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
</head>
<body>
<h3>jQuery List</h3>
<hr/>
<ol>
	<li><a href='index.jsp?inc=./jquery/filter.jsp'>FILTER</a></li>
	<li><a href='index.jsp?inc=./jquery/traverse.jsp'>TRAVERSE</a></li>
	<li><a href='index.jsp?inc=./jquery/manipulation.jsp'>MANIPULATION</a>
	<li><a href='index.jsp?inc=./jquery/each.jsp'>EACH</a>
	<li><a href='index.jsp?inc=./jquery/attribute.jsp'>ATTRIBUTE</a>
	<li><a href='index.jsp?inc=./jquery/serialize.jsp'>SERIALIZE</a>
	<li><a href='index.jsp?inc=./jquery/keyup.jsp'>KEYUP</a>
	<li><a href='index.jsp?inc=./jquery/toggle.jsp'>TOGGLE</a>
	<li><a href='index.jsp?inc=./jquery/one.jsp'>ONE</a>
	<li><a href='index.jsp?inc=./jquery/effect.jsp'>EFFECT</a>
	<li><a href='index.jsp?inc=./jquery/tabs.jsp'>TABS</a>
	<li><a href='index.jsp?inc=./jquery/drag.jsp'>DRAG</a>
	<li><a href='index.jsp?inc=./jquery/drop.jsp'>DROP</a>
	<li><a href='index.jsp?inc=./jquery/sortable.jsp'>SORTABLE</a>
	<li><a href='index.jsp?inc=./jquery/accordion.jsp'>Accordion</a>
	<li><a href='index.jsp?inc=./jquery/autocomplete.jsp'>Autocomplete</a>
	<li><a href='index.jsp?inc=./jquery/menu_ui.jsp'>MENU</a>
	<li><a href='index.jsp?inc=./jquery/func_ajax.jsp'>FUNC_AJAX</a>
</ol>
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
<title>func_ajax</title>
</head>
<body>
<div id='func_ajax'>
	<h2>ajax in jQeury을 사용한 구구단</h2>
	<form name='frm' method='post' id='frm'>
		<label>단수를 입력하세요 : </label>
		<input type='text' size='4' name='don' value='9' />
		<input type='button' value='구구단 실행' id='btnRun' />
	</form>
	
	<div id='result'></div>
</div>
   <script>
   
$('#btnRun').on('click', function(){
   
   let param = $('#form').serialize();

   $.ajax({
      type : 'get',
      url  : './jquery/gugudan.jsp',
      data : param,
   
      dataType : 'html',
      success   : function(receiveData, status){
            $('.result').html(receiveData);
      },
      error     : function(xhr, status, error){
         alert(status);
      }
      
   });
});

</script>
</body>
</html>
```

html버전^^

# 점심후 2교시

```jsp
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//파라미터 dan을 전달 받아 해당 구구단을 출력하는 코드
	String temp = request.getParameter("dan");
	List<String> list = new ArrayList<String>();
	
	if (temp != null && !temp.equals("")) {
		int dan = Integer.parseInt(temp);

		for (int i = 1; i < 10; i++) {

		list.add("'" + dan + "*" + i + "=" + (dan * i) + "'");
		
		}
		
		String str = Arrays.toString(list.toArray());
		str = str.replaceAll("'", "\"");
		out.print(str);
	}
%>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>func_ajax</title>
</head>
<body>
<div id ='func_ajax'>
	<h2>ajax in jQuery을 사용한 구구단(JSON)</h2>
	<form id = 'frm' name='frm' method='post'>
		<label>단수를 입력하세요 : </label>
		<input type='text' size ='4' name='dan' value='9'/>
		<input type='button' value='구구단 실행' id = 'btnRun' />	
	</form>
	
	<div id = 'result'></div>

</div>
<script>

$('#btnRun').on('click', function(){
	
	let param = $('#frm').serialize();
	$.ajax({
	type : 'get',
	url : './jquery/gugudan_json.jsp',
	data : param,
	
	dataType : 'json',
	success : function(json, status){
		var temp = '';
		for(var i=0; i<json.length; i++){
			temp += json[i] + '<br/>'
		}
		$('#result').html(temp);
	},
	error : function(xhr, status, error){ 		
		alert(status);
	}
	
	});

});
</script>
</body>
</html>
```
 
json버전^^

# 점심후 라스트 교시^^

1. 버튼을 클릭하면 특정페이지로 이동(form + action + submit)
2. 항목들이 반드시 입력되어야 할 때 태그의 속성 지정
3. label을 클릭하면 해당 입력상자로 이동로 label의 태그의 속성
4. 정규식을 사용해서 영문자의 대소문자,문자의길이를 체크.
    /^[A-Z]/,/[A-Z0-9]$/,/[a-z]{4,}/
5. 포커스를 받았을 때 잃었을때의 이벤트(focus,blur)
6. 특정id에 있는 value값을 지정하거나 삭제
7. 라디오버튼등의 상태값을 체크하여 처리하는 방법.

* 문제해결 시나리오*
- 실행결과를 보고 CSS 지정
- 마우스나 키보드 이벤트에 따른 이벤트 설정
- 입력창의 입력될 내용들에 대한 설명 입력이 되면 안내 메세지는 자동 삭제