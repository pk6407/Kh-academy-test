# 1교시

```js
/**
 * 회원 관리에 관련된 스크립트 작성자 : it여행자 작성일 : 2020.12
 */
function getID(id) {
	return document.getElementById(id)
}

var board = function() {
	var frm = document.frm_board;
	var url = 'index.jsp?inc=./board/'; // 'board.do?job=
	var job = "board.do?job=";
	
	var btnInsert = getID('btnInsert');
	var btnSelect = getID('btnSelect');
	var btnSave = getID('btnSave');
	var btnFind = getID('btnFind');
	var btnDelete = getID('btnDelete');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnRepl   = getID('btnRepl');
	var btnReplSave = getID('btnReplSave');
	
	if(btnReplSave != null){
		btnReplSave.onclick = function(){
			frm.enctype = 'multipart/form-data';
			frm.action =job + 'replR';
			frm.submit();
		}
	}
	
	if(btnRepl != null){// 댓글 작성화면
		btnRepl.onclick = function(){
			frm.action = job + 'repl';
			frm.submit();
		}
	}
	
	if(btnUpdate != null){//게시판 수정저장
		btnUpdate.onclick = function(){
			var pwd = prompt("수정하려면 암호를 입력하세요");
			if(pwd !=null){
				frm.pwd.value = pwd;
				frm.enctype = 'multipart/form-data';
				frm.action = job + "updateR";
				frm.submit();
			}
		}
	}
	
	
	
	if(btnModify !=null){
		btnModify.onclick = function(){
			frm.action = job + "update";
			frm.submit();
		}
	}
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var pwd = prompt("정말 삭제하시려면 암호를 ???");
			if(pwd != null){
				frm.pwd.value = pwd;
				frm.action = job + 'deleteR';
				frm.submit();
			}
		}
	}
	
	if (btnFind != null) {
		btnFind.onclick = function() {
			frm.nowPage.value = 1;
			frm.action = job + 'select';
			frm.submit();
		}
	}

	if (btnSave != null) {
		btnSave.onclick = function() {
			frm.enctype = 'multipart/form-data';
			frm.action = job + 'insertR';
			frm.submit();
		}
	}

	if (btnSelect != null) {
		btnSelect.onclick = function() {
			frm.action = job + 'select';
			frm.submit();
		}
	}

	if (btnInsert != null) {
		btnInsert.onclick = function() {
			frm.action = job + 'insert';
			frm.submit();
		}
	}

}
 
function goPage(page) {
	var job = "board.do?job=";
	var frm = document.frm_board;
	frm.nowPage.value = page;
	frm.action = job + "select";
	frm.submit();
}
function view(serial){
	var job = "board.do?job=";
	var frm = document.frm_board;
	frm.serial.value = serial;
	frm.action = job + "view";
	frm.submit();
}
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
<script src='./js/file_upload.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' value='${sessionScope.mid }' 
		       placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc' te></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label></label>
		<div id='attach_zone'></div>
	
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }' />
		
	</form>
</div>


<script>
	board()
	fileUpload('attach_zone');	
</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
<script src='./js/file_upload.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80'></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
		<label>첨부</label>
		<div id='attach_zone'></div>
	
		<div class='btns'>
			<input type='button' value='댓글저장' id='btnReplSave' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='serial'  value='${param.serial }'/>
		
	</form>
</div>


<script>
	board();
	fileUpload('attach_zone');	
</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<div id='msg'>
		${msg }
	</div>
	<form name='frm_board' method='post' class='frm_msg'>
		<input type='button' value='목록' id='btnSelect' />
		<input type='hidden' name='findStr' value='${page.findStr }' />
		<input type='hidden' name='nowPage' value='${page.nowPage }' />
	</form>
</div>

<script>board()</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>

<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판1</h2>
	<form name='frm_board' method='post'>
		<input type='button' id='btnInsert' value='입력'>
		<input type='hidden' name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage }' />
		<input type='hidden' name='serial'  value='0'/>
		<div class='find'>
			<input type='text' name='findStr' id='findStr' value='${param.findStr }'>
			<input type='button' name='btnFind' id='btnFind' value='조회'/>
		</div>
	</form>

	<div class='title'>
		<span class='no'>NO</span>
		<span class='subject'>제목</span>
		<span class='mid'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<div class='items'>
		<c:set var='rno' value='${page.startNo }' />
		<c:forEach var='vo' items='${list }'>
			<div class='item' onclick="view(${vo.serial})">
				<span class='no'>${rno}</span>
				<span class='subject'>${vo.subject }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='mdate'>${vo.mdate }</span>
				<span class='hit'>${vo.hit }</span>
			</div>					
			<c:set var='rno' value='${rno+1 }' />
		</c:forEach>
	</div>	
	
	<div class='btns'>
		<input type='button' value='맨점' onclick='goPage(1)'>
		<input type='button' value='이전' onclick='goPage(${page.startPage-1})'>
		
		<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
				<input type='button' value='${i }' onclick='goPage(${i})'>
		</c:forEach>

		<input type='button' value='다음' onclick = 'goPage(${page.endPage+1})'>
		<input type='button' value='맨끝' onclick = 'goPage(${page.totPage})'>
	</div>
</div>

<script>board()</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
<script src='./js/file_upload.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' readonly value='${vo.mid }' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' maxLength='200' value='${vo.subject }'/><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80'>${vo.doc }</textarea><br/>
		
		
		<label></label>
		<div class='inner'>
			<c:forEach items="${vo.attList }" var="att">
				<div class='attach_old'>
					<img src='./upload/${att.sysFile }' width='120px' height='100px'/>
					<input type='checkbox' name='delFiles'  value='${att.sysFile }'/>
				</div>
			</c:forEach>
		</div>
		<br/>
		
		<label>추가</label>
		<div id='attach_zone' class='inner'></div>
		<br/>
		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }' />
		<input type='hidden' name='serial'  value='${param.serial }'/>
		<input type='hidden' name='pwd' placeholder='영숫자와 !$-_ 만 가능' /><br/>
		
	</form>
</div>


<script>
	board();
	fileUpload('attach_zone');	
</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' disabled value='${vo.mid }'/><br/>
		
		<label>제목</label>
		<input type='text' name='subject' disabled value='${vo.subject }' /><br/>
		
		<label></label>
		<textarea name='doc' rows='7' cols='80' disabled>${vo.doc }</textarea><br/>
		
		<label>첨부</label>
		<div id='attach_zone'>
			<c:forEach items="${vo.attList }" var="att">
				<img src='./upload/${att.sysFile }' width='120px' height='100px'/>
			</c:forEach>
		
		</div>
	
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='댓글' id='btnRepl' />
			<input type='button' value='목록' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='serial'  value='${param.serial }'/>
		<input type='hidden' name='pwd' />
	</form>
</div>


<script>board()</script>
</body>
</html>
```

```css
@charset "UTF-8";

/*--------- 공통 부분 -------------- */
#board{
	width:100%;
	padding:20px;
	box-sizing: border-box;
}
#board span{
	display: inline-block;
}

#board input[type=button]{
	border-radius: 12px;
	border : 1px solid #bbb;
	font-size:0.8em;
}

#board>form label{
	display: inline-block;
	width:60px;
	text-align: right;
}

#board #attach_zone{
	margin-top:7px;
	display: inline-block;
	
}
/* select -------------------*/
#board>form>.find{
	display:inline-block;
	float:right;
}
#board .title{
	clear:both;
	background-color:#777;
	margin-top:3px;
	color:#fff;
	padding:2px;
	box-sizing: border-box;
}
#board .no { width:70px;text-align:right;}
#board .subject { width:250px;}
#board .mid{ width:90px;}
#board .mdate{width:100px;}
#board .hit{ width:70px;text-align:right}

#board .btns{
	border-top: 2px solid #aaa;
	margin-top:3px;
	padding-top:10px;
	text-align: center;
}


#board .item:hover{
	background-color:#eee;
	cursor: pointer;
}

/* insert ----------------- */
#board form input[name=subject]{
	width: 500px;
}
#board form textarea[name=doc]{
	padding-top:0px;
	margin-top:4px;
	width: 500px;
	height:150px;
}

/* update ------------*/
#board form .inner{
	display: inline-block;
}

#board .attach_old{
	position: relative;
	width:120px;
	height:100px;
}
#board .attach_old input[type=checkbox]{
	position: absolute;
	right:3px;
	bottom:3px;
	width:30px;
	height:30px;
	opacity:0.3;
}
/* result -------------*/

#board #msg{
	width:300px;
	margin:auto;
	background-color:#eee;
	border:2px solid #ccc;
	box-shadow: 2px 2px 3px #bbb;
	text-align: center;
	padding:30px;
	box-sizing: border-box;
	border-radius:15px;
}

#board .frm_msg{
	margin-top:20px;
	text-align: center;
}
```

```java
package board;

public class BoardAttVo {
	int serial;
	int pSerial;
	String oriFile;
	String sysFile;
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public String getOriFile() {
		return oriFile;
	}
	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}
	public String getSysFile() {
		return sysFile;
	}
	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}
	
	
}
```

```java
package board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Page;

public class BoardDao {

	SqlSession sqlSession;

	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();
			
			/*
			if (sqlSession == null) {
				System.out.println("연결중 오류");
			} else {
				System.out.println("성공~");
				// 모든 serial값을 가져옴
				  List<Integer> list = sqlSession.selectList("board.all_serial");
				  System.out.println(Arrays.toString(list.toArray()));
				  
				  int serial = sqlSession.selectOne("board.one_serial");
				  System.out.println("serial : " + serial);
				  
				  
				  // 모든 데이터를 BoardVo에 담아 출력
				
				  List<BoardVo> list2 = sqlSession.selectList("board.list"); for(BoardVo vo :
				  list2) { System.out.println(vo.getSerial() + " : " + vo.getSubject()); }
				 
				// serial번호에 해당하는 BoardVo 한건 출력
				
				  BoardVo vo = sqlSession.selectOne("board.view", 33); //여러분은 1~10중 하나.
				  System.out.println("-------------------------");
				  System.out.println("serial : " + vo.getSerial());
				  System.out.println("subject : " + vo.getSubject());
				 
				// 검색어를 전달받아 해당 자료를 BoardVo에 담아 출력
				
				  List<BoardVo> list3 = sqlSession.selectList("board.select", "3");
				  System.out.println("----------------------"); for(BoardVo v : list3) {
				  System.out.println(v.getSerial()); System.out.println(v.getSubject()); }
				 
				// 한건의 데이터를 BoardVo에 담아 저장하시오.
				
				  BoardVo vo2 = new BoardVo(); vo2.setMid("hong"); vo2.setSubject("방가.....");
				  
				  int cnt = sqlSession.insert("board.insert", vo2); if(cnt>0) {
				  System.out.println("insert 성공"); sqlSession.commit(); }else {
				  System.out.println("insert 실패"); }
				 
				// serial = 1인 자료의 subject, doc를 수정
				
				  BoardVo vo3 = new BoardVo(); vo3.setSubject("수정된 제목"); vo3.setDoc("수정된 내용");
				  vo3.setSerial(11); vo3.setPwd("1111");
				  
				  int cnt = sqlSession.update("board.update", vo3); if(cnt>0) {
				  System.out.println("수정됨"); sqlSession.commit(); }
				 
				// serial 과 암호를 전달받아 자료를 삭제
				BoardVo vo4 = new BoardVo();
				vo4.setSerial(11);
				vo4.setPwd("1111");
				int cnt = sqlSession.delete("board.delete", vo4);
				if (cnt > 0) {
					System.out.println("삭제됨");
					sqlSession.commit();
				}
			}
			sqlSession.close();
			 */
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// insert -> att insert -> 오류시 첨부 파일 삭제
	public String insert(BoardVo vo) {
		String msg = "게시물이 저장되었습니다.";
		try {
			int cnt = sqlSession.insert("board.insert", vo);
			if(cnt<1) {
				throw new Exception("게시물 저장중 오류 발생");
			}
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			msg = ex.getMessage();
			
			delFile(vo.getAttList());
		} finally {
			sqlSession.close();
			return msg;
		}
	}
	
	// insert -> att insert -> 오류시 첨부파일 삭제
	public String insertRepl(BoardVo vo) {
		String msg = "댓글이 저장되었습니다.";
		try {
			int cnt = sqlSession.insert("board.insert_repl", vo);
			if(cnt<1) {
				throw new Exception("댓글 저장중 오류 발생");
			}
			
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			sqlSession.close();
			return msg;
		}
	}

	// update -> att insert -> att delete -> file delete
	public String update(BoardVo vo) {
		String msg = "게시물이 수정되었습니다.";
		try {
			int cnt = sqlSession.update("board.update", vo);
			if(cnt>0) {
				if(vo.getAttList() != null) {
					cnt = sqlSession.insert("board.insert_att", vo);
					if(cnt<1) throw new Exception("첨부 저장중 오류 발생");
				}
				if(vo.getDelFiles() != null) {
					cnt = sqlSession.delete("board.delete_att", vo);
					if(cnt<1) throw new Exception("첨부 파일 삭제중 오류 발생"); 
					delFile(vo.getDelFiles());
				}
			}else {
				throw new Exception("수정중 오류 발생");
			}
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			sqlSession.close();
			return msg;
		}
	}

	// 댓글 여부 체크
	// delete -> att delete -> file delete
	public String delete(BoardVo vo) {
		String msg = "게시물이 삭제되었습니다.";
		List<BoardAttVo> attList = null;
		try {
			attList = sqlSession.selectList("board.select_att", vo.getSerial());
			int cnt = sqlSession.delete("board.delete", vo);
			if(cnt>0) {
				cnt = sqlSession.delete("board.delete_att_pserial", vo.getSerial());
				if(cnt<1) throw new Exception("게시물 첨부 삭제중 오류 발생");
				delFile(attList);
			}else {
				throw new Exception("게시물 삭제중 오류 발생");
			}

			sqlSession.commit();
		} catch (Exception ex) {
			msg = ex.getMessage();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
			return msg;
		}
	}


	public Map<String, Object> select(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardVo> list = null;
		try {
			int totListSize = sqlSession.selectOne("board.tot_list_size", page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = sqlSession.selectList("board.select", page);
			map.put("page", page);
			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return map;
		}
	}

	public BoardVo view(int serial) {
		BoardVo vo = null;
		List<BoardAttVo> attList = null;
		try {
			vo = sqlSession.selectOne("board.view", serial);
			attList = sqlSession.selectList("board.select_att", serial);
			vo.setAttList(attList);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return vo;
		}
	}

	public void delFile(List<BoardAttVo> delList) {
		System.out.println("delFile");
		for(BoardAttVo v : delList) {
			System.out.println(v.getSysFile());
			File f = new File(FileUpload.saveDir + v.getSysFile());
			if(f.exists()) f.delete();
		}
	}
	
	
	public static void main(String[] args) {
		new BoardDao();
	}

}
```

```java
package board;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("board/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
```

```java
package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Page;

@WebServlet(urlPatterns = "/board.do")
public class BoardServlet extends HttpServlet{
	String url = "index.jsp?inc=./board/";
	BoardDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String job = req.getParameter("job");
		
		int nowPage = 1;
		String findStr = "";
		String msg = "";
		int serial=0;
		RequestDispatcher rd = null;
		dao = new BoardDao();
		Page page = new Page();
		BoardVo vo = null;
		FileUpload fu;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}else {
			nowPage = 1;
		}
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		
		page.setNowPage(nowPage);
		page.setFindStr(findStr);
		
		switch(job) {
		case "select":
			Map<String, Object> map = dao.select(page);
			
			List<BoardVo> list = (List<BoardVo>)map.get("list");
			page = (Page)map.get("page");
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"select.jsp");
			rd.forward(req, resp);
			break;
			
		case "insert":
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"insert.jsp");
			rd.forward(req, resp);
			
			break;
			
		case "insertR":
			fu = new FileUpload(req);
			vo = fu.getBoardVo('i');
			page = fu.getPage();
			msg = dao.insert(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
		case "repl":
			vo = new BoardVo();
			vo.setSerial(Integer.parseInt(req.getParameter("serial")));
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"repl.jsp");
			rd.forward(req, resp);
			
			break;
		case "replR":
			fu = new FileUpload(req);
			vo = fu.getBoardVo('r');
			page = fu.getPage();
			msg = dao.insertRepl(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
		case "view":
			serial = Integer.parseInt(req.getParameter("serial"));
			vo = dao.view(serial);
			
			req.setAttribute("vo", vo);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url + "view.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "deleteR":
			vo = new BoardVo();
			vo.setSerial(Integer.parseInt(req.getParameter("serial")));
			vo.setPwd(req.getParameter("pwd"));
			
			if(req.getParameterValues("delFiles") != null) {
				List<BoardAttVo> delFiles = new ArrayList<BoardAttVo>();
				for(String s : req.getParameterValues("delFiles")){
					BoardAttVo v = new BoardAttVo();
					v.setSysFile(s);
					delFiles.add(v);
				}
				vo.setDelFiles(delFiles);
			}
			
			msg = dao.delete(vo);
			
			req.setAttribute("page", page);
			req.setAttribute("msg", msg);
			
			rd = req.getRequestDispatcher(url + "result.jsp");
			rd.forward(req, resp);
			break;
		case "update":
			serial = Integer.parseInt(req.getParameter("serial"));
			vo = dao.view(serial);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "update.jsp");
			rd.forward(req, resp);
			
			break;
		case "updateR":
			fu = new FileUpload(req);
			vo = fu.getBoardVo('u');
			page = fu.getPage();
			msg = dao.update(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
		}

	}
	
}
```

```java
package board;

import java.util.List;

public class BoardVo {
	
	int serial;
	String mid;
	String pwd;
	String subject;
	String doc;
	String mdate;
	int hit;
	int pSerial;
	
	int attCnt;
	List<BoardAttVo> attList;
	List<BoardAttVo> delFiles;
	
	public int getAttCnt() {
		return attCnt;
	}
	public void setAttCnt(int attCnt) {
		this.attCnt = attCnt;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public List<BoardAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<BoardAttVo> attList) {
		this.attList = attList;
	}
	public List<BoardAttVo> getDelFiles() {
		return delFiles;
	}
	public void setDelFiles(List<BoardAttVo> delFiles) {
		this.delFiles = delFiles;
	}
	
	
}
```

```java
package board;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.MemberVo;
import bean.Page;

public class FileUpload {
	// 학원
	//public static final String saveDir = "C:\\Users\\user1\\Documents\\hipwg\\git\\kh-web-2020\\WebContent\\upload\\";
	
	//home
	//public static final String saveDir = "C:/Users/jobtc/git/kh-web-2020/kh-web-2020/WebContent/upload/";
	
	// notebook
	public static final String saveDir = "C:/Users/pwg/git/kh-web-2020/kh-web-2020/WebContent/upload/";
	int maxSize = 1024*1024*100;//100Mb;
	String encoding = "utf-8";
	MultipartRequest mul;
	String sysFile = "";
	String oriFile = "";
	List<BoardAttVo> attList = new ArrayList<BoardAttVo>();
	
	public FileUpload(HttpServletRequest req) {
		try {
			mul = new MultipartRequest(req,saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
			//업로드된 파일명
			Enumeration<String> en = mul.getFileNames();
			while(en.hasMoreElements()) {
				String tag = (String)en.nextElement();
				sysFile = mul.getFilesystemName(tag); // 수정된 파일명
				oriFile = mul.getOriginalFileName(tag); //원본 파일명
				if(oriFile == null) continue;
				
				BoardAttVo attVo = new BoardAttVo();
				attVo.setSysFile(sysFile);
				attVo.setOriFile(oriFile);
				attList.add(attVo);
			}
			
			
		}catch(Exception ex) {
			System.out.println("FileUpload 생성자");
			ex.printStackTrace();
		}
	}
	
	//mode : i(insert), u(update), r(repl)
	public BoardVo getBoardVo(char mode) {
		BoardVo vo = new BoardVo();
		vo.setMdate(mul.getParameter("mdate"));
		vo.setMid(mul.getParameter("mid"));
		vo.setPwd(mul.getParameter("pwd"));
		vo.setSubject(mul.getParameter("subject"));
		vo.setDoc(mul.getParameter("doc"));
		
		if(mul.getParameter("serial") !=null) {
			vo.setpSerial(Integer.parseInt(mul.getParameter("serial")));
		}
		
		if(mul.getParameter("hit") != null) {
			vo.setHit(Integer.parseInt(mul.getParameter("hit")));
		}
		
		
		if(attList.size()>0) {
			vo.setAttList(attList);
		}
		
		if(mode == 'u' || mode == 'd') {
			vo.setSerial(Integer.parseInt(mul.getParameter("serial")));
			if(mul.getParameterValues("delFiles") != null) {
				List<BoardAttVo> delFiles = new ArrayList<BoardAttVo>();
				for(String s : mul.getParameterValues("delFiles")){
					
					BoardAttVo v = new BoardAttVo();
					v.setSysFile(s);
					delFiles.add(v);
				}
				vo.setDelFiles(delFiles);
			}
		}
		return vo;
	}
	
	public Page getPage() {
		Page page = new Page();
		
		if(mul.getParameter("findStr") != null) {
			page.setFindStr(mul.getParameter("findStr"));
		}
		if(mul.getParameter("nowPage") != null && !mul.getParameter("nowPage").equals("") ) {
			int nowPage = Integer.parseInt(mul.getParameter("nowPage"));
			page.setNowPage(nowPage);
		}else {
			page.setNowPage(1);
		}
		return page;
		
	}
	
	
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="board">

	<select id="all_serial" resultType="int">
	   select serial from board	
	</select>

	<select id="one_serial" resultType="int">
	   select serial from board where serial=11	
	</select>
	
	<select id="list" resultType="board.BoardVo">
		select * from board
	</select>

	<select id="view" resultType="board.BoardVo" parameterType="int">
		select * from board where serial = #{_parameter}
	</select>
	
	<select id="tot_list_size" resultType='int' parameterType="bean.Page">
		select count(serial) from board
		where subject like '%${findStr}%' or doc like '%${findStr}%'
	</select>
	
	<select id="select_att" resultType="board.BoardAttVo" parameterType="int">
		select * from boardAtt where pserial = #{_parameter}
	</select>
	
	<select id="select" resultType="board.BoardVo" parameterType="bean.Page">
		<![CDATA[
		select * from (
			select rownum rno, m.* from
			   ( select b.serial , b.mid, b.mdate, b.hit,
			    	   lpad(' ', (level-1)*6+1, '&nbsp;&nbsp;') || decode(level, 1, '', '└ ') || b.subject subject,
			    	(select count(serial) cnt from boardAtt where pserial=b.serial) attCnt 
				from board b where subject like '%${findStr}%' or doc like '%${findStr}%' 
				connect by prior serial = pserial
				start with pserial is null
				order siblings by serial desc ) m
		) where rno between #{startNo} and #{endNo}
		]]>	 
	</select>

	<insert id="insert" parameterType="board.BoardVo">
		insert all
		into board(serial, mid, pwd, subject, doc, mdate, hit) 
		values(seq_board.nextval, #{mid} , #{pwd},  #{subject} , #{doc}, sysdate, 0 )
		<if test="attList != null">
			<foreach collection="attList" item="att">
				into boardAtt(serial, pserial, sysfile, orifile)
				values(seq_boardAtt.nextval, seq_board.currval, #{att.sysFile}, #{att.oriFile} )
			</foreach>
		</if>
		select * from dual
	</insert>

	<insert id="insert_repl" parameterType="board.BoardVo">
		insert all
		into board(serial, mid, pwd, subject, doc, mdate, hit, pSerial) 
		values(seq_board.nextval, #{mid} , #{pwd},  #{subject} , #{doc}, sysdate, 0, #{pSerial} )
		<if test="attList != null">
			<foreach collection="attList" item="att">
				into boardAtt(serial, pserial, sysfile, orifile)
				values(seq_boardAtt.nextval, seq_board.currval, #{att.sysFile}, #{att.oriFile} )
			</foreach>
		</if>
		select * from dual
	</insert>


	<update id="update" parameterType="board.BoardVo">
		update board set subject=#{subject}, doc=#{doc} where serial = #{serial} and pwd=#{pwd}
	</update>

	<insert id="insert_att" parameterType="board.BoardVo">
		insert all
		<foreach collection="attList" item="att">
			into boardAtt(serial, pserial, sysfile, orifile)
			values(seq_boardAtt.nextval, #{serial}, #{att.sysFile}, #{att.oriFile} )
		</foreach>	
		select * from dual
	</insert>


	<delete id="delete" parameterType="board.BoardVo">
		delete from board where serial=#{serial} and pwd=#{pwd}
	</delete>
	
	<delete id="delete_att_pserial" parameterType="Integer">
		delete from boardAtt where pSerial = #{_parameter}
	</delete>
	
	<delete id="delete_att" parameterType="board.BoardVo">
		delete from boardAtt
		<where>
			<foreach collection="delFiles" item="att" separator="or">
				sysfile = #{att.sysFile}
			</foreach>
		</where>
	</delete>
	


</mapper>   
```

# 2교시

#{}와${}의 차이점  #{123}하면 '123'이라고 출력 ${123}하면 123이라고 출력

'%${findStr}%'는 왜 %로 썻냐하면 겉에 ''이 잇기때문에

# 3교시

```xml
<update id="update" parameterType="board.BoardVo">
		update board set subject=#{subject}, doc=#{doc} where serial = #{serial} and pwd=#{pwd}
	</update>
```
수정 - 내용 + 첨부파일

# 4교시 

설명햇다..쭉....그러나 난 뭐가 뭔지 모르겟다..살려줘라..

# 5교시

```sql
declare

begin
    for i int 1..1000 loop
        insert into board(serial, mid, pwd, subject, doc)
        values(seq_board.nextval, 'hang'||i,'1111','제목입니다.'||i,'내용입니다.'||i)
    end loop;
end;
commit;
select * from board order by serial desc;
```

# 6~7교시 

