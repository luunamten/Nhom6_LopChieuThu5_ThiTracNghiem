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
	
	$(document).on('click', '.delete_q', function() {
		var testID = $(this).closest('tr').children('td:nth-child(2)').text();
		var isDelete = window.confirm("Bạn thực sự muốn xóa câu hỏi "+testID+" ?");
		if(isDelete) {
			$('#test_table > tbody').empty();
			$.ajax({
				url:"DeleteTest",
				type:"POST",
				async: false,
				data: {
					testID: testID
				},
				success: function(content, status) {
					$("#report_result").html(content);
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
				}
			});
		}
	});
	
	$('#searchBut').click(function() {
		$('#question_table > tbody').empty();
		$.ajax({
			url:'ViewTests',
			data:{
				select_semester:$('#select_semester').val(),
				select_subject:$('#select_subject').val(),
				subjectName: $('#select_subject > option:selected').text(),
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