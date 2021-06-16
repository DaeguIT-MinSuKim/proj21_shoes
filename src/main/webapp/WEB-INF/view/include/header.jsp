<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<body>
	<div class="sns-menu">
		<ul>
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-instagram"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
		</ul>
	</div>
	<nav class="top-menu">
		<ul>
			<!--�α��� ���� �ʾ��� �� �������� �޴�  -->
			<c:if test="${empty authInfo}"> 
				<p>�α������ּ���.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">ȸ������</a></li>
				<li><a href="${contextPath}/login/loginForm">�α���</a></li>			
			</c:if>
			
			<!-- �α��� ���� �� �������� �޴� -->
			<c:if test="${!empty authInfo}">
				<p>${authInfo.memberName }��. ȯ���մϴ�</p>
				<p>
			
					<%-- <a href="<c:url value="/edit/changePassword"/>">[��й�ȣ ����]</a> --%>
				</p>	
				<li><a href="${contextPath}/cartList">��ٱ���</a></li>		
				<li><a href="${contextPath}/myPageHome/${authInfo.memberId}">����������</a></li>
				<li><a href="<c:url value="/logout"/>">�α׾ƿ�</a></li>
			</c:if>
			

			
			<li><a href="#">��������</a></li>

			<!-- ���� ���̵�� �α��� �ϰ� ���� ������ ������ ȭ�� ǥ�� -->
			<%-- <c:if test="${employee.authority == 1}"> --%>
			<li><a href="adminMain">������ ȭ��</a></li>
			<%-- </c:if> --%>

		</ul>
	</nav>
	<div class="logo">
	</div>
	<nav class="main-menu">
		<ul>
			<li><a href="${contextPath}/index">Home</a></li>
			<li><a href="${contextPath}/productList?menu=brand">BRAND</a></li>
			<li><a href="${contextPath}/productList?menu=women">WOMEN</a></li>
			<li><a href="${contextPath}/productList?menu=men">MEN</a></li>
			<li><a href="${contextPath}/productList?menu=kids">KIDS</a></li>
			<li><a href="${contextPath}/productList?menu=all">FREE</a></li>
		</ul>
	</nav>
</body>
</html>