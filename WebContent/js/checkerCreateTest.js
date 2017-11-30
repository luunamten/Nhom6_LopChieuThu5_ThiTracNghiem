
function checkTestName(testName, testNameStatus) {
	var content = testName.val();
	if(content == '') {
		testNameStatus.text('Không được để trống.');
	} else if(content.length < 7) {
		testNameStatus.text('Phải nhiều hơn 6 kí tự.');
	} else {
		testNameStatus.text('');
	}
}
//Check start point
function checkStartPoint(startTime, endTime, startTimeStatus) {
	var startTimeContent = startTime.val();
	if(startTimeContent == '') {
		startTimeStatus.text('Không được để trống.');
		return;
	}
	var realStartTime = new Date(startTime.val());
	var endTimeContent = endTime.val();
	if(realStartTime == 'Invalid Date') {
		startTimeStatus.text('Nhập không hợp lệ.');
	} else {
		if(endTimeContent == '') {
			startTimeStatus.text('');
			return;
		}
		var realEndTime = new Date(endTime.val());
		if(realEndTime == 'Invalid Date') {
			startTimeStatus.text('');
			return;
		} else if(realStartTime.getTime() >= realEndTime.getTime()) {
			startTimeStatus.text('Phải nhỏ hơn thời điểm kết thúc.');
		} else {
			startTimeStatus.text('');	
		}
	}
}
//	Check end point
function checkEndPoint(startTime, endTime, endTimeStatus) {
	var endTimeContent = endTime.val();
	if(endTimeContent == '') {
		endTimeStatus.text("Không được để trống.");
		return;
	}
	var realEndTime = new Date(endTime.val());
	var startTimeContent = startTime.val();
	if(realEndTime == 'Invalid Date') {
		endTimeStatus.text('Nhập không hợp lệ.');
	} else {
		if(startTimeContent == '') {
			endTimeStatus.text('');
			return;
		}
		var realStartTime = new Date(startTime.val());
		if(realStartTime == 'Invalid Date') {
			endTimeStatus.text('');
			return;
		} else if(realStartTime.getTime() >= realEndTime.getTime()) {
			endTimeStatus.text('Phải lớn hơn thời điểm bắt đầu.');
		} else {
			endTimeStatus.text('');	
		}
	}
}
//Check duration
function checkDuration(duration, durationStatus) {
	var content = duration.val();
	if(content < 10 || content == '') {
		durationStatus.text('Tối thiểu là 10 phút.');
	} else {
		durationStatus.text('');
	}
}
$(document).ready(function() {
	var testName = $('#test_name');
	var testNameStatus = $('#test_name_status');
	var startTimeStatus = $('#start_time_status');
	var endTimeStatus = $('#end_time_status');
	var durationStatus = $('#duration_status');
	var startTime = $('#start_time');
	var endTime = $('#end_time');
	var duration = $('#duration');
	//Check test name
	testName.on({
		input:function() {
			checkTestName(testName, testNameStatus);
		}
	});
	//Check start point
	startTime.on({
		input:function() {
			checkStartPoint(startTime, endTime, startTimeStatus);
		}
	});
	//Check end point
	endTime.on({
		input:function() {
			checkEndPoint(startTime, endTime, endTimeStatus);
		}
	});
	//Check duration
	duration.on({
		input:function() {
			checkDuration(duration, durationStatus);
		}
	});
});