<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>each</title>
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
      $('.each > .target').text(toText);
      }

   $('.each > .btns > #btnHtml')[0].onclick = function(){
      	let div = $('.each>.sources>div:first');
      	let html = $(div).html();
      	$('.each >.target').html(html);
      }
   </script>
</body>
</html>