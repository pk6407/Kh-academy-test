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