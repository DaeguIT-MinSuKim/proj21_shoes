<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	
	function listDB(page){
		$.ajax({
			url : "${contextPath}/api/ProductQnAList/${product.productCode},"+page,
			type : 'get',
			contentType : "application/json; charset=utf-8",
			data:null,
			success : function(json) {
				var sCont = "";
				for(i = 0; i < json.length; i++){
					
					sCont +='<tr>';
					sCont +='<td><a href="${contextPath}/ProductQnADetail/'+json[i].boardCode+'">'+json[i].productName+'</a></td>';	<!-- ��ǰ�� -->
					sCont +='<td><a href="${contextPath}/ProductQnADetail/'+json[i].boardCode+'">';
					sCont +='<img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/'+json[i].productMainImage+'"></a></td>';		
					sCont +='<td><a href="${contextPath}/ProductQnADetail/'+json[i].boardCode+'">'+json[i].title+'</a></td>';	<!-- ���� -->
					sCont +='<td>'+json[i].registDate +'</td>';	<!-- �ۼ��� -->
					sCont +='<td>'+json[i].resOX +'</td>';
					sCont +='</tr>';
					
				};
				$("#QnAList").html(sCont);
			},
			error : function(request, status, error) {
				/* alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error); */
			}
		});
	}
	
	var page=1;
	listDB(page)
	
	$(".pageButton").click(function(){
		page=$(this).val();
		listDB(page);
	});
	$(".pagejun").click(function(){
		if(page>1){
			page -=1;
			listDB(page);
		}
	});
	$(".pageNext").click(function(){
		if(page<Number("${fn:length(pages)}")){
			page +=1;
			listDB(page);
		}
	});
});
</script>
</head>
<body>
	<p> <a href="${contextPath}/ProductQnAInsertAndUpdateForm/${product.productCode},insert,0">���Ǳ� ���</a> </p>
	<table>
		<thead> 
		<tr>
			<td>���ǻ�ǰ</td>
			<td>��ǰ����</td>
			<td>����</td>						
			<td>�ۼ���</td>
			<td>�亯����</td>
		</tr>
		</thead>
		<tbody id="QnAList">
		<%-- <c:forEach var="myQnAList" items="${myQnAList }" begin="0" end="1">
			<tr>
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.productName }</a></td>	<!-- ��ǰ�� -->
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">
				<img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myQnAList.productMainImage }"></a></td>				
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.title }</a></td>	<!-- ���� -->
				<td>${myQnAList.registDate }</td>	<!-- �ۼ��� -->
				<td>${myQnAList.resOX }</td>
			</tr>
		</c:forEach> --%>
		</tbody>
	</table>
		<!-- <button class="pagejun">����</button> -->
		<c:forEach var="page" items="${pages}">
			<button class="pageButton" value="${page}">${page}</button>
		</c:forEach>
		<!-- <button class="pageNext">����</button> -->
</body>
</html>