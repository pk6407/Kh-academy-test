<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form_xml</title>
<style type='text/css'>
#items>div{
	display : inline-block;
	width : 200px;
	height : 150px;
	border : 1px solid #ccc;
	box-sizing : border-box;
	padding : 5px;
	box-shadow : 2px 2px 4px #aaa;
	border-radius:12px;
	margin-right:7px;
	background-color:#fee;
}
.emp>div:first-child{
	color:#00f;
	border-bottom: 1px dotted #555;
}
.emp>div:nth-child(2){
	font-weight:bolder;
}
</style>
</head>
<body>
<div id ='emp_search_form'>
	<h2>사원조회(XML)</h2>
	<form name='frm'method='post' id='frm'>
		<label>검색어를 입력하세요</label>
		<input type="text" name='findStr'placeholder='성명,이메일,연락처로 검색'/>
		<input type="button" value='검색' id='btnFind' />
	</form>
	<hr/>
	<div id='items'></div>
</div>
<script>

$('#btnFind').on('click', function(){
	let param = $('#frm').serialize(); //form에 있는 값을 직렬화시킨다. findStr=123;
	let req = new XMLHttpRequest();
	req.open('get', './ajax/emp_search_xml.jsp?' + param); //''여기서는 안에 빈 공백이 있으면 안된다.
	req.onreadystatechange = function(){
		
		//console.log(req.status + "," + req.readyState);
		if(req.status==200 && req.readyState==4){
			let xml = req.responseXML;
			let emps = xml.getElementsByTagName("emp");
			let rst = '';
			
			for(var i=0; i<emps.length; i++){
				var emp = emps.item(i);
				var id = emp.getElementsByTagName("id").item(0).firstChild.nodeValue;
				var name = emp.getElementsByTagName("name").item(0).firstChild.nodeValue;
				var email = emp.getElementsByTagName("email").item(0).firstChild.nodeValue;
				var phone = emp.getElementsByTagName("phone").item(0).firstChild.nodeValue;
				var salary = emp.getElementsByTagName("salary").item(0).firstChild.nodeValue;
			
				rst += "<div class='emp'>"
					+ "    <div>" + id + "</div>"
					+ "    <div>" + name + "</div>"
					+ "    <div>" + email + "</div>"
					+ "    <div>" + phone + "</div>"
					+ "    <div>" + salary + "</div>"
					+ "</div>";
			}
			
			$('#items').html(rst);
		}
	}
	req.send();
	
});

</script>
</body>
</html>