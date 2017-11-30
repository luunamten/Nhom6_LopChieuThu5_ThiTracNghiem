<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'gv'}">
	<c:redirect url="../index.jsp" />
</c:if>
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
	<c:import url="../common/header.jsp" />
	<!--Cac tinh nang-->
	<div id="testing_container" class="row">
		<div class="col-sm-3">
			<div class="card cs_card">
				<div class="card-header bg-info text-white">
					<h4>ENGLISH01_TEST</h4>
				</div>
				<div class="card-body cs_card_body">
					<p id="subject">Môn: Anh văn 1</p>
					<p id="total_time">Thời gian: 15:00</p>
					<p id="num_question">Số câu: 15</p>
					<p id="create_time">Thời gian tạo: 17-11-2017 11:11</p>
					<p id="start_time">Thời gian bắt đầu: 17-11-2017 13:00</p>
					<p id="end_time">Thời gian kết thúc: 20-11-2017 07:00</p>
					<p id="num_sv">Số sinh viên thi: 50</p>
				</div>
				<div class="card-footer">
					<a href="gv_cacBaiThi.jsp"><button type="button"
							class="btn btn-block btn-outline-danger" id="back_to_tests"><<
							Trở về</button></a>
				</div>
			</div>
		</div>
		<div class="col-sm-8 test_table_container">
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
								<option value="A">Lớp A</option>
							</select>
						</div>
						<!--table showing tests-->
						<div class="table-responsive-sm">
							<table id="sv_table"
								class="table table-striped table-hover table-bordered">
								<tr>
									<th>STT</th>
									<th>Mã số sinh viên</th>
									<th>Họ tên</th>
									<th>Điểm</th>
									<th>Đã thi</th>
								</tr>
								<tr>
									<td>1</td>
									<td>15110255</td>
									<td>Lưu Nam</td>
									<td>10đ</td>
									<td><span title="xóa" class="material-icons pointer_cur">check_box</span>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>15110244</td>
									<td>Văn Chương</td>
									<td>0đ</td>
									<td><span title="xóa" class="material-icons pointer_cur">check_box_outline_blank</span>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>15110204</td>
									<td>Thế Luân</td>
									<td>7đ</td>
									<td><span title="xóa" class="material-icons pointer_cur">check_box</span>
									</td>
								</tr>
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