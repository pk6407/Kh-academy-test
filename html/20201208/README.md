# 1~2교시

어제꺼 복습..

```jsp
<%@page import="bean.EmpDao"%>
<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //사용자의 요청정보를 dao에 전달한 후 그 결과를 다시 사용자에게 반환
   String findStr = request.getParameter("findStr");
   EmpDao dao = new EmpDao();
   List<EmpVo> list = dao.search(findStr);
   StringBuilder sb = new StringBuilder();
   String fmt = "<div class='emp'>"
              + "  <div>사번:%d</div>"
              + "  <div>성명:%s</div>"
              + "  <div>이메일:%s</div>"
              + "  <div>연락처:%s</div>"
              + "  <div>급여:%10.1f</div>"
              + "</div>";
		   
   for(EmpVo vo : list){
		String str = String.format(fmt, 
				vo.getEmployee_id(), 
				vo.getFirst_name(),
				vo.getEmail(),
				vo.getPhone_number(),
				vo.getSalary()
				);
		sb.append(str);
   }
   
   out.print(sb.toString());
%>
```

%d : 정수
%s : 문자열
%f : 실수
%c : 문자
'%k%' : k가 포함
'k%' : k로 시작
'%K' : k로 끝

out.print(sb.toString()); => ajax에게 반환된다 출력값이.
StringBuilder sb = new StringBuilder();
고정 문자열의 특징 - 최대길이가 정해져있고 남는공간이 체워진다

```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public EmpDao() {
		conn = new Application().getConn();
	}
	
	public List<EmpVo> search(String findStr){
		List<EmpVo> list = new ArrayList<EmpVo>();

		try {
			String sql = " select * from hr.employees "
					   + " where  first_name like ? "
					   + " or     email like ? "
					   + " or     phone_number like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				EmpVo vo = new EmpVo();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("first_name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone_number(rs.getString("phone_number"));
				vo.setSalary(rs.getDouble("salary"));
				
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
}
```

public EmpDao() {
		conn = new Application().getConn();
	}
Application 만들고 바로 conn을 가져온다.

public List<EmpVo> search(String findStr){
		List<EmpVo> list = new ArrayList<EmpVo>();
EmpVo란 어레이리스트를 리스트에 넣는다???(맞나?) 다형성 => 부모타입의 변수에 자식의 객체 저장

# 3교시^-^

```jsp
<%@page import="bean.EmpDao"%>
<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //사용자의 요청정보를 dao에 전달한 후 그 결과를 다시 사용자에게 반환
   String findStr = request.getParameter("findStr");
   EmpDao dao = new EmpDao();
   List<EmpVo> list = dao.search(findStr);
   StringBuilder sb = new StringBuilder();
   String fmt = "<div class='emp'>"
              + "  <div>사번:%d</div>"
              + "  <div>성명:%s</div>"
              + "  <div>이메일:%s</div>"
              + "  <div>연락처:%s</div>"
              + "  <div>급여:%10.1f</div>"
              + "</div>";
		   
   for(EmpVo vo : list){
		String str = String.format(fmt, 
				vo.getEmployee_id(), 
				vo.getFirst_name(),
				vo.getEmail(),
				vo.getPhone_number(),
				vo.getSalary()
				);
		sb.append(str);
   }
   
   out.print(sb.toString());
%>
```

위에 한 코드를 xml버전으로 바꾼

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

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form</title>
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
	background-color:whire;
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
	req.open('get', './ajax/emp_search.jsp?' + param);
	req.onreadystatechange=function(){
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			$('#items').html(req.responseText);
		}
	}
	req.send();
})
</script>
</body>
</html>
```

위에 코드를 xml버전으로 바꾼 코드

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form</title>
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
	background-color:whire;
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
			
			$('#items').html();
		}
	}
	req.send();
})
</script>
</body>
</html>
```

# 점심후 1교시

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
			
			$('#items').html(rst);
		}
	}
	req.send();
})


</script>
</body>
</html>
```

공용DB 오래된것중 xml이 많다
데이터를 태그를 통해 구조화 시키는데 좋지만 데이터양보다 태그의 용량이 높아지는경우가 많다.. xml의 장점이자 단점이다.   최근유행은 xml보다 Json으로 구조화를 시킨다

# 점심먹구 2교시

JSON(Nototiom) - javascript + Object  

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
	border-radius:12px;
	margin-right:7px;
	background-color:whire;
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
			$('#items').html(req.responseText);
		}
	}
	req.send();
})
</script>
</body>
</html>
```

```jsp
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
		sb.add(str);
   }
   
   out.print(Arrays.toString(sb.toArray()));
   
%>
```

html - 호환성이 떨어지고
xml - 구조성이 떨어진다

 "{"
              + "  'id' : '%d' , "
              + "  '성명' : '%s' , "
              + "  '이메일' : '%s' , "
              + "  '연락처' : '%s' , "
              + "  '급여' : '%10.1f' "
              + "}";

이부분에서 + " "\id\" : "\%d\"이렇게 해야되는데 힘드니까 저위처럼함^^

out.print(Arrays.toString(sb.toArray())); 

Arrays - 배열 안에잇는걸 문자열로 바꿔라 뭘? -> sb의 배열을 []안에 넣어라

# 마지막 교시~_~

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

str = str.replaceAll("'","\""); '와 \ 를 바꿔라 ""로 자바와 자바 스크립트가 알아 먹을 수 잇게...냠냠...(?)