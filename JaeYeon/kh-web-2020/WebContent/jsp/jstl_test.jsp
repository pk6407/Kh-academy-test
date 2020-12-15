<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test</title>
</head>
<body>
<div id='jstl_ctrl'>
	<h2>jstl(Java Standard Tag Library)의 제어문</h2>
	<%
		String name="hong gil dong";
		int score = 80;
		pageContext.setAttribute("page_name", name);
		pageContext.setAttribute("page_score", score);
		
		request.setAttribute("req_name", name);
		request.setAttribute("req_score", score);
	%>
	
	<h3>c:out ==>jstl을 사용한 출력문</h3>
	<li>Name : <c:out value='${pageScope.page_name }' default='이름을 입력하세요' /></li>
	<li>Score : <c:out value='${pageScope.page_score }' default='빵점' /> </li>	
	<li>Name(req) : <c:out value='${requestScope.req_name }' /></li>
	<li>Score(req) : <c:out value='${requestScope.req_score }' /></li>
	<li>Name : <c:out value='${page_name }' /></li>
	<li>Score : <c:out value='${page_score }' /></li>
	
	<h3>c:set | c:remove | c:out</h3>
	
	<c:set var='score' value='100' />
	<li>Score 1 : <c:out value='${score }' /> </li>
	<c:remove var='score' />
	<li>Score 2 : <c:out value='${score }' default='변수가 삭제됨.'/> </li>
	
	<h3>c:if</h3>
	<c:if test='${req_score>=90 }'>
		<li>
			<font color='red'>장학생</font>
		</li>
	</c:if>
	
	<fieldset>
		<h3>c:if 사용하여 해결</h3>
		<div>
			kor, eng변수에 임의 값을 대입하여 request영역에 저장한 후 두수의 합이 180이상이면 '우등생'을 출력하시오.
		</div>
		<hr/>
		<c:set var='kor' value='100' />
		<c:set var='eng' value='90'  />
		<c:if test='${(kor+eng)>=180 }'>
			<font color='blue'>우동생</font>
		</c:if>
	</fieldset>
	
	<h3>c:choose | c:when | c:otherwise </h3>	
	<xmp>		
	   [c:choose]
	      [c:when test='조건식'] T [/c:when]
	      [c:when test='조건식'] T [/c:when]
	      ...
	      [c:otherwise]
	         	맞는 조건식이 없을 경우 처리
	      [/c:otherwise]
	   [/c:choose]
	</xmp>
	<fieldset>
		<div>
			구매수량, 단가를 임의의 변수에 저장하여 scope담고, 구매금액(구매수량*단가)에 따라 사은품이 지급되도록
			choose문을 기술하시오.<br/>
			- 1000원 이상 : 화장지<br/>
			- 10000원 이상 : 자전거<br/>
			- 100000원 이상 : 아파트<br/>
		</div>
		<hr/>
		<h5>방법1(JSP)</h5>
		<%
			int ea = 1;//구매수량
			int price = 500; //단가
			int amt = ea*price;
			
			request.setAttribute("amt", amt);
		%>
		<c:choose>
			<c:when test='${amt>=100000 }'>
				축하~축하 아파트 당첨 ^^
			</c:when>
			<c:when test='${amt>=10000 }'>
			 	따르릉~ 자전거가 왔어요...
			</c:when>
			
			<c:when test='${amt>=1000 }'>
				모든 문제가 잘 풀리도록 화장지 증정~
			</c:when>
			
			<c:otherwise>
				다음기회에는 1000원 이상 구매 부탁..
			</c:otherwise>
			
		</c:choose>		
		
		<h5>방법2</h5>
		<c:set var='ea' value='100' />
		<c:set var='price' value='500'/>
		<c:set var='amt' value='${ea*price }'/>
		<c:choose>
			<c:when test='${amt>=100000 }'>
				축하~축하 아파트 당첨 ^^2
			</c:when>
			<c:when test='${amt>=10000 }'>
			 	따르릉~ 자전거가 왔어요...2
			</c:when>
			
			<c:when test='${amt>=1000 }'>
				모든 문제가 잘 풀리도록 화장지 증정~2
			</c:when>
			
			<c:otherwise>
				다음기회에는 1000원 이상 구매 부탁..2
			</c:otherwise>
		</c:choose>		
	</fieldset>
	
	<h3>c:forTokens</h3>	
	<xmp>
	 [c:forTokens var='변수명' items='토큰문자열' delims='구분자']
	 
	 [/c:forTokens]
	</xmp>
	<c:forTokens var='item' items="개나리,진달래,코스모스,장미,국화,수국화,연꽃,무궁화,해바라기,동백꽃" delims=",">
		<li><c:out value='${item }'/></li>
	</c:forTokens>	
	
	<h3>c:forEach</h3>
	<xmp>
	  [c:forEach var='변수명' items='배열 | Collection' begin='시작값' end='끝값' step='증가값' varStatus='상태값']
	     ...
	  [/c:forEach]
	</xmp>
	
	<fieldset>
		<legend>
			forEach를 사용하여 1~100까지의 홀수를 출력하시오.
		</legend>
		<c:forEach var='i' begin='1' end='100' step='2'>
			<c:out value='${i }'/>( ${i } )
		</c:forEach>
	</fieldset>
	
	<fieldset>
		<legend>
			List[MemberVo] 타입의 데이터를 scope에 저장하고 forEach문을 사용하여 화면에 출력하시오. 
		</legend>
		<%
			List<MemberVo> list = new ArrayList<MemberVo>();
			MemberVo v1 = new MemberVo();
			v1.setMid("Park");
			v1.setPhone("010-6351-3491");
			list.add(v1);
	
			v1 = new MemberVo();
			v1.setMid("Kim");
			v1.setPhone("010-1111-2222");
			list.add(v1);
			
			v1 = new MemberVo();
			v1.setMid("Hong");
			v1.setPhone("010-4444-4444");
			list.add(v1);
			
			request.setAttribute("list", list);
		
		%>
		<c:forEach var='vo' items='${list }'>
			<li>${vo.mid } : ${vo.phone } </li>
		</c:forEach>	
	
	</fieldset>
	
	
	
	
	
	
</div>
</body>
</html>