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
		<div class="leftMenuProduct">
			<ul>
				<li><a href="${contextPath}/admin/productMgt">��ǰ ����</a></li>				
				<li><a href="${contextPath}/admin/product/brandReg">�귣�� ����</a></li>
				<li><a href="${contextPath}/admin/product/categoryReg">ī�װ� ����</a></li>
			</ul>
		</div>
</body>
</html>