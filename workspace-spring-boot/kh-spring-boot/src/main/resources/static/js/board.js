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

