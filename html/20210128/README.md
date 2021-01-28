# 1교시

- Spring 회원관리 마무리

[프로젝트]
- 컨텐츠 선정 및 개발 범위 지정
- 공통 사용 기술
- 업무 분장시 분장된 컨텐츠에 적용한 기술 선정

insert_result.jsp -> result.jsp로 바꿈

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_result</title>
</head>
<body>
<div id='member'>
	<h2>처리결과</h2>
	${msg }
</div>
</body>
</html>
```

MemberDao.java

```java
package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;
	MemberFactory f;
	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		this.f = f;
		sqlSession = f.getFactory().openSession();
	}
	
	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String,Object> select(Page p) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		sqlSession.close();
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 저장되었습니다.";
		sqlSession = f.getFactory().openSession();
		int cnt = sqlSession.insert("member.insert", vo);
		if(cnt<1) {
			msg = "회원 정보 저장중 오류 발생";
			sqlSession.rollback();
		}
		sqlSession.commit();
		sqlSession.close();
		return msg;
	}

	@Override
	public String update(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = f.getFactory().openSession();
		
		System.out.println("Dao.view()..." + mid);
		
		MemberVo vo =sqlSession.selectOne("member.view",mid);
		
		System.out.println(vo.getName());
		
		sqlSession.close();
		return vo;
	}

}
```

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

   <!-- 테이블의 컬러명과 vo 객체의 필드명이 서로 다른 경우  -->
   <!-- column : 테이블의 컬럼명, property : vodml 필드명  -->
   <resultMap type="mVo" id="m_vo">
      <result column="m_id" property="mId"/>
      <result column="m_name" property="mName"/>
   </resultMap>

   <select id="temp_select" parameterType="page" resultMap="m_vo">
   
   </select>
   
   <select id="tot_list_size" parameterType="page" resultType="Integer">
      select count(mid) cnt from members
      <where> 
      	<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
      		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where>
   </select>
   
   <!-- config.xml에서 typeAliases로 별칭을 등록해서 패키지명,클래스명을 단순화 시킬 수 있다.  -->
   <!--<select id="select" parameterType="member.Page" resultType="member.MemberVo">-->
   <select id="select" parameterType="page" resultType="mVo">
       select * from (
        select rownum no, m.* from (
           select * from members 
           <where> 
      	<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
     		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where> 
           order by name asc) m 
        ) where no between #{startNo} and #{endNo}
   </select>
   
   <insert id="insert" parameterType="mVo">
      insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
      values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
   </insert>
   
   <update id="update" parameterType="mVo">
      update members set
      name=#{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}   
      <if test="#{photo} != null">
         , photo= #{photo}
      </if>
      where mid=#{mid} and pwd=#{pwd}
   </update>
   
   <delete id="delete" parameterType="mVo">
      delete from members where mid=#{mid} and pwd=#{pwd}
   </delete>
   
   <select id="view" parameterType="String" resultType="mVo">
      select * from members where mid=#{_parameter}
   </select>
   
   
   
</mapper> 
```

MemberController.java

```java
package member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao;
	FileUpload fu;
	String msg;
	
	public MemberController() {}
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="insert.mem", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert");	// WEB-INF/member/insert.jsp
		
		return mv;
	}
	
	@RequestMapping(value="insertR.mem", method=RequestMethod.POST)
	public ModelAndView insertR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		fu = new FileUpload(req);
		MemberVo vo = fu.getMember();
		Page page = fu.getPage();
		
		msg = dao.insert(vo);
		
		System.out.println("-------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("result");//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", msg);
		
		return mv;
	
	}
	
	@RequestMapping(value="select.mem", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> list = null;
		
		if(page != null) {
			System.out.println("controller.select()..............");
			System.out.println("nowPage : " + page.getNowPage());
		}else {
			System.out.println("page is null");
		}
				
		Map<String,Object> map= dao.select(page);
		page = (Page)map.get("page");
		list = (List<MemberVo>)map.get("list");
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("select");//WEB-INF/member/select.jsp
	
		
		return mv;
	}
	
	@RequestMapping(value="view.mem", method=RequestMethod.POST)
	public ModelAndView view(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("controller.view()........");
		System.out.println(vo.getMid()); 
		
		vo = dao.view(vo.getMid());
		mv.addObject("vo",vo);
		mv.setViewName("view");//WEB-INF/member/view.jsp
		
		
		return mv;
	}
	
	
	
}
```

# 2교시

select.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
          <img align="left" src='./upload/${v.photo }'>
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
```

# 3교시

member.css

```css
@charset "UTF-8";

#member{
	width:1000px;
	margin:5px auto;
}

#btnZone{
	border-top: 1px solid #aaa;
	padding-top : 10px;
	text-align: center;
}
#btnZone>input[type=button]{
	border-radius: 14px;
	border:1px solid #aaa;
}


/* select ---------------------------*/
#findZone{
	height:60px;
}
#findZone>form{
	position: relative;
}

#findZone>form > div{
	display:inline-block;
	position: absolute;
	right:0;
}

#listItems{
	text-align: center;
}

#listItems .item{
	width: 300px;
	display: inline-block;
	margin-bottom:10px;
	text-align: left;
	font-size:10pt;
}

#listItems .item>img{
	width:150px;
	height:200px;
}

/*--암호 입력 처리 ---------------------*/
#member > #password_zone{
	display:none;
	z-index:1;
	position: fixed;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-color: rgba(150,150,150, 0.3);
}

#member #password_zone>div{
	width:300px;
	position: absolute;
	padding:25px;
	margin: 150px auto;
	background-color: #fff;
	text-align: center;
	border-radius: 7px;
}
```

member.js

```js
/**
 *    회원 관리에 관련된 스크립트
 *   작성자 : 김남호
 *   작성일 : 2020.12
 */

 function getID(id) {
    return document.getElementById(id)
 }
 
 
 var member = function() {
    
    var btnInsert = getID('btnInsert');
    var btnFind = getID('btnFind');
    var btnSelect = getID('btnSelect');
    var btnSave = getID('btnSave');
    var btnFindZip = getID('btnFindZip');
    var btnPhoto = getID('btnPhoto');
    var btnModify = getID('btnModify');
    var btnUpdate = getID('btnUpdate');
   var btnDelete = getID('btnDelete');
   
   //---------------------view에서 삭제버튼 클릭시 삭제 기능---------------------
   if(btnDelete != null){
      btnDelete.onclick = function(){
         var frm = document.frm_member;
        // var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요.");
  	  	 var pZone = getID('password_zone');
  	  	 var btnPassword = getID('btnPassword');
  	  	 frm.pwd.value = '';
  	  	 pZone.style.display= 'block';
  	
  		 btnPassword.onclick = function(){
  		 pZone.style.display = 'none';
  		 
  		 if(frm.pwd.value != ''){
            frm.action = 'delete.mem';
            //frm.pwd.value = pwd;
            frm.mid.disabled=false;
            frm.submit();
             
  		 	}
  		 }
                 
        }
       
      }

   
    if(btnUpdate != null){
       btnUpdate.onclick = function(){
          var frm = document.frm_member;
         var win = window.open('./member/input_pwd.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px');
         win.onbeforeunload = function(){
               if(frm.pwd.value != ''){
             frm.enctype= 'multipart/form-data';
             frm.action = 'update.mem'; //수정된 정보를 저장
             frm.submit();
            }
         }
       }
    }

    if(btnModify != null){
       btnModify.onclick = function(){
          var frm = document.frm_member;
          frm.mid.disabled=false;
          frm.action = 'modify.mem'; //수정화면으로 이동
          frm.submit();
       }
    }
    
    // 이미지 파일 미리보기
    if(btnPhoto != null){
       btnPhoto.onchange = function(ev){
          var tag = ev.srcElement; //이벤트 발생한 태그
          var url =tag.files[0];
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
    
    
    
    //다음 우편번호 검색 API를 사용한 주소 찾기
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
          var checkFlag =true;
          
          /*
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
             alert("암호를 확인하세요");
             return;
          }
          */
          //파일 업로드를 위해선 반드시 저 코드를 사용해야하는데 사용시 request.getParameter()를 통해서 form에 있는 데이터를 처리할 수 없기에          
          //cos.jar lib 다운받아서 사용해야만 아래 코드가 작동한다. <1222 스샷필기 확인>
          if(checkFlag){
            frm.enctype = 'multipart/form-data';
            frm.action = 'insertR.mem';
            frm.submit();
          
          }
       }
    }
    
    if(btnSelect != null){
       btnSelect.onclick = function(){
          var frm = document.frm_member;
          // Servlet 이후 이런식으로 변경할것 frm.action ='member.do?inc=select'
          // frm.action = url + 'select.jsp';   
          frm.action = 'select.mem';
          frm.submit();
       }
    }
   
   if(btnFind != null){
      btnFind.onclick =function() {
         var frm = document.frm_member;
         // Servlet 이전 frm.action = url + 'select.jsp'; 아래 코드는 Servlet 이후 변경 코드
         frm.action = "select.mem";
         frm.nowPage.value = 1;
         frm.submit();
      }
   }    
    
    
    //$('#btnInsert').on('click',function(){...});
    if(btnInsert != null) {
       btnInsert.onclick = function() {
          var frm = document.frm_member;
          frm.action = 'insert.mem';
          frm.submit();
       }
    }
 }
 
 function goPage(page) {
    var frm = document.frm_member;
    //frm.action = 'index.jsp?inc=./member/select.jsp'; Servlet 이전 밑에 코드는 Servlet 이후
    frm.action = 'select.mem';   
    frm.nowPage.value = page;
    frm.submit();
 }
 
 function view(mid){
    var frm =document.frm_member;
    frm.action = 'view.mem'; //frm.action = 'index.jsp?inc=./member/view.jsp'
    frm.mid.value = mid;
    frm.submit();
 }
```

view.jsp

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
				<img src='http://placehold.it/200X140' width='200px' height='140px' />
				</c:when>
				<c:otherwise>
				<a href='./upload/${vo.photo }' download = '${vo.photo }'>
				<img src='./upload/${vo.photo }' width='200px' height='140px' />
				</a>
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
		
		<div id='password_zone'>
			<div>
				<input type='password' name='pwd' />
				<input type='button' value='입력' id='btnPassword' />
			</div>
		</div>
	</form>

</div>
<script>member()</script>
</body>
</html>
```

# 점심시간후 4교시

MemberDao.java

```java
package member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;
	MemberFactory f;
	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		this.f = f;
		sqlSession = f.getFactory().openSession();
	}
	
	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String,Object> select(Page p) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		sqlSession.close();
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		sqlSession = f.getFactory().openSession();
		
		int cnt = sqlSession.delete("member.delete", vo);
		if(cnt>0) {
			File file =new File(FileUpload.saveDir + vo.getDelFile());
			if(file.exists()) file.delete();
			sqlSession.commit();
		}else {
			msg = "회원 정보 삭제중 오류 발생";
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return msg;
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = f.getFactory().openSession();
		
		System.out.println("Dao.view()..." + mid);
		
		MemberVo vo =sqlSession.selectOne("member.view",mid);
		
		System.out.println(vo.getName());
		
		sqlSession.close();
		return vo;
	}

}
```

member.js

```js
/**
 *    회원 관리에 관련된 스크립트
 *   작성자 : 김남호
 *   작성일 : 2020.12
 */

 function getID(id) {
    return document.getElementById(id)
 }
 
 
 var member = function() {
    
    var btnInsert = getID('btnInsert');
    var btnFind = getID('btnFind');
    var btnSelect = getID('btnSelect');
    var btnSave = getID('btnSave');
    var btnFindZip = getID('btnFindZip');
    var btnPhoto = getID('btnPhoto');
    var btnModify = getID('btnModify');
    var btnUpdate = getID('btnUpdate');
   var btnDelete = getID('btnDelete');
   
   //---------------------view에서 삭제버튼 클릭시 삭제 기능---------------------
   if(btnDelete != null){
      btnDelete.onclick = function(){
         var frm = document.frm_member;
        // var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요.");
        var win = window.open('./member/input_pwd.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px');
        
        win.onbeforeunload = function(){
         if(frm.pwd.value != ''){
            frm.action = 'deleteR.mem';
            //frm.pwd.value = pwd;
            frm.mid.disabled=false;
            frm.submit();
         }            
        }
      }
   }
   
    if(btnUpdate != null){
       btnUpdate.onclick = function(){
          var frm = document.frm_member;
         var win = window.open('./member/input_pwd.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px');
         win.onbeforeunload = function(){
               if(frm.pwd.value != ''){
             frm.enctype= 'multipart/form-data';
             frm.action = 'update.mem'; //수정된 정보를 저장
             frm.submit();
            }
         }
       }
    }

    if(btnModify != null){
       btnModify.onclick = function(){
          var frm = document.frm_member;
          frm.mid.disabled=false;
          frm.action = 'modify.mem'; //수정화면으로 이동
          frm.submit();
       }
    }
    
    // 이미지 파일 미리보기
    if(btnPhoto != null){
       btnPhoto.onchange = function(ev){
          var tag = ev.srcElement; //이벤트 발생한 태그
          var url =tag.files[0];
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
    
    
    
    //다음 우편번호 검색 API를 사용한 주소 찾기
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
          var checkFlag =true;
          
          /*
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
             alert("암호를 확인하세요");
             return;
          }
          */
          //파일 업로드를 위해선 반드시 저 코드를 사용해야하는데 사용시 request.getParameter()를 통해서 form에 있는 데이터를 처리할 수 없기에          
          //cos.jar lib 다운받아서 사용해야만 아래 코드가 작동한다. <1222 스샷필기 확인>
          if(checkFlag){
            frm.enctype = 'multipart/form-data';
            frm.action = 'insertR.mem';
            frm.submit();
          
          }
       }
    }
    
    if(btnSelect != null){
       btnSelect.onclick = function(){
          var frm = document.frm_member;
          // Servlet 이후 이런식으로 변경할것 frm.action ='member.do?inc=select'
          // frm.action = url + 'select.jsp';   
          frm.action = 'select.mem';
          frm.submit();
       }
    }
   
   if(btnFind != null){
      btnFind.onclick =function() {
         var frm = document.frm_member;
         // Servlet 이전 frm.action = url + 'select.jsp'; 아래 코드는 Servlet 이후 변경 코드
         frm.action = "select.mem";
         frm.nowPage.value = 1;
         frm.submit();
      }
   }    
    
    
    //$('#btnInsert').on('click',function(){...});
    if(btnInsert != null) {
       btnInsert.onclick = function() {
          var frm = document.frm_member;
          frm.action = 'insert.mem';
          frm.submit();
       }
    }
 }
 
 function goPage(page) {
    var frm = document.frm_member;
    //frm.action = 'index.jsp?inc=./member/select.jsp'; Servlet 이전 밑에 코드는 Servlet 이후
    frm.action = 'select.mem';   
    frm.nowPage.value = page;
    frm.submit();
 }
 
 function view(mid){
    var frm =document.frm_member;
    frm.action = 'view.mem'; //frm.action = 'index.jsp?inc=./member/view.jsp'
    frm.mid.value = mid;
    frm.submit();
 }
```

# 5교시

modify.jsp만듬

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(수정))</title>
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
			<c:choose>
				<c:when test="${empty vo.photo}">
		<img src='http://placehold.it/200x140' id='photo' width='200px' height='140px'/>
		</c:when>
		<c:otherwise>
		<img src='./upload/${vo.photo }' id='photo' width='200px' height='140px'/>
		</c:otherwise>
		</c:choose>
		<hr/>

		<div class='btns'>
			<input type='button' value='수정' id='btnUpdate' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='pwd' /><br/>
		<input type='hidden' name='delFile' value='${vo.photo }' />
		
	</form>

</div>
<script>member()</script>
</body>
</html>
```

memberDao.java

```java
package member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;
	MemberFactory f;
	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		this.f = f;
		sqlSession = f.getFactory().openSession();
	}
	
	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String,Object> select(Page p) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		sqlSession.close();
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 수정되었습니다.";
		sqlSession = f.getFactory().openSession();
		int cnt = sqlSession.update("member.update",vo);
		if(cnt>0) {
			sqlSession.commit();
			if(vo.getPhoto() !=null && vo.getPhoto().equals("")) {
				File file = new File(FileUpload.saveDir + vo.getDelFile());
				if(file.exists()) file.delete();
			}
		}else {
			msg = "회원 정보 수정중 오류 발생";
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return msg;
	}

	@Override
	public String delete(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		sqlSession = f.getFactory().openSession();
		
		int cnt = sqlSession.delete("member.delete", vo);
		if(cnt>0) {
			File file =new File(FileUpload.saveDir + vo.getDelFile());
			if(file.exists()) file.delete();
			sqlSession.commit();
		}else {
			msg = "회원 정보 삭제중 오류 발생";
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return msg;
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = f.getFactory().openSession();
		
		System.out.println("Dao.view()..." + mid);
		
		MemberVo vo =sqlSession.selectOne("member.view",mid);
		
		System.out.println(vo.getName());
		
		sqlSession.close();
		return vo;
	}

}
```

# 6교시

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

   <!-- 테이블의 컬러명과 vo 객체의 필드명이 서로 다른 경우  -->
   <!-- column : 테이블의 컬럼명, property : vodml 필드명  -->
   <resultMap type="mVo" id="m_vo">
      <result column="m_id" property="mId"/>
      <result column="m_name" property="mName"/>
   </resultMap>

   <select id="temp_select" parameterType="page" resultMap="m_vo">
   
   </select>
   
   <select id="tot_list_size" parameterType="page" resultType="Integer">
      select count(mid) cnt from members
      <where> 
      	<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
      		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where>
   </select>
   
   <!-- config.xml에서 typeAliases로 별칭을 등록해서 패키지명,클래스명을 단순화 시킬 수 있다.  -->
   <!--<select id="select" parameterType="member.Page" resultType="member.MemberVo">-->
   <select id="select" parameterType="page" resultType="mVo">
       select * from (
        select rownum no, m.* from (
           select * from members 
           <where> 
      	<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
     		mid like '%${v}%' or email like '%${v}%' 
      		or phone like '%${v}%' or address like '%${v}%'
   	  	</foreach>
   	  </where> 
           order by name asc) m 
        ) where no between #{startNo} and #{endNo}
   </select>
   
   <insert id="insert" parameterType="mVo">
      insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
      values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
   </insert>
   
   <update id="update" parameterType="mVo">
      update members set
      name=#{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}   
      <if test="photo != null">
         , photo= #{photo}
      </if>
      where mid=#{mid} and pwd=#{pwd}
   </update>
   
   <delete id="delete" parameterType="mVo">
      delete from members where mid=#{mid} and pwd=#{pwd}
   </delete>
   
   <select id="view" parameterType="String" resultType="mVo">
      select * from members where mid=#{_parameter}
   </select>
   
   
   
</mapper> 
```

# 7 ~ 마지막 교시

member패키지 Dao.interface

```interface
package member;

import java.util.Map;

public interface Dao {
	public boolean log(String mid, String pwd);
	public int getTotListSize(String findStr);
	public Map<String, Object> select(Page p);
	public String insert(MemberVo vo);
	public String update(MemberVo vo);
	public String delete(MemberVo vo);
	public MemberVo view(String mid);
	
}
```

member패키지 FileUpload.java

```java
package member;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUpload {
	// 학원
	public static final String saveDir = "C:\\Users\\user1\\git\\kh-spring\\kh-spring\\WebContent\\upload\\";
	
	//home
	//public static final String saveDir = "C:/Users/jobtc/git/kh-web-2020/kh-web-2020/WebContent/upload/";
	
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
			System.out.println("FileUpload 생성자");
			ex.printStackTrace();
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

member패키지MemberController.java

```java
package member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao ;
	FileUpload fu;
	String msg;
	
	public MemberController() {	}
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(value="insert.mem", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert"); // WEB-INF/member/insert.jsp
		
		return mv;
	}
	
	@RequestMapping(value="insertR.mem", method=RequestMethod.POST)
	public ModelAndView insertR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		fu = new FileUpload(req);
		MemberVo vo = fu.getMember();
		Page page = fu.getPage();
		
		msg = dao.insert(vo);
		
		System.out.println("---------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("result");//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", msg);
		
		return mv;
		
	}
	@RequestMapping(value="select.mem", method= {RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> list = null;
		
		if(page != null) {
			System.out.println("controller.select().............");
			System.out.println("nowPage : " + page.getNowPage());
		}else {
			System.out.println("page is null");
		}
		
		Map<String, Object> map = dao.select(page);
		page = (Page)map.get("page");
		list = (List<MemberVo>) map.get("list");
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("select");//WEB-INF/member/select.jsp
		
		
		return mv;
	}
	
	@RequestMapping(value="view.mem", method=RequestMethod.POST)
	public ModelAndView view(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("controller.view().......");
		System.out.println(vo.getMid());
		
		vo = dao.view(vo.getMid());
		mv.addObject("vo", vo);
		mv.setViewName("view");//WEB-INF/member/view.jsp
		
		return mv;
	}
	
	@RequestMapping(value="deleteR.mem", method=RequestMethod.POST)
	public ModelAndView delete(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = dao.delete(vo);
		
		mv.addObject("msg", msg);
		mv.setViewName("result");
		
		return mv;
	}
	
	@RequestMapping(value="modify.mem", method=RequestMethod.POST)
	public ModelAndView modify(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		vo = dao.view(vo.getMid());
		
		mv.addObject("vo", vo);
		mv.setViewName("modify");
		
		return mv;
	}
	
	@RequestMapping(value="modifyR.mem", method=RequestMethod.POST)
	public ModelAndView modifyR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		fu = new FileUpload(req);
		MemberVo vo = fu.getMember();
		Page page = fu.getPage();
		
		msg = dao.update(vo);
		
		mv.setViewName("result");//WEB-INF/member/result.jsp
		mv.addObject("msg", msg);
		
		return mv;
		
	}
	
	
}
```

member패키지memberDao.java

```java
package member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;
	MemberFactory f;
	
	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		this.f = f;
		sqlSession = f.getFactory().openSession();
	}

	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String , Object> select(Page p) {
		sqlSession = f.getFactory().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()...................");
		System.out.println("nowPage : " + p.getNowPage());
		
		int cnt = sqlSession.selectOne("member.tot_list_size", p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage());
		System.out.println("endNo : " + p.getEndNo());
		
		List<MemberVo> list = sqlSession.selectList("member.select" , p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		sqlSession.close();
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 저장되었습니다.";
		sqlSession = f.getFactory().openSession();
		int cnt = sqlSession.insert("member.insert", vo);
		if(cnt<1) {
			msg = "회원 정보 저장중 오류 발생";
			sqlSession.rollback();
		}
		sqlSession.commit();
		sqlSession.close();
		return msg;
	}

	@Override
	public String update(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 수정되었습니다.";
		sqlSession = f.getFactory().openSession();
		int cnt = sqlSession.update("member.update", vo);
		if(cnt>0) {
			sqlSession.commit();
			if(vo.getPhoto() !=null && !vo.getPhoto().equals("")) {
				File file = new File(FileUpload.saveDir + vo.getDelFile());
				if(file.exists()) file.delete();
			}
		}else {
			msg = "회원 정보 수정중 오류 발생";
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return msg;
	}

	@Override
	public String delete(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		sqlSession = f.getFactory().openSession();
		
		int cnt = sqlSession.delete("member.delete", vo);
		if(cnt>0) {
			File file = new File(FileUpload.saveDir + vo.getDelFile());
			if(file.exists()) file.delete();
			sqlSession.commit();
		}else {
			msg = "회원 정보 삭제중 오류 발생";
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return msg;
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = f.getFactory().openSession();
		
		System.out.println("Dao.view()..." + mid);
		
		MemberVo vo = sqlSession.selectOne("member.view", mid);
		
		
		System.out.println(vo.getName());
		
		sqlSession.close();
		return vo;
	}

}
```

member패키지MemberVo.java

```java
package member;

public class MemberVo {
	String mid;
	String pwd;
	String name;
	String email;
	String phone;
	String zipcode;
	String address;
	String photo;
	String delFile;
	String mdate;
	
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDelFile() {
		return delFile;
	}
	public void setDelFile(String delFile) {
		this.delFile = delFile;
	}
	
	
}
```

member패키지Page.java

```java
package member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Page {
	int totListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize=12;
	int blockSize=5;
	
	String findStr;
	
	List<String> findStrList = new ArrayList<String>();
	
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}
	
	public void pageCompute() {
		totPage = (int)(Math.ceil(totListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo -listSize + 1;
		if(endNo>totListSize) endNo = totListSize;
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
		if(endPage>totPage) endPage = totPage;
	}
	
	

	public List<String> getFindStrList() {
		if(findStr != null) {
			String[] temp = findStr.split(" ");
			findStrList.addAll(Arrays.asList(temp));
		}
		
		return findStrList;
	}
	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	
}
```

member패키지config.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE configuration
   PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-config.dtd">
      
<configuration>
	<typeAliases>
		<typeAlias type="member.Page"     alias="page"/>
		<typeAlias type="member.MemberVo" alias="mVo"/>
	</typeAliases>
	
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver"   value="oracle.jdbc.driver.OracleDriver"/>			
				<property name="url"      value="jdbc:oracle:thin:@localhost:1521:XE"/>			
				<property name="username" value="system"/>			
				<property name="password" value="oracle"/>			
			</dataSource>			
		</environment>
	</environments>




	<mappers>
		<mapper resource="member/member.xml"/>
	</mappers>

</configuration>       
```

member패키지member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="member">

	<!-- 테이블의 컬럼명과 vo 객체의 필드명이 서로 다른경우 -->
	<!-- columne : 테이블의 컬럼명, property : vo의 필듬여 -->
	<resultMap type="mVo" id="m_vo">
		<result column="m_id"   property="mId"/>
		<result column="m_name" property="mName"/>
	</resultMap>


	<select id='temp_select' parameterType='page' resultMap='m_vo'>
	
	</select>
	
	<select id='tot_list_size' parameterType='page' resultType='Integer'>
		select count(mid) cnt from members 
		<where>
			<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
				mid   like '%${v}%'       or email   like '%${v}%'
				or    phone like '%${v}%' or address like '%${v}%'
			</foreach>
		</where>
	</select>
	

	<select id='select' parameterType='page' resultType='mVo'>
 		select * from (
		   select rownum no, m.* from (
		     select * from members 
			<where>
				<foreach collection='findStrList' item='v' open='(' close=')' separator='or'>
					mid   like '%${v}%'       or email   like '%${v}%'
					or    phone like '%${v}%' or address like '%${v}%'
				</foreach>
			</where>
		     order by name asc) m   
		 ) where no between #{startNo} and #{endNo} 	
	</select>

	<insert id="insert" parameterType='mVo'>
		insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate) 
		values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
	</insert>
	
	<update id="update" parameterType='mVo'>
		update members set 
		name = #{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone} 
		
		<if test="photo != null ">
			, photo= #{photo }
		</if>
		
		where mid=#{mid} and pwd=#{pwd}
	
	</update>

	<delete id="delete" parameterType='mVo'>
		delete from members where mid=#{mid} and pwd=#{pwd}
	</delete>

	<select id="view" parameterType='String' resultType='mVo'>
		select * from members where mid=#{_parameter}
	</select>

</mapper>   
```

WebContent폴더안에 css폴더안에 index.css

```css
@charset "UTF-8";
*{
	box-sizing: border-box;
	padding:0;
	margin:0;
}

#index{
	width:1000px;
	margin: 10px auto;
	
}

#index > h2{
	background-color: #333;
	padding:30px;
	color:#fff;
	
}
#index >.menu{
	text-align: right;
	background-color: #ccc;
	
}
#index >.menu > a {
	text-decoration: none;
	list-style: none;
	display: inline-block;
	margin-left:-6px;
	font-size:10pt;
	padding:5px 10px;
}

#index > .menu> a:hover {
	background-color: #555;
	color:#ff0;
}
```

css폴더안에 member.css

```css
@charset "UTF-8";

#member{
	width:1000px;
	margin:5px auto;
}

#btnZone{
	border-top: 1px solid #aaa;
	padding-top : 10px;
	text-align: center;
}
#btnZone>input[type=button]{
	border-radius: 14px;
	border:1px solid #aaa;	
}


/* select ---------------------- */
#findZone{
	height:60px;
}
#findZone>form{
	position: relative;
}

#findZone>form > div{
	display:inline-block;
	position: absolute;
	right:0;
}

#listItems{
	text-align: center;
}

#listItems .item{
	width: 300px;
	display: inline-block;
	margin-bottom:10px;
	text-align: left;
	font-size:10pt;
}

#listItems .item>img{
	width: 150px;
	height:200px;	
}	

/*--암호 입력 처리 ----------------------- */
#member #password_zone{
	display:none;
	z-index: 1;
	position: fixed;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-color: rgba(0,0,0, 0.4);
}

#member #password_zone>div{
	width:300px;
	position: relative;
	padding: 25px;
	margin: 250px auto;
	background-color: #fff;
	text-align: center;
	border-radius : 7px;
}
```

WebContent폴더안에 js폴더안에 file_upload.js

```js
/**
 * 파일 첨부및 이미지 미리보기
 * 작성일 :2020.12.30
 * 작성자 : it여행자
 */

var fileAttCnt =1;
var fileUpload = function(attZone){
	var zone = document.getElementById(attZone);
	append(zone);
}
function append(zone){
	var style_div = "border:1px solid #00f;width:120px;height:100px;"
		+ "display:inline-block;position:relative;margin-right:4px;";
	var style_delBtn = "position:absolute;bottom:2px;right:2px;border-width:0;"
		+ "font-size:40px;color:#f00;opacity:0.3;background-color:rgba(0,0,0,0)";

	//이미지, file tag, button을 포함하고 있는 div
	var div = document.createElement("div");
	div.setAttribute("style", style_div);

	var img = document.createElement("img");
	img.setAttribute("src", "http://placehold.it/120x100");
	img.setAttribute("width", "120px");
	img.setAttribute("height", "100px");
	div.appendChild(img);
	img.onclick = function(ev){
		imagePreView(zone,ev);
	}
	
	var file = document.createElement("input");
	file.setAttribute("type", "file");
	file.setAttribute("name", "attfile" + fileAttCnt);
	file.setAttribute("style" , "display:none;");
	file.setAttribute("modify", "no"); //파일의 선택여부를 체크
	file.setAttribute("class", "attfile");
	fileAttCnt++;
	
	
	var delBtn = document.createElement("input");
	delBtn.setAttribute("type", "button");
	delBtn.setAttribute("value", "X");
	delBtn.setAttribute("style", style_delBtn);
	delBtn.onclick = function(ev){
		if(zone.childNodes.length <=1) return;
		
		var ele = ev.srcElement; //이벤트가 발생한 태그
		var p = ele.parentNode;
		var file = p.getElementsByClassName("attfile").item(0);
		if(file.getAttribute("modify") == "yes"){
			zone.removeChild(p);
		}
	}
	
	div.appendChild(file);
	div.appendChild(delBtn);
	
	zone.appendChild(div);
}
function imagePreView(zone, ev){
	var tag = ev.srcElement;
	var pDiv = tag.parentNode;
	var file = pDiv.getElementsByClassName("attfile").item(0);
	file.click();
	
	file.onchange = function(ev2){
		if(file.getAttribute("modify") == "no"){
			append(zone);
		}
		
		var url = ev2.srcElement.files[0];
		var reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload = function(ev3){
			tag.src = ev3.target.result;
			file.setAttribute("modify", "yes");
		}
	}
}
```

js폴더안에 member.js

```js
/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	
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
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
			
				if(frm.pwd.value != ''){
					frm.action = 'deleteR.mem';
					frm.mid.disabled=false;
					frm.submit();
				}
			}
			
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			var pZone = getID('password_zone');
			var btnPassword = getID('btnPassword');
			frm.pwd.value = '';
			pZone.style.display= 'block';
			
			btnPassword.onclick = function(){
				pZone.style.display= 'none';
				if(frm.pwd.value != ''){
					frm.enctype = 'multipart/form-data';
					frm.action = 'modifyR.mem'; //수정된 정보를 저장
					frm.submit();
				}
			}
		
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			frm.action = 'modify.mem';//수정화면이동
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
			
			/*
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
			
			*/
			if(checkFlag){
				frm.enctype = 'multipart/form-data';
				frm.action = 'insertR.mem';
				alert(frm.mid.value);
				frm.submit();
			}
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'select.mem';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "select.mem";
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'insert.mem';
			frm.submit();
		}
	}
}//end of member()

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'select.mem';
	frm.nowPage.value = page;
	frm.submit();
}

function view(mid){
	var frm = document.frm_member;
	frm.action = 'view.mem';
	frm.mid.value = mid;
	frm.submit();
}
```

WebContent폴더안에 index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
</head>
<body>
<div id='index'>
	<h2>Spring Framework</h2>
	<div class='menu'>
		<a href='test.ddd'>Srping MVC Test</a>
		<a href='gugudan.ddd'>Spring MVC를 사용한 구구단</a>
		<a href='sum.ddd'>두수의 합</a>
		<a href='insert.mem'>회원가입</a>
		<a href='select.mem'>회원조회</a>
	</div>
	
</div>
</body>
</html>
```

WebContent폴더안에 pox.xml

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>kh-spring</groupId>
	<artifactId>kh-spring</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>
	<build>
		<sourceDirectory>src</sourceDirectory>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.8.0</version>
				<configuration>
					<source>1.8</source>
					<target>1.8</target>
				</configuration>
			</plugin>
			<plugin>
				<artifactId>maven-war-plugin</artifactId>
				<version>3.2.1</version>
				<configuration>
					<warSourceDirectory>WebContent</warSourceDirectory>
				</configuration>
			</plugin>
		</plugins>
	</build>

	<dependencies>
		<dependency>
		    <groupId>org.springframework</groupId>
		    <artifactId>spring-context</artifactId>
		    <version>5.2.12.RELEASE</version>
		</dependency>
		<dependency>
		    <groupId>org.springframework</groupId>
		    <artifactId>spring-aop</artifactId>
		    <version>5.2.12.RELEASE</version>
		</dependency>
		<dependency>
		    <groupId>org.aspectj</groupId>
		    <artifactId>aspectjweaver</artifactId>
		    <version>1.9.6</version>
		</dependency>
		
		<dependency>
		    <groupId>org.springframework</groupId>
		    <artifactId>spring-webmvc</artifactId>
		    <version>5.2.12.RELEASE</version>
		</dependency>

		<dependency>
		    <groupId>javax.servlet</groupId>
		    <artifactId>jstl</artifactId>
		    <version>1.2</version>
		</dependency>

		<dependency>
		    <groupId>org.mybatis</groupId>
		    <artifactId>mybatis</artifactId>
		    <version>3.4.6</version>
		</dependency>

		<dependency>
		    <groupId>com.oracle.database.jdbc</groupId>
		    <artifactId>ojdbc8</artifactId>
		    <version>21.1.0.0</version>
		</dependency>
		<dependency>
		    <groupId>servlets.com</groupId>
		    <artifactId>cos</artifactId>
		    <version>05Nov2002</version>
		</dependency>
		

	</dependencies>



</project>
```
 