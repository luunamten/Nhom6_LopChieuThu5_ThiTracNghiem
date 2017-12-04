$(document).ready(function() {
	$('#select_subject').change(function() {
		$.ajax({
			url: 'LoadPart',
			type: 'POST',
			async:false,
			data: {
				subjectID: $(this).val() 
			},
			success: function(content,status) {
				$('#select_part').html(content);
			}
		}); 
	});
});