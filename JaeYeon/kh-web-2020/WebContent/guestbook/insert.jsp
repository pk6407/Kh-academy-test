<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name='frm_gb_insert' method='post' id='frm_gb_insert'>
	<label>작성자</label>
	<input type='text' name='mid' readonly class='mid' value='${sessionScope.mid }' />
	<label>작성일</label>
	<output class='mdate'><%=new Date().toLocaleString() %></output>
	<br/>
	<textarea name='doc' cols='80' rows='5'></textarea>
	
	<div class='btns'>
		<label>암호</label>
		<input type='passwrod' name='pwd' />
		<input type='button' value='저장' id='btnInsert' />
	</div>
</form>