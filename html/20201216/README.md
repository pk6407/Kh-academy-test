# 1교시
- 한글 깨짐시
  - 이클립스의 인코딩 상태 체크
  - table에 저장된 한글 상태 체크
  - form 태그의 method='post'인지 체크

어제한거 복습함..

# 2교시

```jsp
<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css'>
<script src='./js/guestbook.js'></script>
</head>
<jsp:useBean id="dao" class="gb.GuestBookDao"/>
<%-- GuestBookDao dao = new GuestBookDao();--%>
<body>
<div id ='guestbook'>
   <h2>방명록</h2>
   <%-- 검색바 --%>
   
   <form name='frm_gb' id='frm_gb' method='post'>
      <input type='search' name='findStr' value='${param.findStr }'
            size='30' placeholder='작성자나 내용으로 검색'/>
      <input type='submit' value='검색' id='btnFind'/>
   </form>
   <%
      String findStr = "";
      if (request.getParameter("findStr") != null) {
         findStr = request.getParameter("findStr");
      }
      
      List<GuestBookVo> list = dao.select(findStr);
      
      request.setAttribute("list", list);
   %>
   
   <c:if test = '${not empty sessionScope.mid }'>
   		<%-- 방명록 입력화면 --%>
   		<%@include file= "./insert.jsp" %>
   </c:if>
   <c:if test = '${empty sessionScope.mid }'>
   	<font color='blue'>로그인 하시면 방명록을 작성할 수 있습니다.</font>
   	</c:if>
   	<hr/>
   	<%-- 
   	<c:choose>
   		<c:when test="${not empty sessionScope.mid }">
   			<%@include file="./insert.jsp" %>
   		</c:when>
   		<c:otherwise>
   			<font color='blue'>로그인 하시면 방명록을 작성할 수 있습니다.</font>
   		</c:otherwise>
   	</c:choose>
   	--%>
   	
   <%--방명록 list  --%>
   <div id='list'>
   <%-- <% for(int i =0; i<10; i++){ %> --%>
      <c:forEach var='vo' items='${list }'>
      <div id='item'>
         <label>작성자</label>
         <output class='mid'>${vo.mid }</output>
         <label>작성일자</label>
         <output class='mdate'>${vo.mdate }</output>
         <br/>
         <textarea rows="5" cols="80" disabled>${vo.doc }</textarea>
         <br/>
         
         <div class='btns'>
            <input type='button' value='수정' id='btnUpdate'/>
            <input type='button' value='삭제' id='btnDelete'/>
         </div>
      </div>
   <%-- <% } %> --%>
      </c:forEach>
   </div>
   
   
<%-- JSTL 라이브러리 사용안하고 하는 방법 위의 것과 결과는 동일하게 나오는 코드다.    
   <% for(GuestBookVo vo : list){ %>
         <div id='item'>
         <label>작성자</label>
         <output class='mid'><%=vo.getMid() %></output>
         <label>작성일자</label>
         <output class='mdate'><%=vo.getMdate() %></output>
         <br/>
         <textarea rows="5" cols="80" disabled><%=vo.getDoc() %></textarea>
         <br/>
         
         <div class='btns'>
            <input type='button' value='수정' id='btnUpdate'/>
            <input type='button' value='삭제' id='btnDelete'/>
         </div>
      </div>
   <%   } %> 
--%>
   
   
</div>
</body>
</html>
```

```jsp
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name='frm_gb_insert' method='post'>
	<label>작성자</label>
	<output class='mid'>${sessionScope.mid }</output>
	<label>작성일</label>
	<output class='mdate'><%=new Date().toLocaleString() %></output>
	<br/>
	<textarea name='doc' cols='80' rows='5'></textarea>
	<div class='btns'>
		<input type='button' value='저장' id='btnInsert' />
	</div>
</form>
```

```js
/**
 * 방명록에서 사용되는 스크립트
 * 작성자 : it여행자
 * 작성일 : 2020.12.16
 */
 
 var guestbook = function(){
 	var btnInsert = document.getElementById('btnInsert');
 	
 	if(btnInsert != null){
 		btnInsert.onclick = function(){
 			//TODO
 		}
 	}
 	
 	$('#btnInsert').click(function(){
 	
 	})
 	
 	
 	
 	
 	
 	
 	
 	
}
```

# 3교시

```java
package gb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Application;

public class GuestBookDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public GuestBookDao() {
		conn = new Application().getConn();
	}
	
	public List<GuestBookVo> select(String findStr){
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		
		try {
			String sql = " select serial, mid, mdate, doc from guestbook where mid like ? or doc like ? "
					   + " order by serial desc ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				GuestBookVo gb = new GuestBookVo();
				gb.setSerial(rs.getInt("serial"));
				gb.setMid(rs.getString("mid"));
				gb.setMdate(rs.getString("mdate"));
				gb.setDoc(rs.getString("doc"));
				
				list.add(gb);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
	
	public String insert(GuestBookVo vo){
		String msg = "방명록이 작성되었습니다.";
		try {
			String sql = "insert into guestbook(serial, mid, pwd, doc, mdate) "
					   + "values( seq_guestbook.nextval, ?, ?, ?, sysdate)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getDoc());
			
			int rowCnt = ps.executeUpdate();	// insert된 행수가 반환됨.
			if(rowCnt<1) {
				msg = "방명록 입력중 오류 발생";
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}
	
	/*
	update(){
		
	}
	
	insert(){
		
	}
	
	delete(){
		
	}
	
	
	*/
	
}
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="gb.GuestBookDao" />
<jsp:useBean id="vo" class="gb.GuestBookVo" />
<jsp:setProperty property="*" name="vo" />

<%
	String msg = dao.insert(vo);
	request.setAttribute("msg", msg);

%>
<script>
	var msg = '${msg}';
	alert(msg);
	location.href='../index.jsp?inc=./guestbook/select.jsp';
</script>
```

```jsp
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name='frm_gb_insert' method='post' id='frm_gb_insert'>
	<label>작성자</label>
	<input type='text' name='mid' readonly class='mid' value='${sessionScope.mid }' />
	<label>작성일</label>
	<output class='mdate'><%=new Date().toLocaleString() %></output>
	<br/>
	<textarea name='doc' cols='80' rows='5'></textarea>
	
	<div class='btns'>
		<label>암호</label>
		<input type='passwrod' name='pwd' />
		<input type='button' value='저장' id='btnInsert' />
	</div>
</form>
```

```jsp
<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css'>
<script src='./js/guestbook.js'></script>
</head>
<jsp:useBean id="dao" class="gb.GuestBookDao"/>
<%-- GuestBookDao dao = new GuestBookDao();--%>
<body>
<div id ='guestbook'>
   <h2>방명록</h2>
   <%-- 검색바 --%>
   
   <form name='frm_gb' id='frm_gb' method='post'>
      <input type='search' name='findStr' value='${param.findStr }'
            size='30' placeholder='작성자나 내용으로 검색'/>
      <input type='submit' value='검색' id='btnFind'/>
   </form>
   <%
      String findStr = "";
      if (request.getParameter("findStr") != null) {
         findStr = request.getParameter("findStr");
      }
      
      List<GuestBookVo> list = dao.select(findStr);
      
      request.setAttribute("list", list);
   %>
   
   <c:if test = '${not empty sessionScope.mid }'>
   		<%-- 방명록 입력화면 --%>
   		<%@include file= "./insert.jsp" %>
   </c:if>
   <c:if test = '${empty sessionScope.mid }'>
   	<font color='blue'>로그인 하시면 방명록을 작성할 수 있습니다.</font>
   	</c:if>
   	<hr/>
   	<%-- 
   	<c:choose>
   		<c:when test="${not empty sessionScope.mid }">
   			<%@include file="./insert.jsp" %>
   		</c:when>
   		<c:otherwise>
   			<font color='blue'>로그인 하시면 방명록을 작성할 수 있습니다.</font>
   		</c:otherwise>
   	</c:choose>
   	--%>
   	
   <%--방명록 list  --%>
   <div id='list'>
   <%-- <% for(int i =0; i<10; i++){ %> --%>
      <c:forEach var='vo' items='${list }'>
      <div id='item'>
         <label>작성자</label>
         <output class='mid'>${vo.mid }</output>
         <label>작성일자</label>
         <output class='mdate'>${vo.mdate }</output>
         <br/>
         <textarea rows="5" cols="80" disabled>${vo.doc }</textarea>
         <br/>
         
         <div class='btns'>
            <input type='button' value='수정' id='btnUpdate'/>
            <input type='button' value='삭제' id='btnDelete'/>
         </div>
      </div>
   <%-- <% } %> --%>
      </c:forEach>
   </div>
   
   
<%-- JSTL 라이브러리 사용안하고 하는 방법 위의 것과 결과는 동일하게 나오는 코드다.    
   <% for(GuestBookVo vo : list){ %>
         <div id='item'>
         <label>작성자</label>
         <output class='mid'><%=vo.getMid() %></output>
         <label>작성일자</label>
         <output class='mdate'><%=vo.getMdate() %></output>
         <br/>
         <textarea rows="5" cols="80" disabled><%=vo.getDoc() %></textarea>
         <br/>
         
         <div class='btns'>
            <input type='button' value='수정' id='btnUpdate'/>
            <input type='button' value='삭제' id='btnDelete'/>
         </div>
      </div>
   <%   } %> 
--%>
   
   
</div>
<script>guestbook()</script>
</body>
</html>
```

```js
/**
 * 방명록에서 사용되는 스크립트
 * 작성자 : it여행자
 * 작성일 : 2020.12.16
 */
 
 var guestbook = function(){
 	// 방명록 입력 버튼이 클릭된 경우-------------
 	var btnInsert = document.getElementById('btnInsert');
 	
 	//방법1
 	if(btnInsert != null){
 		btnInsert.onclick = function(){
 			var frm = document.frm_gb_insert;
 			frm.action = './guestbook/insert_result.jsp';
 			frm.submit();
 		}
 	}
 	
 	//방법2
 	/*
 	$('#btnInsert').click(function(){
 		$('#frm_gb_insert').action='./insert_result.jsp';
 		$('#frm_gb_insert').submit();
 	})
 	*/
 	
 	// -------------------------------------
 	
 	
 	
 	
 	
}
```

# 점심후 4교시

전에한것들 설명하심..

# 점심후 5교시

```jsp
<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css'>
<script src='./js/guestbook.js'></script>
</head>
<jsp:useBean id="dao" class="gb.GuestBookDao"/>
<%-- GuestBookDao dao = new GuestBookDao();--%>
<body>
<div id ='guestbook'>
   <h2>방명록</h2>
   <%-- 검색바 --%>
   
   <form name='frm_gb' id='frm_gb' method='post'>
      <input type='search' name='findStr' value='${param.findStr }'
            size='30' placeholder='작성자나 내용으로 검색'/>
      <input type='submit' value='검색' id='btnFind'/>
   </form>
   <%
      String findStr = "";
      if (request.getParameter("findStr") != null) {
         findStr = request.getParameter("findStr");
      }
      
      List<GuestBookVo> list = dao.select(findStr);
      
      request.setAttribute("list", list);
   %>
   
   <c:if test = '${not empty sessionScope.mid }'>
   		<%-- 방명록 입력화면 --%>
   		<%@include file= "./insert.jsp" %>
   </c:if>
   <c:if test = '${empty sessionScope.mid }'>
   	<font color='blue'>로그인 하시면 방명록을 작성할 수 있습니다.</font>
   	</c:if>
   	<hr/>
   	<%-- 
   	<c:choose>
   		<c:when test="${not empty sessionScope.mid }">
   			<%@include file="./insert.jsp" %>
   		</c:when>
   		<c:otherwise>
   			<font color='blue'>로그인 하시면 방명록을 작성할 수 있습니다.</font>
   		</c:otherwise>
   	</c:choose>
   	--%>
   	
   <%--방명록 list  --%>
   <div id='list'>
   <%-- <% for(int i =0; i<10; i++){ %> --%>
      <c:forEach var='vo' items='${list }'>
      <div id='item'>
      <form name='frm_temp' method='post'>
         <label>작성자</label>
         
         <input type='text'name='mid' readOnly class='mid' value='${vo.mid }'/>
         
         <label>작성일자</label>
         <output class='mdate'>${vo.mdate }</output>
         <br/>
         <textarea rows="5" cols="80" disabled>${vo.doc }</textarea>
         <br/>
         
       <c:if test="${vo.mid == sessionScope.mid }">
         <div class='btns'>
            <input type='button' value='수정' id='btnUpdate' onclick='funcUpdate(this.form)'/>
            <input type='button' value='삭제' id='btnDelete' onclick='funcDelete(this.form)'/>
         </div>
       </c:if>
       <input type='hidden' name='serial' value='${vo.serial }'/>
       <input type='hidden' name='pwd' />
      </form>
      </div>
      
   <%-- <% } %> --%>
      </c:forEach>
   </div>
   
   
<%-- JSTL 라이브러리 사용안하고 하는 방법 위의 것과 결과는 동일하게 나오는 코드다.    
   <% for(GuestBookVo vo : list){ %>
         <div id='item'>
         <label>작성자</label>
         <output class='mid'><%=vo.getMid() %></output>
         <label>작성일자</label>
         <output class='mdate'><%=vo.getMdate() %></output>
         <br/>
         <textarea rows="5" cols="80" disabled><%=vo.getDoc() %></textarea>
         <br/>
         
         <div class='btns'>
            <input type='button' value='수정' id='btnUpdate'/>
            <input type='button' value='삭제' id='btnDelete'/>
         </div>
      </div>
   <%   } %> 
--%>
   
   
</div>
<script>guestbook()</script>
</body>
</html>
```

```js
/**
 * 방명록에서 사용되는 스크립트
 * 작성자 : it여행자
 * 작성일 : 2020.12.16
 */
 
 
 var guestbook = function(){
 	// 방명록 입력 버튼이 클릭된 경우-------------
 	var btnInsert = document.getElementById('btnInsert');
 	
 	//방법1
 	if(btnInsert != null){
 		btnInsert.onclick = function(){
 			var frm = document.frm_gb_insert;
 			frm.action = './guestbook/insert_result.jsp';
 			frm.submit();
 		}
 	}
 	
 	//방법2
 	/*
 	$('#btnInsert').click(function(){
 		$('#frm_gb_insert').action='./insert_result.jsp';
 		$('#frm_gb_insert').submit();
 	})
 	*/
 	
 	// -------------------------------------
 	
 	// 방명록 삭제 버튼 클릭
 	// -------------------------------------
 	function funcDelete(frm){
 		let pwd = prompt("방명록을 삭제하시려면 작성시 암호를 입력해주세요.");
 		frm.pwd.value = pwd;
 		frm.action = './guestbook/delete_result.jsp';
 		frm.submit();
		}
 	
 	}
```

# 6교시

```js
/**
 * 방명록에서 사용되는 스크립트
 * 작성자 : it여행자
 * 작성일 : 2020.12.16
 */
 
 
 var guestbook = function(){
 	// 방명록 입력 버튼이 클릭된 경우-------------
 	var btnInsert = document.getElementById('btnInsert');
 	
 	//방법1
 	if(btnInsert != null){
 		btnInsert.onclick = function(){
 			var frm = document.frm_gb_insert;
 			frm.action = './guestbook/insert_result.jsp';
 			frm.submit();
 		}
 	}
 	
 	//방법2
 	/*
 	$('#btnInsert').click(function(){
 		$('#frm_gb_insert').action='./insert_result.jsp';
 		$('#frm_gb_insert').submit();
 	})
 	*/
 	
 	// -------------------------------------
 	
 	// 방명록 삭제 버튼 클릭
 	// -------------------------------------
 	function funcDelete(frm){
 		let pwd = prompt("방명록을 삭제하시려면 작성시 암호를 입력해주세요.");
 		frm.pwd.value = pwd;
 		frm.action = './guestbook/delete_result.jsp';
 		frm.submit();
		}
	// -------------------------------------
	//방명록 수정 버튼 클릭
	//--------------------------------------
	function funcUpdate(frm){
		if(frm.btnUpdate.value=='수정'){
			frm.doc.disabled=false;
			frm.btnUpdate.value='수정내용저장';
 		}else if(frm.btnUpdate.value=='수정내용저장'){
 		let pwd = prompt("수정된 내용을 저장하시려면 암호를 입력하세요");
 		frm.pwd.value = pwd;
 		frm.action = './guestbook/update_result.jsp';
 		frm.submit();
 	}
 }
 }
 ```

 ```jsp
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="gb.GuestBookDao" />
<jsp:useBean id="vo" class="gb.GuestBookVo" />
<jsp:setProperty property="*" name="vo" />

<%
	String msg = dao.insert(vo);
	request.setAttribute("msg", msg);

%>
<script>
	var msg = '${msg}';
	alert(msg);
	location.href='../index.jsp?inc=./guestbook/select.jsp';
</script>
```

```jsp
<%@page import="gb.GuestBookVo"%>
<%@page import="gb.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="gb.GuestBookDao"/>
<jsp:useBean id="vo" class="gb.GuestBookVo" />
<jsp:setProperty property="*" name="vo" />

<% 
	String msg = dao.update(vo);
	request.setAttribute("msg", msg);
	
%>
<script>
	alert('${msg}');
	location.href='index.jsp?inc=./guestbook/select.jsp';
</script>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="gb.GuestBookDao"/>
<jsp:useBean id="vo" class=gb.GuestBookVo />
<jsp:setProperty property="*" name="vo" />

<%
	String msg = dao.delete(vo);
	request.setAttribute("msg", msg);

%>
<script>
	alert('${msg}');
	location.href='index.jsp?inc=./guestbook/select.jsp';
</script>
```

# 7교시

```java
package gb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Application;

public class GuestBookDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public GuestBookDao() {
		conn = new Application().getConn();
	}
	
	public List<GuestBookVo> select(String findStr){
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		
		try {
			String sql = " select serial, mid, mdate, doc from guestbook where mid like ? or doc like ? "
					   + " order by serial desc ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				GuestBookVo gb = new GuestBookVo();
				gb.setSerial(rs.getInt("serial"));
				gb.setMid(rs.getString("mid"));
				gb.setMdate(rs.getString("mdate"));
				gb.setDoc(rs.getString("doc"));
				
				list.add(gb);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
	
	public String insert(GuestBookVo vo){
		String msg = "방명록이 작성되었습니다.";
		try {
			String sql = "insert into guestbook(serial, mid, pwd, doc, mdate) "
					   + "values( seq_guestbook.nextval, ?, ?, ?, sysdate)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getDoc());
			
			int rowCnt = ps.executeUpdate();	// insert된 행수가 반환됨.
			if(rowCnt<1) {
				msg = "방명록 입력중 오류 발생";
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}
	
	public String update(GuestBookVo vo){
		String msg = "방명록 내용을 수정하였습니다.";
		try {
			String sql = "update guestbook set doc=? where serial=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getDoc());
			ps.setInt(2, vo.getSerial());
			ps.setString(3, vo.getPwd());
			
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				msg="방명록 수정중 오류 발생";
			}
			
		} catch (Exception ex) {
			msg = ex.getMessage();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}
	
	
	public String delete(GuestBookVo vo){
		String msg = "방명록이 삭제되었습니다.";
		try {
			String sql = "delete from guestbook where serial=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());
			ps.setString(2, vo.getPwd());
			
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				msg = "방명록 삭제중 오류 발생";
			}
			
		} catch (Exception ex) {
			msg = ex.getMessage();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}
	
	
	
	

}
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="gb.GuestBookDao"/>
<jsp:useBean id="vo" class=gb.GuestBookVo />
<jsp:setProperty property="*" name="vo" />

<%
	String msg = dao.delete(vo);
	request.setAttribute("msg", msg);

%>
<script>
	alert('${msg}');
	location.href='index.jsp?inc=./guestbook/select.jsp';
</script>
```

- 방명록 만들고 수정하고 삭제하는 기능에 대해 배웟습니다^^

