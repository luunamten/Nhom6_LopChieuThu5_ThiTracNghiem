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
<script src="js/editStudentsOfTest.js"></script>
<link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/login.css" />
<title>Giáo viên</title>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<!--Chuc nang-->
		<div class="col-md-7 container test_table_container">
			<h3>Các lớp và sinh viên thi</h3>
			<div id="report_result"></div>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<form>
						<input type="hidden" value="${requestScope.test.id}" name="test_id" /> 
						<!--select subject-->
						<div class="form-group col-sm-5">
							<label for="select_class">Chọn lớp</label> <select
								name="select_class" id="select_class" class="form-control">
								<c:if test="${not empty requestScope.classes }">
									<c:forEach var="_class" items="${requestScope.classes}">
										<option value="${_class.id}">${_class.name}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="form-group col-md-5">
							<input type="button" class="form-control btn btn-primary" id="edit_students_but" value="Lưu"/>
						</div>
						<!--table showing tests-->
						<p id="report_load"></p>
						<div class="table-responsive-sm">
							<table id="testing_table"
								class="table table-striped table-hover table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>STT</th>
										<th>Mã số sinh viên</th>
										<th>Họ tên</th>
										<th>Được thi</th>
									</tr>
								</thead>
								<tbody>
									<c:import url="tcSelectStudentTableRows.jsp" />
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>