$(document).ready(function() {
	$('#select_subject').change(function() {
		$.ajax({
			url: 'LoadPartAndNumQuestion',
			type: 'POST',
			async: true,
			data: {
				subjectID: $(this).val() 
			},
			success: function(content,status) {
				$('#select_part').html(content);
			}
		}); 
	});

	$('#add_part_but').click(function() {
		var selectedPartAndTotalQuestion = $('#select_part').val();
		if(selectedPartAndTotalQuestion == null) {
			return;
		}
		var partAndTotalQuestion = selectedPartAndTotalQuestion.split(" ");
		var selectedPart = partAndTotalQuestion[0];
		var totalQuestion = partAndTotalQuestion[1];
		var selectedPartName = $('#select_part option:selected').text();
		var isExist = false;
		$("#part_table > tbody > tr").each(function() {
			var tmp = $(this).children("td:first-child").text();
			if(tmp == selectedPart) {
				isExist = true;
				return false;
			}
		});
		if(isExist) {
			return;
		}
		var elementsString = 
			"<tr>" +
				"<td>"+selectedPart+"<input type='hidden' name='selectedPart' value='"+selectedPart+"' /></td>" +
				"<td>"+selectedPartName+"</td>" +
				"<td><input type='number' class='form-control' value='1' max='"+totalQuestion+"' min='1' name='numQuestion' /></td>" +
				"<td>"+totalQuestion+"<input type='hidden' name='totalQuestion' value='"+totalQuestion+"' /></td>" +
				"<td><span class='material-icons pointer_cur'>delete</span></td>" +
			"</tr>"
		$("#part_table > tbody").append(elementsString);
	});
	$(document).on('click', '.material-icons', function() {
		$(this).closest('tr').remove();
	});
	$("#select_subject").on({
		input: function() {
			$("#part_table > tbody").empty("tr");
		}
	});
});