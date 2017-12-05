<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="bootstrap400/js/bootstrap.js"></script>
<script src="bootstrap400/js/bootstrap.min.js"></script>
<script src="bootstrap400/js/bootstrap.bundle.js"></script>
<script src="js/viewTestDetails.js"></script>
<title>Chi tiết bài thi</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<!--Cac tinh nang-->
	<div id="testing_container" class="row">
		<div class="col-sm-4">
			<div class="card cs_card">
				<div class="card-header bg-info text-white">
					<c:set var="test" value="${requestScope.testDetails.test}" />
					<h4>
						${test.id} - ${test.name} <input
							type="hidden" value="${test.id}" id="test_id" />
					</h4>
				</div>
				<div class="card-body cs_card_body">
					<p id="subject">
						<strong>Môn: </strong> ${requestScope.subject.id } -
						${requestScope.subject.name }

					</p>

					<p id="total_time">
						<strong>Thời gian: </strong> ${test.duration} phút
					</p>
					<p id="num_question">
						<strong>Số câu: </strong> ${requestScope.testDetails.numQuestion}
					</p>
					<p id="create_time">
						<strong>Thời gian tạo: </strong> ${test.birth}
					</p>
					<p id="start_time">
						<strong>Thời gian bắt đầu: </strong> ${test.start}
					</p>
					<p id="end_time">
						<strong>Thời gian kết thúc: </strong> ${test.end}
					</p>
					<p id="num_sv">
						<strong>Số sinh viên thi: </strong>
						${requestScope.testDetails.numStudent}
					</p>
				</div>
				<div class="card-footer">
					<a href="gv_cacBaiThi.jsp"><button type="button"
							class="btn btn-block btn-outline-danger" id="back_to_tests">
							&lt;&lt; Trở về</button></a>
				</div>
			</div>
		</div>
		<div class="col-sm-7 test_table_container">
			<h1>Các lớp và sinh viên thi</h1>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form>
						<!--select subject-->
						<div class="form-group col-sm-4">
							<label for="select_class">Chọn lớp</label> <select
								name="select_class" id="select_class" class="form-control">
								<c:if test="${not empty requestScope.classes }">
									<c:forEach var="_class" items="${requestScope.classes}">
										<option value="${_class.id}">${_class.name}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<!--table showing tests-->
						<div class="table-responsive-sm">
							<table id="student_table"
								class="table table-striped table-hover table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>STT</th>
										<th>Mã số sinh viên</th>
										<th>Họ tên</th>
										<th>Điểm</th>
										<th>Đã thi</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
						<!--hidden element for holding table data-->
						<input type="hidden" name="table_value" id="table_value" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>