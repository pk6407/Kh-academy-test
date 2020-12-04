# 1교시 

- 어제 한거.....뭐햇는지 설명하셧다.....복습..
  
```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
<title>drag</title>
<style>
#drag>div{
	width:250px;
	height:250px;
	background:#88f;
	opacity:0.5;	
}
</style>
</head>
<body>
<div id='drag'>
	<div id='target1'>이곳을 끌어 보세용~</div>
	<div id='target2'>이곳을 끌어 봐랑~</div>
</div>
<script>
	$('#target1').draggable();
	$('#target2').draggable();
</script>

</body>
</html>
```

- target1,2 란 창을 마우스로 끌어서 이동시킬수잇는 이펙트다..(darg란 걸 이용해서)

# 2교시

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sortable</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
<style>
#sortable>#items>li {
	list-style: none;
	border: 1px dashed #324d32;
	background-color: #639763;
	color: #ffffe6;
	width: 150px;
	height: 40px;
	line-height: 40px;
	text-align: center;
}

#sortable>#items>li:first-child {
	border-radius: 10px 10px 0 0;
}

#sortable>#items>li:last-child {
	border-radius: 0 0 10px 10px;
}
#items li:hover{
	cursor : pointer;
}
</style>
</head>
<body>
<div id='sortable'>
	<ul id='items'>
		<li>html5</li>
		<li>css3</li>
		<li>javascript</li>
		<li>java</li>
		<li>jdbc</li>
		<li>jquery</li>
		<li>ajax</li>
		<li>mybatis</li>
		<li>jsp</li>
		<li>spring boot</li>
		<li>final project</li>
	</ul>
</div>
<script>
	$('#items').sortable();
</script>
</body>
</html>
```

- 왼쪽 메뉴 이쁘장하게 꾸몃구 그 메뉴 순서을 옮길수잇는 코드..

# 3교시

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accordion</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
</head>
<body>
<div id='accordion'>
		<h2>html5</h2>
		<div>
			<ul>
				<li>웹표준의 시작</li>
				<li>현재 5버전이지만 대중화된 버전은4.x대 버전</li>
				<li>canvas나 localStorage등과 같은 기술이 있지만 국내에서는 아직은...</li>
			</ul>
		</div>
		
		<h2>css3</h2>
		<div>
			<img src='./images/bg.png' width='200px' height='120px' />
		</div>
		<h2>javascript</h2>
		<h2>java</h2>
		<h2>jdbc</h2>
		<h2>jquery</h2>
		<h2>ajax</h2>
		<h2>mybatis</h2>
		<h2>jsp</h2>
		<h2>spring boot</h2>
		<h2>final project</h2>
</div>
<script>
	$('#accordion').accordion();
</script>
</body>
</html>
```

- 설명글처럼 나오는 코드

# 점심후 1교시

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autocomplete</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>

</head>
<body>
<div id='autocomplete'>
	<label>성명을 입력하세요.</label>
	<input type='text' name='findStr' id='findStr' />
	<input type='button' value='검색' id='btnFind' />
</div>
<script>
var data = ['java', 'jara', 'jagopa', 'jsp', 'javascript', 'like', 'love', 'life']
$('#findStr').autocomplete({
	source : data
});
</script>
</body>
</html>
```

- 자동 완성 기능^^ 코드

```java
package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class Application {
	Connection conn;
	public Application() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //요놈이 오라클 sql에 자바에서 치는걸 올려주는 
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE",
					"system","oracle"
					);  // 서버명/포트번호/그후 오라클sql 아이디/비번
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	public Connection getConn() {
		return conn;
	}
}
```

-그리고 그걸 sql디펠로퍼에 연결^^

# 점심후 2교시

* 전꺼랑 이어짐^^
  
```java
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AutoComplete {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public AutoComplete() {
		conn = new Application().getConn();
	}// conn 에 Application.conn 값이 담김^^
	// ['java', 'jara', 'jagopa', 'jsp', 'javascript', 'like', 'love', 'life'] ==> ''(X), ""(0)
	public String getData() {
		StringBuffer sb = new StringBuffer();// 처리 속도 빠르게 하기위해 StringBuffer를 씀
		
		try {
			String sql = "select first_name from hr.employess";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();	// CRUD(insert, select, update, delete) // select,updata,delete 를 executeUpdate()로 날려주면됨^^
			sb.append("[");
			rs.next();
			sb.append("'" + rs.getString("first_name") + "'");
			while(rs.next()) {
				sb.append(", '" +rs.getString("first_name") + "'");
			}
			sb.append("]");
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			String temp = sb.toString();
			temp = tem p.replaceAll("'", "\"");// ' 로 들어간걸 "로 바꿔라^^
			return temp;
		}
	}
}
```

- 저위에 쓴게 자바 에서 쓴걸 sql에 넣겟다

```jquery
<%@page import="bean.AutoComplete"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autocomplete</title>
<link rel='stylesheet' type='text/css'
	  href='http://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css'/>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>

</head>
<body>
<%
	AutoComplete ac = new AutoComplete();
	String data = ac.getData();//["kim","lee","hong","park"]
%>

<div id='autocomplete'>
	<label>성명을 입력하세요.</label>
	<input type='text' name='findStr' id='findStr' />
	<input type='button' value='검색' id='btnFind' />
</div>
<script>
var data = <%=data%> // System.out.print();
$('#findStr').autocomplete({
	source : data
});
</script>
</body>
</html>
```

# 라스트 팡 교시

```jquery
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu_ui</title>
<link rel='stylesheet' type='text/css'
   href='https://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css'/>
<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
<style>
.menu{width:120px;}
</style>
</head>
<body>
<div id='menu_ui'>
	<ul>
		<li><a href='#' class='ui-state-disabled'>강이름</a></li>
		<li><a href='#'>산이름</a></li>
		<li><a href='#'>과일명</a></li>
		<li>
			<a href='#'>동물명</a>
			<ul>
				<li><a href='#'>사자</a></li>
				<li><a href='#'>고양이</a></li>
				<li><a href='#'>강아지</a></li>
				<li><a href='#'>원숭이</a></li>
				<li><a href='#'>사슴</a></li>
			</ul>
		</li>
	</ul>
</div>
<script>
$('#menu_ui>.menu').menu();
</script>
</body>
</html>
```