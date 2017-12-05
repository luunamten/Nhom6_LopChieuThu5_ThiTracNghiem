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
<script src="js/viewQuestion.js"></script>
<title>Các bài thi</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<div class="row">
		<c:import url="tcFeatures.jsp">
			<c:param name="f4" value="active" />
		</c:import>
		<!--test-->
		<div class="col-sm-9 test_table_container">
			<h1>Các câu hỏi</h1>
			<div id="report_result">
				<c:import url="../common/ReportSuccess.jsp" />
				<c:import url="../common/ReportErrors.jsp" />
			</div>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form method="post" action="ViewQuestions">
						<div class="row">
							<!--select subject-->
							<div class="form-group col-sm">
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
								<label for="select_subject">Chọn phần</label> <select
									name="select_part" id="select_part" class="form-control">
									<c:if test="${not empty requestScope.parts }">
										<c:forEach var="part" items="${requestScope.parts}">
											<option value="${part.id}">${part.name}</option>
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
							<div class="form-group col-sm-4">
								<button type="button" id="backBut"
									class="btn btn-danger form-control">&lt;&lt;
									Quay trở lại</button>
							</div>
							<div class="form-group col-sm-4">
								<button type="button" id="forwardBut"
									class="btn btn-danger form-control">Tải thêm
									20 câu>></button>
							</div>
						</div>
						<!--table showing tests-->
						<div class="table-responsive-sm">
							
							<table id="question_table"
								class="table table-striped table-hover table-bordered">
								<caption id="question_table_cap">Trang 1</caption>
								<thead class="thead-dark">
									<tr>
										<th>STT</th>
										<th>Mã câu hỏi</th>
										<th>Nội dung</th>
										<th>Thời điểm thêm</th>
										<th>Thao tác</th>
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