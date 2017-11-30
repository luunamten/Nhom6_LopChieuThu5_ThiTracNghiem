<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${empty sessionScope.loginBean or sessionScope.loginBean.userType != 'gv'}">
	<c:redirect url="../index.jsp" />
</c:if>

<%--Ket noi Mysql va load tat cac cac mon hoc --%>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/thitn" user="root"
password="luunam" var="db" />
<sql:query var="subjects" dataSource="${db}">
	{call sp_tcLoadAllSubjects()}
</sql:query>
<%--lay cac phan cua mot mon --%>
<c:if test="${not empty subjects or subjects.rows.count > 0 }">
<sql:query var="parts" dataSource="${db}">
	{call sp_tcLoadParts(?)}
	<sql:param value="${subjects.rows[0].mamh}" />
</sql:query>
</c:if>
<%----------------------------------%>
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
<script src="js/checkerAddQuestion.js"></script>
<script src="js/util.js"></script>
<link rel="stylesheet" href="css/login.css" />
<title>Giáo viên</title>
</head>
<body>
  <c:import url="../common/header.jsp" />
  <!--Chuc nang-->
  <div class="row">
   	<c:import url="tcFeatures.jsp">
    	<c:param name="f2" value="active"/>
   	</c:import>
    <!--Form cua chuc nang them cau hoi-->
    <div class="col-sm-9 test_table_container">    
      <h1>Thêm câu hỏi</h1>    
      <c:if test="${not empty requestScope.addSuccess }">
      <p style="background:#99ff99;font-weight:bold;">
            ${requestScope.addSuccess}
      </p>
      </c:if>   
      <c:if test="${not empty requestScope.addError }">
      <p style="background:#ff8080;font-weight:bold;">
            ${requestScope.addError}
      </p>
      </c:if>
      <hr />
      <div class="card cs_card">
        <div class="card-body cs_card_body">
          <form method="post" action="AddQuestion">
            <!--Nhap mon, phan-->
            <div class="row">
              <div class="form-group col-sm-6">
                <label for="select_subject">Chọn môn</label> 
                <select id="select_subject" name="select_subject" class="form-control">
                <c:if test="${not empty subjects }">
                <c:forEach var="subject" items="${subjects.rows}">
                	<option value="${subject.mamh}">${subject.tenmh}</option>
                </c:forEach>
                </c:if>
                </select>
              </div>
              <div class="form-group col-sm-6">
                <label for="select_part">Chọn phần</label>
                 <select id="select_part" name="select_part" class="form-control">
                 <c:if test="${not empty parts }">
                 <c:forEach var="part" items="${parts.rows}">
                	<option value="${part.maphan}">${part.tenphan}</option>
                	</c:forEach>
                	</c:if>
                </select>
                <span class="check_status">
                <c:if test="${not empty requestScope.partError }">
                	${requestScope.partError }
                </c:if>
                </span>
              </div>
            </div>
            <!--Nhap cau hoi-->
              <div class="form-group">
                <label for="input_question">Nhập câu hỏi(Tối thiểu 6 kí tự)</label>
                <textarea class="form-control" rows="5" name="input_question" id="input_question"></textarea>
                <span id="input_question_status" class="check_status">
                <c:if test="${not empty requestScope.contentError }">
                	${requestScope.contentError }
                </c:if>
                </span>
              </div>
            
            <!--Nhap cac cau tra loi-->
            <div class="row">
              <div class="form-group col-sm-6">
                <label for="correct_answer">Câu trả lời đúng</label>
                <textarea class="form-control" rows="2" id="correct_answer" name="correct_answer"></textarea>
                <span id="correct_answer_status" class="check_status">
                <c:if test="${not empty requestScope.correctError }">
                	${requestScope.correctError }
                </c:if>
                </span>
              </div>
              <div class="form-group col-sm-6">
                <label for="wrong_answer1">Câu sai 1</label>
                <textarea class="form-control" rows="2" id="wrong_answer1" name="wrong_answer1"></textarea>
                <span id="wrong_answer1_status" class="check_status">
                <c:if test="${not empty requestScope.wrong1Error }">
                	${requestScope.wrong2Error }
                </c:if>
                </span>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-sm-6">
                <label for="wrong_answer2">Câu sai 2</label>
                <textarea class="form-control" rows="2" id="wrong_answer2" name="wrong_answer2"></textarea>
                <span id="wrong_answer2_status" class="check_status">
                <c:if test="${not empty requestScope.wrong2Error }">
                	${requestScope.wrong2Error }
                </c:if>
                </span>
              </div>
              <div class="form-group col-sm-6">
                <label for="wrong_answer3">Câu sai 3</label>
                <textarea class="form-control" rows="2" id="wrong_answer3" name="wrong_answer3"></textarea>
                <span id="wrong_answer3_status" class="check_status">
                <c:if test="${not empty requestScope.wrong3Error }">
                	${requestScope.wrong3Error }
                </c:if>
                </span>
                
              </div>
            </div>
            <div class="form-group">
              <input type="submit" id="send_but" class="btn btn-primary btn-block" value="Tạo" />
            </div>
          </form>
        </div>
      </div>    
    </div>
  </div>
</body>
</html>