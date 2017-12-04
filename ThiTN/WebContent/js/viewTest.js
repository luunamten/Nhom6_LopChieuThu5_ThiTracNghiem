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
	
	$('#searchBut').click(function() {
		$('#question_table > tbody').empty();
		$.ajax({
			url:'ViewTests',
			data:{
				select_semester:$('#select_semester').val(),
				select_subject:$('#select_subject').val(),
				searchTxt:$('#searchTxt').val()
			},
			async:false,
			type:"POST",
			success: function(content, status) {
				$('#test_table > tbody').html(content);			
			}
		});
	});
});