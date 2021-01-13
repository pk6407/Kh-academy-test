<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="bean.MemberVo"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json_toClass</title>
</head>
<body>
<div id ='json_to_class'>
	<h3>json to class</h3>
	<%
		String json = "{'mid': 'hong' , 'name' : '홍길동'}".replaceAll("'", "\"");
		
		Gson gson = new Gson();
		MemberVo vo = gson.fromJson(json, MemberVo.class);
		out.print("<li>mid : " + vo.getMid());
		out.print("<li>name : " + vo.getName());
		
		
		String jsonArray = "[{'phone' : '010-1111-1111'}, {'phone' : '010-2222-2222'}]".replaceAll("'", "\"");
		MemberVo[] voArray = gson.fromJson(jsonArray, MemberVo[].class);
		List<MemberVo> list = Arrays.asList(voArray);
		
		vo = list.get(0);
		out.print("<h3>json array to List</h3>");
		out.print("<li>phone : " + vo.getPhone());
		
		
		
	%>

</div>

</body>
</html>