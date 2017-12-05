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
<script src="js/userInfo.js"></script>
<link rel="stylesheet" href="css/login.css" />
<title>Giáo viên</title>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<!--Chuc nang-->
	<div class="col-sm-5 test_table_container">
		<h1>Thêm câu hỏi</h1>
		<c:import url="../common/ReportSuccess.jsp" />
		<c:import url="../common/ReportErrors.jsp" />
		<hr />
		<div class="card cs_card">
			<div class="card-body cs_card_body">
				<form action="" method="post">
					<div class="form-group">
						<label for="test_name"></label>
						<textarea id="test_name" class="form-control" rows="5"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>