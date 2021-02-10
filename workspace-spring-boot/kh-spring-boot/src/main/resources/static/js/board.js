/**
 * 게시판에서 사용하는 스크립트
 * date : 2021.02.09
 */
//즉시 실행하는 함수

brd = function() {
	$('#btnFind').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();

		$.ajax({
			url      : '/bSelect',
			data     : param,
			dataType : 'html',
			method   : 'post',
			success  : function(data)  {
				$('#here').html(data)
			}

		});

	});


	$('#btnSelect').on('click', function() {
		var param = $('#frm_board').serialize();
		$('#here').load('/bSelect', param);
	});



	$('#btnInsert').on('click', function()  {
		var param = $('#frm_board').serialize();
		$('#here').load('/bInsert', param);

	});

	$('#btnSave').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.enctype  = 'multipart/form-data';

		var data = new FormData(frm);

		$.ajax({
			url        : '/bInsertR',
			data       : data,
			dataType   : 'html',
			method     : 'post',
			processData: false,
			contentType: false,
			success: function(data) {
				$('#here').html(data)
			}

		});

	});


	$('#btnReplSave').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.enctype = 'multipart/form-data';

		var data = new FormData(frm);

		$.ajax({
			url        : '/bReplR',
			data       : data,
			dataType   : 'html',
			method     : 'post',
			processData: false,
			contentType: false,
			success: function(data) {
				$('#here').html(data)
			}

		});

	});


	$('#btnRepl').on('click', function() {
		var param = $('#frm_board').serialize();
		$('#here').load('/bRepl', param);

	});


	$('#btnModifyR').on('click', function() {
		var frm = $('#frm_board')[0];
		frm.enctype = 'multipart/form-data';
		var pwd = prompt("수정하려면 암호를 입력하세요");

		if (pwd != null) {
			frm.pwd.value = pwd;
			var data = new FormData(frm);

			$.ajax({
				url        : '/bModifyR',
				data       : data,
				dataType   : 'html',
				method     : 'post',
				processData: false,
				contentType: false,
				success: function(data) {
					$('#here').html(data)
				}

			});
		}
	});


	$('#btnModify').on('click', function() {
		var param = $('#frm_board').serialize();
		$('#here').load('/bModify', param);

	});

	$('#btnDelete').on('click', function() {
		var frm = $('#frm_board')[0];
		var pwd = prompt("정말 삭제하시려면 암호를 ???");
		if (pwd != null) {
			frm.pwd.value = pwd;
			var param = $('#frm_board').serialize();
			$('#here').load('/bDelete', param);
		}

	});



};


brd.goPage = function goPage(page) {
	var frm = $('#frm_board')[0];
	frm.nowPage.value = page;
	var param = $(frm).serialize();

	$('#here').load('/bSelect', param);


}

brd.view = function view(serial) {
	var frm = $('#frm_board')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();

	$.ajax({
		url: '/bView',
		data: param,
		method: 'post',
		success: function(data) {
			$('#here').html(data);
		}
	})

}