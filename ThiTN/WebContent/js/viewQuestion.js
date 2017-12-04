$(document).ready(function() {
	var pageOffset = 0;
	var pageLength = 20;
	var isLimit = false;
	$('#select_subject').change(function() {
		$('#question_table > tbody').empty();
		$.ajax({
			url: 'LoadPart',
			type: 'POST',
			data: {
				subjectID: $(this).val() 
			},
			async:false,
			success: function(content,status) {
				$('#select_part').empty();
				$('#select_part').append(content);
			}
		}); 
	});

	$('#searchBut').click(function() {
		$('#question_table > tbody').empty();
		pageOffset = 0;
		$.ajax({
			url:'ViewQuestions',
			data:{
				select_part:$('#select_part').val(),
				searchTxt:$('#searchTxt').val(),
				offset:0,
				length:pageLength
			},
			async:false,
			type:"POST",
			success: function(content, status) {
				var pageIndex = pageOffset / pageLength + 1;
				$('#question_table_cap').text("Trang "+pageIndex);
				$('#question_table > tbody').html(content);			
			}
		});
	});
	$('#backBut').click(function() {
		$('#question_table > tbody').empty();
		if(pageOffset >= pageLength) {
			pageOffset -= pageLength;
		}
		$.ajax({
			url:'ViewQuestions',
			data:{
				select_part:$('#select_part').val(),
				searchTxt:$('#searchTxt').val(),
				offset:pageOffset,
				length:pageLength
			},
			async:false,
			type:"POST",
			success: function(content, status) {
				var pageIndex = pageOffset / pageLength + 1;
				$('#question_table_cap').text("Trang "+pageIndex);
				$('#question_table > tbody').html(content);		
				if(content.trim() == '') {
					pageOffset = 0;
				} else {
					isLimit = false;
				}
			}
		});
	});
	$('#forwardBut').click(function() {
		$('#question_table > tbody').empty();
		if(!isLimit) {
			pageOffset += pageLength;
		}
		$.ajax({
			url:'ViewQuestions',
			data:{
				select_part:$('#select_part').val(),
				searchTxt:$('#searchTxt').val(),
				offset:pageOffset,
				length:pageLength
			},
			async:false,
			type:"POST",
			success: function(content, status) {
				var pageIndex = pageOffset / pageLength + 1;
				$('#question_table_cap').text("Trang "+pageIndex);
				$('#question_table > tbody').html(content);
				if(content.trim() == '') {
					isLimit = true;
				} else {
					isLimit = false;
				}
			}
		});
	});
	$(document).on('click', '.delete_q', function() {

		var questionID = $(this).closest('tr').children('td:nth-child(2)').text();
		var isDelete = window.confirm("Bạn thực sự muốn xóa câu hỏi "+questionID+" ?");
		if(isDelete) {
			$('#question_table > tbody').empty();
			$.ajax({
				url:"DeleteQuestion",
				type:"POST",
				async: false,
				data: {
					questionID: questionID
				},
				success: function(content, status) {
					$("#report_result").html(content);
					$.ajax({
						url:'ViewQuestions',
						data:{
							select_part:$('#select_part').val(),
							searchTxt:$('#searchTxt').val(),
							offset:pageOffset,
							length:pageLength
						},
						async:false,
						type:"POST",
						success: function(content, status) {
							$('#question_table > tbody').html(content);
							if(content.trim() == '') {
								isLimit = true;
							} else {
								isLimit = false;
							}
						}
					});
				}
			});
		}
	});
	$(document).on('click', '.edit_q', function() {
		$('#question_table > tbody').empty();
	});
});
