<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
			<li><a href="#">JOIN</a></li>
			<li><a href="#">LOGIN</a></li>
			<li><a href="#">MYPAGE</a></li>
			<li><a href="#">BOARD</a></li>

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
			<li><a href="index">Home</a></li>
			<li><a href="brand">BRAND</a></li>
			<li><a href="women">WOMEN</a></li>
			<li><a href="men">MEN</a></li>
			<li><a href="kids">KIDS</a></li>
		</ul>
	</nav>
</body>
</html>