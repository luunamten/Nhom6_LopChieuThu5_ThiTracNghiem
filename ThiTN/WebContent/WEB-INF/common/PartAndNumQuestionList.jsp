<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="item" items="${requestScope.items}">
	<option value="${item.partID} ${item.numberOfQuestion}">
		${item.partName}
	</option>
</c:forEach>