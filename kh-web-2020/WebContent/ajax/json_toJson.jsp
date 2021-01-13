<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bean.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json_toJson</title>
</head>
<body>
<div id='json_toJson'>
	<h3>Java Vo를 GSON 라이브러리를 사용하여 json 구조로 변경</h3>
	<%
		MemberVo vo = new MemberVo();
		vo.setMid("김씨");
		vo.setEmail("kim@jobtc.kr");
		vo.setPhoto("kim.png");
		
		Gson gson = new Gson();
		String str = gson.toJson(vo);
		out.print("vo to json : " + str);
		
		// 문자열로 되어 있는 JSON구조를 JSON Object로 변환
		JsonParser parser = new JsonParser();		
		JsonElement ele = parser.parse(str);
		JsonObject obj = ele.getAsJsonObject();
		out.print("<hr/>");
		out.print("<li>mid : " + obj.get("mid"));
		out.print("<li>email : " + obj.get("email"));
		out.print("<li>photo : " + obj.get("photo"));
		
		// List<MemberVo>를 생성하여 GSON을 사용한 배열 처리
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo vo1 = new MemberVo();
		vo1.setMid("park");
		vo1.setName("박씨 공방");
		
		list.add(vo1);
		
		MemberVo vo2 = new MemberVo();
		vo2.setMid("lee");
		vo2.setName("키다리 이씨");
		
		list.add(vo2);
		
		str = gson.toJson(list);
		out.print("<hr/>");
		out.print("List to JSON : " + str);
		
		ele = parser.parse(str);
		JsonArray array = ele.getAsJsonArray();
		
		JsonElement ele2 = array.get(0);
		JsonObject obj2 = ele2.getAsJsonObject();
		out.print("<li>mid : " + obj2.get("mid"));
		out.print("<li>name : " + obj2.get("name"));
		
	%>

</div>
</body>
</html>