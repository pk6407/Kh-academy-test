# 1. jQuery

- html+CSS+javascript를 통합한 하나의 라이브러리
- 굉장히 쉬운 접근방법을 제공한다. --> 전체 처리 속도 감소
- 모든 javascript 문법은 그대로 사용 가능.
- 대소문자 구별
- " or ** 는 구별하지 않음.
- 라이브러리를 사용하는법
  - CDN
  - 라이브러리를 해당 프로젝트내에 복사해서 사용.
- jQuery는 모든것이 함수화되어 있기 때문에 함수에 대한 이해가 좋을수록 jQuery의 이해도가 높아 질수 있다.
  - ex) id='abc'인 요소를 선택

- javascript
```javascript
    var id = document.getElementByid('abc);
    var get ID = function(id){
        return document.getElementByid(id);
    }
        var id = getId('abc');
```
- jquery(```jquery 가 안되서 스크립트로 햇어요;;)

```jquery
    var id = $('abc');
```
- http:www.jquery.com

eclipse EE 버전 설치후 환경 설정

## 1.1. 한글 인코딩 : UTF-8
  - Preferences 에서 enc 치고 content Types 에 text textEditor 에 utf-8 update
  - workspace 에서 맨밑에 other 에서 utf-8바꾸고 적용
  - CSS filles 에서 맨위에 UTF-8로 바꾸기
  - HTTL filles 도 맨위에 UTF-8로 바꿈
  - JSP files 도 맨위 UTF-8로 바꿈
  - xml files 도 맨위 UTF-8로 바꾸기
## 1.2. 자바 연결 : 확인
  - Preferences 에서 java안에 install JRES 확인
## 1.3. 웹서버 설정 : JSP컨테이너(톰캣)
  - Preferences 에서 server안에 Runtime Envlronments 확인
## 1.4. 현재 프로젝트에 웹서버 설정
    - 오른쪽 위에 java 나 Debug가 아닌 java EE 로 되엇어야됨.(안되잇을 경우 그 옆에 창생성 누르고 java EE 누르셈^^)
- 새로만든 jsp에서 1줄에 빨간색 x 표시 뜰 경우 (프로젝트 오른쪽 클릭후 build path 누르고 java build path에서 add Libradry 에서 톰캣 추가 ㄱㄱ)
  - window에서 preferences 에서 General 에서 Web Browser 에 다른 거 추가 가능^^

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro</title>
</head>
<body>
<% //스크립틀릿(scriptlet) : java coding area 
	// System.out.println()
	// javascript : document.write(), console.log()
	out.print("hi jQuery...");

%>

</body>
</html>
```
- jsp
  - <%@ ~~~~~~~%> : 지시문
  - <%() ~~~~~~~~~~%> : 선언문
  - <% =       %> :실행문 

## 1.5. 
- https://code.jquery.com/ 에서 ㄱㄱ

```jquery
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
```

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
<% //스크립틀릿(scriptlet) : java coding area 
	// System.out.println()
	// javascript : document.write(), console.log()
	out.print("hi jQuery...");

%>
<h1 id='header'>jQuery Test를 위한 태그</h1>

<script>
$('#header').css('color','#f00');

</script>
</body>
</html>
```

- jquery.com/download/에서 Download the compressed,production jQuery 3.5.1 를 링크 저장 후 프로젝트 WebContent 밑에 lib폴더 만들고 거기로 끌어가져오면됨^^

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<% //스크립틀릿(scriptlet) : java coding area 
	// System.out.println()
	// javascript : document.write(), console.log()
	out.print("hi jQuery...");

%>
<h1 id='header'>jQuery Test를 위한 태그</h1>

<script>
$('#header').css('color','#f00');

</script>
</body>
</html>
```
- jquery 는 큰따옴표,작은 따옴표 부분 안함
  - 그러나 한가지만 쓰도록...하세여..

# 2. CSS
 - id: #ele {...} --> $(ele).css(key,value)
 - class: .ele 
  
# 2.1.
  - #ele > ele
  - #ele ele
  - ele[]

- DOM?
  - DOM 은 동일한 문서를 표현하고, 저장하고, 조작하는 방법을 제공한다. DOM 은 웹 페이지의 객체 지향 표현이며, 자바스크립트와 같은 스크립팅 언어를 이용해 DOM 을 수정할 수 있다. W3C DOM, WHATWG DOM 표준은 대부분의 브라우저에서 DOM 을 구현하는 기준이다
  - HTML을 트리구조로 표현한것.
  - selectors,Attributes,Travrsing,Manipulation,CSS,Event,Effects,Ajax
- JSON 표기방법
  - 1. KEY:VALUE => {key:value, key:value,...}
  - 2. 배열 => [v1,v2,v3,...]
  - 3. 혼합형
    - 1. 배열안에 map : [{  },{   },...]
    - 2. map 안에 배열 : {key:[,,,,]}

- 왠만하면 script는 타이틀 과 해더 마지막 사이에 넣거나 body 끝에 넣도록 하자(아무대나 넣으면 안좋게 본다...받은 사람이.)

jquery식 스타일 시트 먹힌후

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
<div id='index'>
	<header id='header'>헤더</header>
	<section id='contents'>contents</section>
	<footer id='footer'>융합 S/W 개발(주)</footer>
</div>
<script>
	// 모든 기본태그의 마진,패딩을 0로 설정
	$('*').css('margin','0px');
	$('*').css('padding','0px');
	// 패딩의 증가의 영향을 최소화 하기 위한 조치
	$('*').css('box-sizing','border-box');
	
	// index 페이지의 넓이와 중앙배치
	$('#index').css('width','800px');
	$('#index').css('margin','auto');
	
	// header의 높이와 바탕색
	$('#index>#header').css('height','150px');
	$('#index>#header').css('background-color','#ccc');
	
	// contents는 최소높이만
	$('#index>#contents').css('min-height','250px');
	
	//footer 높이와 바탕색
	$('#index>#footer').css('height','100px');
	$('#index>#footer').css('background-color','#bbb');
	$('#index>#footer').css('text-align','center');
	$('#index>#footer').css('line-height','100px');
</script>
</body>
</html>
```
가상 이미지 와 JSON 표기법 먹힌 후

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
<div id='index'>
	<header id='header'>헤더</header>
	<section id='contents'>
		<article class='content'></article>
		<aside class='aride'>
			<img src='http://placehold.it/150*100'>
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
	
	// index 페이지의 넓이와 중앙배치
	$('#index').css('width','800px');
	$('#index').css('margin','auto');
	
	// header의 높이와 바탕색
	$('#index>#header').css('height','150px');
	$('#index>#header').css('background-color','#ccc');
	
	// contents는 최소높이만
	$('#index>#contents').css('min-height','250px');

	//footer 높이와 바탕색 등등을 JSON 표기법으로
	$('#index>#footer').css({
		'height' : '100px',
		'background-color' : '#00f',
		'text-align' : 'center',
		'line-height' : '100px'
	});
</script>
</body>
</html>
```

가상이미지에 대한 스타일 시트 먹힌후 

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
<div id='index'>
	<header id='header'>헤더</header>
	<section id='contents'>
		<article class='content'>content</article>
		<aside class='aride'>
			<img src='http://placehold.it/150*100'>
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
	
	// index 페이지의 넓이와 중앙배치
	$('#index').css('width','800px');
	$('#index').css('margin','auto');
	
	// header의 높이와 바탕색
	$('#index>#header').css('height','150px');
	$('#index>#header').css('background-color','#ccc');
	$('#index>#header').css('margin-top','5px');
	
	// contents는 최소높이만
	$('#index>#contents').css('min-height','250px');

	//footer 높이와 바탕색 등등을 JSON 표기법으로
	$('#index>#footer').css({
		'height' : '100px',
		'background-color' : '#00f',
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
 
```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter</title>
<script src='../lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<div id='filter'>
	<fieldset>
		<legend>filter</legend>
		<ul>
		<li>선택된 요소중 필요한 요소만을 걸러내는 방법</li>
		<li>접두문자 ':'을 사용한다.</li>
		<li>필터와필터를 연결하여 사용할 수 있다.</li>
		<li>종류=> : eq(index) , :even , :odd , :first , :last , :gt(index) , :lt(index)</li>
		</ul>
	</fieldset>
	
	<ol>
		<li>백두산</li>
		<li>금강산</li>
		<li>설악산</li>
		<li>치악산</li>
		<li>내장산</li>
		<li>속리산</li>
		<li>맛동산</li>
		<li>한라산</li>
	</ol>
</div>
<script>
	// UL태그안에 있는 첫번째 li
	$('#filter>ol>li:first').css('color','#f00');
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
<title>filter</title>
<script src='../lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<div id='filter'>
	<fieldset>
		<legend>filter</legend>
		<ul>
		<li>선택된 요소중 필요한 요소만을 걸러내는 방법</li>
		<li>접두문자 ':'을 사용한다.</li>
		<li>필터와필터를 연결하여 사용할 수 있다.</li>
		<li>종류=> : eq(index) , :even , :odd , :first , :last , :gt(index) , :lt(index)</li>
		</ul>
	</fieldset>
	
	<ol>
		<li>백두산</li>
		<li>금강산</li>
		<li>설악산</li>
		<li>치악산</li>
		<li>내장산</li>
		<li>속리산</li>
		<li>맛동산</li>
		<li>한라산</li>
	</ol>
</div>
<script>
	// UL태그안에 있는 첫번째 li
	$('#filter>ol>li:first').css('color','#f00');
	$('#filter>ol>li:odd').css('font-weight','bolder');
  
</script>

</body>
</html>
```

-  odd 는 홀수만 선택 인데 왜 짝수 가 될까요?? 왜냐하면 0 부터 시작해서 입니당.. 

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter</title>
<script src='../lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<div id='filter'>
	<fieldset>
		<legend>filter</legend>
		<ul>
		<li>선택된 요소중 필요한 요소만을 걸러내는 방법</li>
		<li>접두문자 ':'을 사용한다.</li>
		<li>필터와필터를 연결하여 사용할 수 있다.</li>
		<li>종류=> : eq(index) , :even , :odd , :first , :last , :gt(index) , :lt(index)</li>
		</ul>
	</fieldset>
	
	<ol start='0'>
		<li>백두산</li>
		<li>금강산</li>
		<li>설악산</li>
		<li>치악산</li>
		<li>내장산</li>
		<li>속리산</li>
		<li>맛동산</li>
		<li>한라산</li>
	</ol>
</div>
<script>
	// UL태그안에 있는 첫번째 li
	$('#filter>ol>li:first').css('color','#f00');
	$('#filter>ol>li:odd').css('font-weight','bolder');
</script>

</body>
</html>
```

- 이렇게 코드치면 0번 백두산 1번 금강산 2번 설악산 순으로 나오기때문에 올바르게 됨^^,css 한개 만먹일때는 ('color','#f00'); 이렇게
  
```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter</title>
<script src='../lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<div id='filter'>
	<fieldset>
		<legend>filter</legend>
		<ul>
		<li>선택된 요소중 필요한 요소만을 걸러내는 방법</li>
		<li>접두문자 ':'을 사용한다.</li>
		<li>필터와필터를 연결하여 사용할 수 있다.</li>
		<li>종류=> : eq(index) , :even , :odd , :first , :last , :gt(index) , :lt(index)</li>
		</ul>
	</fieldset>
	
	<ol start='0'>
		<li>백두산</li>
		<li>금강산</li>
		<li>설악산</li>
		<li>치악산</li>
		<li>내장산</li>
		<li>속리산</li>
		<li>맛동산</li>
		<li>한라산</li>
	</ol>

	<div id='items'>
		<div>방가......1</div>
		<div>방가......2</div>
		<div>방가......3</div>
		<div>방가......4</div>
		<div>방가......5</div>
		<div>방가......6</div>
	</div>
	
</div>
<script>
	// UL태그안에 있는 첫번째 li
	$('#filter>ol>li:first').css('color','#f00');
	$('#filter>ol>li:odd').css('font-weight','bolder');
	
	// items안에 있는 div의 바탕색상을 홀짝수로 나뉘어 표시되도록 구성
	$('#filter>#items>div:odd').css({
		'background-color' : '#00f',
		'color' : '#ff0'
	});
	$('#filter>#items>div:even').css({
		'background-color' : '#f00',
		'color' : '#ff0'
	});
	
	
</script>

</body>
</html>
```

- 홀수 짝수 글자만 바꾸는 코드 추가해봄^^,css 여러개 먹일때는 $('#filter>#items>div:odd').css({
		'background-color' : '#00f',
		'color' : '#ff0'
	}); 이렇게

  index.jsp 코드안에 인트로 하는 코드

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
	<header id='header'>헤더</header>
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
	
	// index 페이지의 넓이와 중앙배치
	$('#index').css('width','800px');
	$('#index').css('margin','auto');
	
	// header의 높이와 바탕색
	$('#index>#header').css('height','150px');
	$('#index>#header').css('background-color','#ccc');
	$('#index>#header').css('margin-top','5px');
	
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
		'background-color' : '#00f',
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
- index 에서 intro 를 인트로하고 intro 페이지에 filter와travers를 인트로함

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<% //스크립틀릿(scriptlet) : java coding area 
	// System.out.println()
	// javascript : document.write(), console.log()
	out.print("hi jQuery...");

%>
<h1 id='header'>jQuery Test를 위한 태그</h1>
<ul>
	<li><a href='index.jsp?inc=./jquery/filter.jsp'>FILTER</a></li>
	<li><a href='index.jsp?inc=./jquery/traverse.jsp'>TRAVERSE</a></li>
</ul>


<script>
$('#header').css('color','#f00');	// #header{color : #f00; }

</script>
</body>
</html>
```