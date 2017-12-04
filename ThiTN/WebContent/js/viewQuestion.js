$(document).ready(function() {
	var pageOffset = 0;
	var pageLength = 20;
	var isLimit = false;
	$('#select_subject').change(function() {
		$.ajax({
			url: 'LoadPart',
			type: 'POST',
			async: true,
			data: {
				subjectID: $(this).val() 
			},
			success: function(content,status) {
				$('#select_part').empty();
				$('#select_part').append(content);
			}
		}); 
	});

	$('#searchBut').click(function() {
		$.ajax({
			url:'ViewQuestions',
			data:{
				select_part:$('#select_part').val(),
				searchTxt:$('#searchTxt').val(),
				offset:0,
				length:pageLength
			},
			type:"POST",
			success: function(content, status) {
				var pageIndex = pageOffset / pageLength + 1;
				$('#question_table_cap').text("Trang "+pageIndex);
				$('#question_table > tbody').html(content);			
			}
		});
	});
	$('#backBut').click(function() {
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
});
