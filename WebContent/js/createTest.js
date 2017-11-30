$(document).ready(function() {
	/*$('#send_but').click(function() {
		var subject = $('#select_subject');
		var partTable = $('#part_table');
		var testName = $('#test_name');
		var testNameStatus = $('#test_name_status');
		var startTimeStatus = $('#start_time_status');
		var endTimeStatus = $('#end_time_status');
		var durationStatus = $('#duration_status');
		var startTime = $('#start_time');
		var endTime = $('#end_time');
		var duration = $('#duration');
		var tmpArray = [];

		//kiem tra hop le va in loi
		checkTestName(testName, testNameStatus);
		checkStartPoint(startTime, endTime, startTimeStatus);
		checkEndPoint(startTime, endTime, endTimeStatus);
		checkDuration(duration, durationStatus);
		
		if(testNameStatus.text() != '' || 
			startTimeStatus.text() != '' ||
			endTimeStatus.text() != '' ||
			durationStatus.text() != ''
			) {
			alert("Vẫn còn lỗi hoặc chưa nhập đủ.");
			return;
		}


		//kiem tra bang rong hay khong
		var rows = partTable.children('tbody').children('tr');
		if(rows.length == 1) {
			alert('Phải chọn một phần của môn.');
			return;
		}

		//lay du lieu tu bang va luu vao mang
		rows.each(function() {
			var firstValue = $(this).children('td:nth-of-type(1)').text();
			if(firstValue == '') {
				return true;
			}
			tmpArray.push(firstValue);
			tmpArray.push($(this).children('td:nth-of-type(2)').children().val());
		});

		alert(tmpArray);

		
	});*/
	//gui du lieu len server

});