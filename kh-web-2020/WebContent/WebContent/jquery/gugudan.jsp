<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//파라미터 dan을 전달 받아 해당 구구단을 출력하는 코드
String temp = request.getParameter("dan");
if (temp != null && !temp.equals("")) {
	int dan = Integer.parseInt(temp);

	for (int i = 0; i < 9; i++) {

		String str = dan + " X " + (i+1) + " = " + dan * (i+1) + " <br/>";
		out.print(str);

	}

}
%>