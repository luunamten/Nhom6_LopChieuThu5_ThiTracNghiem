<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if
	test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'sv'}">
	<c:redirect url="index.jsp" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="icon/icon.css">
<link rel="stylesheet" href="bootstrap400/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="icon" href="img/ebook.png" />
<script src="jquery/jquery321.js"></script>
<script src="bootstrap400/js/popper.min.js"></script>
<script src="bootstrap400/js/bootstrap.min.js"></script>
<script src="js/Testing.js"></script>
<title>Làm bài thi</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<c:set var="test" value="${sessionScope.test }" />
	<c:set var="testingInfo" value="${sessionScope.testingInfo }" />
	<c:set var="question" value="${requestScope.question }" />
	<c:set var="amap" value="${question.mapAnswers }" />
	<div id="testing_container" class="row">
		<div class="col-sm-3">
			<div class="card cs_card">
				<div class="card-header bg-info text-white">
					<h4>${test.id} - ${test.name }</h4>
				</div>
				<div class="card-body cs_card_body">
					<div class="table-responsive-lg">
						<table class="table table-hover">
							<tr>
								<td><strong>Tổng thời gian:</strong></td>
								<td>${test.duration }phút</td>
							</tr>
							<tr>
								<td><strong>Thời gian còn lại:</strong>
									
								</td>
								<td><span id="time_remaining"></span></td>
							</tr>
							<tr>
								<td><strong>Tổng số câu::</strong>
								</td>
								<td><span id="total_question">${testingInfo.totalPage }</span></td>
							</tr>
							<tr>
						</table>
					</div>
				</div>
				<div class="card-footer">
				<form method="post" action="EndTest">
					<button type="submit" class="btn btn-block btn-primary"
						id="end_test_but">Nộp bài</button>
						</form>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card cs_card" id="question_panel">
				<div class="card-header bg-info text-white">
					<p id="question">${question.content}</p>
				</div>
				<div class="card-body cs_card_body">
					<div class="radio">
						<label> <input type="radio" name="answer" id="ans-1"
							value="by" /><span id="ans-a"> ${question.answers[amap[0]]}</span>
						</label>
					</div>
					<hr />
					<div class="radio">
						<label> <input type="radio" name="answer" id="ans-2"
							value="of" /><span id="ans-b"> ${question.answers[amap[1]]}</span>
						</label>
					</div>
					<hr />
					<div class="radio">
						<label> <input type="radio" name="answer" id="ans-3"
							value="do" /><span id="ans-c"> ${question.answers[amap[2]]}</span>
						</label>
					</div>
					<hr />
					<div class="radio">
						<label> <input type="radio" name="answer" id="ans-4"
							value="go" /><span id="ans-d"> ${question.answers[amap[3]]}</span>
						</label>
					</div>
				</div>
				<div class="card-footer">
					<div class="form-inline">
						<label for="page_val_to">Trang</label> <input type="number"
							class="form-control" min="1" max="${testingInfo.totalPage }" value="1" id="page_val_to"
							name="page_val_to" />
						<button type="button" class="btn btn-outline-danger" id="page_to2">>></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>