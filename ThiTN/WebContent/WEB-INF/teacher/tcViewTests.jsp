<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
<script src="js/viewTest.js"></script>
<title>Giáo viên</title>
</head>
<body>
	<%--Sheet2--%>
	<c:import url="../common/header.jsp" />
	<div class="row">
		<c:import url="tcFeatures.jsp">
			<c:param name="f5" value="active" />
		</c:import>
		<!--test-->
		<div class="col-sm-9 test_table_container">
			<h1>Các bài thi</h1>
			<div id="report_result">
				<c:import url="../common/ReportSuccess.jsp" />
				<c:import url="../common/ReportErrors.jsp" />
			</div>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form>
						<div class="row">
							<!--select subject-->
							<div class="form-group col-sm-4">
								<label for="select_semester">Chọn học kì</label> <select
									name="select_semester" id="select_semester"
									class="form-control">
									<c:if test="${not empty requestScope.semesters }">
										<c:forEach var="semester" items="${requestScope.semesters}">
											<option value="${semester.id}">${semester.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label for="select_subject">Chọn môn</label> <select
									name="select_subject" id="select_subject" class="form-control">
									<c:if test="${not empty requestScope.subjects }">
										<c:forEach var="subject" items="${requestScope.subjects}">
											<option value="${subject.id}">${subject.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group col-sm">
								<label for="searchTxt">Chuỗi tìm kiếm</label> <input type="text"
									name="searchTxt" id="searchTxt" class="form-control" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-4">
								<input type="button" name="searchBut" id="searchBut"
									class="btn btn-primary form-control" value="Tìm kiếm" />
							</div>
						</div>
						<!--table showing tests-->
						<div class="table-responsive-sm">
							<table id="test_table"
								class="table table-striped table-hover table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>STT</th>
										<th>Mã bài thi</th>
										<th>Tên</th>
										<th>Bắt đầu thi</th>
										<th>Kết thúc</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>