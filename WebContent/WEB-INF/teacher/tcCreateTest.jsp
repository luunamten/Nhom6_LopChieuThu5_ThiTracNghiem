<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:if
	test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'gv'}">
	<c:redirect url="../index.jsp" />
</c:if>
<%--Ket noi Mysql va load tat cac cac mon hoc --%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/thitn" user="root" password="luunam"
	var="db" />
<sql:query var="currentSemester" dataSource="${db}">
	{call sp_loadCurrentSemester()}
</sql:query>
<c:if test="${not empty currentSemester or currentSemester.rows.count > 0}">
<sql:query var="subjects" dataSource="${db}">
	{call sp_tcLoadSubjects(?,?)}
	<sql:param value="${sessionScope.loginBean.username }" />
	<sql:param value="${currentSemester.rows[0].mahk}" />
</sql:query>
<%--lay cac phan cua mot mon --%>
<c:if test="${not empty subjects or subjects.rows.count > 0}">
<sql:query var="parts" dataSource="${db}">
	{call sp_tcLoadParts(?)}
	<sql:param value="${subjects.rows[0].mamh}" />
</sql:query>
</c:if>
</c:if>
<%----------------------------------%>
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
<script src="js/addPhan.js"></script>
<script src="js/checkerCreateTest.js"></script>
<script src="js/util.js"></script>
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
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form method="post" action="CreateTest">
						<div class="row">
							<!--select subject-->
							<div class="form-group col-sm-4">
								<label for="select_subject">Chọn môn</label> <select
									name="select_subject" id="select_subject" class="form-control">
									<c:if test="${not empty subjects }">
										<c:forEach var="subject" items="${subjects.rows}">
											<option value="${subject.mamh}">${subject.tenmh}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<!--select subject part-->
							<div class="form-group col-sm-4">
								<label for="select_part">Chọn phần</label> <select
									name="select_part" id="select_part" class="form-control">
									<c:if test="${not empty parts }">
										<c:forEach var="part" items="${parts.rows}">
											<option value="${part.maphan}">${part.tenphan}</option>
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
							<tr>
								<th>Mã phần</th>
								<th>Tên phần</th>
								<th>Số câu</th>
								<th>Xóa phần</th>
							</tr>
						</table>
						<!--hidden element for holding table data-->
						<input type="hidden" name="table_value" id="table_value" />
						<div class="row">
							<!--test name-->
							<div class="form-group col-sm-6">
								<label for="test_name">Tên bài thi (tối thiểu 7 kí tự)</label>
								<textarea class="form-control" rows="2" id="test_name"
									name="test_name"></textarea>
								<span id="test_name_status" class="check_status"></span>
							</div>
							<!--start point-->
							<div class="form-group col-sm-6">
								<label for="start_time">Thời điểm bắt đầu</label> <input
									type="datetime-local" class="form-control" name="start_time"
									id="start_time" /> <span id="start_time_status"
									class="check_status"></span>
							</div>
						</div>
						<!--end point-->
						<div class="row">
							<div class="form-group col-sm-6">
								<label for="end_time">Thời điểm kết thúc</label> <input
									type="datetime-local" class="form-control" id="end_time"
									name="end_time" /> <span id="end_time_status"
									class="check_status"></span>
							</div>
							<!--test duration-->
							<div class="form-group col-sm-6">
								<label for="duration">Khoảng thời gian thi (tối thiểu 10
									phút)</label> <input type="number" value="10" min="10"
									class="form-control" id="duration" name="duration" /> <span
									id="duration_status" class="check_status"></span>
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