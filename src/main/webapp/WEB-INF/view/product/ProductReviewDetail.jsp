<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	<section>
			${reView}
				<h4> ��ǰ�ı� �󼼺���</h4>
				<br>
				<table  class="tbl_type" border="1"> 
				<tr><td>��ǰ�ڵ� : ${reView.orderCode.orderProduct[0].orderOption.productCode } </td></tr>
				<%-- <tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myQnADetail.productMainImage }"></td></tr> --%>
				<tr> 
					<c:forEach var="image" items="${reView.reviewImages}">
					<td>${image.image } </td>
					</c:forEach>
				</tr>		
				
				</table>
					<br>
				<table class="tbl_type" border="1">
				<tr>	
					<td>�ı����� : ${reView.title }   (${reView.registDate })</td>	
				</tr>
				<tr>
 				<td>�ı⳻�� : ${reView.content }</td>		<!-- ���� -->
				</tr>
				</table>
				${reView.boardCode}
				<a href="${contextPath}/ProductReviewInsertAndUpdateForm/${reView.orderCode.orderProduct[0].orderOption.productCode},update,${reView.boardCode}">���Ǳ� ����</a>
				<a href="${contextPath}/ProductReviewDelete/${reView.boardCode},${reView.orderCode.orderProduct[0].orderOption.productCode}">����</a>
				
	
	</section>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>