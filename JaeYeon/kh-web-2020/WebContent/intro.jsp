<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro1130</title>
		<!-- 1. CDN 라이브러리 코드 복사해서 사용하는 법 -->
<!--  <script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>  -->
		
		<!-- 2. jquery 직접 다운받아서 lib 폴더 만들어서 넣은 뒤 임포트 시키는 방법 -->		
<script src='./lib/jquery-3.5.1.min.js'>

</script>
</head>
<body>
<% //스크립틀릿(Scriptlet) : java coding area
	// java : System.out.println();
	// javascript : document.write(브라우저), console.log(개발자모드)
	out.print("JSP 표준 입력장치");
	
%>
<h1 id='header'>jQuery Test를 위한 태그</h1>
<ul>
 <li><a href = 'index.jsp?inc=./jquery/filter.jsp'>FILTER</a></li>
 <li><a href = 'index.jsp?inc=./jquery/traverse.jsp'>TRAVERSE</a></li>
</ul>
<script>
$('#header').css('color', '#f00'); // css(정적) => #header{color:#f00;};

</script>
</body>
</html>