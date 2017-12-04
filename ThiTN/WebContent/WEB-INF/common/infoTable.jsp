<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Form cua chuc nang them cau hoi-->
<div class="col-sm-9 test_table_container">
	<h1>${param.title}</h1>
	<c:if test="${not empty requestScope.success }">
		<p style="background: #99ff99;">${requestScope.phoneSuccess}</p>
	</c:if>
	<c:import url="../common/ReportSuccess.jsp" />
	<c:import url="../common/ReportErrors.jsp" />
	<hr />
	<div class="card cs_card">
		<div class="card-body cs_card_body">
			<div class="table-responsive-md">
				<table class="table table-responsive-md table-hover">
					<tr>
						<td><strong>Tên đăng nhập:</strong></td>
						<td>${ sessionScope.loginBean.username }</td>
						<td></td>
					</tr>
					<tr>
						<td><strong>Họ tên:</strong></td>
						<td>${sessionScope.loginBean.name}</td>
						<td></td>
					</tr>
					<tr>
						<td><strong>Số điện thoại:</strong></td>
						<td>${sessionScope.loginBean.phoneNumber}</td>
						<td>
							<button type="button" class="btn btn-outline-danger"
								data-toggle="collapse" data-target="#changePhone">Thây
								đổi</button>
						</td>
					</tr>
					<tr>
						<td><strong>Email:</strong></td>
						<td>${sessionScope.loginBean.email}</td>
						<td>
							<button type="button" class="btn btn-outline-danger"
								data-toggle="collapse" data-target="#changeEmail">Thây
								đổi</button>
						</td>
					</tr>
					<tr>
						<td><strong>Mật khẩu:</strong></td>
						<td>●●●●●●●●●●●●●●●</td>
						<td>
							<button type="button" class="btn btn-outline-danger"
								data-toggle="collapse" data-target="#changePass">Thây
								đổi</button>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="changePhone" class="collapse container col-md-5">
			<form method="post" action="${param.cPhoneTarget}">
				<div class="form-group">
					<label for="phoneNumberTxt">Số điện thoại mới</label> <input
						type="text" id="phoneNumberTxt" name="phoneNumberTxt"
						class="form-control" required/>
				</div>
				<div class="form-group">
					<input type="submit" class="form-control btn btn-primary btn-block"
						name="savePhoneBut" value="Thây đổi" />
				</div>
			</form>
			<hr />
		</div>

		<div id="changeEmail" class="collapse container col-md-5">
			<form method="post" action="${param.cEmailTarget}">
				<div class="form-group">
					<label for="emailTxt">Email mới</label> <input type="text"
						id="emailTxt" name="emailTxt" class="form-control" required />
				</div>
				<div class="form-group">
					<input type="submit" class="form-control btn btn-primary btn-block"
						name="saveEmailBut" value="Thây đổi" />
				</div>
			</form>
			<hr />
		</div>

		<div id="changePass" class="collapse container col-md-5">
			<form method="post" action="${param.cPassTarget}">
				<div class="form-group">
					<label for="oldPassTxt">Mật khẩu cũ:</label> <input type="password"
						id="oldPassTxt" name="oldPassTxt" class="form-control" required />
				</div>
				<div class="form-group">
					<label for="newPassTxt">Mật khẩu mới:</label> <input
						type="password" id="newPassTxt" name="newPassTxt"
						class="form-control" required />
				</div>
				<div class="form-group">
					<label for="reNewPassTxt">Nhập lại mật khẩu mới:</label> <input
						type="password" id="reNewPassTxt" name="reNewPassTxt"
						class="form-control" required />
				</div>
				<hr />
				<div class="form-group">
					<input type="submit" class="form-control btn btn-primary btn-block"
						name="savePassBut" value="Thây đổi" />
				</div>
			</form>
			<hr />
		</div>
	</div>
</div>