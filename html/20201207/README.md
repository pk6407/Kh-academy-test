# 1교시 

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bigin</title>
<style>
 #result{
    width:400px;
    height:250px;
    background-color: #eee;
 }
</style>
</head>
<body>
   <div id = 'begin'>
   <fieldset>
   <legend>Ajax 의특징</legend>
   <ul>
      <li>별도의 외부 플러그인이나 라이브러리, API , Activex 와같은 API</li>
      <li> 브라우저 내부에있는 자바스크립트 만으로 처리가 가능하다.</li>
      <li> 비동기방식으로 서버와 통신하며, 브라우저에 새로고침없이 특정 영역의 내용을 동적으로 변경할 수 있다.</li>
      <li> 프로그램 방식을 web 방식에서 App 방식으로 처리할 수 있다 .  </li>
      <li> Ajax (Asynchronus javaScript XML)의약자 </li>
      <li> Ajax 의 가장 중추적인 역활을 하는 객체는 XMLHttpRequest 이다</li>
      </ul>
</fieldset>
<h3>홀짝수 체크</h3>
<p>간단테스트 (서버의 결과를 표시해 주기 위해 전체 화면의 새로고침 되느냐 아니면 필요한 부분만 새로고침 되느냐)</p>
   <% 
      String temp = request.getParameter("su");	//jsp의 표현방법
      String msg = "";   //결과 메세지
      int su = 0;
      if(temp !=null && !temp.equals("")){
         su = Integer.parseInt(temp);   // "5" --> 5
         if(su%2==0){
            msg = su + " 는 짝수입니다.";
         }else{
            msg = su + " 는 홀수입니다.";
         }
      }
   
   %>

<form name = 'frm' method='post'>
<label>정수를 입력하세요</label>
<input type = 'text' size = '6' name= 'su'>
<input type ='submit' value='check'/>
</form>
<div id = 'result'>
<%=msg %>
</div>
</body>
</html>
```
ajax를 통해 전체 페이지가 새로고침되게 하지 않으려면,

- 서버에서 처리할 내용을 ui에서 분리
- 서버는 처리된 내용을 화면에 출력하는 로직을 추가한다.
- ui단에서는 XMLHttpRequest 객체를 사용하여 서버의 처리 결과를 가져온다.

# 2교시

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// file name : odd_even_check.jsp

   String temp = request.getParameter("su");	//jsp의 표현방법
      String msg = "";   //결과 메세지
      int su = 0;
      if(temp !=null && !temp.equals("")){
         su = Integer.parseInt(temp);   // "5" --> 5
         if(su%2==0){
            msg = su + " 는 짝수입니다.";
         }else{
            msg = su + " 는 홀수입니다.";
         }
      }
      
      out.print(msg);
      
%>
```

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bigin</title>
<style>
#result {
	width: 400px;
	height: 250px;
	background-color: #eee;
}
</style>
</head>
<body>
	<div id='begin'>
		<fieldset>
			<legend>Ajax 의특징</legend>
			<ul>
				<li>별도의 외부 플러그인이나 라이브러리, API , Activex 와같은 API</li>
				<li>브라우저 내부에있는 자바스크립트 만으로 처리가 가능하다.</li>
				<li>비동기방식으로 서버와 통신하며, 브라우저에 새로고침없이 특정 영역의 내용을 동적으로 변경할 수 있다.</li>
				<li>프로그램 방식을 web 방식에서 App 방식으로 처리할 수 있다 .</li>
				<li>Ajax (Asynchronus javaScript XML)의약자</li>
				<li>Ajax 의 가장 중추적인 역활을 하는 객체는 XMLHttpRequest 이다</li>
			</ul>
		</fieldset>

		<h3>홀짝수 체크</h3>
		<p>간단테스트 (서버의 결과를 표시해 주기 위해 전체 화면의 새로고침 되느냐 아니면 필요한 부분만 새로고침 되느냐)</p>
		<% 
  
   
   		%>
		<form name='frm' method='post'>
			<label>정수를 입력하세요</label> <input type='text' size='6' name='su'>
			<input type='submit' value='check' />
		</form>
		<div id='result'>
			
		</div>
</div>
<script>
	// ajax를 통해 서버의 처리 결과를 result에 표시
	
	var frm = document.frm;
	frm.onsubmit = function(){
		var param = "?su=" + frm.su.value;
		var req = new XMLHttpRequest(); // 1번째
		req.open('get', './ajax/odd_even_check.jsp');//요청 정보를 생성 2번째
		req.onreadystatechange=function(){ //3번째
			//req.status==200 => 정상요청됨, req.readyState==4 => 정상응답.
			if(req.status==200 && req.readyState==4){
				var r = document.getElementById('result');
				r.innerHTML = req.responseText;
				// 요청과 응답이 모두 정상일때 값을 가져와라
				//$('#result').html(req.responseText);
			}
		}
		req.send();//요청 정보를 서버에 전송 //4번째 (3번째 4번째가 바뀔때가 잇다^^상황에 따라)
		
		return false;//submit 고유의 기능을 취소
	}
	
</script>
</body>
</html>
```

ajax의 고유의 기능?을 이용하여 만듬

# 3교시

ex1) emp_search_form.jsp / emp_search.jsp/EmpDao.java/EmpVo.java

검색어를 입력하여 first_name or email or phone_number에 포함되어 있으면 employee_id, first_name,eamil,phone_number,salary를 화면에 표시하시오.

```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpDao {// Dao or DTo(네트워크 기능 이 있을때는 Dto로) 컨트롤(각종제어구조)
	Connection conn; //DB
	PreparedStatement ps; 
	ResultSet rs;
	
	public EmpDao() {
		conn = new Application().getConn();
	}
	
	public List<EmpVo> search(String findstr){
		List<EmpVo> list = new ArrayList<EmpVo>();
		
		try {
			String sql = "select * from employees "
					+ " where first_name like ? "
					+ " or	 email like ? "
					+ " or	 phone_number like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findstr + "%");//setString 이라고 하면 자동으로 양옆에 '를 찍어준다
			ps.setString(2, "%" + findstr + "%");
			ps.setString(3, "%" + findstr + "%");
			
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
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();	//열엇으면 꼭 닫아주기
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
}
```

```java
package bean;

public class EmpVo {
	int employee_id;
	String first_name;
	String email;
	String phone_number;
	double salary;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	
}
```

# 점심후 1교시

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
	
	public List<EmpVo> search(String findstr){
		List<EmpVo> list = new ArrayList<EmpVo>();
		
		try {
			String sql = "select * from employees "
					+ " where first_name like ? "
					+ " or	 email like ? "
					+ " or	 phone_number like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findstr + "%");//setString 이라고 하면 자동으로 양옆에 '를 찍어준다
			ps.setString(2, "%" + findstr + "%");
			ps.setString(3, "%" + findstr + "%");
			
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
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();	//열엇으면 꼭 닫아주기
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
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
<title>emp_search_form</title>
<style>
#items>div{
	display : inline-block;
	width : 200px;
	height : 200px;
	border : 1px solid #ccc;
	padding : 5px;
	box-shadow : 2px 2px 3px #999;
	borde-radius : 9px;
}
</style>
</head>
<body>
<div id='emp_search_form'>
	<form name='frm' method='post'>
		<label>검색어를 입력하세요</label>
		<input type='text' name='findStr' />
		<input type='button' value='검색' id='btnFind'/>
	</form>
	<hr/>
	<div id='items'>
		<div class='emp'>
		</div>
		<div class='emp'>
		</div>
		<div class='emp'>
		</div>
		<div class='emp'>
		</div>
		<div class='emp'>
		</div>
		<div class='emp'>
		</div>
		
	</div>
</div>
</body>
</html>
```

```jsp
<%@ page import="bean.EmpVo" %>
<%@ page import="bean.EmpDao" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//사용자의 요청정보를 dao에 전달한 후 그 결과를 다시 사용자에게 반환
	String findStr = request.getParameter("finStr");

	EmpDao dao = new EmpDao();
	List<EmpVo> list = dao.search(findStr); // dao.search()괄호안에 EmpDao의 public List<EmpVo> search(String findstr) 의 findStr를 가져야된다 
	
	
%>
```

# 점심후 2교시

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
	height:200px;
	border:1px solid #ccc;
	padding:5px;
	box-shadow:2px 2px 3px #999;
	border-radius:9px;
}
</style>
</head>
<body>
<div id='emp_search_form'>
	<form name='frm' method='post' id='frm'>
		<label>검색어를 입력하세요 </label>
		<input type='text' name='findStr' />
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

```java
package bean;

public class EmpVo {
	int    employee_id;
	String first_name;
	String email;
	String phone_number;
	double salary;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
}
```

- 실행하면 검색어에 알파벳을 입력하면 그 알파벳에 해당하는 이름들 값이 나와야되는데 안나온다.ㅋㅋㅋ이클립스 고유의 문제때문에 더웃긴건 저번주에 같은 문제가 잇엇는데 오늘 돌려보니 또 된다...ㅋㅋㅋㅋ골때린다..