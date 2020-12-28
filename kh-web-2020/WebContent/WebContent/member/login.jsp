<%@page import="java.io.PrintWriter"%>
<%@page import="bean.MemberDao"%>
<%--MemberDao만 import 해준 이유 아래 useBean하기 전에 MemberDao dao = new MemberDao() 이부분만 쓰고 사용하려 했을 때는 import 필요 --%>
<%--useBean 사용해서 class 선언할때는 어차피 풀네임 bean.MemberDao 써줘야 하기 때문에 따로 import 필요 없다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id ="dao" class ="bean.MemberDao"/>
<jsp:useBean id ="vo" class ="bean.MemberVo"/>

<%--vo객체가 가지고 있는 모든 setter를 사용하여 값을 대입 --%>
<jsp:setProperty property="*" name="vo"/>

<%

	vo.setMid(request.getParameter("mid"));
	vo.setPwd(request.getParameter("pwd"));

	//resoponse.setContentType("text/html;charset=utf-8");
	//String mid = request.getParameter("mid");
	//String pwd = request.getParameter("pwd");
	
	
	//database에 존재 유무	
	
	//session.setAttribute("mid", mid);
	//response.sendRedirect("../index.jsp");
	
	// DB로 연결시켜서 가져오는 방법 MemberDao class 생성해서 sql 사용
	//MemberVo vo = new MemberVo();
	//vo.setMid(mid);
	//vo.setPwd(pwd);
	
	
	//MemberDao dao = new MemberDao();
	boolean b = dao.login(vo.getMid(),vo.getPwd());
	
	if(b) {
		session.setAttribute("mid", vo.getMid());
		response.sendRedirect("../index.jsp");
	}else {
		//로그인 실패
	%>
	<script>
		alert('fail');
		location.href='../index.jsp';
	</script>	
	
	<% } %>
