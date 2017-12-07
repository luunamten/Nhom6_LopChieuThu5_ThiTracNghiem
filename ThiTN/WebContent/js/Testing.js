$(document).ready(function() {
	var timeout;
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

	$(document).on('change','input[name=answer]', function() {
		$.ajax({
			url:'ChangeAnswer',
			async: false,
			type:'GET',
			data: {
				aindex:$(this).val()
			},
			success:function() {
				
			}
		});
	})
	function loop() {
		$.ajax({
			url: 'UpdateTime',
			type:'GET',
			async:false,
			success:function(content, status) {
				if(content == "00:00:00") {

				} else if(content.trim() != '') {
					$('#time_remaining').html(content);
				}
			}
		});
		timeout = setTimeout(loop, 500);
	}
	loop();
});