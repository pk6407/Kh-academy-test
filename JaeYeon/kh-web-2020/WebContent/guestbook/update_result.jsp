<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	/* jsp useBean 안할경우 이렇게 선언하고 import 시켜주는 과정을 마쳐야 함.	
	GuestBookDao dao = new GuestBookDao();
	GuestBookVo vo = new GuestBookVo();
	
	vo.setMid(request.getParameter("mid"));
	vo.setPwd(request.getParameter("pwd"));
	vo.setDoc(request.getParameter("doc"));
	vo.setSerial(Integer.parseInt(request.getParameter("serial")));
	
	String msg = dao.update(vo); 
	*/
%>


<jsp:useBean id="dao" class="gb.GuestBookDao" />
<jsp:useBean id="vo" class="gb.GuestBookVo" />
<jsp:setProperty property="*" name="vo" />   <!-- 폼테그에 있는 모든 정보들이 vo로 들어간다. -->

<%	
   String msg = dao.update(vo);
   request.setAttribute("msg", msg);   // request 값이 script의 msg로 이동.


%>
<script>
   var msg = '${msg}';
   alert(msg);
   //alert('${msg}');
   location.href='../index.jsp?inc=./guestbook/select.jsp';
</script>