function checkUname(uname, unameStatus) {
	var reg = /^[a-z][a-z0-9_]{2,}$/i;
	var content = uname.val();
	if(content == '') {
		unameStatus.text('Không được để trống.');
	} else if(content.length < 3) {
		unameStatus.text('Tối thiểu 3 kí tự');
	} else if(!reg.test(content)) {
		unameStatus.text('Chỉ được nhập a-z, 0-9, _ , bắt đầu là a-z.');
	} else {
		unameStatus.text('');
	}
}

function checkPassword(pass, passStatus) {
	var content = pass.val();
	var reg = /^[a-z0-9]{1,}$/i;
	if(content == '') {
		passStatus.text('Không được để trống.');
	} else if(content.length < 1) {
		passStatus.text('Tối thiểu 1 kí tự');
	} else if(!reg.test(content)) {
		passStatus.text('Chỉ được nhập a-z, 0-9.');
	} else {
		passStatus.text('');
	}
}

$(document).ready(function() {
	var uname = $('#uname');
	var pass = $('#password');
	var unameStatus = $('#uname_status')
	var passStatus = $('#pass_status');
	uname.on({
		input: function() {
			checkUname(uname, unameStatus);
		}
	});

	pass.on({
		input: function() {
			checkPassword(pass, passStatus);
		}
	});
});