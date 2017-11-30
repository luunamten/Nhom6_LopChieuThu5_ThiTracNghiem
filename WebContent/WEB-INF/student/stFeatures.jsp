<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="features" class="list-group col-sm-2">
	  <a href="student.jsp"
        class="list-group-item list-group-item-action list-group-item-secondary ${param.f1}">
        Thông tin sinh viên </a>
      <a href="stViewTests.jsp" class="list-group-item list-group-item-action list-group-item-secondary ${param.f2}">
		Xem các bài thi
	  </a>
</div>