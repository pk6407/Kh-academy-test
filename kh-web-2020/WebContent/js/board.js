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
	
	if(btnReplSave != null){ //댓글저장
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
	
	if(btnUpdate != null){//게시물 수정저장
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





