<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.testings }">
	<c:set var="count" value="${requestScope.testings.size()-1}" />
	<c:forEach var="i" begin="0" end="${count}">
		<c:set var="testing" value="${requestScope.testings[i]}" />
		<c:set var="student" value="${testing.student}" />
		<c:set var="testID" value="${testing.test.id.trim()}" />
		<tr>
			<td>${i+1}</td>
			<td>${student.username}
				<input type="hidden" name="student_name" value="${student.username}" />
			</td>
			<td>${student.name}</td>
			<td><c:choose>
					<c:when test="${empty testID}">
						<input type="checkbox" class="w3-check" name="check" value="1" />
						<input type="hidden" name="check_value" value="0" />
					</c:when>
					<c:when test="${not empty testID}">
						<input type="checkbox" class="w3-check" name="check" value="1" checked />
						<input type="hidden" name="check_value" value="1" />
					</c:when>
				</c:choose></td>
		</tr>
	</c:forEach>
</c:if>