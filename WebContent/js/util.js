$(document).ready(function() {
	
	$('#select_subject').change(function() {
		$.ajax({
			url: '../LoadPart',
			type: 'POST',
			async: true,
			data: {
				subjectID: $(this).val() 
			},
			dataType: 'html',
			success: function(content,status) {
				$('#select_part').empty();
				$('#select_part').append(content);
			}
		}); 
	});
});210625968
