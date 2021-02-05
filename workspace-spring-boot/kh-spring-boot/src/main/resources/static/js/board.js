/** 
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12
 */
function getID(id){ return document.getElementById(id)}

var board = function(){
	var frm = document.frm_board;
	var url = 'index.jsp?inc=./board/';	//'board.do?job=
	
	var btnInsert = getID('btnInsert');
	var btnSelect = getID('btnSelect');
	var btnSave = getID('btnSave');
	var btnFile = getID('btnFind');
	
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