<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	// login.jsp 백업용으로 그대로 복사한 것. 처음엔 이런방식으로 진행했지만 다른 방식으로 하기 위해 여기에 백업 후
	// login.jsp 코드 변경시켰다. 실행은 변화된 login.jsp로 될 것이다. 참고할 것. 


	//resoponse.setContentType("text/html;charset=utf-8");
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	//database에 존재 유무	
	
	//session.setAttribute("mid", mid);
	//response.sendRedirect("../index.jsp");
	
	// DB로 연결시켜서 가져오는 방법 MemberDao class 생성해서 sql 사용
	//MemberVo vo = new MemberVo();
	//vo.setMid(mid);
	//vo.setPwd(pwd);
	
	
	MemberDao dao = new MemberDao();
	boolean b = dao.login(mid,pwd);
	
	if(b) {
		session.setAttribute("mid", mid);
		response.sendRedirect("../index.jsp");
	}else {
		//로그인 실패
	%>
	<script>
		alert('fail');
		location.href='../index.jsp';
	</script>	
	
	<% } %>
