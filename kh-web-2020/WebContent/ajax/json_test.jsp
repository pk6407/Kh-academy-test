<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json test</title>
</head>
<body>
<script>
/*
  json은 데이터 형식이 기본적으로 문자열 패턴을 갖고 있다.
 
  json 의 기본적인 데이터 구조
  1)map 구조 : {"key" : "value" , ...}
  2)배열 구조 : ["value", ...]
  3)혼합 구조 : {[]} or [{}] or {{}} or [[]]  ajax - > json.parse()
  */
</script>
<%
	//1) gson 라이브러리 jar설치(구글)

	//2) gson을 사용하여 json의 object 생성하기
	JsonObject obj1 = new JsonObject();
	obj1.addProperty("mid","a001");
	obj1.addProperty("name","송씨");
	obj1.addProperty("addresss","부산");
	obj1.addProperty("phone","010-1111-1111");
	obj1.addProperty("age",18);
	obj1.addProperty("mdate", new Date().toGMTString());
	
	out.print("<h3>gson으로 만든 Object </h3>");
	out.print(obj1 + "<hr/>");
	out.print("<li>mid : " + obj1.get("mid"));
	out.print("<li>name : " + obj1.get("name"));
	out.print("<li>address : " + obj1.get("address"));
	out.print("<li>phone : " + obj1.get("phone"));
	out.print("<li>age : " + obj1.get("age"));
	out.print("<li>mdate : " + obj1.get("mdate"));
	
	// gson 라이브러리의 json 배열 구조
	JsonArray array = new JsonArray();
	JsonObject obj2 = new JsonObject();
	obj2.addProperty("mid", "b001");
	obj2.addProperty("name", "김씨 아저씨");
	
	array.add(obj2);
	
	JsonObject obj3 = new JsonObject();
	obj3.addProperty("mid", "c001");
	obj3.addProperty("name", "박씨 총각");
	
	array.add(obj3);
	
	out.print("<h3>gson 라이브러리를 사용한 Object 배열</h3>");
	out.print(array);
	
	
	JsonElement ele = array.get(0);
	out.print("<li>mid : " + ele.getAsJsonObject().get("mid"));
	out.print("<li>name : " + ele.getAsJsonObject().get("name"));
	
%>
</body>
</html>