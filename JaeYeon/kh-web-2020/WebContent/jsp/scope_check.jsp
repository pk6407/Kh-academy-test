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