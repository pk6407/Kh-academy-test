<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index1130</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<%
	//inc
	String inc = "intro.jsp";
 	if(request.getParameter("inc") != null) {
 		inc = request.getParameter("inc");
 	} 
 	
	//sub
 	String sub = "./jquery/menu.jsp";
 	if(request.getParameter("sub") != null){
 		sub = request.getParameter("sub");	
 	}
%>
	<div id='index'>
		<!-- header 영역 -->
		<%@include file="header.jsp" %>
		
		<section id='contents'>
			<article class ='content'>
				<jsp:include page="<%=inc %>"/>
			</article>
			<aside class ='aside'>
				<jsp:include page="./member/loginfo.jsp"/>
			<div id ='sub_menu'>
				<jsp:include page="<%=sub %>"/>
			</div>
			</aside>
			
		</section>
		<%--foot 영역 --%>
		<%@include file="footer.jsp" %>
	
	</div>
	<script>
	// 모든 기본태그의 마진, 패딩을 0
	$('*').css('margin','0');
	$('*').css('padding','0');
	// 패딩의 증가의 영향을 최소화 하기위한 조치
	$('*').css('box-sizing', 'border-box');
	//
	$('a').css('text-decoration', 'none');
	
	//index 페이지의 넓이와 중앙배치
	$('#index').css('width', '800px');
	$('#index').css('margin', 'auto');
	
	//header의 높이와 바탕색
	$('#index>#header').css('height', '150px');
	$('#index>#header').css('background-color', 'grey');
	$('#index>#header').css('margin-top', '5px');
	$('#index>#header').css('position', 'relative');
	
	
	// index > header > nav
	$('#header>#nav').css({
		'position' : 'absolute',
		'right' : '2px',
		'bottom' : '2px'
	});
	
	$('#header>#nav>ul').css({
		'list-style' : 'none'
	});
	
	$('#header>#nav>ul>li').css({
		'display' : 'inline-block',
		'padding' : '3px',
		'width' : '70px',
		'background-color' : '#99f',
		'text-align' : 'center',
		'cursor' : 'pointer'
	});
	
	$('#header>#nav>ul>li').first().css('border-radius','8px 0 0 8px');
	$('#header>#nav>ul>li').last().css('border-radius','0 8px 8px 0');
	
	
	//contents는 최소높이와 바탕색
	$('#index>#contents').css('min-height', '800px');
	$('#index>#contents').css('background-color', 'white');
	
	//footer는 높이와 바탕색
	//$('#index>#footer').css('min-height', '100px');
	//$('#index>#footer').css('background-color', 'green');
	//$('#index>#footer').css('text-align', 'center');
	//$('#index>#footer').css('line-height', '100px');
	
	//footer 높이와 바탕색 등등을 JSON 표기법으로
	$('#index>#footer').css({
		'height':'100px', 
		'background-color':'grey', 
		'text-align':'center', 
		'line-height':'100px'
		});
	
	//
	$('#index>#contents').css({
		'margin-top':'3px',
		'margin-bottom':'3px'
	});
	
	//
	$('#index>#contents>.content').css({
		'width':'650px',
		'float':'left'
	});
	
	//
	$('#index>#contents>.aside').css({
		'width':'150px',
		'float':'right'
	});
	
	//
	$('#index>#contents>.aside>#sub_menu').css({
		'width': '150px'
	});
	
	$('#index>#contents>.aside>#sub_menu>ol').css({
		'margin-left' : '17px'
	});
	
	
	
	
	
	</script>
</body>
</html>