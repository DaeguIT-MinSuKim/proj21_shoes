<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<body>
		<table style="width: 100%">
			<tr style="background-color: #e9e9e9; text-align: center;">
				<td><a href="${contextPath}/admin/adminMain">包府磊权</a></td>
				<td><a href="${contextPath}/admin/memberMgt">雀盔包府</a></td>
				<td><a href="${contextPath}/admin/productMgt">惑前包府</a></td>
				<td><a href="${contextPath}/admin/orderMgt">林巩包府</a></td>
				<td><a href="${contextPath}/admin/adminMain">霸矫魄包府</a></td>
			</tr>
		</table>
</body>
</html>