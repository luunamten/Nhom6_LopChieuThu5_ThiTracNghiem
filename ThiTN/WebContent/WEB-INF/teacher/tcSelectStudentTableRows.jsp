<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.students }">
	<c:set var="count" value="${requestScope.students.size()-1}" />
	<c:forEach var="i" begin="0" end="${count}">
		<c:set var="student" value="${requestScope.students[i]}" />
		<c:set var="start" value="${student.start.trim()}" />
		<tr>
			<td>${i+1}</td>
			<td>${student.username}</td>
			<td>${student.name}</td>
			<td>
				<c:choose>
					<c:when test="${empty start}">  
						<span title="chưa thi" class="material-icons pointer_cur">check_box_outline_blank</span>
   					</c:when>
					<c:when test="${not empty start}">  
						<span title="đã thi" class="material-icons pointer_cur">check_box</span>
    				</c:when>
				</c:choose></td>
		</tr>
	</c:forEach>
</c:if>