<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//파라미터 dan을 전달 받아 해당 구구단을 출력하는 코드
	String temp = request.getParameter("dan");
	List<String> list = new ArrayList<String>();
	
	if (temp != null && !temp.equals("")) {
		int dan = Integer.parseInt(temp);

		for (int i = 1; i < 10; i++) {

		list.add("'"+ dan + "*" + i + "=" + (dan * i)+"'");
		
		}
		
		String str = Arrays.toString(list.toArray());
		str = str.replaceAll("'", "\"");
		out.print(str);
	}
%>