<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="features" class="list-group col-sm-2">
	  <a href="Teacher"
        class="list-group-item list-group-item-action list-group-item-secondary ${param.f1}">
        Thông tin giảng viên </a>
      <a href="AddQuestion"
        class="list-group-item list-group-item-action list-group-item-secondary ${param.f2}">
        Thêm câu hỏi </a>
      <a href="CreateTest"
        class="list-group-item list-group-item-action list-group-item-secondary ${param.f3}">
        Tạo bài thi </a>
      <a href="ViewQuestions"
        class="list-group-item list-group-item-action list-group-item-secondary ${param.f4}">
        Xem các câu hỏi </a>     
      <a href="ViewTests"
        class="list-group-item list-group-item-action list-group-item-secondary ${param.f5}">
        Xem các bài thi </a>
</div>