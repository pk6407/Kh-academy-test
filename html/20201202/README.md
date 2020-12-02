- 전에 했던 README.md이랑 이어집니당..

## 6.1 $( expr, context)

Parameter
• expr : 찾는 표현식
• context : Element | jQuery
Example
• $('div') : <script/>div> 선택
• $('div > p') : <script/>div>안에 <script/>p> 선택
• $('input:radio', document.forms[0]) : 첫번째 폼의 라디오 버튼 선택
[예제] 첫번째 버튼의 바탕색 바꾸기
jQuery
$('input:button', document.forms[0]).css('background-color','#aaf');
HTML
<form>
<label>첫번째폼의 특징 라디오<input type='button' value='first' name='radio'/></label>
</form>
<form>
<label>두번째폼의 특징 라디오<input type='button' value='second' name='radio'/></label>
</form>

## 6.2 $(html) | $(elements)

Html 를 추가하거나 선택할 수 있다.
Html 을 특정 위치에 추가하는예
jQuery
$('<h1>hi jobtc</h1>').appendTo('#core_append_div');
html
<div id='core_append_div'></div>

## 6.3 $(fn)

$(document).ready(function(){})을 짧게 표현.
$( function(){ ... } )
 6 Core > 6.4 length | size()

## 6.4 length | size()

지정된 요소의 개수를 구한다.
Html 을 특정 위치에 추가하는예
jQuery
var len = $('div').length;
var s = $('div').size();
alert(len + ',' + s); // 4,4
html
<div></div><div></div><div></div><div></div>

## 6.5 get() | get(n)

해당되는 모든 요소들을 배열로 가져오거나 n 번째 요소를 가져옴.
jQuery
var len = $('div').get();
$('#get_result').html(len.join('<br/>'));
html
<div></div><div></div><div></div><div></div>
<div id='get_result'></div>

## 6.6 each(fn)

지정된 항목을 순환 검색하여 fn 를 수행한다.
• fn : function
jquery
var bg = [ '#f00', '#00f', '#0f0','#ff0']
$(document).ready(function(){
$('.each_div1').each(function(i){
$(this).css('background-color',bg[i]);
})
})
html
<div class='each_div1'>11</div>
<div class='each_div1'>22</div>
<div class='each_div1'>33</div>
<div class='each_div1'>44</div>
 6 Core > 6.7 index(subject) | find()

## 6.7 index(subject) | find()

index() : 지정된 요소를 검색하여 위치값을 반환함. 0 base 이며 찾지 못하면 -1 을 반환.
find() : 저정된 요소를 검색하여 배열 타입으로 반환
• subject : 찾고자 하는 요소. element
var bg = [ '#fdd', '#ddf', '#dfd','#ffd']
$(document).ready(function(){
var index = $('div').index($('.index_div2'));
$('.index_div' + (index+1)).css('background',bg[index]);
})
<div class='index_div1'>11</div>
<div class='index_div2'>22</div>
<div class='index_div3'>33</div>
<div class='index_div4'>44</div>

## 6.8 eq(pos) | lt(pos) | gt(pos)

같거나 작거나 큰 요소들을 찾는다.
• pos : Number
var bg = [ '#fdd', '#ddf', '#dfd','#ffd']
$(document).ready(function(){
var eq = $('.sub_div1:eq(2)');
var lt = $('.sub_div1:lt(2)');
var gt = $('.sub_div1:gt(2)');
lt.css('background-color', bg[0]);
eq.css('background-color', bg[1]);
gt.css('background-color', bg[2]);
})
<div class='sub_div1'>11</div>
<div class='sub_div1'>22</div>
<div class='sub_div1'>33</div>
<div class='sub_div1'>44</div>

# 7 Attribute 함수 > 7 Attribute 함수

## 7 Attribute 함수
HTML 요소에서 name 속성을 제외한 나머지 부분을 제어할 수 있다. 정의되지 않은 속성을 임의로 지정할
수는 있으나 브라우저별 호환성이 없음으로 주의해야 한다.

### 7.1.1 .attr()

• 엘리먼트 집합에 속한 첫 번째 엘리먼트의 속성을 가져온다.
• .attr 메서드의 장점
◦ 편리성 : jQuery 객체나 jQuery 메서드 체인 코드에서 바로 활용할 수 있다.
◦ 크로스 브라우징 지원 : 브라우저의 종류에 따라 속성 이름이 다르거나 속성값을 다르게 표현
할 때가 있다. 이러한 크로스 브라우징의 이슈들을 최소화 할 수 있다.
• 사용 패턴
◦ .attr(attributeName)
◦ .attr(attributeName, value)
◦ .attr(map)
◦ .attr(attributeName, function)

### 7.1.2 .removeAttr()

### 7.1.3 .val()

• value 값을 가져옴.

### 7.1.4 .text() | .html()

• 해당 형식으로 값을 가져오거나 대입함.
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attributes function</title>
<script src='../lib/jquery-1.8.3.js'></script>
<script>
$(document).ready(
function(){
$btn = $('#af_btn');
var v = $btn.attr('value') + "," + $btn.attr('type');
$btn.click(function(){
$btn.attr('value', 'atfer jobtc');
});
$('#af_html_btn').click(function(){
var str = '<font color=red>jobtc.kr</font>';
$('#af_div').html(str);
});
$('#af_text_btn').click(function(){
var str = '<font color=red>jobtc.kr</font>';
$('#af_div').text(str);
});
}
)
</script>
</head>
<body>
<input type='button' value='jobtc' id='af_btn'>
<input type='button' value='jobtc' id='af_html_btn'>
<input type='button' value='jobtc' id='af_text_btn'>
<div id='af_div'></div>
</body>
</html>

# 8 CSS > 8 CSS

 8 CSS

## 8.1 .css()

사용방법
• .css(프로퍼티명)
◦ 프로퍼티의 속성을 가져온다.
• .css(프로퍼티명, 값)
◦ 지정된 프로퍼티의 속성을 값으로 변경한다.
• .css(프로퍼티명, function(index, value)
◦ index : 현재 선택된 항목의 위치
◦ value : 현재 선택된 항목의 object
◦ index, value 는 생략할 수 있음.
◦ 파라메터를 하나만 사용하면 무조건 index 로 사용됨.
• .css(map)
◦ map 형태로 지정.{key:value}
◦ 복수 지정을 한번에 할때 사용.
[사용예] <script/>div>태그의 바탕색 가져오기
var v = $('div').css('background-color');
alert(v);
[사용예] div 태그에 바탕색 지정하기
$('div').css('background-color', 'blue');
 8 CSS > 8.1 .css()
[사용예] index 값이 짝수인경우 바탕색 변경하기
$(document).ready(
function(){
$('div').css({'float':'left', 'margin':'10px'});
$('div').css({'width':'100px','height':'100px', 'border':'5px solid #00f' });
var v = $('div').css('background-color',
function(index, v){
if(index%2==0 ){
return 'red';
}
}
);
}
);
[사용예] map 을 사용하여 복수 속성 지정하기
$(document).ready(
function(){
$('div').css({'float':'left', 'margin':'10px'});
$('div').css({'width':'100px','height':'100px', 'border':'5px solid #00f' });
var v = $('div').css('background-color',
function(index, v){
if(index%2==0 ){
return 'red';
}
}
);
}
);

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>each</title>
</head>
<body>
<div id='each'>
	<div id='source'>
		<div><font color='red'>가</font></div>	
		<div>나</div>
		<div>다</div>
		<div>라</div>
	</div>

	<div id='target'></div>

	<div id='btns'>
		<input type='button' value='SIZE' id='btnSize' />
		<input type='button' value='TEXT' id='btnText' />
		<input type='button' value='HTML' id='btnHtml' />
		<input type='button' value='EACH' id='btnEach' />
	</div>
</div>
<script>
a();    // 함수가 선언 되기 전에 호출 해도 됨.
b();    // 함수가 선언 되기 전이기 때문에 호출 할 수 없음.
function a(){} --> 스크립트가 실행되면 메모리에 상주하게 됨.
var b = function(){} --> 함수를 호출하는 시점에 메모리에 올라감.
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
<title>jQuery Core</title>
</head>
<body>
   <div id="frame">
      <div class="each">
         <div class="sources">
            <div><font color ='red'>가</font></div>
            <div>나</div>
            <div>다</div>
            <div>라</div>
         </div>
         
         <!-- target 에 btns에 값이 담긴다. -->
         <div class="target"></div>

         <div class="btns">
            <input type="button" value="Length" id="btnLength" /> 
            <input type="button" value="TEXT" id="btnText" /> 
            <input type="button" value="HTML" id="btnHtml" /> 
            <input type="button" value="EACH" id="btnEach" />
         </div>
      </div>
   </div>
   <script>
   $('.each > .btns > #btnEach')[0].onclick = function(){
	   let bg = ['#00f', '#44f', '#88f', '#aaf'];
	   $('.each > .source > div').each(function(index){
		   $(this).css('background-color', bg[index]);
	   });
   }


   $('.each > .btns > #btnLength')[0].onclick = function(){
      let len  = $('.each > .sources > div').length; // 당신의 size()는 3.0ver 이후 Length로 대체되었다.
      $('.each > .target').html('div의 len : ' + len);
      }

   $('.each > .btns > #btnText')[0].onclick = function(){
      let targetdiv1 = $('.each > .sources > div').get(0); // 객체의 div element
      let targetdiv2 = $('.each > .sources > div:first');  // 객체
      let targetdiv3 = $('.each > .sources > div').first(); // 객체
      // 세가지 모두 값은 같다.
      let toText = $(targetdiv3).text();
      $('.each > .target').html(toText);
      }

   $('.each > .btns > #btnHtml')[0].onclick = function(){
      
      }
   </script>
</body>
</html>
```

- $('.each > .btns > #btnText')[0].onclick = function(){
  - 보이는 것처럼 .(클래스명),#(id명) 이렇게 주소를 찾아야한다(-중요하다-)

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attribute</title>
<style>
	#target{
		border:1px solid #aaa;
		width:400px;
		height:200px;
	}
	.a_type{
		background-color:#00f;
		color:#fff;
	}
	.a_type>h1{
		color : #fff;
		font-family:궁서체;
	}
	
	.b_type{
		background-color : #f99;
		color:#ff0;
	}
	
	.b_type>h1{
		color:#ff0;
		font-family:명조체;
	}
</style>

</head>
<body>
<div id='attr'>
	<div id='target'>
		<h1>Jquery Attr</h1>
	</div>
	
	<div id='btns'>
		<input type='button' value='A type' id='btnAtype' />
		<input type='button' value='B type' id='btnBtype' />
	</div>
</div>
<script>
// A,B type에 click event 추가
var target = $('#attr>#target');
$('#attr #btnAtype')[0].onclick = function(){
	$(target).attr('class', 'a_type');
}

$('#attr #btnBtype')[0].onclick = function(){
	$(target).attr('class', 'b_type');
}


</script>
</body>
</html>
```
- 스타일 바꾸는 버튼 추가

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attribute</title>
<style>
	#target{
		border:1px solid #aaa;
		width:400px;
		height:200px;
	}
	.a_type{
		background-color:#00f;
		color:#fff;
	}
	.a_type>h1{
		color : #fff;
		font-family:궁서체;
	}
	
	.b_type{
		background-color : #f99;
		color:#ff0;
	}
	
	.b_type>h1{
		color:#ff0;
		font-family:명조체;
	}
</style>

</head>
<body>
<div id='attr'>
	<div id='target'>
		<h1>Jquery Attr</h1>
	</div>
	
	<div id='btns'>
		<input type='button' value='A type' id='btnAtype' />
		<input type='button' value='B type' id='btnBtype' />
		<input type='button' value='Inite' id= 'btnInite'/>
	</div>
</div>
<script>
// A,B type에 click event 추가
var target = $('#attr>#target');
$('#attr #btnAtype')[0].onclick = function(){
	$(target).attr('class', 'a_type');
}

$('#attr #btnBtype')[0].onclick = function(){
	$(target).attr('class', 'b_type');
}

$('#attr #btnInite')[0].onclick = function(){
	$(target).attr('class', '');
}

</script>
</body>
</html>
```

- 스타일 시트 초기화 하는 버튼 과 코드 추가

# 9 Event

## 9.1 종류
◦ load(fn) | unload(fn)
◦ blur(fn) | blur() | focus(fn) | focus()
◦ hover(over, out)
◦ change(fn) | scroll(fn)
◦ click() | click(fn) | dbclick(fn)
◦ keydown(fn) | keypress(fn) | keyup(fn)
◦ mousedown(fn) | mouseenter(fn) | mouseleave(fn) | mouseout(fn) | mouseup(fn) |
mousemove(fn) | mouseover(fn)
◦ ready(fn)
◦ resize(fn)
◦ select(fn) | select()
◦ submit(fn) | submit()
◦ bind(type, data, fn) | unbind(type, fn)
◦ one(type, data, fn) -> 여러번 실행해도 1번밖에 발생하지않음 
◦ error(fn)
◦ trigger(type)
◦ toggle(even, odd)

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>keyup</title>
<style>
	#result{
		border:2px solid #aaa;
		border-radius:10px;
		padding:15px;
		width:350px;
		height:200px;
		background-color:#eee;
		box-shadow:2px 2px 4px #999;
		overflow: auto;
	}
</style>
</head>
<body>
<div id='keyup'>
	<label>생년월일</label>
	<input type='text' id='birth' placeholer='YYMMDD'>
	<label>-</label>
	<input type='text' id='gender' size='4'>
	<p/>
	<div id='result'></div>
</div>
<script>
$('#keyup>#birth').keyup(function(ev){
	var str = ev.keyCode;
	$('#result').text(str);
	cosole.table(ev);

	// 입력된 문자열의 길이를 계산하여 8자이면 커서를 성별을 입력하는 항목으로 이동
	if($(this).val().length >=8){
		$('#gender').focus().select();
	}
});

// 성별이 입력되면 홀수이면 '남자', 짝수이면 '여자'를 결과창에 출력
$('#keyup>#gender').keyup(function(){
	var gen = Number($(this).val());
	var str = '';
	if(gen%2==0){
		str = '여성입니다.';
	}else{
		str = '남성입니다.';
	}
	$('#result').html(str);
});

</script>
</body>
</html>
```