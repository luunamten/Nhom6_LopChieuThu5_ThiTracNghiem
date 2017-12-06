<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="js/editTest.js"></script>
<link rel="stylesheet" href="css/login.css" />
<title>Giáo viên</title>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<!--Chuc nang-->
		<div class="col-md-5 container test_table_container">
			<h3>Chỉnh sửa bài thi</h3>
			<div id="report_result"></div>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<form method="post" action="EditTest" id="edit_form">
						<!--test name-->
						<c:set var="startDateTime" value="${fn:split(requestScope.test.start,' ')}" />
						<c:set var="endDateTime" value="${fn:split(requestScope.test.end,' ')}" />
						<input type="hidden" value="${requestScope.test.id }" name="test_id" />
						<div class="form-group">
							<label for="test_name">Tên bài thi (tối thiểu 6 kí tự)</label>
							<textarea class="form-control" rows="2" id="test_name"
								name="test_name" required>${requestScope.test.name}</textarea>
						</div>
						<div class="row">
							<!--start point-->
							<div class="form-group col-sm">
								<label for="start_time">Ngày bắt đầu</label> <input type="date"
									class="form-control" name="test_start_date" id="test_start_date"
									value="${startDateTime[0] }" required />
							</div>
							<div class="form-group col-sm">
								<label for="start_time">Giờ bắt đầu</label> <input type="time"
									class="form-control" id="test_start_time" name="test_start_time"
									value="${startDateTime[1] }" required />
							</div>
						</div>
						<!--end point-->
						<div class="row">
							<div class="form-group col-sm">
								<label for="start_time">Ngày kết thúc</label> <input type="date"
									class="form-control" name="test_end_date" id="test_end_date"
									value="${endDateTime[0]}" required />
							</div>
							<div class="form-group col-sm">
								<label for="start_time">Giờ kết thúc</label> <input type="time"
									class="form-control" id="test_end_time" name="test_end_time"
									value="${endDateTime[1] }" required />
							</div>
						</div>
						<!--test duration-->
						<div class="form-group">
							<label for="duration">Thời gian thi (tối thiểu 10 phút)</label> <input
								type="number" min="10" class="form-control" id="test_duration"
								name="test_duration"
								value="${requestScope.test.duration}"
								required />
						</div>
						<!--send data button-->
						<div class="form-group">
							<input type="button" id="send_but"
								class="btn btn-primary btn-block" value="Thay đổi" />
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>