$(document).ready(function() {
	$('#select_semester').change(function() {
		$.ajax({
			url: 'LoadClasses',
			type: 'GET',
			data: {
				semesterID: $(this).val()
			},
			async:false,
			success: function(content,status) {
				$('#select_class').html(content);
				$('#select_class').trigger('change');
			}
		}); 
	});
	
	$('#select_class').change(function() {
		$.ajax({
			url: 'LoadTesting',
			type: 'GET',
			data: {
				semesterID: $('#select_semester').val(),
				classID: $(this).val()
			},
			async:false,
			success: function(content,status) {
				$('#testing_table > tbody').html(content);
			}
		}); 
	});
	
});