$(document).ready(function() {
	$('#select_class').change(function() {
		$.ajax({
			url: 'LoadStudentsOfTest',
			type: 'POST',
			data: {
				classID: $(this).val(),
				testID: $('input[name=test_id]').val()
			},
			async:false,
			success: function(content,status) {
				$('#student_table > tbody').html(content);
			}
		}); 
	});
	$('#edit_test_but').click(function() {
		$("form[name=test_data_form]").submit();
	});
});