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
<title>Các bài thi</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<div class="row">
		<c:import url="tcFeatures.jsp">
          <c:param name="f4" value="active"/>
   		</c:import>
		<!--test-->
		<div class="col-sm-9 test_table_container">
			<h1>Các câu hỏi</h1>
			<hr />
			<div class="card cs_card">
				<div class="card-body cs_card_body">
					<!--form-->
					<form>
						<div class="row">
							<!--select subject-->
							<div class="form-group col-sm-4">
								<label for="select_subject">Chọn môn</label>
							 	<select name="select_subject" id="select_subject" class="form-control">
									<option value="A">Mon A</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label for="select_subject">Chọn phần</label>
							 	<select name="select_part" id="select_part" class="form-control">
									<option value="PA">Phan A</option>
								</select>
							</div>
						</div>
						<!--table showing tests-->
						<div class="table-responsive-sm">
							<table id="question_table"
								class="table table-striped table-hover table-bordered">
								<tr>
									<th>STT</th>
									<th>Thời điểm thêm</th>
									<th>Thao tác</th>
								</tr>
								<tr>
									<td>1</td>
									<td>2017-11-11 13:00</td>
									<td><span title="xóa" class="material-icons pointer_cur">delete</span>
										<span title="chỉnh sửa" class="material-icons pointer_cur">border_color</span>
										<span title="chi tiết" class="material-icons pointer_cur">remove_red_eye</span>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2017-11-17 8:00</td>
									<td><span title="xóa" class="material-icons pointer_cur">delete</span>
										<span title="chỉnh sửa" class="material-icons pointer_cur">border_color</span>
										<span title="chi tiết" class="material-icons pointer_cur">remove_red_eye</span>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>2017-11-29 15:00</td>
									<td><span title="xóa" class="material-icons pointer_cur">delete</span>
										<span title="chỉnh sửa" class="material-icons pointer_cur">border_color</span>
										<span title="chi tiết" class="material-icons pointer_cur">remove_red_eye</span>
									</td>
								</tr>
							</table>
						</div>
						<!--hidden element for holding table data-->
						<input type="hidden" name="table_value" id="table_value" />
						<button type="button" id="load_20" class="btn btn-outline-danger">Tải
							thêm 20 câu >></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>