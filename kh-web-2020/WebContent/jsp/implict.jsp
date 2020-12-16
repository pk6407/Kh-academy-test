<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체</title>
</head>
<body>
<div id ='implicit'>
<h3>1. out.print()</h3>
<ul>
	<li>result = <%out.print("hello JSP"); %></li>
	<li>result2 = <%="hello JSP 2" %></li>
</ul>
<br/>
<hr/>
<h3>2. Request 내장 객체</h3>
<ul>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버명 : <%=request.getServerName() %></li>
	<li>웹루트 : <%=request.getContextPath() %></li>
	<li>현재경로 : <%=request.getRequestURI() %></li>
	<li>실제경로 : <%=request.getRealPath(".") %></li>
</ul>
<br/>
<hr/>
<h3>3. Response 내장 객체</h3>
	
</div>

<%
	response.sendRedirect("/index.jsp");
%>
</body>
</html>