
$(document).ready(function() {
	$("#savePhoneBut").click(function() {
		$.ajax({
			url:'ChangePhone',
			type: 'POST',
			data:{
				phoneNumber: $('#phoneNumberTxt').val()
			},
			async: false,
			success: function(content, status) {
				$('#changePNumberModal').modal('hide', function() {
					$('#phoneModalWrapper').empty();
				})
			}
		});
	});

	$("#saveEmailBut").click(function() {
		$.ajax({
			url:'ChangeEmail',
			type: 'POST',
			data:{
				phoneNumber: $('#emailTxt').val()
			},
			async: false,
			success: function(content, status) {
			}
		});
	});
	
	$("#savePasswordBut").click(function() {
		$.ajax({
			url:'ChangePass',
			type: 'POST',
			data:{
				phoneNumber: $('#passwordTxt').val()
			},
			async: true,
			success: function(content, status) {
			}
		});
	});	
});