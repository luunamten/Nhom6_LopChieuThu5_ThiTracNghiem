$(document).ready(function() {
	$('#select_semester').change(function() {
		$.ajax({
			url: 'LoadSubject',
			type: 'POST',
			data: {
				semesterID: $(this).val() 
			},
			async:false,
			success: function(content,status) {
				$('#select_subject').html(content);
			}
		}); 
	});
});