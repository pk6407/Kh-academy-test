<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	//file name : odd_even_check.jsp
String temp = request.getParameter("su");
String msg = ""; // 결과메시지
int su = 0;
if(temp !=null && !temp.equals("")){
	su = Integer.parseInt(temp); 
	// "5" -> 5 Wrapper Class "5" 정수형을을 5 정수값으로 변환
	if(su%2==0){
		msg = su + "는 짝수입니다.";
	} else {
		msg = su + "는 홀수입니다.";
	}
}
	out.print(msg);
%>