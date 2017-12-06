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
<title>Chi tiết bài thi</title>
</head>
<body>
	<%--Banner --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!--Thong` tin de thi-->
	<c:set var="testInfo" value="${requestScope.testInfo}" />
	<c:set var="testing" value="${testInfo.testing}" />
	<c:set var="test" value="${testing.test }" />
	<c:set var="subject" value="${testInfo.subject }" />
	<div id="test_info_container" class="container col-lg-5">
		<div class="card cs_card">
			<div class="card-header text-white bg-info">
				<h4 id="test_name">${test.id} - ${test.name }</h4>
			</div>

			<div class="card-body cs_card_body">
				<div class="table-responsive-lg">
					<table class="table table-hover">
						<tr>
							<td><strong>Môn:</strong></td>
							<td>${subject.id} - ${subject.name}</td>
						</tr>
						<tr>
							<td><strong>Bắt đầu thi:</strong></td>
							<td>${test.start }</td>
						</tr>
						<tr>
							<td><strong>Thời gian:</strong></td>
							<td>${test.duration } phút</td>
						</tr>
						<tr>
							<td><strong>Thời hạn:</strong></td>
							<td>${test.end }</td>
						</tr>
						<tr>
							<td><strong>Số câu:</strong></td>
							<td>${testInfo.numQuestion }</td>
						</tr>
						<tr>
							<td><strong>Tình trạng:</strong></td>
							<td>${test.start }</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="card-footer">
				<a href="sinhVien.jsp">
					<button id="back_to_tests" class="btn btn-outline-danger">
						&lt;&lt;Trở về</button>
				</a> <a href="thi.jsp">
					<button id="forward_to_test" class="btn btn-outline-danger">Thi
						>></button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>