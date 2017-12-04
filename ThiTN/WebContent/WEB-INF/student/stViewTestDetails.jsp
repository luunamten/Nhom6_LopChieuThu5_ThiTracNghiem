<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div id="test_info_container" class="container col-sm-4">
		<div class="card cs_card">
			<div class="card-header text-white bg-info">
				<h4 id="test_name">ENGLISH_TEST01</h4>
			</div>
			<div class="card-body cs_card_body">
				<p id="subject">Môn: Anh văn 1</p>
				<p id="start_time">Thời gian bắt đầu thi: 17-11-2017 07:00</p>
				<p id="total_time">Thời gian: 15 phút</p>
				<p id="number_question">Số câu: 15</p>
				<p id="test_state">Tình trạng: Chưa thi</p>
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