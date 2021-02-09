# 1교시

- 검색과 Spring FileUpload
- 오후 3:30 ~ 면접특강

BoardVo.java

```java
package kr.jobtc.board;

public class BoardVo {
	String mid;
	String subject;
	
	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
```

board.js

```js
/*
* 게시판에서 사용하는 스크립트
* date : 2021.02.09
*/
//즉시 실행하는 함수

brd = function(){
	$('#btnFind').on('click',function(){
	 var param = $('#frm_board').serialize();
	 //console.log(param);
	
	$.ajax({
		url : '/bSelect',
		data : param,
		dataType : 'html',
		method : 'post',
		sucess : function(data){
			$('#here').html(data)
			}
	
		});
	
	});


};
```

select.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='css/board.css'>
</head>
<body>
<div id='board'>
	<h2>일반 공지 게시판</h2>
	<form name='frm_board' id='frm_board' method='post'>
		<input type='button' value='공지추가' id='btnInsert' />
		<input type='text' name='findStr'/>
		<input type='button' value='검색' id='btnFind' />
		<input type='hidden' name='nowPage' value='5'/>
		<input type='hidden' name='serial' value='123'/>
	</form>
	<hr/>
	
	<c:forEach var='vo' items='${list }'>
		<div class='item'>
			<span>${vo.mid }</span>
			<span>${vo.subject }</span>
		</div>
	</c:forEach>

</div>
<script>brd()</script>
</body>
</html>
```

# 2교시
BoardService.java

```java
package kr.jobtc.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

 

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.Page;

@Service
@Transactional
public class BoardService { // Mapper를 실행시킴
	
	@Autowired
	BoardMapper mapper;
	@Autowired
	BoardDao dao;
	
	public List<BoardVo> select(Page page){
		List<BoardVo> list = mapper.select(page);
		System.out.println("BoardService.select()......");
		dao.select();
		/*
		for(BoardVo v : list) {

			System.out.println(v.getSubject());

		}

		*/

		return list;

	}

	

}
```

board.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="kr.jobtc.mybatis.BoardMapper">

	<select id='select' resultType='kr.jobtc.board.BoardVo' parameterType="kr.jobtc.board.Page">
		select * from board 
		where subject like '%${findStr}%'
		or doc like '%${findStr}%'
		order by serial desc
	</select>

 
</mapper>
```

insert.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='board'>
	<form name='frm_board' id='frm_board' method='post'>
		<label>작성자</label>
		<input type='text' name='mid' value='kim n.h'/>
		<br/>
		<label>제목</label>
		<input type='text' name='subject' value='하이...방가루....'/>
		<br/>
		<label>파일첨부</label>
		<input type='file' name='attFile' multiple='multiple'/>
		<p/>
		<input type='button' value='저장' id='btnSave'/>
		<input type='button' value='목록으로' id='btnList'/>
		
	</form>
 
</div>
<script>board()</script>
</body>
</html>
```

MainController.java

```java
package kr.jobtc.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;
import kr.jobtc.mybatis.BoardService;

@RestController
public class MainController {

	@Autowired
	BoardService service;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("index");

		return mv;

	}

	@RequestMapping(value="/bSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();

		List<BoardVo> list = service.select(page);

		mv.addObject("list", list);
		mv.setViewName("board/select");

		return mv;
	}

	@RequestMapping(value="/bInsert" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insert(Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("page",page);
		mv.setViewName("board/insert");
		return mv;
	}


}
```

board.js

```js
/*
* 게시판에서 사용하는 스크립트
* date : 2021.02.09
*/
//즉시 실행하는 함수

brd = function(){
	$('#btnFind').on('click',function(){
	 var param = $('#frm_board').serialize();
	 //console.log(param);
	
	$.ajax({
		url : '/bSelect',
		data : param,
		dataType : 'html',
		method : 'post',
		success : function(data){
			$('#here').html(data)
			}
	
		});
	
	});

	$('#btnInsert').on('click',function(){
		var param = $('#frm_board').serialize();
		$('#here').load('/bInsert',param);
		
	});
	
	
};
```

index.jsp


```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel='stylesheet' type='text/css' href='css/index.css'/>
<html>
<head>
<meta charset="UTF-8">
<title>Spring boot final example</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
	        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
 	        crossorigin="anonymous"></script>
 	        
<script src='js/index.js'></script>
<script src='js/board.js'></script>

</head>
<body>
<div id='index'>
	<header id='header'>
	<h2>Spring boot final example</h2>
 	</header>
 	<nav id='menu'>
 		<ul>
 			<li><a href='#' onclick="goURL('/bSelect')">공지사항</a></li>
 		</ul>
 	</nav>
 	<section id='here'>
 	
 	</section>
 	
 	<footer id='footer'>
 		좋은 우리 주식회사
 	</footer>
 	
</div>


</body>
</html>
```

# 3교시

[spring boot 제공해 주는 FileUpload 사용하기]
1. application.properties속성추가
- spring.servlet.multipart.max-request-size=300MB
- spring.servlet.multipart.max-file-size=100MB
2. FileUploadController추가
- webapp -> WEB-INF -> upload폴더 만들기

FileUploadController.java

```java
package kr.jobtc.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.jobtc.board.BoardVo;
import kr.jobtc.mybatis.BoardService;

@Controller
public class FileUploadController {
	String saveDir = "C:\\Users\\asdas\\workspace-spring-boot\\kh-spring-boot\\src\\main\\webapp\\WEB-INF\\upload\\";

	@Autowired
	BoardService service;
	
	public String upload(@RequestParam("attFile") List<MultipartFile> mul, @ModelAttribute BoardVo vo) {
		String msg = "";
		
		for(MultipartFile m : mul) {
			File oriFile = new File(saveDir + m.getOriginalFilename());
			System.out.println(oriFile.toString());
			
		}
		
		return msg;
	}
	
}
```

public String upload(@RequestParam("attFile") List<MultipartFile> mul, @ModelAttribute BoardVo vo) 에서 @RequestParam("attFile")이것은 insert에 <input type='file' name='attFile' multiple='multiple'/> attFile 말하는것이다,그리고 List<MultipartFile> mul 의 mul 는 임의의 변수명이다,List<MultipartFile>은 file tag에 의해서 선택된 파일들을 전달한다.
<input type='hidden' name='nowPage' value='5'/>
<input type='hidden' name='serial' value='123'/>
가
@ModelAttribute BoardVo vo)안에
request.getPar() vo.setMid(mid)이런식으로 들어간다

board.js

```js
/*
* 게시판에서 사용하는 스크립트
* date : 2021.02.09
*/
//즉시 실행하는 함수

brd = function(){
	$('#btnFind').on('click',function(){
	 var param = $('#frm_board').serialize();
	 //console.log(param);
	
	$.ajax({
		url : '/bSelect',
		data : param,
		dataType : 'html',
		method : 'post',
		success : function(data){
			$('#here').html(data)
			}
	
		});
	
	});

	$('#btnInsert').on('click',function(){
		var param = $('#frm_board').serialize();
		$('#here').load('/bInsert',param);
		
	});
	
	$('#btnSave').on('click',function(){
	 var frm = $('#frm_board');
	 frm.enctype='multipart/form-data';
	
	 var data = new FormData(frm);
	 
	$.ajax({
		url : '/bInsertR',
		data : data,
		dataType : 'html',
		method : 'post',
		processData : false,
		contentType : false,
		success : function(data){
			$('#here').html(data)
			}
	
		});
	
	});
	
};
```

# 점심후 4교시 

application.properties

```properties
# embed tomcat server port
server.port = 8899

#mvc view resolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

# oracle account info
spring.datasource.driver=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=system
spring.datasource.password=oracle

# mybatis mapper
mybatis.type-aliases-package=kr.jobtc.mybatis, kr.jobtc.board
mybatis.mapper-locations=static/mapper/*.xml

# connection pool(TomcatCP)
#spring.datasource.tomcat.max-active=100
#spring.datasource.tomcat.max-idle=50
#spring.datasource.tomcat.initial-size=10

# spring boot 2.x connection pool(HikariCP) 1/1000
spring.datasource.hikari.maxPoolSize=20
spring.datasource.hikari.connectionTimeout=60000

#file upload
spring.servlet.multipart.max-request-size=300MB
spring.servlet.multipart.max-file-size=50MB
```

MainController.java

```java
package kr.jobtc.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;
import kr.jobtc.mybatis.BoardService;

@RestController
public class MainController {

	@Autowired
	BoardService service;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("index");

		return mv;

	}

	@RequestMapping(value="/bSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();

		List<BoardVo> list = service.select(page);

		mv.addObject("list", list);
		mv.setViewName("board/select");

		return mv;
	}

	@RequestMapping(value="/bInsert" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insert(Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("page",page);
		mv.setViewName("board/insert");
		return mv;
	}


}
```

BoardMapper.java

```java
package kr.jobtc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@Repository
@Mapper
public interface BoardMapper {
	// List<String> list = sqlSession.selectList("kr.jobtc.mybatis.BoardMapper.select","hong");
	public List<BoardVo> select(Page page);
	public int insert(BoardVo vo);
}
```

AttVo.java

```java
package kr.jobtc.board;

public class AttVo {
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

BoardVo.java

```java
package kr.jobtc.board;

import java.util.ArrayList;
import java.util.List;

public class BoardVo {
	String mid;
	String subject;
	
	List<AttVo> attFiles = new ArrayList<AttVo>();

	public List<AttVo> getAttFiles() {
		return attFiles;
	}

	public void setAttFiles(List<AttVo> attFiles) {
		this.attFiles = attFiles;
	}

	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
```

BoardService.java

```java
package kr.jobtc.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

 

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.Page;

@Service
@Transactional
public class BoardService { // Mapper를 실행시킴
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardDao dao;
	
	public List<BoardVo> select(Page page){
		List<BoardVo> list = mapper.select(page);
		System.out.println("BoardService.select()......");
		dao.select();
		/*
		for(BoardVo v : list) {
			System.out.println(v.getSubject());
		}
		*/
		return list;
	}

	public String insert(BoardVo vo) {
		String msg = "게시물이 정상적으로 입력됨.";
		int cnt = mapper.insert(vo);
		
		return msg;
	}

}
```

FileUploadController.java

```java
package kr.jobtc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.jobtc.board.AttVo;
import kr.jobtc.board.BoardVo;
import kr.jobtc.mybatis.BoardService;

@Controller
public class FileUploadController {
	String saveDir = "C:\\Users\\asdas\\workspace-spring-boot\\kh-spring-boot\\src\\main\\webapp\\WEB-INF\\upload\\";

	@Autowired
	BoardService service;
	
	@RequestMapping(value="/bInsertR", method=RequestMethod.POST)
	public String upload(@RequestParam("attFile") List<MultipartFile> mul, @ModelAttribute BoardVo vo) {
		String msg = "";
		List<AttVo> attFiles = new ArrayList<AttVo>();
		
		
		try {
			for(MultipartFile m : mul) {
				File oriFile = new File(saveDir + m.getOriginalFilename());
				System.out.println(oriFile.toString());
				//file upload
				m.transferTo(oriFile);

				AttVo v = new AttVo();
				v.setOriFile(m.getOriginalFilename());
				
				attFiles.add(v);
				
			}
			
			vo.setAttFiles(attFiles);
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return msg;
	}
	
}
```

board.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="kr.jobtc.mybatis.BoardMapper">

	<select id='select' resultType='kr.jobtc.board.BoardVo' parameterType="kr.jobtc.board.Page">
		select * from board 
		where subject like '%${findStr}%'
		or doc like '%${findStr}%'
		order by serial desc
	</select>

	<insert id='insert' parameterType='kr.jobtc.board.BoardVo'>
		insert all
		into board(serial, mid, pwd, subject, doc, mdate, hit)
		values(seq_board.nextval, #{mid} , #{pwd}, #{subject} , #{doc}, sysdate, 0 )
		<if test="attList != null">
			<foreach collection="attList" item="att">
				into boardAtt(serial, pserial, sysfile, orifile)
				values (getBoardAttSeq(), seq_board.currval, #{att.sysFile}, #{att.oriFile} )
			</foreach>
		</if>
		select * from dual
	</insert>
	
	
</mapper>
```

board.js

```js
/*
* 게시판에서 사용하는 스크립트
* date : 2021.02.09
*/
//즉시 실행하는 함수

brd = function(){
	$('#btnFind').on('click',function(){
	 var param = $('#frm_board').serialize();
	 //console.log(param);
	
	$.ajax({
		url : '/bSelect',
		data : param,
		dataType : 'html',
		method : 'post',
		success : function(data){
			$('#here').html(data)
			}
	
		});
	
	});

	$('#btnInsert').on('click',function(){
		var param = $('#frm_board').serialize();
		$('#here').load('/bInsert',param);
		
	});
	
	$('#btnSave').on('click',function(){
	 var frm = $('#frm_board')[0];
	 frm.enctype='multipart/form-data';
	
	 var data = new FormData(frm);
	 
	$.ajax({
		url : '/bInsertR',
		data : data,
		dataType : 'html',
		method : 'post',
		processData : false,
		contentType : false,
		success : function(data){
			$('#here').html(data)
			}
	
		});
	
	});
	
};
```

# 5교시

프로젝트 회의햇다