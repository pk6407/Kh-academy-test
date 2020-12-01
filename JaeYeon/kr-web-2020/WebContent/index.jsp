<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>


	<%
		// inc
	String inc = "intro.jsp";
	if (request.getParameter("inc") != null) {
		inc = request.getParameter("inc");
	}

	// sub
	String sub = "./jquery/menu.jsp";
	if (request.getParameter("sub") != null) {
		sub = request.getParameter("sub");
	}
	%>
	<div id='index'>
		<header id='header'>
			<nav id='nav'>
				<ul>
					<li><a href='index.jsp'>HOME</a></li>
					<li><a href='index.jsp?sub=./jquery/menu.jsp'>JQUERY</a></li>
					<li><a href='index.jsp?sub=./ajax/menu.jsp'>AJAX</a></li>
					<li><a href='index.jsp?sub=./mybatis/menu.jsp'>MYBATIS</a></li>
					<li>방명록</li>
					<li>게시판</li>
					<li>회원관리</li>
				</ul>
			</nav>
		</header>


		<section id='contents'>
			<article class='content'>
				<jsp:include page="<%=inc%>" />
			</article>
			<aside class='aside'>
				<img src="http://placehold.it/150X100" />
				<div id='sub_menu'>
					<jsp:include page="<%=sub%>" />
				</div>
			</aside>
			
		</section>
		<footer id='footer'>융합 S/W 개발(주)</footer>
	</div>
	<script>
		// 모든 기본태그의 마진,패딩을 0로 설정
		$('*').css('margin', '0px');
		$('*').css('padding', '0px');
		// 패딩의 증가의 영향을 최소화 하기 위한 조치
		$('*').css('box-sizing', 'border-box');
		$('a').css('text-decoration', 'none');

		// index 페이지의 넓이와 중앙배치
		$('#index').css('width', '800px');
		$('#index').css('margin', 'auto');

		// header의 높이와 바탕색
		$('#index>#header').css('height', '150px');
		$('#index>#header').css('background-color', '#ccc');
		$('#index>#header').css('margin-top', '5px');
		$('#index>#header').css('position', 'relative');

		// header>nav
		$('#header>#nav').css({
			'position' : 'absolute',
			'right' : '2px',
			'bottom' : '2px'
		})
		$('#header>#nav>ul').css({
			'list-style' : 'none',
		});

		$('#header>#nav>ul>li').css({
			'display' : 'inline-block',
			'padding' : '3px',
			'width' : '70px',
			'background-color' : '#99f',
			'text-align' : 'center'
		})

		$('#header>#nav>ul>li').first().css('border-radius', '8px 0 0 8px');
		$('#header>#nav>ul>li').last().css('border-radius', '0 8px 8px 0');

		// contents는 최소높이만
		$('#index>#contents').css('min-height', '250px');

		//footer 높이와 바탕색
		/*
		$('#index>#footer').css('height','100px');
		$('#index>#footer').css('background-color','#bbb');
		$('#index>#footer').css('text-align','center');
		$('#index>#footer').css('line-height','100px');
		 */

		//footer 높이와 바탕색 등등을 JSON 표기법으로
		$('#index>#footer').css({
			'height' : '100px',
			'background-color' : '#ccc',
			'text-align' : 'center',
			'line-height' : '100px'
		});

		$('#index>#contents').css({
			'margin-top' : '3px',
			'margin-botton' : '3px'
		});
		$('#index>#contents>.content').css({
			'width' : '650px',
			'float' : 'left'
		});

		$('#index>#contents>.aside').css({
			'width' : '150px',
			'float' : 'left'
		});

		$('#index>#contents>.aside>#sub_menu').css({
			'width' : '150px'
		})
		
		$('index>#contents>.aside>#sub_menu>ol').css({
			'margin-left' : '17px'
		})
	</script>
</body>
</html>