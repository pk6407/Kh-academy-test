/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : it여행자
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var board = function(){
	var frm = document.frm_board;
	var url = 'index.jsp?inc=./board/';	//'board.do?job=
	
	var btnInsert = getID('btnInsert');
	var btnSelect = getID('btnSelect');
	var btnSave = getID('btnSave');
	var btnFind = getID('btnFind');
	var btnDelete = getID('btnDelete');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnRepl = getID('btnRepl');
	var btnReplSave = getID('btnReplSave');
	
	if(btnReplSave != null){
		btnReplSave.onclick = function(){
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	if(btnRepl != null){
		btnRepl.onclick = function(){
			frm.action = url + 'repl.jsp';
			frm.submit();
		}
	}
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var pwd = prompt("수정하려면 암호를 입력하세요.");
			if(pwd != null){
				frm.pwd.value = pwd;
				frm.action = url + 'result.jsp';
				frm.submit();
			}
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			frm.action = url + 'update.jsp';
			frm.submit(); 
		}
	}	
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var yn = confirm("정말 삭제하시겠습니까???");
			if(yn){
				frm.action = url + 'result.jsp';
				frm.submit();
			}	
		}
	}
	
	if(btnFind != null){
		btnFind.onclick = function(){
			frm.nowPage.value = 1;
			frm.action = url + 'select.jsp';
			frm.submit();
		}
	}
	
	if(btnSave != null){
		btnSave.onclick = function(){
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			frm.action = url + 'select.jsp';
			frm.submit();
		}
	}
	
	if(btnInsert != null){
		btnInsert.onclick = function(){
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}

}

function goPage(page){
	var frm = document.frm_board;
	frm.nowPage.value = page;
	frm.action = 'index.jsp?inc=./board/select.jsp';
	frm.submit();
}
function view(serial){
	var frm = document.frm_board;
	frm.serial.value = serial;
	frm.action = 'index.jsp?inc=./board/view.jsp';
	frm.submit();
}