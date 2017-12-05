$(document).ready(function() {
	$('#select_class').change(function() {
		$.ajax({
			url: 'LoadStudentsAndTest',
			type: 'GET',
			data: {
				classID: $(this).val(),
				testID: $('input[name=test_id]').val()
			},
			async:false,
			success: function(content,status) {
				$('#testing_table > tbody').html(content);
			}
		}); 
	});
	
	$(document).on('change','input[name=check]',function() {
		var sib = $(this).siblings('input[name=check_value]');
		if(this.checked) {
			sib.val(1);
		} else {
			sib.val(0);
		}
	});
});