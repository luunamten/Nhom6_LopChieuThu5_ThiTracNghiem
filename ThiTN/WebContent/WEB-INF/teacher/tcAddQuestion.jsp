<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="icon/icon.css">
<link rel="stylesheet" href="bootstrap400/css/bootstrap.min.css" />
<link rel="icon" href="img/ebook.png" />
<script src="jquery/jquery321.js"></script>
<script src="bootstrap400/js/bootstrap.js"></script>
<script src="bootstrap400/js/bootstrap.min.js"></script>
<script src="bootstrap400/js/bootstrap.bundle.js"></script>
<script src="js/checkerAddQuestion.js"></script>
<script src="js/addQuestion.js"></script>
<link rel="stylesheet" href="css/login.css" />
<title>Giáo viên</title>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<!--Chuc nang-->
	<div class="row">
		<c:import url="tcFeatures.jsp">
			<c:param name="f2" value="active" />
		</c:import>
		<!--Form cua chuc nang them cau hoi-->
		<div class="col-sm-9 test_table_container">
			<h1>Thêm câu hỏi</h1>
			<c:import url="../common/ReportSuccess.jsp" />
			<c:import url="../common/ReportErrors.jsp" />
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<form method="post" action="AddQuestion">
						<!--Nhap mon, phan-->
						<div class="row">
							<div class="form-group col-sm-6">
								<label for="select_subject">Chọn môn</label> <select
									id="select_subject" name="select_subject" class="form-control"
									required>
									<c:if test="${not empty requestScope.subjects }">
										<c:forEach var="subject" items="${requestScope.subjects}">
											<option value="${subject.id}">${subject.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<label for="select_part">Chọn phần</label> <select
									id="select_part" name="select_part" class="form-control"
									required>
									<c:if test="${not empty requestScope.parts }">
										<c:forEach var="part" items="${requestScope.parts}">
											<option value="${part.id}">${part.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
						<!--Nhap cau hoi-->
						<div class="form-group">
							<label for="input_question">Nhập câu hỏi(Tối thiểu 6 kí
								tự)</label>
							<textarea class="form-control" rows="5" name="input_question"
								id="input_question" required>${requestScope.saveContent }</textarea>
						</div>

						<!--Nhap cac cau tra loi-->
						<div class="row">
							<div class="form-group col-sm-6">
								<label for="correct_answer">Câu trả lời đúng</label>
								<textarea class="form-control" rows="2" id="correct_answer"
									name="correct_answer" required>${requestScope.saveCorrect }</textarea>
							</div>
							<div class="form-group col-sm-6">
								<label for="wrong_answer1">Câu sai 1</label>
								<textarea class="form-control" rows="2" id="wrong_answer1"
									name="wrong_answer1" required>${requestScope.saveWrong1 }</textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<label for="wrong_answer2">Câu sai 2</label>
								<textarea class="form-control" rows="2" id="wrong_answer2"
									name="wrong_answer2" required>${requestScope.saveWrong2 }</textarea>
							</div>
							<div class="form-group col-sm-6">
								<label for="wrong_answer3">Câu sai 3</label>
								<textarea class="form-control" rows="2" id="wrong_answer3"
									name="wrong_answer3" required>${requestScope.saveWrong3 }</textarea>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" id="send_but"
								class="btn btn-primary btn-block" value="Tạo" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>