<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.questions }">
	<c:set var="count" value="${requestScope.questions.size()-1}" />
	<c:forEach var="i" begin="0" end="${count}">
		<tr>
			<td>${i+1}</td>
			<td>${requestScope.questions[i].id}</td>
			<td>${requestScope.questions[i].content}</td>
			<td>${requestScope.questions[i].birth}</td>
			<td>
				<span title="xóa" class="material-icons pointer_cur delete_q">delete</span>
				<span title="chỉnh sửa" class="material-icons pointer_cur edit_q">border_color</span>
			</td>
		</tr>
	</c:forEach>
</c:if>