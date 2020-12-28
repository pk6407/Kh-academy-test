/**
 * login / logout을 위한 스크립트
 * 작성일 : 2020.12.11
 * 작성자 : Jacob
 */

var logInOut = function(){
	
	/* jQuery
	$('#btnLogin').on('click', function(){
		$('#frm_log').action = "./member/login.jsp";
		$('#frm_log').submit();
	});
	
	$('btnLogout').on('click', function(){
		location.href = "./member/logout.jsp";
	});
	*/
	
	// javascript version
	
	var btnLogin = document.getElementById('btnLogin');
	var btnLogout = document.getElementById('btnLogout');
	
	if(btnLogin !=null){
	btnLogin.onclick = function() {
		var frm = document.frm_log;
		frm.action = './member/login.jsp';
		frm.submit();
	}
	}
	if(btnLogout !=null){
	btnLogout.onclick = function() {
		location.href = './member/logout.jsp';
	}
	}
	
};