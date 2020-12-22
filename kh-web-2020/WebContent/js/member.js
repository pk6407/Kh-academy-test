/**
 * 회원 관리에 관련된 스크립트
 * 작성자 : 김남호
 * 작성일 : 2020.12.21.
 */
function getID(id){ return document.getElementById(id)}

var member = function(){
	let url = 'index.jsp?inc=./member/';
	
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
			var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요");
			if(pwd != null){
				frm.action = 'member.do?job=delete';
				frm.pwd.value = pwd;
				frm.mid.disabled=false;
				frm.submit();
			}
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			//frm.enctype = 'multipart/form-data';
			frm.action = url + 'result.jsp';
			frm.submit();
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'update.jsp';
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
			
			//암호와 암호확인의 일치여부
			if(frm.pwd.value != frm.pwdConfirm.value){
				alert('암호를 확인해 주소~');
				return;
			}
			
			frm.enctype = 'multipart/form-data';
			frm.action = 'member.do?job=insert';
			frm.submit();
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			frm.action = 'member.do?job=select';
			frm.submit();
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.action = "member.do?job=select";
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			var frm = document.frm_member;
			frm.action = url + 'insert.jsp';
			frm.submit();
		}
	}
}

function goPage(page){
	var frm = document.frm_member;
	frm.action = 'member.do?job=select';
	frm.nowPage.value = page;
	frm.submit();
}
function view(mid){
	var frm = document.frm_member;
	frm.action = 'member.do?job=view';
	frm.mid.value = mid;
	frm.submit();
}