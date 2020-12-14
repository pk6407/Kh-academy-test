<%@page import="java.util.Iterator" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParameterValues</title>
<script src="./lib/jquery-3.5.1.min.js"></script>
</head>
<body>
<div id='parameter'>
	<h3>paragerver values</h3>

	<form name='frm_param' method='post' id='frm_param'>
		<label for='mid'>아이디</label>
		<input type='text' id='mid' name='mid' />
		<br/>
		<label>성별</label>
		<label><input type='radio' name='gender' value='M'>남성</label>
		<label><input type='radio' name='gender' value='F'>여성</label>
		<br/>
		<label>취미</label>
		<label><input type='checkbox' value='축구' name='hobby'>축구</label>
		<label><input type='checkbox' value='야구' name='hobby'>야구</label>
		<label><input type='checkbox' value='농구' name='hobby'>농구</label>
		<label><input type='checkbox' value='탁구' name='hobby'>탁구</label>
		<label><input type='checkbox' value='배구' name='hobby'>배구</label>
		<br/>
		<label>선택과목</label>
		<select name='subject' size='5'>
			<option value='html5'>HTML5</option>
			<option value='css'>CSS</option>
			<option value='javascript'>JAVASCRIPT</option>
			<option value='java'>JAVA</option>
			<option value='jsp'>JSP</option>
			<option value='ajax'>AJAX</option>
			<option value='jquery'>JQUERY</option>
		</select>
		<br/>
		<label>첨부파일</label>
		<input type='file' name='attFile' multiple />
		<p/>
		<input type='button' value='실행' id="btnRun"/>
	</form>
</div>

<script>
	$('#frm_param').on('submit',function(){
		var param = $('#frm_param').serialize();
		$('#result').load('parameterValuesCtrl.jsp', param);
	})
	
</script>

</body>
</html>