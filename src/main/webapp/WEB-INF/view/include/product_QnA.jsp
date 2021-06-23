<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p> <a href="${contextPath}/ProductQnAInsert/${product.productCode }">���Ǳ� ���</a> </p>
	<table class="tbl_type" border="1">
				<tr>
					<td>���ǻ�ǰ</td>
					<td>��ǰ����</td>
					<td>����</td>						
					<td>�ۼ���</td>
					<td>�亯����</td>
				</tr>
			<c:forEach var="myQnAList" items="${myQnAList }">
				<tr>
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.productName }</a></td>	<!-- ��ǰ�� -->
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">
				<img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myQnAList.productMainImage }"></a></td>				
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.title }</a></td>	<!-- ���� -->
				<td>${myQnAList.registDate }</td>	<!-- �ۼ��� -->
				<td>${myQnAList.resOX }</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>