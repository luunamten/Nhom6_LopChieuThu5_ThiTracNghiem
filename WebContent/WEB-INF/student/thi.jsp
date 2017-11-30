<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'sv'}">
	<c:redirect url="index.jsp" />
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
<script src="bootstrap400/js/popper.min.js"></script>
<script src="bootstrap400/js/bootstrap.min.js"></script>
<title>Làm bài thi</title>
</head>
<body>
  <%--Banner --%>
	<c:import url="../common/header.jsp" />
  <div id="testing_container" class="row">
    <div class="col-sm-3">
      <div class="card cs_card">
        <div class="card-header bg-info text-white">
          <h4>ENGLISH01_TEST</h4>
        </div>
        <div class="card-body cs_card_body">
          <p id="subject">Môn: Anh văn 1</p>
          <p id="total_time">Tổng thời gian: 15:00</p>
          <p id="num_question">Số câu: 15
          <hr />
          <p id="time_rem">Thời gian còn lại: 5:00</p>
          <p id="sv_name">Sinh viên: Lưu Nam</p>
        </div>
        <div class="card-footer">
          <button type="button" class="btn btn-block btn-primary" id="end_test">Nộp bài</button>
        </div>
      </div>
    </div>
    <div class="col-sm-8">
      <div class="card cs_card">
        <div class="card-header bg-info text-white">
          <p id="question">1. He always fascinated ... eggs</p>
        </div>
        <div class="card-body cs_card_body">
           <div class="radio">
            <label> <input type="radio" name="answer" id="ans-1" value="by" /><span id="ans-a"> by</span>
            </label>
          </div>
          <hr />
          <div class="radio">
            <label> <input type="radio" name="answer" id="ans-2" value="of" /><span id="ans-b"> of</span>
            </label>
          </div>
          <hr />
          <div class="radio">
            <label> <input type="radio" name="answer" id="ans-3" value="do" /><span id="ans-c"> do</span>
            </label>
          </div>
          <hr />
          <div class="radio">
            <label> <input type="radio" name="answer" id="ans-4" value="go" /><span id="ans-d"> go</span>
            </label>
          </div>
        </div>
        <div class="card-footer">
          <div id="forward_to_test">
            <button type="button" class="btn btn-outline-danger" id="page_prev"><<</button>
            <span id="page_num">Trang 1</span>
            <button type="button" class="btn btn-outline-danger" id="page_to">>></button>
          </div>
          <div class="form-inline">
            <label for="page_val_to">Trang</label>
            <input type="number" class="form-control" min="1" max="15" value="1" id="page_val_to" name="page_val_to" />
            <button type="button" class="btn btn-outline-danger" id="page_to">>></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>