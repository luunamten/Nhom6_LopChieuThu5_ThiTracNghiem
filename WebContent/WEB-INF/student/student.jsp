<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'sv'}">
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
<title>Sinh viên</title>
</head>
<body>
	<%--Banner --%>
	<c:import url="../common/header.jsp" />
	<div class="row">
		<!--Feature-->
		<c:import url="stFeatures.jsp">
			<c:param name="f1" value="active"></c:param>
		</c:import>
		<c:import url="../common/infoTable.jsp">
    		<c:param value="Thông tin sinh viên" name="title" />
    		<c:param value="ChangePhone" name="cPhoneTarget" />
    		<c:param value="ChangeEmail" name="cEmailTarget" />
    		<c:param value="ChangePass" name="cPassTarget" />
   		</c:import>
	</div>
</body>
</html>