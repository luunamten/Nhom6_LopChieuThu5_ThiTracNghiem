<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.testings and not empty requestScope._class}">
	<c:set var="count" value="${requestScope.testings.size()-1}" />
	<c:forEach var="i" begin="0" end="${count}">
		<c:set var="testing" value="${requestScope.testings[i]}" />
		<c:set var="test" value="${testing.test}" />
		<c:set var="start" value="${testing.start.trim()}" />
		<tr>
			<td>${i+1}</td>
			<td>${test.id}</td>
			<td>${test.name}</td>
			<td>${test.start}</td>
			<td><c:choose>
					<c:when test="${empty start}">
						<span title="chưa thi" class="material-icons pointer_cur">check_box_outline_blank</span>
					</c:when>
					<c:when test="${not empty start}">
						<span title="đã thi" class="material-icons pointer_cur">check_box</span>
					</c:when>
				</c:choose></td>
			<td>${testing.point }</td>
			<td><a 
			href="STLoadTestDetails?tid=${test.id}&cid=${requestScope._class.id}"
			title="Thi" class="non_link material-icons pointer_cur edit_q">border_color</a></td>
		</tr>
	</c:forEach>
</c:if>