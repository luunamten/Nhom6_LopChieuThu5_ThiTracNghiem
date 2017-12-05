$(document).ready(function() {
	$('#select_subject').change(function() {
		$.ajax({
			url: 'LoadPart',
			type: 'GET',
			async:false,
			data: {
				subjectID: $(this).val() 
			},
			success: function(content,status) {
				$('#select_part').html(content);
			}
		});
	});
	
	$('#excel_but').click(function() {
		var res = window.confirm("Bạn có muốn thêm các câu hỏi trong file Excel?");
		if(res) {
			$("#excel_partID").val($('#select_part').val());
			$('#excel_form').submit();
		}
	});
});
