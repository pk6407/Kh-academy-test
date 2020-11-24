<%@page import="com.github.repository.TodoRepository"%>
<%@page import="com.github.domain.Todo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userId = request.getParameter("userid");
String whatTodo = request.getParameter("whattodo");

final Todo todo = new Todo(whatTodo, userId);
TodoRepository.getInstance().saveTodo(todo);
response.sendRedirect("index.jsp");
%>
</body>
</html>