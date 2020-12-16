<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="gb.GuestBookDao" />
<jsp:useBean id="vo" class="gb.GuestBookVo" />
<jsp:setProperty property="*" name="vo" />

<%
	String msg = dao.insert(vo);
	request.setAttribute("msg", msg);

%>
<script>
	var msg = '${msg}';
	alert(msg);
	location.href='../index.jsp?inc=./guestbook/select.jsp';
</script>