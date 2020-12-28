<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MENU</title>
</head>
<body>
<h3>JSP</h3>
<ol>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/implict.jsp'>내장객체</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/parameterValues.jsp'>PARAMETER</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/scope.jsp'>SCOPE</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/el_test.jsp'>EL_TEST</a></li>
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/jstl_test.jsp'>JSTL_TEST</a></li>
	
	<li><a href='index.jsp?sub=./jsp/menu.jsp&inc=./jsp/servlet_test.jsp'>Servelt(GET|POST)</a></li>
	
</ol>
</body>
</html>