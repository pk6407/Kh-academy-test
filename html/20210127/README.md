# 참고
프로젝트 폴더 를 Visual Studio Code에서 열어서 프론트 작업해도된다.

# 1교시

Spring을 사용한 회원관리
프로젝트 자료 조사

어제꺼 복습햇다..

# 2교시

MemberController.java

```java
package member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao;
	
	public MemberController() {}
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="insert.mem", method=RequestMethod.GET)
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert");	// WEB-INF/member/insert.jsp
		
		return mv;
	}
	
	@RequestMapping(value="insertR.mem", method=RequestMethod.POST)
	public ModelAndView insertR(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("-------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("insert_result");	//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", "회원 정보가 정상적으로 저장되었습니다.");
		
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
		
		
		return mv;
	}
	
	
	
}
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

# 3교시

web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
		 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		 xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
		 		http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
		 version="3.1">
		 
	<filter>
		<filter-name>encoding_filter</filter-name>
		<filter-class>
			org.springframework.web.filter.CharacterEncodingFilter
		</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>utf-8</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>encoding_filter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	
	<servlet>
		<servlet-name>hello</servlet-name>
		<servlet-class>
		org.springframework.web.servlet.DispatcherServlet
		</servlet-class>	
	</servlet>

	<servlet-mapping>
		<servlet-name>hello</servlet-name>
		<url-pattern>*.ddd</url-pattern>
	</servlet-mapping>

	<!-- member -->
	<servlet>
		<servlet-name>member</servlet-name>
		<servlet-class>
		org.springframework.web.servlet.DispatcherServlet
		</servlet-class>	
	</servlet>

	<servlet-mapping>
		<servlet-name>member</servlet-name>
		<url-pattern>*.mem</url-pattern>
	</servlet-mapping>
	
</web-app>
```

한글 인코딩 추가

<bean class='org.springframework.web.servlet.view.InternalResourceViewResolver'>
      <property name='prefix' value='/WEB-INF/member/'  />
      <property name='suffix' value='.jsp' />
   </bean>

이문장때문에 MemberController.java에서 setViewName();이안에 jsp파일명만 쳐도 알아서 /WEB-INF/member/().jsp이렇게 되는거다

MemberController.java

```java
package member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao;
	
	public MemberController() {}
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="insert.mem", method=RequestMethod.GET)
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert");	// WEB-INF/member/insert.jsp
		
		return mv;
	}
	
	@RequestMapping(value="insertR.mem", method=RequestMethod.POST)
	public ModelAndView insertR(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("-------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("insert_result");	//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", "회원 정보가 정상적으로 저장되었습니다.");
		
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
		<input type='text' name='pwd' />
	</form>

</div>
<script>member()</script>
</body>
</html>
```

# 점심후 4교시

js폴더에 file_upload.js

```js
/**
 * 파일 첨부및 이미지 미리보기
 * 작성일 :2020.12.30
 * 작성자 : 김남호
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

member폴더에 insert.jsp

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

<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
이코드가 다음에 잇는 주소API 코드 빌려오는 거당.

# 5교시

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

insert.jsp

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
		<input type='text' name='mid' size='10' maxlength='10' required pattern='[\w!\-$]{3,10}'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' size='12'  required pattern='[a-zA-Z가-힣]{2,20}'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='14'  required pattern='[\w!\-$]{4,10}'/><br/>
		
		<label>암호확인</label>
		<input type='password' name='pwdConfirm' size='14' /><br/>
		
		<label>이메일</label>
		<input type='email' name='email' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' size='15' pattern='[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}'/><br/>
		
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
			
			<input type='hidden' name='findStr' value='${param.findStr }' />
			<input type='hidden' name='nowPage' value='${param.nowPage }' />
			
		</div>
	</form>

</div>
<script>member()</script>
</body>
</html>
```

# 6교시

- http://servlets.com/cos/
- https://mvnrepository.com/artifact/servlets.com/cos/05Nov2002
둘중 하나 받아라

member패키지안에 FileUpload.java만들고

cos -> 상업용 유료란다..

```java
package member;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUpload {
	// 학원
	public static final String saveDir = "C:\\Users\\pc\\eclipse-workspace\\kh-spring\\WebContent\\upload\\";
	
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

memberController.java

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
		
		
		System.out.println("-------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("insert_result");//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", "회원 정보가 정상적으로 저장되었습니다.");
		
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

# 7~ 8교시

프로젝트 이야기한다..