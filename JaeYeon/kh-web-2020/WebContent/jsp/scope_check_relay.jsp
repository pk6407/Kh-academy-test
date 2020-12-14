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