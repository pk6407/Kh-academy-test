package com.github.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.domain.*;
import com.github.repository.TodoRepository;

/**
 * Servlet implementation class TodoControllerServlet
 */
@WebServlet("/TodoControllerServlet")
public class TodoControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TodoRepository repository = TodoRepository.getInstance();
	
	
    public TodoControllerServlet() {
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * [HTTP Request]
	 * POST /todo-app/TodoControllerServlet HTTP/1.1
	 * Content-Length: 25
	 * Content-Type
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String whatTodo = request.getParameter("whattodo");
		String myName = request.getParameter("myname");
		final Todo todo = new Todo(whatTodo, myName);
		repository.saveTodo(todo);
		response.sendRedirect("todo.jsp");
	}

}