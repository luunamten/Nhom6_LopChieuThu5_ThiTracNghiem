<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.question and not empty sessionScope.testingInfo }">
	<c:set var="question" value="${requestScope.question }" />
	<c:set var="testingInfo" value="${sessionScope.testingInfo }" />
	<c:set var="amap" value="${question.mapAnswers }" />
	<div class="card-header bg-info text-white">
		<p id="question">${question.content}</p>
	</div>
	<div class="card-body cs_card_body">
		<div class="radio">
			<label> <input type="radio" name="answer" id="ans-1"
				value="by" /><span id="ans-a"> ${question.answers[amap[0]]}</span>
			</label>
		</div>
		<hr />
		<div class="radio">
			<label> <input type="radio" name="answer" id="ans-2"
				value="of" /><span id="ans-b"> ${question.answers[amap[1]]}</span>
			</label>
		</div>
		<hr />
		<div class="radio">
			<label> <input type="radio" name="answer" id="ans-3"
				value="do" /><span id="ans-c"> ${question.answers[amap[2]]}</span>
			</label>
		</div>
		<hr />
		<div class="radio">
			<label> <input type="radio" name="answer" id="ans-4"
				value="go" /><span id="ans-d"> ${question.answers[amap[3]]}</span>
			</label>
		</div>
	</div>
	<div class="card-footer">
		<div class="form-inline">
			<label for="page_val_to">Trang</label> <input type="number"
				class="form-control" min="1" max="${testingInfo.totalPage }" value="${testingInfo.pageIndex + 1 }"
				id="page_val_to" name="page_val_to" />
			<button type="button" class="btn btn-outline-danger" id="page_to2">>></button>
		</div>
	</div>
</c:if>