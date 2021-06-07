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
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
	
<script>
	function testDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						
						var roadAddr = data.address; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipCode').value = data.zonecode;  /* 우편번호 */
						document.getElementById("address").value = roadAddr+"("+data.jibunAddress+")" ;  /* 도로명주소 */
						//document.getElementById("sample4_jibunAddress").value = data.jibunAddress;/* 지번주소 */
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("detailAddress").value = extraRoadAddr;
							} else {
								document.getElementById("detailAddress").value = '';
							} 
						 	var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
					}
				}).open();
	}
	
	</script>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<div id="signUpForm">
	<section id = "signUpForm">

	
		<h2>회원가입</h2><!-- 회원가입 -->
	
		
		<form:form action="step3" modelAttribute="registerRequest">
		<form:errors/>
		<div class="left">
		<p>
			<label>회원 아이디: 
			<form:input path="memberId" placeholder="6글자 이상 입력하세요." />  
			<form:errors path="memberId" />
			</label>
		</p>
		
		
		<p>
			<label>회원 비밀번호: 
			<form:password path="memberPwd" placeholder="6글자 이상 입력하세요." />  
			<form:errors path="memberPwd" />
			</label>
		</p>
		
		<p>
			<label>비밀번호 확인: 
			<form:password path="confirmPassword" placeholder="6글자 이상 입력하세요." />  
			<form:errors path="confirmPassword" />
			</label>
		</p>
		
		<p>
			<label>회원 이름: 
			<form:input path="memberName" placeholder="6글자 이상 입력하세요." />  
			<form:errors path="memberName" />
			</label>
		</p>
		<p>
			<label>회원 성별: 
			<form:input path="gender" name="gender" value="여" placeholder="남/여 중 입력하세요" />  
			<form:errors path="gender" />
			</label>
		</p>
		<p>
			<label>회원 생일: 
			<form:input path="birthday" type='date' value='2021-06-06'  placeholder="생년월일을 선택해주세요" />  
			<form:errors path="birthday" />
			</label>
		</p>
		
		<p>
			<label>이메일: 
			<form:input path="email" placeholder="" />  
			<form:errors path="email" />
			</label>
		</p>
		
			<p>
			<label>연락처: 
			<form:input path="tel" placeholder="" />  
			<form:errors path="tel" />
			</label>
		</p>
		
		<p>
			<label for="zipCode">우편번호: 
			<form:input type="test" path="zipCode"  id="zipCode"  value="우편번호 찾기"  onclick="testDaumPostcode()"/>  
			<form:errors path="zipCode" />
			</label>
		</p>
		
		<p>
			<label for="address">주소: 
			<form:input path="address" type="text"  id="address"  readonly="true"   placeholder="도로명 주소 찾기" />  
			<form:errors path="address" />
			</label>
		</p>
		
			<p>
			<label for="detailAddress">상세주소: 
			<form:input path="detailAddress"  type="text" id="detailAddress"  placeholder="상세주소를 입력해주세요" />  
			<form:errors path="detailAddress" />
			</label>
		</p>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<%-- <table>
		<tr>
		
		<th scope="row"><label for="memberId"> 회원아이디</label></th><td><form:input path="memberId"/><form:errors path="memberId" /></td>
		
		<td class="td_left"><label >회원아이디 <form:input path="memberId" /> <form:errors path="memberId" /> </label></td>
		</tr>
		<tr>
		<td class="td_left"><label >회원비밀번호 <form:input path="memberPwd" /> <form:errors path="memberPwd" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >비밀번호확인 <form:input path="confirmPassword" /> <form:errors path="confirmPassword" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >회원이름 <form:input path="memberName" /> <form:errors path="memberName" /></label></td>
		</tr>
		<tr>
		
		<td class="td_left"><label >성별</label>
		<td class="td_left"><label >남 <form:input path="gender"  name="gender" type="radio"  value="true"/></label></td>
		<td class="td_left"><label >여 <form:input path="gender" name="gender" type="radio"  value="false"/></label></td>
		</tr>
		
		<tr>
		<td class="td_left"><label >생년월일 <form:input path="birthday" /> <form:errors path="birthday" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >이메일 <form:input path="email" /> <form:errors path="email" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >연락처 <form:input path="tel" /> <form:errors path="tel" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >우편번호 <form:input path="zipCode" /> <form:errors path="zipCode" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >주소 <form:input path="address" /> <form:errors path="address" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >상세주소 <form:input path="detailAddress" /> <form:errors path="detailAddress" /></label></td>
		</tr>
		
		
			
		
	
		</table> --%>
		</form:form>
		<article class="btn2">
		
				 <form action="step3" method="post"> <!-- 일로 보내조 -->
				<input type="submit" value="다음단계" /><!--다음단계  -->
				
				</form> 
				<form action="../index" method="get">
				<input type="submit" value="가입취소" />
				</form>
		</article>
	
	
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