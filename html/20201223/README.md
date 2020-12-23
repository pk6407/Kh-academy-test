# 1교시

- 회원 관리 수정
  - 내용만 수정
  - 이미지만 수정
  - 내용+이미지 수정
- 기타 기능 마무리
- 문제 돌출 및 보완
  - 입력,수정시 입력항목들의 무결성 체크
    - mid 중복체크 - BD,Comtroller체크,각 항목 무결성 - Script부분체크
  - 이미지 다운로드 가능하도록
  - 이미지 다운로드시 원본 파일명 변경되는 문제
  - 암호시 암호가 보이는 문제
  - 암호를 암호화하기
  - 조회시 회원 사진도 같이 보여주기 -> UI변경

```java
package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberDao;
import bean.MemberVo;
import bean.Page;

@WebServlet(urlPatterns = "/member.do")
public class MemberServlet extends HttpServlet{
	String url = "index.jsp?inc=./member/";
	MemberDao dao;
	
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
		
		RequestDispatcher rd = null;
		dao = new MemberDao();
		Page page = null;
		MemberVo vo = null;
		
		switch(job) {
		case "select":
			if(req.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}
			if(req.getParameter("findStr") != null) {
				findStr = req.getParameter("findStr");
			}
			
			page = new Page();
			page.setNowPage(nowPage);
			page.setFindStr(findStr);
			List<MemberVo> list = dao.select(page);
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"select.jsp");
			rd.forward(req, resp);
			break;
			
			
		case "insert":
			FileUpload fu = new FileUpload(req);
			vo = fu.getMember();
			page = fu.getPage();
			String msg = dao.insert(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "view":
			String mid = req.getParameter("mid");
			vo = dao.view(mid);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "view.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "delete":
			vo = new MemberVo();
			vo.setMid(req.getParameter("mid"));
			vo.setPwd(req.getParameter("pwd"));
			vo.setDelFile(req.getParameter("delFile"));
			
			msg = dao.delete(vo);
			
			page = new Page();
			page.setFindStr(req.getParameter("findStr"));
			page.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
			req.setAttribute("page", page);
			
			req.setAttribute("msg", msg);
			
			rd = req.getRequestDispatcher(url + "result.jsp");
			rd.forward(req, resp);
			break;
		case "modify":
			String mid2 = req.getParameter("mid");
			vo = dao.view(mid2);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "update.jsp");
			rd.forward(req, resp);
			
			break;
		}
	
	}

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
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>

</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='update'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' readOnly required value='${vo.mid }'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required value='${vo.name }'/><br/>
		
		
		<label>이메일</label>
		<input type='email' name='email' size='35' value='${vo.email }'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' value='${vo.phone }'/><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required value='${vo.zipcode }'/>
		<input type='button' value='우편번호 검색' name='btnZipcode' id='btnFindZip' />
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required value='${vo.address }'/> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'/><br/>
		<label></label>
			<c:chosse>
				<c:when test="${empty vo.photo}">
		<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
		</c:when>
		<c:otherwise>
		<img src='./upload/${vo.photo }' id='photo' width='200px' height='140px'/>
		</c:otherwise>
		</c:chosse>
		<hr/>

		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='pwd' /><br/>
		<input type='text' name='delFile' value='${vo.photo }' />
		
	</form>

</div>
<script>member()</script>
</body>
</html>
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	let url = 'index.jsp?inc=./member/';
	
	var btnInsert = getID('btnInsert');
	var btnFind   = getID('btnFind');
	var btnSelect = getID('btnSelect');
	var btnSave   = getID('btnSave');
	var btnFindZip = getID('btnFindZip');
	var btnPhoto  = getID('btnPhoto');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnDelete = getID('btnDelete');
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var frm = document.frm_member;
			var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요");
			if(pwd != null){
				frm.action = 'member.do?job=delete';
				frm.pwd.value = pwd;
				frm.mid.disabled=false;
				frm.submit();
			}
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			//frm.enctype = 'multipart/form-data'; //파일을 업로드
			frm.action = 'member.do?job=update'; //수정된 정보를 저장
			frm.submit();
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			frm.action = 'member.do?job=modify'; //수정화면이동
			frm.submit();
		}
	}
	
	
	
	// 이미지 파일 미리보기
	if(btnPhoto != null){
		btnPhoto.onchange = function(ev){
			var tag = ev.srcElement; // 이벤트 발생한 태그
			var url = tag.files[0]; // 선택된 파일명
			var reader = new FileReader();
			reader.readAsDataURL(url);
			reader.onload = function(e){
				var img = new Image();
				img.src = e.target.result;
				var photo = getID('photo');
				photo.src = img.src;
			}
		}
	}
	
	
	
	
	// 다음 우편번호 검색 API를 사용한 주소 찾기
	if(btnFindZip != null){
		btnFindZip.onclick = function(){
			var frm = document.frm_member;
			new daum.Postcode({
				oncomplete : function(data){
					frm.zipcode.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			var frm = document.frm_member;
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			frm.enctype = 'multipart/form-data';
			frm.action = 'member.do?job=insert';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'member.do?job=select';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "member.do?job=select";
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'member.do?job=select';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'member.do?job=view';
	frm.mid.value = mid;
	frm.submit();
}
```

# 2교시

```java
package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberDao;
import bean.MemberVo;
import bean.Page;

@WebServlet(urlPatterns = "/member.do")
public class MemberServlet extends HttpServlet{
	String url = "index.jsp?inc=./member/";
	MemberDao dao;
	
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
		
		RequestDispatcher rd = null;
		dao = new MemberDao();
		Page page = null;
		MemberVo vo = null;
		
		switch(job) {
		case "select":
			if(req.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}
			if(req.getParameter("findStr") != null) {
				findStr = req.getParameter("findStr");
			}
			
			page = new Page();
			page.setNowPage(nowPage);
			page.setFindStr(findStr);
			List<MemberVo> list = dao.select(page);
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"select.jsp");
			rd.forward(req, resp);
			break;
			
			
		case "insert":
			FileUpload fu = new FileUpload(req);
			vo = fu.getMember();
			page = fu.getPage();
			String msg = dao.insert(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "view":
			String mid = req.getParameter("mid");
			vo = dao.view(mid);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "view.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "delete":
			vo = new MemberVo();
			vo.setMid(req.getParameter("mid"));
			vo.setPwd(req.getParameter("pwd"));
			vo.setDelFile(req.getParameter("delFile"));
			
			msg = dao.delete(vo);
			
			page = new Page();
			page.setFindStr(req.getParameter("findStr"));
			page.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
			req.setAttribute("page", page);
			
			req.setAttribute("msg", msg);
			
			rd = req.getRequestDispatcher(url + "result.jsp");
			rd.forward(req, resp);
			break;
		case "modify":
			String mid2 = req.getParameter("mid");
			vo = dao.view(mid2);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "update.jsp");
			rd.forward(req, resp);
			
			break;
		case "update":
			FileUpload fu2 = new FileUpload(req);
			vo = fu2.getMember();
			page = fu2.getPage();
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

```jsp
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	let url = 'index.jsp?inc=./member/';
	
	var btnInsert = getID('btnInsert');
	var btnFind   = getID('btnFind');
	var btnSelect = getID('btnSelect');
	var btnSave   = getID('btnSave');
	var btnFindZip = getID('btnFindZip');
	var btnPhoto  = getID('btnPhoto');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnDelete = getID('btnDelete');
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var frm = document.frm_member;
			var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요");
			if(pwd != null){
				frm.action = 'member.do?job=delete';
				frm.pwd.value = pwd;
				frm.mid.disabled=false;
				frm.submit();
			}
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			
			//암호와 암호확인의일치여부
			var pwd = prompt("회원정보를 수정하사갰습니까?");
			if(pwd == null){
				return;
			}
			frm.pwd.value = pwd;
			frm.enctype = 'multipart/form-data'; //파일을 업로드
			frm.action = 'member.do?job=update'; //수정된 정보를 저장
			frm.submit();
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			frm.action = 'member.do?job=modify'; //수정화면이동
			frm.submit();
		}
	}
	
	
	
	// 이미지 파일 미리보기
	if(btnPhoto != null){
		btnPhoto.onchange = function(ev){
			var tag = ev.srcElement; // 이벤트 발생한 태그
			var url = tag.files[0]; // 선택된 파일명
			var reader = new FileReader();
			reader.readAsDataURL(url);
			reader.onload = function(e){
				var img = new Image();
				img.src = e.target.result;
				var photo = getID('photo');
				photo.src = img.src;
			}
		}
	}
	
	
	
	
	// 다음 우편번호 검색 API를 사용한 주소 찾기
	if(btnFindZip != null){
		btnFindZip.onclick = function(){
			var frm = document.frm_member;
			new daum.Postcode({
				oncomplete : function(data){
					frm.zipcode.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			var frm = document.frm_member;
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			frm.enctype = 'multipart/form-data';
			frm.action = 'member.do?job=insert';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'member.do?job=select';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "member.do?job=select";
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'member.do?job=select';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'member.do?job=view';
	frm.mid.value = mid;
	frm.submit();
}
```

```java
package member;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.MemberVo;
import bean.Page;

public class FileUpload {
	public static final String saveDir = "C:\\Users\\user1\\Documents\\hipwg\\git\\kh-web-2020\\WebContent\\upload\\";
	int maxSize = 1024*1024*100;//100Mb;
	String encoding = "utf-8";
	MultipartRequest mul;
	String sysFile = "";
	String oriFile = "";
	
	public FileUpload(HttpServletRequest req) {
		try {
			mul = new MultipartRequest(req,saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
			//업로드된 파일명
			Enumeration<String> en = mul.getFileNames();
			while(en.hasMoreElements()) {
				String tag = (String)en.nextElement();
				sysFile = mul.getFilesystemName(tag); // 수정된 파일명
				oriFile = mul.getOriginalFileName(tag); //원본 파일명
			}
			
			
		}catch(Exception ex) {
			
		}
	}
	
	public MemberVo getMember() {
		MemberVo vo = new MemberVo();
		vo.setAddress(mul.getParameter("address")); 
		vo.setEmail(mul.getParameter("email"));
		vo.setMdate(mul.getParameter("mdate"));
		vo.setMid(mul.getParameter("mid"));
		vo.setName(mul.getParameter("name"));
		vo.setPhone(mul.getParameter("phone"));
		vo.setPwd(mul.getParameter("pwd"));
		vo.setZipcode(mul.getParameter("zipcode"));
		vo.setPhoto(sysFile);
		vo.setDelFile(mul.getParameter("delFile"));
		
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

```java
package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.FileUpload;

public class MemberDao {
	Connection conn; //database의 연결 정보
	PreparedStatement ps; // 문자열로 되어 있는 sql문장을 sql 실행문장
	ResultSet rs; // select문의 실행결과
	
	public MemberDao() {
		conn = new Application().getConn();
	}
	
	public boolean login(String mid, String pwd) {
		boolean b = false;
		try {
			String sql = "select count(mid) cnt from members where mid=? and pwd=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  mid);
			ps.setString(2,  pwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt >=1) {
					b=true;
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConn();
			return b;
		}
	}
	
	public int getTotListSize(String findStr) throws Exception{
		int totListSize = 0;
		String sql = "select count(mid) cnt from members where mid like ? or email like ? or phone like ? or address like ? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1,  "%" + findStr + "%");
		ps.setString(2,  "%" + findStr + "%");
		ps.setString(3,  "%" + findStr + "%");
		ps.setString(4,  "%" + findStr + "%");
		
		rs = ps.executeQuery();
		if(rs.next()) {
			totListSize = rs.getInt("cnt");
		}
		return totListSize;
		
	}
	
	
	
	public List<MemberVo> select(Page page){
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			//넘겨받은 검색어를 사용하여 totListSize값을 구해야함.
			String f = page.getFindStr();
			page.setTotListSize(getTotListSize(f));
			page.pageCompute();
			
			String sql = " select * from ("
			           + "   select rownum no, m.* from ("
			           + "     select * from members "
					   + "     where mid like ? or email like ? or phone like ? or address like ? "
					   + "     order by name asc) m   "
					   + " ) where no between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,  "%" + page.getFindStr() + "%");
			ps.setString(2,  "%" + page.getFindStr() + "%");
			ps.setString(3,  "%" + page.getFindStr() + "%");
			ps.setString(4,  "%" + page.getFindStr() + "%");			
			ps.setInt(5, page.getStartNo());
			ps.setInt(6, page.getEndNo());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setMid(rs.getString("mid"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setPhoto(rs.getString("photo"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setMdate(rs.getString("mdate"));
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConn();
			return list;
		}
	}
	
	public String insert(MemberVo vo){
		String msg = "회원 정보가 정상적으로 저장되었습니다.";
		try {
			String sql = " insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate) "
					   + " values(?, ?, ?, ?, ?, ?, ?, ?, sysdate )";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getZipcode());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getPhoto());
						
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				msg = "회원정보 입력중 오류 발생....";
				throw new Exception(msg);
			}
					
		}catch(Exception ex) {
			msg = ex.getMessage();
			
			// 이미 업로드된 파일 삭제
			File file = new File(FileUpload.saveDir + vo.getPhoto());
			if(file.exists()) {
				file.delete();
			}
			
		}finally {
			disConn();
			return msg;
		}
	}
	
	
	public String update(MemberVo vo){
		String msg = "회원 정보가 정상적으로 수정되었습니다.";
		try {
			String sql = "update members set"
					   + "name =?, email=?, zipcode=?, address=?, phone=? ";
			if(vo.getPhoto() != null && !vo.getPhoto().equals("")) {
				sql += ", photo= '" + vo.getPhoto() + "'";
			}
			sql += " where mid=? and pwd=? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getZipcode());
			ps.setString(4, vo.getAddress());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getMid());
			ps.setString(7, vo.getPwd());
			
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				msg = "회원정보 수정중 오류 발생.";
				throw new Exception(msg);
			}
			
			//이미지가 수정된 경우 기존 파일 삭제
			if(vo.getPhoto() !=null && !vo.getPhoto().equals("")) {
				File file = new File(FileUpload.saveDir + vo.getDelFile());
				if(file.exists()) {
					file.delete();
				}
			}
			
			
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			disConn();
			return msg;
		}
	}

	public String delete(MemberVo vo){
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		try {
			String sql = "delete from members where mid=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2,vo.getPwd());
			
			int rowCnt = ps.executeUpdate();
			if(rowCnt<1) {
				throw new Exception("회원 정보 삭제중 오류 발생");
			}
			
			//첨부 파일 삭제
			File file = new File(FileUpload.saveDir + vo.getDelFile());
			if(file.exists()) {
				file.delete();
			}
			
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			disConn();
			return msg;
		}
	}
	
	public MemberVo view(String mid){
		MemberVo vo = new MemberVo();
		try {
			String sql = "select * from members where mid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setMid(rs.getString("mid"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setPhoto(rs.getString("photo"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setMdate(rs.getString("mdate"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConn();
			return vo;
		}
	}

	public void disConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
 
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
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='view'>
		<label>아이디</label>
		<input type='text' name='mid' disabled size='10' value='${vo.mid }'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12' value='${vo.name }'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35'  value='${vo.email }'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' disabled size='15'  value='${vo.phone }'/><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6'  value='${vo.zipcode }'/><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60'  value='${vo.address }'/> <br/>
		
		<label></label>
		
			<c:choose>
				<c:when test="${empty vo.photo }">
					<img src='http:/;placehold.it/200X140' width='200px' height='140px' />
				</c:when>
				<c:otherwise>
				<img src='./upload/${vo.photo }' width='200px' height='140px' />
			</c:otherwise>
		</c:choose>
		
		<hr/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='delFile' value='${vo.photo }' />
		<input type='text' name='pwd' />
	</form>

</div>
<script>member()</script>
</body>
</html>
```

# 3교시

- 과제....란다..
  - 회원 입력시 아이디가 중복되지 않도록 조치하시오.
  - 암호를 암호화 하도록 코드를 보완하시오.

# 점심후 4교시

1 - 2 입력항목대한 무결성
- 아이디(영숫자 $-!) => 4~10자리까지 => [\W$!\-]{4,10}
- 이름(한글+영어) => ^[a-zA-Z가-힣]+$ => [a-zA-Z가-힣]{4,20}
- 암호(영숫자 $_!) => 4~10자리까지 => [\W$!\-]{4,10}
- 이메일()
- 연락처(숫자-) = > \d{2,3} - \d{3,4} - \d{4} 

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='insert'>
		<label>아이디</label>
		<input type='text' name='mid' size='10' required pattern='[\W$!\-]'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required pattern='[a-zA-Z가-힣]'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'  required pattern='[\W$!\-]'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14' pattern='[\W$!\-]'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' pattern='\d{2,3} - \d{3,4} - \d{4}'/><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' size='6'  required />
		<input type='button' name='btnZipcode' value='우편번호검색' id='btnFindZip'/>
		<br/>
		
		<label>주소</label>
		<input type='text' name='address' size='60'  required /> <br/>
		
		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'/>
		<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
		<hr/>
		
		<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='목록으로' id='btnSelect' />
			
			<input type='text' name='findStr' value='${param.findStr }' />
			<input type='text' name='nowPage' value='${param.nowPage }' />
			
		</div>
	</form>

</div>
<script>member()</script>
</body>
</html>
```

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	let url = 'index.jsp?inc=./member/';
	
	var btnInsert = getID('btnInsert');
	var btnFind   = getID('btnFind');
	var btnSelect = getID('btnSelect');
	var btnSave   = getID('btnSave');
	var btnFindZip = getID('btnFindZip');
	var btnPhoto  = getID('btnPhoto');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnDelete = getID('btnDelete');
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var frm = document.frm_member;
			var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요");
			if(pwd != null){
				frm.action = 'member.do?job=delete';
				frm.pwd.value = pwd;
				frm.mid.disabled=false;
				frm.submit();
			}
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			
			//암호와 암호확인의일치여부
			var pwd = prompt("회원정보를 수정하사갰습니까?");
			if(pwd == null){
				return;
			}
			frm.pwd.value = pwd;
			frm.enctype = 'multipart/form-data'; //파일을 업로드
			frm.action = 'member.do?job=update'; //수정된 정보를 저장
			frm.submit();
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			frm.action = 'member.do?job=modify'; //수정화면이동
			frm.submit();
		}
	}
	
	
	
	// 이미지 파일 미리보기
	if(btnPhoto != null){
		btnPhoto.onchange = function(ev){
			var tag = ev.srcElement; // 이벤트 발생한 태그
			var url = tag.files[0]; // 선택된 파일명
			var reader = new FileReader();
			reader.readAsDataURL(url);
			reader.onload = function(e){
				var img = new Image();
				img.src = e.target.result;
				var photo = getID('photo');
				photo.src = img.src;
			}
		}
	}
	
	
	
	
	// 다음 우편번호 검색 API를 사용한 주소 찾기
	if(btnFindZip != null){
		btnFindZip.onclick = function(){
			var frm = document.frm_member;
			new daum.Postcode({
				oncomplete : function(data){
					frm.zipcode.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			var frm = document.frm_member;
			var checkFlag=true;
			
			/*example(html 태그에 pattern속성 미사용시)
			var reg_mid = /[\w!$\-]{4,10}/;			
			if(!reg_mid.test(frm.mid.value) ){
				alert('mid');
				checkFlag=false;
			}
			*/
			
			if(!frm.mid.checkValidity()){
				alert('mid');
				checkFlag=false;
			}else if(!frm.name.checkValidity()){
				alert('name');
				checkFlag=false;
			}else if(!frm.pwd.checkValidity()){
				alert('pwd');
				checkFlag=false;
			}else if(!frm.email.checkValidity()){
				alert('email');
				checkFlag=false;
			}else if(!frm.phone.checkValidity()){
				alert('phone');
				checkFlag=false;
			}
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			frm.enctype = 'multipart/form-data';
			frm.action = 'member.do?job=insert';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'member.do?job=select';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "member.do?job=select";
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'member.do?job=select';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'member.do?job=view';
	frm.mid.value = mid;
	frm.submit();
}
```

# 5교시

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	let url = 'index.jsp?inc=./member/';
	
	var btnInsert = getID('btnInsert');
	var btnFind   = getID('btnFind');
	var btnSelect = getID('btnSelect');
	var btnSave   = getID('btnSave');
	var btnFindZip = getID('btnFindZip');
	var btnPhoto  = getID('btnPhoto');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnDelete = getID('btnDelete');
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var frm = document.frm_member;
			//var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요");
			var win = window.open('./member/input_pwd.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px');
			
			win.onbeforeunload = function(){
				if(frm.pwd.value != ''){
					frm.action = 'member.do?job=delete';
					frm.mid.disabled=false;
					frm.submit();
				}
			}
			
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			
			/*암호와 암호확인의일치여부
			var pwd = prompt("회원정보를 수정하사갰습니까?");
			if(pwd == null){
				return;
			}
			frm.pwd.value = pwd;
			*/
			var win = window.open('./member/input_pwd.jsp','win', 'width=400px, height=100px, left=300px, top=300px');			
			win.onbeforeunload = function(){
				if(frm.pwd.value != ''){
					frm.enctype = 'multipart/form-data'; //파일을 업로드
					frm.action = 'member.do?job=update'; //수정된 정보를 저장
					frm.submit();
			}
		}
	}	
}
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			frm.action = 'member.do?job=modify'; //수정화면이동
			frm.submit();
		}
	}
	
	
	
	// 이미지 파일 미리보기
	if(btnPhoto != null){
		btnPhoto.onchange = function(ev){
			var tag = ev.srcElement; // 이벤트 발생한 태그
			var url = tag.files[0]; // 선택된 파일명
			var reader = new FileReader();
			reader.readAsDataURL(url);
			reader.onload = function(e){
				var img = new Image();
				img.src = e.target.result;
				var photo = getID('photo');
				photo.src = img.src;
			}
		}
	}
	
	
	
	
	// 다음 우편번호 검색 API를 사용한 주소 찾기
	if(btnFindZip != null){
		btnFindZip.onclick = function(){
			var frm = document.frm_member;
			new daum.Postcode({
				oncomplete : function(data){
					frm.zipcode.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			var frm = document.frm_member;
			var checkFlag=true;
			
			/*example(html 태그에 pattern속성 미사용시)
			var reg_mid = /[\w!$\-]{4,10}/;			
			if(!reg_mid.test(frm.mid.value) ){
				alert('mid');
				checkFlag=false;
			}
			*/
			
			if(!frm.mid.checkValidity()){
				alert('mid');
				checkFlag=false;
			}else if(!frm.name.checkValidity()){
				alert('name');
				checkFlag=false;
			}else if(!frm.pwd.checkValidity()){
				alert('pwd');
				checkFlag=false;
			}else if(!frm.email.checkValidity()){
				alert('email');
				checkFlag=false;
			}else if(!frm.phone.checkValidity()){
				alert('phone');
				checkFlag=false;
			}
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			frm.enctype = 'multipart/form-data';
			frm.action = 'member.do?job=insert';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'member.do?job=select';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "member.do?job=select";
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'member.do?job=select';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'member.do?job=view';
	frm.mid.value = mid;
	frm.submit();
}
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input_pwd</title>
</head>
<body>
<div id='input_pwd'>
	<div>수정 또는 삭제하시려면 암호를 입력하세요</div>
	<input type='password' id='pwd' />
	<input type='button' value='확인' id='btnPwdConfirm' />
</div>
<script>
var btnPwdConf = document.getElementById('btnPwdConfirm');
btnPwdConf.onclick = function(){
	var pwd = document.getElementById('pwd').value;
	opener.document.frm_member.pwd.value = pwd;
	self.close();
}


</script>
</body>
</html>
```

# 6교시

게시판 : 회원관리 + 댓글 => 계층형 쿼리

* mybatis : Dao + servle + mybatis + sping(게시판)

1. 계층형 쿼리(게시물)
---------------------------------------
serial(pk)| doc            |pserial
---------------------------------------
1           방가                N 
4           -댓방가1            1
2           방가2               N
5           -댓방가2            2
3           방가3               N       (숫자들만)원본글의serial
6           -댓방가3            3
7           -댓방가3-2          3
8               -댓댓방가3-2    7

```sql
CREATE TABLE brd_test(
    serial int,
    doc varchar2(100),
    pserial int
);
desc brd_test;

-- brd_test에 사용되는 시퀀스
CREATE SEQUENCE seq_brd_test;

--sample data
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '방가1' , null);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '방가2' , null);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '방가3' , null);
select * from brd_test;

INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가1' , 1);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가2' , 2);

INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가3' , 3);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가3-2' , 3);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓댓방가3-2' , 7);
commit;

--계층형 쿼리 작업 시작--
--3개의 차이점을 잘 분석하고 계층형 쿼리를 이해해 볼 것--

select * from brd_test
start with pserial is null
connect by prior serial = pserial;

--계층형 쿼리가 깨져버림 
select * from brd_test
start with pserial is null
connect by prior serial = pserial
order by serial desc;

--형제들끼리 방가1,2,3 묶어서 order by 다시 해야한다. pserial 입장에서 봤을 때 같은 입장 선에 있는 것
--같은 형제끼리만 정렬하도록 order by 다시 시도한다
select * from brd_test
start with pserial is null
connect by prior serial = pserial
order siblings by serial desc;

--siblings 같은 형제/항목 들끼리 나열을 시킨 후 그 안에 계층 별로 나누게 되는 작업 쿼리문 작성이 필요하다.
```

# 7교시

```sql
CREATE TABLE brd_test(
    serial int,
    doc varchar2(100),
    pserial int
);
desc brd_test;

-- brd_test에 사용되는 시퀀스
CREATE SEQUENCE seq_brd_test;

--sample data
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '방가1' , null);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '방가2' , null);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '방가3' , null);
select * from brd_test;

INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가1' , 1);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가2' , 2);

INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가3' , 3);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓방가3-2' , 3);
INSERT INTO brd_test(serial,doc,pserial) VALUES(seq_brd_test.nextval, '댓댓방가3-2' , 7);
commit;

--계층형 쿼리 작업 시작--
--3개의 차이점을 잘 분석하고 계층형 쿼리를 이해해 볼 것--

select * from brd_test
start with pserial is null
connect by prior serial = pserial;

--계층형 쿼리가 깨져버림 
select * from brd_test
start with pserial is null
connect by prior serial = pserial
order by serial desc;

--형제들끼리 방가1,2,3 묶어서 order by 다시 해야한다. pserial 입장에서 봤을 때 같은 입장 선에 있는 것
--같은 형제끼리만 정렬하도록 order by 다시 시도한다
select * from brd_test
start with pserial is null
connect by prior serial = pserial
order siblings by serial desc;

--siblings 같은 형제/항목 들끼리 나열을 시킨 후 그 안에 계층 별로 나누게 되는 작업 쿼리문 작성이 필요하다.

--SELECT lpad(표시문자,길이,길이가 남았을때 왼쪽에 표시할 문자) from dual;
SELECT lpad('박원기',10,'*')from dual;
SELECT lpad('방가1',10,'-')from dual;

SELECT serial,
lpad(' ',(level-1)*3,'') || doc
,pserial FROM brd_test
start with pserial is null
connect by prior serial = pserial
order SIBLINGS by serial desc;
```

MyBatis
사용자가 servlet에 요청을하면 Dao(SQL)로 이동해서 insert,select,update,delete작업하고 쿼리로 MyBatis로 넘어주고 출력값 다시 Dao(SQL)로 넘겨주고 그걸 다시 Dao(SQL)이 servlet에 넘겨주고 servlet이 사용자한테 출력값 보여줌

# 마지막 8교시

- myBatis 들어가서 Products 들어가서 download받는다 압축풀고 mybatis jar 파일을 복사해서 WEB-INF/lib 경로에 복사하는 것으로 설치 작업이 완료된다.

- mybatis.pdf 가면 대충 설명잇다..
<property name="username" value="system"/>
<property name="password" value="oracle"/>

- Mapper 경로 지정 방법
mybatis는 자동으로 리소스를 찾는 방법을 제공하지 않는다.
클래스 패스에 상대적으로 리소스를 지정할 수 도 있고 , url을 통해서 지정할 수 도 있다.
기본 클래스 패스 위치 : WEB-INF/classes or /src
<mappers>
 <!--WEB-INF/classes안에있는경우-->
 <mapper resource="member.xml"/>
 <!--src/board안에있는경우-->
 <mapper resource="board/board.xml"/>
 <!--특정패키지안에있는경우-->
 <mapper resource="kr/jobtc/myResource/geustbook.xml"/>
 <!--특정디렉토리안에있는경우-->
 <mapper url="file:///a/b/c/member.xml"/>
</mappers>

- 프로퍼티 파일 사용하여 설정
config.xml 파일을 작성할 때 Database 연결과 관련한 정보를 별도의 프로퍼티파일을 작성하여 사용해보자.
step 1. 외부 프로터피 파일을 작성한다.
config.properties
driver = oracle.jdbc.driver.OracleDriver
url = jdbc:oracle:thin:@127.0.0.1:1521:xe
username = hr
password = HR
step 2. 외부 프로퍼티 파일 정보를 <properties/>를 사용하여 정의한다.
step 3.
프로퍼티로 적용할 부분을 ${프로퍼티명}으로 수정한다.
WEB-INF/classes/config.xml
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>

<properties resource="config.properties"/>


<environments default="development">
<environment id="development">
<transactionManager type="JDBC"/>
<dataSource type="POOLED">
<property name="driver" value="${driver}"/>
<property name="url" value="${url}"/>
<property name="username" value="${username}"/>
<property name="password" value="${password}"/>
</dataSource>
</environment>
</environments>

<mappers>
<mapper resource="member.xml"></mapper>
<mapper resource="board/board.xml"></mapper>
</mappers>

</configuration>
```   
- SqlSessionFactory 생성
환경 설정부분에서 생성된 config.xml파일을 읽어들여 SqlSessionFactory를 생성해야 한다. mybatis를 사용하기 위해서는 Database별로 SqlSessionFactory를 생성해야 한다.
SqlSessionFactory의 대부분은 싱글톤 형식으로 사용하기 때문에 static형으로 만들어 가져다 사용한다.
src/begin/BoardFactory.java
```java
package begin;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardFactory {

 // 드라이버를 로딩, Connection정보를 갖고 있음.
 private static SqlSessionFactory factory;

static{
 try{
 Reader reader=Resources.getResourceAsReader("config.xml");
factory = new SqlSessionFactoryBuilder().build(reader);

 }catch(Exception ex){
 ex.printStackTrace();
 }
 }

public static SqlSessionFactory getFactory(){
return factory;
}

}
```

- SqlSessionFactory 생성 테스트
정의된 config.xml 과 BoardFactory에 의해서 정상적으로 SqlSessionFactory가 생성되어 필요한 곳에서 사용될 수 있는지 간단한 jsp 코드를 사용하여 테스트해 보자.
WebContent/begin/factory_test.jsp
```jsp
<%@page import="begin.BeginFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// Factory 생성 테스트
// properties로 연결된 config 테스트

SqlSession sqlSession = null;

try{
sqlSession = BeginFactory.getFactory().openSession();

if(sqlSession == null){
out.print("SqlSession 생성중 오류 발생...");
}else{
out.print("SqlSession이 정상적으로 생성되었습니다...");
}
sqlSession.close();
}catch(Exception ex){
out.print(ex.toString());
}finally{

}
%>
</body>
</html>