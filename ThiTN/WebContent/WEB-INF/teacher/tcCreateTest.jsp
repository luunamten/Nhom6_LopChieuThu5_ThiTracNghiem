<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script src="js/createTest.js"></script>
<title>Giáo viên</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<div class="row">
		<c:import url="tcFeatures.jsp">
			<c:param name="f3" value="active" />
		</c:import>
		<!--test-->
		<div class="col-sm-9 test_table_container">
			<h1>Tạo bài thi</h1>
			<c:if test="${not empty requestScope.createTestSuccess }">
				<p class="notify_success">
				${requestScope.createTestSuccess}
				</p>
			</c:if>
			<c:if test="${not empty requestScope.createTestError }">
				<p class="notify_error">
				${requestScope.createTestError}
				</p>
			</c:if>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form method="post" action="CreateTest">
						<div class="row">
							<!--select subject-->
							<div class="form-group col-sm-4">
								<label for="select_subject">Chọn môn</label> <select
									name="select_subject" id="select_subject" class="form-control"
									required>
									<c:if test="${not empty requestScope.subjects }">
										<c:forEach var="subject" items="${requestScope.subjects}">
											<option value="${subject.id}">${subject.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<!--select subject part-->
							<div class="form-group col-sm-4">
								<label for="select_part">Chọn phần</label> <select
									name="select_part" id="select_part" class="form-control"
									required>
									<c:if test="${not empty requestScope.parts }">
										<c:forEach var="part" items="${requestScope.parts}">
											<option value="${part.partID} ${part.numberOfQuestion }">${part.partName}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<!--add part button-->
							<div class="form-group col-sm-4">
								<label for="add_part_but">(Thêm phần)</label>
								<button type="button" id="add_part_but"
									class="btn btn-primary btn-block">Thêm</button>
							</div>
						</div>
						<!--table showing selected part-->
						<span>(Số câu mỗi phần tối thiểu là 1)</span>
						<table id="part_table"
							class="table table-striped table-responsive-sm table-hover table-bordered">
							<thead class="thead-dark">
								<tr>
									<th>Mã phần</th>
									<th>Tên phần</th>
									<th>Số câu</th>
									<th>Tổng số câu hỏi</th>
									<th>Xóa phần</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<div class="row">
							<!--test name-->
							<div class="form-group col-sm-6">
								<label for="test_name">Tên bài thi (tối thiểu 6 kí tự)</label>
								<textarea class="form-control" rows="2" id="test_name"
									name="test_name" required>${requestScope.saveName}</textarea>
							</div>
							<!--start point-->
							<div class="row col-sm">
								<div class="form-group col-sm">
									<label for="start_time">Ngày bắt đầu</label> <input type="date"
										class="form-control" name="start_date" id="start_date"
										value="${requestScope.saveStartDate }" required />
								</div>
								<div class="form-group col-sm">
									<label for="start_time">Giờ bắt đầu</label> <input type="time"
										class="form-control" id="start_time" name="start_time"
										value="${requestScope.saveStartTime }" required />
								</div>
							</div>
						</div>
						<!--end point-->
						<div class="row">
							<div class="row col-sm">
								<div class="form-group col-sm">
									<label for="start_time">Ngày kết thúc</label> <input
										type="date" class="form-control" name="end_date" id="end_date"
										value="${requestScope.saveEndDate }" required />
								</div>
								<div class="form-group col-sm">
									<label for="start_time">Giờ kết thúc</label> <input type="time"
										class="form-control" id="end_time" name="end_time"
										value="${requestScope.saveEndTime }" required />
								</div>
							</div>

							<!--test duration-->
							<div class="form-group col-sm-6">
								<label for="duration">Khoảng thời gian thi (tối thiểu 10
									phút)</label> <input type="number" min="10" class="form-control"
									id="duration" name="duration"
									value="${(empty requestScope.saveDuration)?10:requestScope.saveDuration}"
									required />
							</div>
						</div>
						<!--send data button-->
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