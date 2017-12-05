<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.testings }">
	<c:set var="count" value="${requestScope.testings.size()-1}" />
	<c:forEach var="i" begin="0" end="${count}">
		<c:set var="testing" value="${requestScope.testings[i]}" />
		<c:set var="student" value="${testing.student}" />
		<c:set var="start" value="${testing.start.trim()}" />
		<tr>
			<td>${i+1}</td>
			<td>${student.username}</td>
			<td>${student.name}</td>
			<td>${testing.point}</td>
			<td>
				<c:choose>
					<c:when test="${empty start}">  
						<span title="xóa" class="material-icons pointer_cur">check_box_outline_blank</span>
   					</c:when>
					<c:when test="${not empty start}">  
						<span title="xóa" class="material-icons pointer_cur">check_box</span>
    				</c:when>
				</c:choose></td>
		</tr>
	</c:forEach>
</c:if>