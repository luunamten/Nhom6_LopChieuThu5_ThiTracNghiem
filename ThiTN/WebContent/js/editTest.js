$(document).ready(function() {
	$('#send_but').click(function() {
		$('#report_result').empty();
		$.ajax({
			url: 'EditTest',
			type: 'POST',
			async: false,
			data: $('#edit_form').serialize(),
			success: function(content, status) {
				$('#report_result').html(content);
			}
		});
	});
});