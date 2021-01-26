<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<script type="text/javascript" src="./js/member.js"></script>
</head>
<body>
 <div id="member" class="select">
    <h2>회원 관리</h2>
    <div id="findZone">
       <form action="insertR.mem" name="frm_member" id="frmMember" method="post">
          <input type="button" id="btnInsert" value="입력"/>
          <div>
             <input type="search" name="findStr" value="${param.findStr }">
             <input type="button" value="검색" id="btnFind">
             <input type="text" name="nowPage" value="${(empty param.nowPage)? 1 : param.nowPage }">
             <input type="text" name="mid">
          </div>
       </form>
    </div>
    <hr/>
    
    <div id="listItems">
    
     <c:forEach var="v" items="${list }">
       <div class="item" onclick="view('${v.mid}')">
          <img align="left" src="http://placehold.it/150x200">
          <span>${v.mid }</span><br/>
          <span>${v.name }</span><br/>
          <span>${v.phone }</span><br/>
          <span>${v.email }</span>
       </div>
     </c:forEach>
       
   </div>
    
    <div id="btnZone">
       <c:if test="${page.startPage > 1 }">
          <input type="button" value="맨처음" id="btnFirst" onclick="goPage(1)"/>
          <input type="button" value="이전" id="btnPrev" onclick="goPage(${page.startPage-1})"/>
       </c:if>
       
       <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
         <input type="button" value="${i }" onclick="goPage(${i})"/>
       </c:forEach>
      
      <c:if test="${page.endPage < page.totPage }">
          <input type="button" value="다음" id="btnNext" onclick="goPage(${page.endPage+1})"/>
          <input type="button" value="맨끝" id="btnLast" onclick="goPage(${page.totPage})"/>
      </c:if>
    </div>
    
   <br><br>
   <a href="index.jsp">HOME</a>
        
 </div>
<script>member()</script>
</body>
</html>