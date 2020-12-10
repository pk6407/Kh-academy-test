# 시험봣다...

# 1.가입버튼을 result.html이동
<form action='result.html'...>
    <input type='submit value='회원가입'/>
</form>

or 

<form id='frm'>
    <input type='button' id='btn'/>
</form>

$('#btn').on('click',function(){
    $('#frm').submit();
})

# 2.반드시 입력 : required
# 3.라벨을 클릭 : <label for='user_id'...><inpt type='text' id='user_id' />
# 4.취소 : <input type='reset' value='취소' />
# 5.첫글자대문자,영숫자,5자 이상
    /^[A-Z][A-Za-z-0-9]{4,0}/
# 6.$('#user_id).blur(function(){})
# 7.if(!req.test($(this).val())){
    alert('ERROR');
}
# 8.$('#user_id').val('');
    frm.userid.value='';
    document.getElementById('user_id').value='';
# 9.
- 1. 패스워드 확인을 입력한 경우 패스워드항을 체크
  - $('#pass_find').on('keyup',function(){
        if($('#pass').val()==''){
            alert('암호확인...');
            $('#pass').focus();
            $('#pass').val('');
        }
    });
- 2. if($('#pass').val() == $('#pass_chk').val()){
        $('#span').html('ok');
        $('#span').css({'color':'green','font-weight':'bolder'})
    }else{
        $('#span').html('Fail');
        $('#span').css({'color':'red','font-weight':'bolder'})
    }
# 10.
    if(!$('.gen1:checked') || !$('.gen2:checked)){fail...}
    
    let flag = true;
    let ra = document.frm.gen;  // 라디오 버튼들
    for(!ra[0].checked || !ra[1].checked){
        fail...
    }

- 점심후 ^^

시험봄..

navi>li{

background-color: black;

list-style-type: none;

width: 100px;

height: 50px;

text-align: center;

}

에서

navi>li{

background-color: black;

list-style-type: none;

width: 150px;

height: 50px;

text-align: center;

}으로 바꾸고

navi > li>a:hover {

                font-size: 1.2em;
            cursor: pointer;
                font-weight: bold;

            }

를

navi > li:hover {

                font-size: 1.2em;
            cursor: pointer;
                font-weight: bold;

            }

로 바꾸면 됨^^

# 마지막 교시^^

- JSP(Java Server Page)
  - ms:asp,asp.net
  - php(window,linux,mos):cgi

- jsp의 특징
  - 웹페이지를 쉽게 개발,유지 -> 자바기반의 기술
  - 일반적으로 확장자 jsp
  - j2ee 규약의 일부(웹규약)
  - jvm 을 사용

- jsp의 구조
  - Directive(지시자,지시문) => <%@...%> (<%....%>)<=이건 공통
  - Scripting element
    - 1. 선언문(전역형 멤버:필드,메서드) => <%!...%>
    - 2. 스크립틀릿(지역형) => <%...%>
    - 3. 표현식(출력문) => <%=...%>
  - 주석
    - 1. html타입 : <!-- 주석 내용 -->
    - 2. jsp타입 : <%-- 주석 내용 --%>
    - 3. Java타입 : // or /*...*/
  - Action Tag : <jsp:.../>

-------------------------
jsp에서 외부 페이지 삽입
-------------------------

- 1. 동적삽입 <jsp:include page='F'/>
  - 1. 해당위치에 실행결과가 복사된다.
  - 2. page속성에 파일명이나 변수를 사용할 수 있다.
- 2. 정적삽입 <%@ inclued file='F' %> F->파일명,변수사숑불가
  - 1. 해당위치에 소스가 그대로 복사된다.