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
		<table style="width: 50%">
			<tr style="background-color: e9e9e9; text-align: center;">
				<td><a href="${contextPath}/admin/productMgt">��ǰ ���</a></td>
				<td><a href="${contextPath}/admin/productPostMgt">��ǰ�Ǹű� ���</a></td>
				<td><a href="${contextPath}/admin/product/productReg">��ǰ ���</a></td>
				<td><a href="${contextPath}/admin/product/productPostReg">��ǰ�Ǹű� ���</a></td>
			</tr>
		</table>
</body>
</html>