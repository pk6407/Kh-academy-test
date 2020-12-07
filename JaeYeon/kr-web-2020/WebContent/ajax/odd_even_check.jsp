<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// file name : odd_even_check.jsp

   String temp = request.getParameter("su");	//jsp의 표현방법
      String msg = "";   //결과 메세지
      int su = 0;
      if(temp !=null && !temp.equals("")){
         su = Integer.parseInt(temp);   // "5" --> 5
         if(su%2==0){
            msg = su + " 는 짝수입니다.";
         }else{
            msg = su + " 는 홀수입니다.";
         }
      }
      
      out.print(msg);
      
%>