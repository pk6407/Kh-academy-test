# 전날 README.md 랑 이어짐

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>traverse</title>

<script src='../lib/jquery-3.5.1.min.js'></script> // 단독으로 하면 잇어야되지만 통합페이지에는 잇어서 안써도된다

</head>
<body>
<div id='traverse'>
	<h1>TRAVERSE</h1>
	<fieldset>
		<legend>traverse</legend>
		<ul>
			<li>traverse는 '.'을 찍어서 표현한다.</li>
			<li>명령어는 filter와 traverse가 매우 유사하거나 상충되기 때문에 개인적
				취향에 따라 사용 빈도수가 달라질 수 있다.</li>
			<li>종류=> .eq(index), .first(), .last(), .slice(start [, end])</li>
			<li>method=> .children(expr), .find(expr), .parent(expr),
						 .next(expr), .prev(expr)</li>
		</ul>
	</fieldset>
	
	<ul>
		<li>백두산</li>
		<li>금강산</li>
		<li>설악산</li>
		<li>치악산</li>
		<li>내장산</li>
		<li>속리산</li>
	 	<li>맛동산</li>
		<li>한라산</li>
	</ul>
</div>
<script>
	$('#traverse ul') // 후손(깊이에 관계없이 모든 ul)
	
	</script>
</body>
</html>
```

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>traverse</title>
</head>
<body>
	<div id='traverse'>
		<h1>TRAVERSE</h1>
		<fieldset>
			<legend>traverse</legend>
			<ul>
				<li>traverse는 '.'을 찍어서 표현한다.</li>
				<li>명령어는 filter와 traverse가 매우 유사하거나 상충되기 때문에 개인적 취향에 따라 사용 빈도수가
					달라질 수 있다.</li>
				<li>종류=> .eq(index), .first(), .last(), .slice(start [, end])</li>
				<li>method=> .children(expr), .find(expr), .parent(expr),
					.next(expr), .prev(expr)</li>
			</ul>
		</fieldset>

		<ul>
			<li>백두산</li>
			<li>금강산</li>
			<li>설악산</li>
			<li>치악산</li>
			<li>내장산</li>
			<li>속리산</li>
			<li>맛동산</li>
			<li>한라산</li>
		</ul>
	</div>
	<script>
	$('#traverse>ul>li').first().css('color', '#f00');
	$('#traverse>ul>li').filter(':odd').css('color', '#00f');
	$('#traverse>ul>li').slice(1,4).css('font-family', '궁서체');
	</script>
	
</body>
</html>
```

- 두가지 방법중 하나 하시면 됩니당^^ 
    - $('#traverse>ul>li').first().css('color', '#f00');
    - $('#filter>ol>li:first').css('color','#f00');

- 1번째 4번째 글자만 바꾸는 명령어
  - $('#traverse>ul>li').slice(1,4).css('font-family', '궁서체');

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>traverse</title>
</head>
<body>
	<div id='traverse'>
		<h1>TRAVERSE</h1>
		<fieldset>
			<legend>traverse</legend>
			<ul>
				<li>traverse는 '.'을 찍어서 표현한다.</li>
				<li>명령어는 filter와 traverse가 매우 유사하거나 상충되기 때문에 개인적 취향에 따라 사용 빈도수가
					달라질 수 있다.</li>
				<li>종류=> .eq(index), .first(), .last(), .slice(start [, end])</li>
				<li>method=> .children(expr), .find(expr), .parent(expr),
					.next(expr), .prev(expr)</li>
			</ul>
		</fieldset>

		<ul>
			<li>백두산</li>
			<li>금강산</li>
			<li>설악산</li>
			<li>치악산</li>
			<li>내장산</li>
			<li>속리산</li>
			<li>맛동산</li>
			<li>한라산</li>
		</ul>

		<!-- .parent() example code -->
		<div id='div1'>
			<input type='button' value='x' class='btn1' />
		</div>

		<div id='div2'>
			<input type='button' value='x' class='btn2' />
		</div>
	</div>
	<script>
	$('#traverse>ul>li').first().css('color', '#f00');
	$('#traverse>ul>li').filter(':odd').css('color', '#00f');
	$('#traverse>ul>li').slice(1,4).css('font-family', '궁서체');

	// 1) div1, div2의 넓이와 높이를 지정하시오.(TODO)
	$('#traverse>div').css({
		'height':'200px', 
		'width':'100px',
		'border' : '1px solid #444'
		});
	// 2) btn1, btn2의 넓이와 높이를 지정하시오.(TODO)
	$('#traverse>div>input').css({
		'height':'100px', 
		'width':'100px'
		});
	</script>

</body>
</html>
```

- div1,2의 넓이와 높이를 바꾸고,btn1,btn2의 넓이와 높이를 바꾸엇다.(요렇게도 된다)
    - $('.btn1,.btn2').css({'width' : '100px','height' : '100px'});
    - $('#traverse>div>.bth1, #traverse>div>.bth2').css({'width' : '80px', 'height' : '30px'});
  
```jquery
// btn1, btn2에 이벤트 처리
	var btn1 = $('.btn1')[0];
	btn1.onclick = function(){
		alert('btn1이 클릭됨.')
	}
	
	var btn2 = $('.btn2')[0];
	btn2.onclick = function(){
		
	}
```
- var btn1 = $('.btn1')[0]; 이소리가 밑에 저소리
  - var btn1 = <input type='button' value='x' class='btn1' />
- btn1.onclick = function(){
		alert('btn1이 클릭됨.')
	}
    - btn1 버튼을 누르면 'btn1이 클릭됨'이라고 출력됨 

```jquery
var btn1 = $('.btn1')[0];
	btn1.onclick = function(){
		var p = $(btn1).parent();
		$(p).css('background-color' , '#88f');
	}
```
btn1 버튼 누르면 색상이 바뀌는 코드^^

```jquery
var btn2 = $('.btn2')[0];
	btn2.onclick = function(){
		alert('btn2클릭하셧소이다?')
		var t = $(btn2).parent();
		$(t).css('background-color' , 'red');
	}
```
클릭 시 눌럿을때 출력문 출력 후 색상 변경^^
 - ```jquery
    var btn2 = $(".btn2")[0];
	btn2.onclick = function() {
		var parent = $(btn2).parent().css("background-color", "beige");	
	}
    ```
    - 이렇게 해도 된다...다시 보니까 이렇게 하는게 더 편하고 짧다..
  
```jquery
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
 String inc = "intro.jsp";
 if(request.getParameter("inc") != null){
	 inc = request.getParameter("inc");
 }

%>
<div id='index'>
	<header id='header'>
		<nav id='nav'>
			<ul>
				<li><a href='index.jsp'>HOME</a></li>
				<li><a href='index.jsp?inc=./jquery/menu.jsp'>JQUERY</a></li>
				<li>방명록</li>
				<li>게시판</li>
				<li>회원관리</li>
			</ul>
		</nav>
	</header>
	
	
	<section id='contents'>
		<article class='content'>
		<jsp:include page="<%=inc %>"/>
		</article>
		<aside class='aride'>
			<img src="http://placehold.it/150X100"/>
		</aside>
	 
	</section>
	<footer id='footer'>융합 S/W 개발(주)</footer>
</div>
<script>
	// 모든 기본태그의 마진,패딩을 0로 설정
	$('*').css('margin','0px');
	$('*').css('padding','0px');
	// 패딩의 증가의 영향을 최소화 하기 위한 조치
	$('*').css('box-sizing','border-box');
	$('a').css('text-decoration', 'none');
	
	// index 페이지의 넓이와 중앙배치
	$('#index').css('width','800px');
	$('#index').css('margin','auto');
	
	// header의 높이와 바탕색
	$('#index>#header').css('height','150px');
	$('#index>#header').css('background-color','#ccc');
	$('#index>#header').css('margin-top','5px');
	
	// header>nav
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
	
	
	// contents는 최소높이만
	$('#index>#contents').css('min-height','250px');
	
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
	
	
</script>
</body>
</html>
```

- 다른 페이지 처럼 위에 메뉴 나열...함

```jquery
$('#header>#nav>ul>li').first().css('border-radius' , '8px 0 0 8px');
```
를 추가하면 
HOEM 의 박스 의 왼쪽위와 아래가 둥글해진다.(왼쪽 위 = 1, 오른쪽 위 = 2, 오른쪽 아래 = 3, 왼쪽 아래 = 4)

```jquery
$('#header>#nav>ul>li').last().css('border-radius' , '0 8px 8px 0');
```
를 추가하면
회원관리 의 박스의 오른쪽 위와 아래가 둥글해진다^^

```jquery
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
 String inc = "intro.jsp";
 if(request.getParameter("inc") != null){
	 inc = request.getParameter("inc");
 }

%>
<div id='index'>
	<header id='header'>
		<nav id='nav'>
			<ul>
				<li><a href='index.jsp'>HOME</a></li>
				<li><a href='index.jsp?inc=./jquery/menu.jsp'>JQUERY</a></li>
				<li>방명록</li>
				<li>게시판</li>
				<li>회원관리</li>
			</ul>
		</nav>
	</header>
	
	
	<section id='contents'>
		<article class='content'>
		<jsp:include page="<%=inc %>"/>
		</article>
		<aside class='aride'>
			<img src="http://placehold.it/150X100"/>
		</aside>
	 
	</section>
	<footer id='footer'>융합 S/W 개발(주)</footer>
</div>
<script>
	// 모든 기본태그의 마진,패딩을 0로 설정
	$('*').css('margin','0px');
	$('*').css('padding','0px');
	// 패딩의 증가의 영향을 최소화 하기 위한 조치
	$('*').css('box-sizing','border-box');
	$('a').css('text-decoration', 'none');
	
	// index 페이지의 넓이와 중앙배치
	$('#index').css('width','800px');
	$('#index').css('margin','auto');
	
	// header의 높이와 바탕색
	$('#index>#header').css('height','150px');
	$('#index>#header').css('background-color','#ccc');
	$('#index>#header').css('margin-top','5px');
	
	// header>nav
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
	
	$('#header>#nav>ul>li').first().css('border-radius' , '8px 0 0 8px');
	$('#header>#nav>ul>li').last().css('border-radius' , '0 8px 8px 0');
	
	// contents는 최소높이만
	$('#index>#contents').css('min-height','250px');
	
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
	
	
</script>
</body>
</html>
```

- 추가 후 코드^^

```jquery
$('#index>#header').css('position', 'relative');
```

- 메뉴 창 을 오른쪽 아래에 배치

```jquery
$('#header>#nav').css({
		'position' : 'absolute',
		'right' : '2px',
		'bottom' : '2px'
	})
```

- 그 후 오른쪽하고 아래 2px씩 띄움..

```jquery
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
```

- 오른쪽 중단 부분에 사이드 메뉴 출력, 상단 메뉴 추가 
 
- traverse
-----------------------------------
- manipulation
-----------------------------------
> 지정된 요소의 내부환경, 외부환경에 대한 요소를 추가,제거
> append,prepend,before,after,remove,empty

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
</head>
<body>
<h3>jQuery List</h3>
<hr/>
<ol>
	<li><a href='index.jsp?inc=./jquery/filter.jsp'>FILTER</a></li>
	<li><a href='index.jsp?inc=./jquery/traverse.jsp'>TRAVERSE</a></li>
	<li><a href='index.jsp?inc=./jquery/manipulation.jsp'>MANIPULATION</a>
</ol>
</body>
</html>
```

- jQuery List => menu에 추가

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manipulation</title>
</head>
<body>
<div id='main'>
	<div class='target'>TARGET</div>

	<div class='btn_zone'>
		<input type='button' value='WRAP' id='btnWrap' />
		<input type='button' value='APPEND' id='btnAppend' />
		<input type='button' value='PREPEND' id='btnPrepend' />
	</div>
</div>
</body>
</html>
```

- manipulation.jsp 로 새로 만듬

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manipulation</title>
</head>
<body>
<div id='main'>
	<div class='target'>TARGET</div>

	<div class='btn_zone'>
		<input type='button' value='WRAP' id='btnWrap' onclick='abc(this)'/>
		<input type='button' value='APPEND' id='btnAppend' onclick='abc(this)'/>
		<input type='button' value='PREPEND' id='btnPrepend' onclick='abc(this)'/>
	</div>
</div>

<script>
 // 버튼 3개에 각각 click event 처리
 
 

</script>

</body>
</html>
```

- abc 묶어서 한번에 버튼 3개의 이벤트 처리 가능(그러나 이방법 추천안함..)

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manipulation</title>
</head>
<body>
	<div id='main'>
		<div id='target'>TARGET</div>

		<div id='btn_zone'>
			<input type='button' value='WRAP' id='btnWrap' onclick='abc(this)' />
			<input type='button' value='APPEND' id='btnAppend' /> 
			<input type='button' value='PREPEND' id='btnPrepend' />
		</div>
	</div>

	<script>
		// WRAP 버튼에 click event 처리
		function abc(button) {
			console.log(button.id);
		}

		var btnAppend = $('#btnAppend')[0];
		btnAppend.onclick = function() {
			console.log(this.value);
		}


		var btnPrepend = document.getElementById('btnPrepend');
		btnPrepend.onclick = function() {
			console.log(this.value)
		}
		
		
	</script>

</body>
</html>
```

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manipulation</title>
</head>
<body>
	<div id='main'>
		<div id='target'>TARGET</div>

		<div id='btn_zone'>
			<input type='button' value='WRAP' id='btnWrap' onclick='abc(this)' />
			<input type='button' value='APPEND' id='btnAppend' /> 
			<input type='button' value='PREPEND' id='btnPrepend' />
		</div>
	</div>

	<script>
		// WRAP 버튼에 click event 처리
		function abc(button) {
			//console.log(button.id);
			var wrap = "<label><input type='checkbox'>확인</label>";
			$('#main>#target').wrap(wrap);
			
		}

		var btnAppend = $('#btnAppend')[0];
		btnAppend.onclick = function() {
			//console.log($(this).val());
			var wrap = "<label><input type='checkbox'>확인</label>";
			for(var i =0;i<5;i++){
				$('#main>#target').append(wrap);
			}
		}

		var btnPrepend = document.getElementById('btnPrepend');
		btnPrepend.onclick = function() {
			//console.log(this.value)
			var wrap = "<label><input type='checkbox'>확인</label>";
			$('#main>#target').prepend(wrap);
		}
		
		
	</script>

</body>
</html>
```

