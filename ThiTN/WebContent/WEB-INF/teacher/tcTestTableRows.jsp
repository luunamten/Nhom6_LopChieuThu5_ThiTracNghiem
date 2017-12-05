<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.tests }">
	<c:set var="count" value="${requestScope.tests.size()-1}" />
	<c:set var="viewTest" value="${requestScope.viewTest}" />
	<c:forEach var="i" begin="0" end="${count}">
		<c:set var="id" value="${requestScope.tests[i].id}" />
		<tr>
			<td>${i+1}</td>
			<td>${id}</td>
			<td>${requestScope.tests[i].name}</td>
			<td>${requestScope.tests[i].start}</td>
			<td>${requestScope.tests[i].end}</td>
			<td>
				<span title="xóa" class="material-icons pointer_cur delete_q">delete</span>
				<a title="Chi tiết" class="material-icons pointer_cur non_link"
					 href="ViewTestDetails?smid=${viewTest.semesterID}&suid=${viewTest.subjectID}&suname=${viewTest.subjectName}&tid=${id}">
					remove_red_eye
				</a> 
			</td>
		</tr>
	</c:forEach>
</c:if>