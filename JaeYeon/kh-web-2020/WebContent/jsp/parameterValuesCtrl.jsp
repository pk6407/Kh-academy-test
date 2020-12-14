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
<title>parameterValuesCtrl</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	if(request.getMethod().equals("GET")){
		String mid = request.getParameter("mid");
		String gender = request.getParameter("gender");
		
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		String[] attFile = request.getParameterValues("attFile");
		
		out.print("<li>아이디: " + mid);
		out.print("<li>성별: " + gender);
		out.print("<li>취미: " + Arrays.toString(hobby));
		out.print("<li>과목: " + Arrays.toString(subject));
		out.print("<li>첨부파일: " + Arrays.toString(attFile));
		
		out.print("<h4>getParameterNames()</h4>");
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String str = en.nextElement();
			out.print("<li>" + str);
		}
		
		out.print("<h4>getParameterMap()</h4>");
		Map<String, String[]> map = null;
		map = request.getParameterMap();
		
		Set<String> set = map.keySet();
		Iterator it = set.iterator();
		while(it.hasNext()){
			String key = it.next();
			String[] values = map.get(key);
			out.print("<li>" + key + " : " + Arrays.toString(values));
		}
		
		
		
		
		
		
		
		out.print("<hr/>");
	}
%>

</body>
</html>