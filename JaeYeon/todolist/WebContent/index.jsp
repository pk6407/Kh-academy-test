<%@page import="com.github.domain.Todo"%>
<%@page import="java.util.List"%>
<%@page import="com.github.repository.TodoRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>메인페이지</title>
        <style>
            html, body {
                margin: 0;
            }

            .todo-box {
                width: 350px;
                background-color: #22cc88;
                box-sizing: border-box;
                padding: 20px;
            }
        </style>
    </head>
    <body>
    <%
    String userId = 
    	(String) session.getAttribute("userid");
    
    final List<Todo> todos =
    	TodoRepository.getInstance().getTodoList();
    %>
    
    <% if (userId != null) { %>
        <div class="todo-box">
            <form action="todo.jsp" method="POST">
            	<input 
            		type="hidden" 
            		name="userid"
            		value="<%= userId %>"
           		/>
                <label for="whattodo">할 일:</label>
                <input id="whattodo" name="whattodo" type="text"/>
                <input type="submit" value="등록하기"/>
            </form>
            <ul>
            <% for (Todo todo : todos) { %>
                <li>이름: <%= todo.getMyName() %>/ 
                할 일: <%=todo.getWhatToDo() %></li>
			<% }  %>
            </ul>
        </div>
    <% } else { %>
    	<a href="login.jsp">로그인하러 가요!</a>
    <% } %>
    <script>
    	const todoInput = document.getElementById('whattodo');
    	todoInput.focus();
    </script>
    </body>
</html>