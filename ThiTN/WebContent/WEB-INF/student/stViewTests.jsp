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
<script src="js/stViewTest.js"></script>
<title>Sinh viên</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<div class="row">
		<!--Feature-->
		<c:import url="stFeatures.jsp">
			<c:param name="f2" value="active"></c:param>
		</c:import>
		<!--test-->
		<div class="col-sm-9 test_table_container">
			<h1>Các bài thi</h1>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form>
						<!--select subject-->
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="select_semester">Chọn học kì</label> <select
									name="select_semester" id="select_semester" class="form-control">
									<c:if test="${not empty requestScope.semesters }">
										<c:forEach var="semester" items="${requestScope.semesters}">
											<option value="${semester.id}">${semester.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
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
						</div>
						<!--table showing tests-->
						<div class="table-responsive-sm">
							<table id="testing_table"
								class="table table-striped table-hover table-bordered">
								<thead class="thead-dark">
								<tr>
									<th>STT</th>
									<th>Mã bài thi</th>
									<th>Tên bài thi</th>
									<th>Bắt đầu thi</th>
									<th>Đã thi</th>
									<th>Kết quả</th>
									<th>Thi</th>
								</tr>
								</thead>
								<tbody>
									<c:import url="stTestingTableRows.jsp" />
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