$(document).ready(function() {
	$(document).on('click','#page_to2',function() {
		$.ajax({
			url: 'ChangeQuestion',
			data:{
				qindex: ($('#page_val_to').val()-1)
			},
			type:'GET',
			async:false,
			success:function(content, status) {
				if(content.trim() != '') {
					$('#question_panel').html(content);
				}
			}
		});
	})
});