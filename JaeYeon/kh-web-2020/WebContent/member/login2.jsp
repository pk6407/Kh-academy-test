<%@page import="java.io.PrintWriter" %>
<%@page import="bean.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//response.setContentType("text/html;charset=utf-8");
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	// database에 존재 유무
	
	//session.setAttribute("mid",mid);
	//response.sendRedirect("../index.jsp");
	
	
	MemberDao dao = new MemberDao();
	boolean b = dao.login(mid,pwd);
	
	if(b){
	session.setAttribute("mid",mid);
	response.sendRedirect("../index.jsp");
	}else{
		//로그인 실패
		%>
		<script>
			alert('fail');
			location.href = '../index.jsp';
		</script>
		
	<% } %>