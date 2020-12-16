<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter1130</title>
<script src='../lib/jquery-3.5.1.min.js'></script>
</head>
<body>
<div id='filter'>
   <fieldset>
      <legend>filter</legend>
      <ul>
         <li>선택된 요소중 필요한 요소만을 걸려내는 방법</li>
         <li>접두문자 ':' 을 사용한다</li>
         <li>필터와 필터를 연결하여 사용할 수 있다</li>
         <li>종류=> :eq(index) , :even(짝수) , :odd(홀수) , :first(처음) , :last(마지막) , :gt(index) , :lt(index)</li>   
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
   		<div>Hi-----1</div>
   		<div>Hi-----2</div>
   		<div>Hi-----3</div>
   		<div>Hi-----4</div>
   		<div>Hi-----5</div>
   		<div>Hi-----6</div>
   </div>
</div>

<script>
   // ol 태그안에 있는 첫번째 li
   $('#filter>ol>li:first').css('color','#f00');
   $('#filter>ol>li:odd').css('color','blue');
   $('#filter>ol>li:even').css('font-weight','bolder');

   // items안에 있는 div의 색상을 홀짝수로 나뉘어 표시되도록 구성
   $('#filter>#items>div:odd').css({'color':'red', 'background-color':'grey'});
   $('#filter>#items>div:even').css({'color':'blue','background-color':'grey' });
</script>
</body>
</html>