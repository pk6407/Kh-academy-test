<%@page import="com.github.repository.TodoRepository"%>
<%@page import="com.github.domain.Todo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 리스트 보기</title>
</head>
<body>
<ul>
	<%
		List<Todo> list = TodoRepository.getInstance().getTodoList();
	for(Todo todo : list) {
	%>
	<li>이름: <%= todo.getMyName() %>|할일: <%=todo.getWhatToDo() %></li>
<% }%>

</ul>
</body>
</html>