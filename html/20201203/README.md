# 전날 README.md랑 이어진다...(왠지 계속 그럴꺼같다...아마도..?)

- 1교시

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toggle</title>
<style>
	#target{
	broder:2px solid #bbb;
	width:250px;height:100px;
	font-weight:bolder;
	text-align: center;
	line-height:100px;
	}
	
	#btnToggle{
		width:120px;
		height:30px;
		line-height:30px;
	}
	
</style>
</head>
<body>
<div id='toggle'>
	<div id='target'></div>
	<br/>
	<input type='button' value='ON/OFF' id='btnToggle' />
</div>
</body>
</html>
```

이거 햇당....

- 2교시 

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toggle</title>

<style>

	#target{
	broder:2px solid #bbb;
	width:250px;height:100px;
	font-weight:bolder;
	text-align: center;
	line-height:100px;
	}
	
	#btnToggle{
		width:120px;
		height:30px;
		line-height:30px;
	}
	
	.target_on{
	background-color:#ff0;
	color:#f00;
	visibility: visible;
	display: block;
	}
	
	.target_off{
	background-color:#000;
	color:#fff;
	}
	 
</style>
</head>
<body>

<div id='toggle'>
	<div id='target'></div>
	<br/>
	<input type='button' value='ON/OFF' id='btnToggle' />

</div>
<script>
	$('#btnToggle').on('click', function(){
	$('#target').toggle(even, odd);
	})
	
	function even(){
		$('#target').attr('class', 'target_on');
	}
	
	function odd(){
		$('#target').attr('class', 'target_off');
	}
	
</script>
</body>
</html>
```

문제점 토글자체가 접엇다 폇다하면서 보엿다 안보엿다 하는기능인데 밑에 써잇는 그자도 토글이 접으면 따라 올라옴...

- 3교시 

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>one</title>
<style>
#one>#result{
	border:1px solid #44f;
	width:300px;height:120px;
	text-align: center;
	line-height: 120px;
}
#one>#btnSend{
	width:70px;
	height:30px;
}
.btn_none{display:none;}
</style>
</head>
<body>
<div id='one'>
	<div id='result'>송금 버튼을 클릭하시면 송금됩니다.</div>
	<input type='button' value='송금' id='btnSend' />
	<div>하단내용 입니다..</div>
</div>
<script>
	let cnt=0;	//전송 횟수
	$('#btnSend').click(function(){
		if(cnt==1) return false;
		cnt++;
		$('#result').html(cnt + " 회 송금됨.");
		$(this).attr('class', 'btn_none');
	})
	
	/*
	$('#btnSend').click(function(){
		cnt++;
		$('#result').html(cnt + "회 송금됨.");
		$(this).attr('disabled', 'disabled');
	})
	
	$('#btnSend').one('click', function(){
		cnt++;
		$('#result').html(cnt + " 회 송금됨.");
	})
	*/
	
</script>
</body>
</html>
```

송금 1번하면 버튼이 없어지게끔 ㅇㅅㅇ.......one이라는 이벤트를 써머금....

- 점심후 1교시

# 10 effect
• Animation Speed
◦ slow : 600/1000 초
◦ fast : 200/1000 초
◦ default : 400/1000 초
◦ 속도는 n/1000 초 단위로 설정할 수 있음.(효과가 시작되고 끝날때 까지 걸리는 시간을 의미)
• callback : 효과가 끝나면 호출되는 함수를 의미

## 10.1 종류
• show() | show( speed [, callback] )
• hide() | hide( speed [, callback] )
• toggle() | toggle( speed [ , callback] )
• slideDown( [speed] [, callback] ) | slideUp( [speed] [ , callback] )
• slideToggle( [speed] [.callback] )
• fadeIn( [speed] [.callback] ) | fadeOut( [speed] [.callback] )
• faseTo( [speed] , opacity [.callback] )
• animate(params [,speed] [, easing] [, callback] )

## 10.2 현재 상태값 체크 상태값 체크
• 요소명.is(":visible") : 현재 상태가 보여져 있는 상태
• 요소명.is("hidden") : 현재 상태가 감추어져 있는 상태
 
## 10.3 show
• 요소를 보이게 함.
• show()
• show( speed [, callback] )

```jquery
<!DOCTYPE HTML >
<html>
<head>
 <title> show </title>
 <meta charset='utf-8'>
<style>
#show_div{ border:1px solid #aaa;width:200px;
text-overflow:clip;}
.show_btn{ width:100px;height:30px}
</style>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready(function(){
$('#show_show').click(function(){
$('#show_div').show();
})
$('#show_show2').click(function(){
$('#show_div').show('slow');
})
$('#show_show3').click(function(){
$('#show_div').show(2000);
})
$('#show_hide').click(function(){
$('#show_div').hide();
})
$('#show_hide2').click(function(){
$('#show_div').hide('slow');
})
$('#show_hide3').click(function(){
$('#show_div').hide(2000);
})
})
</script>
</head>
<body>
<button id='show_show' class='show_btn'>Show</button>
<button id='show_show2' class='show_btn'>Slow Show</button>
<button id='show_show3' class='show_btn'>speed Show</button><br/>
<button id='show_hide' class='show_btn'>Hide</button>
<button id='show_hide2' class='show_btn'>Slow Hide</button>
<button id='show_hide3' class='show_btn'>speed Hide</button>
 <div id='show_div'>
<label>speed option :</label>
<ul>
<li>slow
<li>fast
<li>nomal
<li>n/1000
</ul>
</div>
</body>
</html>
```

## 10.4 hide
• 요소를 숨김
• hide()
• hide( speed [, callback] )
 10.5 toggle
• show() 와 hide()의 기능을 반복함.
• toggle()
• toggle( speed [ , callback] )

```jquery
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.ef_box{ border:5px solid #aaa;
white-space:nowrap;
padding:10px;width:350px;
}
</style>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready(function(){
$box = $('.ef_box');
$('#toggle').click(
function(){ $box.toggle(); }
);
$('#toggle_show').click(
function(){ $box.toggle('slow'); }
);
$('#toggle_speed').click(
function(){ $box.toggle(2000); }
);
}
)
</script>
</head>
<body>
<header>
<h1>Toggle : nomal | show | n/1000<hr/></h1>
</header>
<button type='button' id='toggle'>Toggle</button>
<button type='button' id='toggle_show'>Toggle slow</button>
<button type='button' id='toggle_speed'>Toggle Speed</button>
<p/>
<div class='ef_box'>
Toggle 버튼을 이용한 접근 클릭하면 사라졌다 나타났다 사 라졌다 나타났다 나타났다 나타났다 ^^<br/>
Toggle 버튼을 이용한 접근 클릭하면 사라졌다 나타났다 사 라졌다 나타났다 나타났다 나타났다 ^^<br/>
Toggle 버튼을 이용한 접근 클릭하면 사라졌다 나타났다 사 라졌다 나타났다 나타났다 나타났다 ^^<br/>
Toggle 버튼을 이용한 접근 클릭하면 사라졌다 나타났다 사 라졌다 나타났다 나타났다 나타났다 ^^<br/>
</div>
</body>
</html>
```

## 10.6 slideDown | slideUp | slideToggle
• slideDown( [speed] [, callback] )
• slideUp( [speed] [ , callback] )
• slideToggle( [speed] [.callback] )
• slideDown : 숨겨진 속성이여야 효과를 볼 수 있다. 숨겨진 요소들을 위에서 부터 아래로 차차
보여짐.
• slideUp : 이미 보여진 요소를 아래에서 부터 위로 차차 숨겨짐.

```jquery
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>slideDown | slideUp | slideToggle</title>
<style>
</style>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready( function(){
$('#sl_slideup').click(function(){
$('#sl_div').slideUp(2000, function(){});
});
$('#sl_slidedown').click(function(){
$('#sl_div').hide();
$('#sl_div').slideDown(2000,
function(){
//TODO
});
});
$('#sl_slidetoggle').click(function(){
$('#sl_div').slideToggle(2000, function(){});
});
});
</script>
</head>
<body>
<button id='sl_slideup'>Sliding UP</button>
<button id='sl_slidedown'>Sliding DOWN</button>
<button id='sl_slidetoggle'>Sliding Toggle</button>
<div id='sl_div'>
<img src='a.jpg'>
</div>
</body>
</html>
```

## 10.7 fadeIn( [speed] [.callback] ) | fadeOut( [speed] [.callback] )
지정된 요소를 서서히 보이게 하거나 감춘다.

```jquery
<!DOCTYPE HTML >
<html>
<head>
 <title> fadeIn | fadeOut </title>
 <meta charset='utf-8'>
<style>
#show_div{ border:1px solid #800000;
width:200px; height:200px;
background-color:#c0c0c0;
}
.show_btn{ width:100px;height:30px}
</style>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready(function(){
$('#fade_in').click(function(){
$('#show_div').fadeIn(2000);
})
$('#fade_out').click(function(){
$('#show_div').fadeOut(2000);
})
})
</script>
</head>
<body>
<button id='fade_in' class='fade_in_btn'>fade in</button>
<button id='fade_out' class='fade_out_btn'>fade out</button>
 <div id='show_div'></div>
</body>
</html>
```
## 10.8 fadeTo( [speed] , opacity [.callback] )
opacity : 투명도 (0~1) 1:불투명, 0:투명
요소의 투명도를 지정된 opactity 까지 서서 진행시킨다.
지정된 opacity 까지 fade 를 진행

```jquery
<!DOCTYPE HTML >
<html>
<head>
 <title> fadeTo </title>
 <meta charset='utf-8'>
<style>
#show_div{ border:1px solid #800000;
width:200px; height:200px;
background-color:#c0c0c0;
}
.show_btn{ width:100px;height:30px}
</style>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready(function(){
$('#fade_in').click(function(){
$('#show_div').fadeTo(2000,0.5);
})
$('#fade_out').click(function(){
$('#show_div').fadeTo(2000,0);
})
})
</script>
</head>
<body>
<button id='fade_in' class='fade_in_btn'>fadeTo 0.5 </button>
<button id='fade_out' class='fade_out_btn'>fadeTo 0.0</button>
 <div id='show_div'></div>
</body>
</html>
```

## 10.9 animate(params [, speed] [, easing] [, callback] )
- params : 효과를 표현할 스타일 셋. map 형태로 지정할 수 있음.
- easing : 플러그인을 지정하여 외부 효과를 지정할 때.
```jquery
<!DOCTYPE HTML >
<html>
<head>
 <title> animate </title>
 <meta charset='utf-8'>
<style>
#show_div{ border:1px solid #800000;
width:200px; height:200px;
background-color:#c0c0c0;
}
.show_btn{ width:100px;height:30px}
</style>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready(function(){
$('#ani_btn').click(function(){
$('#show_div').animate({width:'toggle', opacity:'toggle'}, 2000);
})
})
</script>
</head>
<body>
<button id='ani_btn' >animation</button>
 <div id='show_div'></div>
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
<title>effect</title>
<style>
#parent{
	height: 210px;
}
#target{
	background-image:url(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdTgf8J%2FbtqJZoqrhTI%2FFMGhTl7Rd8dxB6r8VK6L4k%2Fimg.jpg);
	background-size:100% 100%;
	border-radius:10px;
	width:90%;
	height:200px;
}
</style>
</head>
<body>
<div id='effect'>
	<div id='parent'>
		<div id='target'></div>
	</div>
	
	<div id='btns'>
		<input type='button' value='SHOW' 			id='btnShow' />	
		<input type='button' value='HIDE' 			id='btnHide' />	
		<input type='button' value='TOGGLE' 		id='btnShow' />	
		<input type='button' value='SLIDE DOWN' 	id='btnSlideDown' />	
		<input type='button' value='SLIDE UP' 		id='btnSlideUp' />	
		<input type='button' value='SLIDE TOGGLE' 	id='btnSlideToggle' />	
		<input type='button' value='FADE IN' 		id='btnFadeIn' />	
		<input type='button' value='FADE OUT' 		id='btnFadeOut' />	
		<input type='button' value='ANI' 			id='btnAni' />
		</div>

</div>

</body>
</html>
```

- 점심후 2교시 

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect</title>
<style>
#parent{
	height: 210px;
}
#target{
	background-image:url(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdTgf8J%2FbtqJZoqrhTI%2FFMGhTl7Rd8dxB6r8VK6L4k%2Fimg.jpg);
	background-size:100% 100%;
	border-radius:10px;
	width:90%;
	height:200px;
}
</style>
</head>
<body>
<div id='effect'>
	<div id='parent'>
		<div id='target'></div>
	</div>
	
	<div id='btns'>
		<input type='button' value='SHOW' 			id='btnShow' />	
		<input type='button' value='HIDE' 			id='btnHide' />	
		<input type='button' value='TOGGLE' 		id='btnToggle' />	
		<input type='button' value='SLIDE DOWN' 	id='btnSlideDown' />	
		<input type='button' value='SLIDE UP' 		id='btnSlideUp' />	
		<input type='button' value='SLIDE TOGGLE' 	id='btnSlideToggle' />	
		<input type='button' value='FADE IN' 		id='btnFadeIn' />	
		<input type='button' value='FADE OUT' 		id='btnFadeOut' />	
		<input type='button' value='ANI' 			id='btnAni' />
		</div>

</div>
<script>
$('#btnShow').on('click', function(){
	$('#target').show(2000,function(){alert('난간다!')});
})
$('#btnHide').on('click',function(){
	$('#target').hide(2000,function(){alert('나도 간다')});
})
$('#btnToggle').on('click',function(){
	$('#target').toggle(700,function(){alert('토클눌럿다오!')});
})
$('#btnSlideDown').on('click',function(){
	$('#target').slideDown(1000,function(){alert('아주좋아욘!')});
})
$('#btnSlideUp').on('click',function(){
	$('#target').slideUp(1000,function(){alert('아주싫어욘!')});
})
$('#btnSlideToggle').on('click',function(){
	$('#target').slideToggle(700,function(){alert('누르지마!')});
})
$('#btnFadeIn').on('click',function(){
	$('#target').fadeIn(1000,function(){alert('누르지마라!')})
})
$('#btnFadeOut').on('click',function(){
	$('#target').fadeOut(1000,function(){alert('누르지마 제발!')})
})
$('#btnAni').on('click',function(){
	$('#target').animate({
		'width' : 'toggle',
		'opacity' : 'toggle',
		'height' : 'toggle'
	});
})
/*
$('#btnShow').click(function(){
	$('#target').show();
})
*/
</script>
</body>
</html>
```

각종 이펙트 효과 집어넣음^^

- 라스트 팡!교시!

http://code.jquery.com/ui/

ui창관련테마?

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tabs</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
</head>
<body>
<div id='tabs'>
	<!-- 상단 탭 메뉴 -->
	<ul>
	<li><a href='#web'>WEB</a></li>
	<li><a href='#app'>APP</a></li>
	<li><a href='#framework'>FrameWork</a></li>
	<li><a href='#office'>Office</a></li>
	<li><a href='#bigData'>Big Data</a></li>
	</ul>
	
	<!-- 각 탭에 해당하는 컨텐츠 내용들 --> 
	<div id='web'>web 이란..</div>
	<div id='app'>app 이란...</div>
	<div id='framework'>framework 이란..</div>
	<div id='office'>office 이란..</div>
	<div id='bigData'>bigData 이란..</div>
	
</div>

<script>
	$('#tabs').tabs();
</script>
</body>
</html>
```