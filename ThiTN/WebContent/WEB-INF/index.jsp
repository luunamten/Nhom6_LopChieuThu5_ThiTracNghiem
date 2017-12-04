<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="bootstrap400/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="icon" href="img/ebook.png" />
<script src="jquery/jquery321.js"></script>
<script src="bootstrap400/js/bootstrap.min.js"></script>
<script src="bootstrap400/js/bootstrap.js"></script>
<script src="bootstrap400/js/bootstrap.bundle.js"></script>
<script src="js/checkerLogin.js"></script>
<title>Đăng nhập</title>
</head>
<body id="login_bg">
	<!--Sheet-->
	<div class="container">
		<img src="img/ebook.png" width="100" height="100" />
		<h3>THƯ VIỆN ĐỀ THI</h3>
		<span id="cs_call"> <span class="cs_call_des">Call:</span>
			+84988565410 | <span class="cs_call_des">Email:</span> Luu@gmail.com
		</span>
	</div>
	<hr style="background: white;" />
	<!--Login container-->
	<div class="container col-sm-4">
		<!--Card-->
		<div class="card cs_card">
			<div class="card-header bg-info text-white">
				<h3>Đăng nhập</h3>
			</div>
			<!--card body-->
			<div class="card-body cs_card_body">
				<form method="post" action="Home">
					<div class="radio">
						<label> <input type="radio" name="qt_gv_sv" value="gv" />
							Quản trị
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="qt_gv_sv" value="gv" />
							Giảng viên
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="qt_gv_sv" value="sv"
							checked /> Sinh viên
						</label>
					</div>
					<div class="form-group">
						<label for="uname">Username</label> <input type="text"
							name="uname" id="uname" class="form-control"
							placeholder="Username" /> <span id="uname_status"
							class="check_status">${ requestScope.errorBean.usernameError }</span>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							name="password" id="password" class="form-control"
							placeholder="Password" /> <span id="pass_status"
							class="check_status">${ requestScope.errorBean.passwordError }</span>
					</div>
					<div class="form-group">
						<input type="submit" name="loginButton" class="btn btn-primary btn-block"
							id="login_but" value="Đăng nhập" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>