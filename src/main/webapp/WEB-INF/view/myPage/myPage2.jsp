<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>회원가입</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step1.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPage.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id = "maPage">
	
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">JOIN</a></li>
				<li><a href="${contextPath}/login/loginForm">LOGIN</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
							<h1>회원정보 변경</h1>
				
				<table style="width: 80%">
			<tr>
				<td colspan="7" class="td_title">나의정보</td>
			</tr>
			
			<tr style="background-color: white-space; text-align: left">
				<td>회원아이디</td>	<td>${member.memberId }</td>				
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>비밀번호</td>		<td>${member.memberPwd }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>회원이름</td>		<td>${member.memberName }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>성별</td>		<td>${member.gender }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>생년월일</td>		<td>${member.birthday }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>이메일</td>		<td>${member.email }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>연락처</td>		<td>${member.tel }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>우편번호</td>		<td>${member.zipCode }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>주소</td>		<td>${member.address }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>상세주소</td>		<td>${member.detailAddress }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>포인트</td>		<td>${member.point }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>누적구매금액</td>	<td>${member.cumulativeBuyAmount }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>등급</td>		<td>${member.grade }</td>
			</tr>
			<tr style="background-color: white-space; text-align: left">
				<td>가입일</td>		<td><tf:formatDateTime value="${member.signUpDate }" pattern="yyyy-MM-dd:mm"/>
			</td>
				
						
		 <%-- 	<c:forEach var="MyPageSelectCommend" items="${MyPageSelectCommend}">  --%>
				<tr>

					
		
					<td><a href="#">[회원정보 수정]</a>&nbsp;
						<a href="#">[회원탈퇴]</a></td>
				</tr>
		<%--  	</c:forEach>  --%>
		
		</table>
				
				
				
				<p>나의 쇼핑정보</p>
				<li><a href="${contextPath}/myPage/changeMemberData">주문내역</a></li>
				
				
				<p>회원정보</p>
				<li><a href="${contextPath}/myPage/changeMemberData">회원정보 변경</a></li>
				<li><a href="${contextPath}/myPage/">회원탈퇴</a></li>
				
				
				
			</c:if>

	
	
	</section>
</div>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>