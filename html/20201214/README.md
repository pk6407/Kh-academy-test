# 1교시 

1. Session처리를 사용한 로그인
2. 로그인 처리를 위한 Database사용부분
3. request(요청정보)세부 사용법
   1. request.getParameter() : 항목이 1개요소(text, radio, numberm, date, color, datetime..)
   2. request.getParameterValues() : 항목이 2개이상(checkbox, select) 
4. 각종 scope(application,session,request,pageContext)
5. 액션 태그(include,forward,useBean,setProperty)

- 현재 페이지 정보를 강제로 새로고침하는 방법
  - 개발자 모드 -> Net work -> Disable Cache 체크 박스 선택
  - f5키 대신 -> Ctrl + Shift + R(r)
  - 소스 전체를 오려두기 -> 저장 -> 붙이기 -> 저장
  - 프로젝트를 clean : project -> clean

# 2교시~3교시

```java
package bean;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test {

	public static void main(String[] args) throws SQLException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin@localhost:1521:xe";
		String user = "system";
		String password = "oracle";
		try {
			Class.forName(driver);
			System.out.println("jdbc driver 로딩 성공");
			DriverManager.getConnection(url, user, password);
			System.out.println("오라클 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("jdbc driver 로딩 실패");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패");
		}
	}
}
```

# 점심후 4교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParameterValues</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	if(request.getMethod().equals("POST")){
		String mid = request.getParameter("mid");
		String gender = request.getParameter("gender");
		
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		String[] attFile = request.getParameterValues("attFile");
		
		out.print("<li>아이디: " + mid);
		out.print("<li>성별: " + gender);
		out.print("<li>취미: " + Arrays.toString(hobby));
		out.print("<li>과목: " + Arrays.toString(subject));
		out.print("<li>첨부파일: " + Arrays.toString(attFile));
		out.print("<hr/>");
	}
%>

<div id='parameter'>
	<h3>paragerver values</h3>

	<form name='frm_param' method='post'>
		<label for='mid'>아이디</label>
		<input type='text' id='mid' name='mid' value='김씨~' />
		<br/>
		<label>성별</label>
		<label><input type='radio' name='gender' value='M'>남성</label>
		<label><input type='radio' name='gender' value='F'>여성</label>
		<br/>
		<label>취미</label>
		<label><input type='checkbox' value='축구' name='hobby'>축구</label>
		<label><input type='checkbox' value='야구' name='hobby'>야구</label>
		<label><input type='checkbox' value='농구' name='hobby'>농구</label>
		<label><input type='checkbox' value='탁구' name='hobby'>탁구</label>
		<label><input type='checkbox' value='배구' name='hobby'>배구</label>
		<br/>
		<label>선택과목</label>
		<select name='subject' size='5'>
			<option value='html5'>HTML5</option>
			<option value='css'>CSS</option>
			<option value='javascript'>JAVASCRIPT</option>
			<option value='java'>JAVA</option>
			<option value='jsp'>JSP</option>
			<option value='ajax'>AJAX</option>
			<option value='jquery'>JQUERY</option>
		</select>
		<br/>
		<label>첨부파일</label>
		<input type='file' name='attFile' multiple />
		<p/>
		<input type='submit' value='실행' />
	</form>
	
	
</div>
</body>
</html>
```

# 점심후 5교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParameterValues</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	if(request.getMethod().equals("POST")){
		String mid = request.getParameter("mid");
		String gender = request.getParameter("gender");
		
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		String[] attFile = request.getParameterValues("attFile");
		
		out.print("<li>아이디: " + mid);
		out.print("<li>성별: " + gender);
		out.print("<li>취미: " + Arrays.toString(hobby));
		out.print("<li>과목: " + Arrays.toString(subject));
		out.print("<li>첨부파일: " + Arrays.toString(attFile));
		
		out.print("<h4>getParameterNames()</h4>");
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String str = en.nextElement();
			out.print("<li>" + str);
		}
		
		
		
		
		
		out.print("<hr/>");
	}
%>

<div id='parameter'>
	<h3>paragerver values</h3>

	<form name='frm_param' method='post'>
		<label for='mid'>아이디</label>
		<input type='text' id='mid' name='mid' />
		<br/>
		<label>성별</label>
		<label><input type='radio' name='gender' value='M'>남성</label>
		<label><input type='radio' name='gender' value='F'>여성</label>
		<br/>
		<label>취미</label>
		<label><input type='checkbox' value='축구' name='hobby'>축구</label>
		<label><input type='checkbox' value='야구' name='hobby'>야구</label>
		<label><input type='checkbox' value='농구' name='hobby'>농구</label>
		<label><input type='checkbox' value='탁구' name='hobby'>탁구</label>
		<label><input type='checkbox' value='배구' name='hobby'>배구</label>
		<br/>
		<label>선택과목</label>
		<select name='subject' size='5'>
			<option value='html5'>HTML5</option>
			<option value='css'>CSS</option>
			<option value='javascript'>JAVASCRIPT</option>
			<option value='java'>JAVA</option>
			<option value='jsp'>JSP</option>
			<option value='ajax'>AJAX</option>
			<option value='jquery'>JQUERY</option>
		</select>
		<br/>
		<label>첨부파일</label>
		<input type='file' name='attFile' multiple />
		<p/>
		<input type='submit' value='실행' />
	</form>
	
	
</div>
</body>
</html>
```

# 6교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParameterValues</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	if(request.getMethod().equals("POST")){
		String mid = request.getParameter("mid");
		String gender = request.getParameter("gender");
		
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		String[] attFile = request.getParameterValues("attFile");
		
		out.print("<li>아이디: " + mid);
		out.print("<li>성별: " + gender);
		out.print("<li>취미: " + Arrays.toString(hobby));
		out.print("<li>과목: " + Arrays.toString(subject));
		out.print("<li>첨부파일: " + Arrays.toString(attFile));
		
		out.print("<h4>getParameterNames()</h4>");
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String str = en.nextElement();
			out.print("<li>" + str);
		}
		
		out.print("<h4>getParameterMap()</h4>");
		Map<String, String[]> map = null;
		map = request.getParameterMap();
		
		Set<String> set = map.keySet();
		Iterator it = set.iterator();
		while(it.hasNext()){
			String key = it.next();
			String[] values = map.get(key);
			out.print("<li>" + key + " : " + Arrays.toString(values));
		}
		
		
		
		
		
		
		
		out.print("<hr/>");
	}
%>

<div id='parameter'>
	<h3>paragerver values</h3>

	<form name='frm_param' method='post'>
		<label for='mid'>아이디</label>
		<input type='text' id='mid' name='mid' />
		<br/>
		<label>성별</label>
		<label><input type='radio' name='gender' value='M'>남성</label>
		<label><input type='radio' name='gender' value='F'>여성</label>
		<br/>
		<label>취미</label>
		<label><input type='checkbox' value='축구' name='hobby'>축구</label>
		<label><input type='checkbox' value='야구' name='hobby'>야구</label>
		<label><input type='checkbox' value='농구' name='hobby'>농구</label>
		<label><input type='checkbox' value='탁구' name='hobby'>탁구</label>
		<label><input type='checkbox' value='배구' name='hobby'>배구</label>
		<br/>
		<label>선택과목</label>
		<select name='subject' size='5'>
			<option value='html5'>HTML5</option>
			<option value='css'>CSS</option>
			<option value='javascript'>JAVASCRIPT</option>
			<option value='java'>JAVA</option>
			<option value='jsp'>JSP</option>
			<option value='ajax'>AJAX</option>
			<option value='jquery'>JQUERY</option>
		</select>
		<br/>
		<label>첨부파일</label>
		<input type='file' name='attFile' multiple />
		<p/>
		<input type='submit' value='실행' />
	</form>
	
	
</div>
</body>
</html>
```

# 7교시 

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내안에 객체잇다</title>
</head>
<body>
<h3>JSP</h3>
<ol>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/implict.jsp'>내장객체</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/parameterValues.jsp'>Parameter</a></li>
</ol>
</body> 
</html>
```

```jsp
<%@page import="java.util.Iterator" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parameterValuesCtrl</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	if(request.getMethod().equals("GET")){
		String mid = request.getParameter("mid");
		String gender = request.getParameter("gender");
		
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		String[] attFile = request.getParameterValues("attFile");
		
		out.print("<li>아이디: " + mid);
		out.print("<li>성별: " + gender);
		out.print("<li>취미: " + Arrays.toString(hobby));
		out.print("<li>과목: " + Arrays.toString(subject));
		out.print("<li>첨부파일: " + Arrays.toString(attFile));
		
		out.print("<h4>getParameterNames()</h4>");
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String str = en.nextElement();
			out.print("<li>" + str);
		}
		
		out.print("<h4>getParameterMap()</h4>");
		Map<String, String[]> map = null;
		map = request.getParameterMap();
		
		Set<String> set = map.keySet();
		Iterator it = set.iterator();
		while(it.hasNext()){
			String key = it.next();
			String[] values = map.get(key);
			out.print("<li>" + key + " : " + Arrays.toString(values));
		}
		
		
		
		
		
		
		
		out.print("<hr/>");
	}
%>

</body>
</html>
```

```jsp
<%@page import="java.util.Iterator" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParameterValues</title>
<script src="./lib/jquery-3.5.1.min.js"></script>
</head>
<body>
<div id='parameter'>
	<h3>paragerver values</h3>

	<form name='frm_param' method='post' id='frm_param'>
		<label for='mid'>아이디</label>
		<input type='text' id='mid' name='mid' />
		<br/>
		<label>성별</label>
		<label><input type='radio' name='gender' value='M'>남성</label>
		<label><input type='radio' name='gender' value='F'>여성</label>
		<br/>
		<label>취미</label>
		<label><input type='checkbox' value='축구' name='hobby'>축구</label>
		<label><input type='checkbox' value='야구' name='hobby'>야구</label>
		<label><input type='checkbox' value='농구' name='hobby'>농구</label>
		<label><input type='checkbox' value='탁구' name='hobby'>탁구</label>
		<label><input type='checkbox' value='배구' name='hobby'>배구</label>
		<br/>
		<label>선택과목</label>
		<select name='subject' size='5'>
			<option value='html5'>HTML5</option>
			<option value='css'>CSS</option>
			<option value='javascript'>JAVASCRIPT</option>
			<option value='java'>JAVA</option>
			<option value='jsp'>JSP</option>
			<option value='ajax'>AJAX</option>
			<option value='jquery'>JQUERY</option>
		</select>
		<br/>
		<label>첨부파일</label>
		<input type='file' name='attFile' multiple />
		<p/>
		<input type='button' value='실행' id="btnRun"/>
	</form>
</div>

<script>
	$('#frm_param').on('submit',function(){
		var param = $('#frm_param').serialize();
		$('#result').load('parameterValuesCtrl.jsp', param);
	})
	
</script>

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
<title>scope</title>
</head>
<body>
<div id='scope'>
	<h3>application | session | request | pageContext</h3>
	<%
		String msg = "오늘 전체 회식입니다~ 메뉴는 소등갈비 와 소고기 육회";
		application.setAttribute("msg", msg);
		session.setAttribute("msg", msg);
		request.setAttribute("msg", msg);
		pageContext.setAttribute("msg", msg);
	%>
	
	<a href='scope_check.jsp'>scope message check</a>

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
<title>scope_check</title>
</head>
<body>
<div id='scope_check'>
	<h3>Scope Area Message Check</h3>
	<ul>
		<li>application : <%=application.getAttribute("msg") %></li>
		<li>session : <%=session.getAttribute("msg") %></li>
		<li>request : <%=request.getAttribute("msg") %></li>
		<li>pageContext : <%=pageContext.getAttribute("msg") %></li>
		
	</ul>
	
	
</div>
</body>
</html>
```

# 라스팡 교시

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope</title>
</head>
<body>
<div id='scope'>
	<h3>application | session | request | pageContext</h3>
	<%
		String msg = "오늘 전체 회식입니다~ 메뉴는 소등갈비 와 소고기 육회";
		application.setAttribute("msg", msg);
		session.setAttribute("msg", msg);
		request.setAttribute("msg", msg);
		pageContext.setAttribute("msg", msg);
		
		//session영역의 유지 시간 설정(5초)
		//session.setMaxInactiveInterval(5);
	%>
	
	<a href='scope_check.jsp'>scope message check</a>
	<form method='post' action='scope_check.jsp'> 
		<input type='submit'/>
		
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
<title>scope_check</title>
</head>
<body>
<div id='scope_check'>
	<h3>Scope Area Message Check</h3>
	<ul>
		<li>application : <%=application.getAttribute("msg") %></li>
		<li>session : <%=session.getAttribute("msg") %></li>
		<li>request : <%=request.getAttribute("msg") %></li>
		<li>pageContext : <%=pageContext.getAttribute("msg") %></li>
		
	</ul>
	
	
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
<title>scope_check_relay</title>
</head>
<body>
<%
	request.setAttribute("msg", "오늘 회식 취소됨ㅜㅜ");
	RequestDispatcher dis = request.getRequestDispatcher("scope_check.jsp");
	dis.forward(request, response);
	

%>
</body>
</html>
```

RequestDispatcher dis = request.getRequestDispatcher("scope_check.jsp");
	dis.forward(request, response);
- 서블렛 관련 코드임 중요함^^

```jsp
<%@page import="java.io.PrintWriter" %>
<%@page import="bean.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dao" class="bean.MemberDao"/>
    
<%
	//response.setContentType("text/html;charset=utf-8");
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	// database에 존재 유무
	
	//session.setAttribute("mid",mid);
	//response.sendRedirect("../index.jsp");
	
	
	//MemberDao dao = new MemberDao();
	boolean b = dao.login(mid, pwd);
	
	if(b){
	session.setAttribute("mid",mid);
	response.sendRedirect("../index.jsp");
	}else{
		//로그인 실패
		%>
		<script>
			alert('fail');
			location.href='../index.jsp';
		</script>
	
<% } %>
```

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

