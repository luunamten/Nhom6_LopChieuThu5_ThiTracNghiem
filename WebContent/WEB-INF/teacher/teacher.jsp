<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'gv'}">
	<c:redirect url="../index.jsp" />
</c:if>
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
<script src="js/userInfo.js"></script>
<link rel="stylesheet" href="css/login.css" />
<title>Giáo viên</title>
</head>
<body>
  <c:import url="../common/header.jsp" />
  <!--Chuc nang-->
  <div class="row">
   	<c:import url="tcFeatures.jsp">
        <c:param name="f1" value="active" />
    </c:import>
    <c:import url="../common/infoTable.jsp">
    	<c:param value="Thông tin giảng viên" name="title" />
    	<c:param name="cPhoneTarget" value="ChangePhone"></c:param>
    	<c:param name="cEmailTarget" value="ChangeEmail"></c:param>
    	<c:param name="cPassTarget" value="ChangePass"></c:param>
    </c:import>
  </div>
</body>
</html>