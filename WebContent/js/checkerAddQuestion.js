
function checkInputQuestion(inputQuestion, inputQuestionStatus) {
	var content = inputQuestion.val();
	if(content == '') {
		inputQuestionStatus.text('Không được để trống.');
	} else if(content.length < 7) {
		inputQuestionStatus.text('Phải nhiều hơn 6 kí tự.');
	} else {
		inputQuestionStatus.text('');
	}
}
//Check correct answer
function checkCorrectAnswer(correctAnswer, correctAnswerStatus) {
	var content = correctAnswer.val();
	if(content == '') {
		correctAnswerStatus.text('Không được để trống.');
	} else {
		correctAnswerStatus.text('');
	}
}
//Check wrong answer 1
function checkWrongAnswer1(wrongAnswer1, wrongAnswer1Status) {
	var content = wrongAnswer1.val();
	if(content == '') {
		wrongAnswer1Status.text('Không được để trống.');
	} else {
		wrongAnswer1Status.text('');
	}
}
//Check wrong answer 2
function checkWrongAnswer2(wrongAnswer2, wrongAnswer2Status) {
	var content = wrongAnswer2.val();
	if(content == '') {
		wrongAnswer2Status.text('Không được để trống.');
	} else {
		wrongAnswer2Status.text('');
	}
}
//Check wrong answer 3
function checkWrongAnswer3(wrongAnswer3, wrongAnswer3Status) {
	var content = wrongAnswer3.val();
	if(content == '') {
		wrongAnswer3Status.text('Không được để trống.');
	} else {
		wrongAnswer3Status.text('');
	}
}

$(document).ready(function() {
	var inputQuestion = $('#input_question');
	var inputQuestionStatus = $('#input_question_status');
	var correctAnswerStatus = $('#correct_answer_status');
	var wrongAnswer1Status = $('#wrong_answer1_status');
	var wrongAnswer2Status = $('#wrong_answer2_status');
	var wrongAnswer3Status = $('#wrong_answer3_status');
	var correctAnswer = $('#correct_answer');
	var wrongAnswer1 = $('#wrong_answer1');
	var wrongAnswer2 = $('#wrong_answer2');
	var wrongAnswer3 = $('#wrong_answer3');

	//Check input question
	inputQuestion.on({
		input:function() {
			checkInputQuestion(inputQuestion, inputQuestionStatus);
		}
	});
	//Check correct answer
	correctAnswer.on({
		input:function() {
			checkCorrectAnswer(correctAnswer, correctAnswerStatus);
		}
	});
	//Check wrong answer 1
	wrongAnswer1.on({
		input:function() {
			checkWrongAnswer1(wrongAnswer1, wrongAnswer1Status);
		}
	});
	//Check wrong answer 2
	wrongAnswer2.on({
		input:function() {
			checkWrongAnswer2(wrongAnswer2, wrongAnswer2Status);
		}
	});
	//Check wrong answer 3
	wrongAnswer3.on({
		input:function() {
			checkWrongAnswer3(wrongAnswer3, wrongAnswer3Status);
		}
	});
});