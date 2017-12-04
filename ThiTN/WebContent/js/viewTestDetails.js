$(document).ready(function() {
$('#select_class').change(function() {
		$.ajax({
			url: 'LoadStudentsOfTest',
			type: 'POST',
			data: {
				classID: $(this).val(),
				testID: $('#test_id').val()
			},
			async:false,
			success: function(content,status) {
				$('#student_table > tbody').html(content);
			}
		}); 
	});
});