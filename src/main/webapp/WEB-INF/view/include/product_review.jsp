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
	
	function pageShowHide(reviewPage){
		if(Number("${fn:length(reviewPages)}")==1){
			$(".reviewPagejun").hide();
			$(".reviewPageNext").hide();
		}else if(reviewPage<=1){
			$(".reviewPagejun").hide();
			$(".reviewPageNext").show();
		}else if(reviewPage>=Number("${fn:length(reviewPages)}")){
			$(".reviewPageNext").hide();
			$(".reviewPagejun").show();
		}else{
			$(".reviewPagejun").show();
			$(".reviewPageNext").show();
		}
	}
	function pageAticle(reviewPage){
		$(".reviewPageButton").each(function(){
			if(Number($(this).val())==reviewPage){
				$(this).attr("disabled", true);
			}else{
				$(this).attr("disabled", false);
			}
		});
	}
	function listDB(reviewPage){
		$.ajax({
			url : "${contextPath}/api/ProductReviewList/${product.productCode},"+reviewPage,
			type : 'get',
			contentType : "application/json; charset=utf-8",
			data:null,
			success : function(json) {
				var sCont = "";
				for(i = 0; i < json.length; i++){
					
					sCont +='<tr>';
					sCont +='<td><a href="${contextPath}/ProductReviewDetail/'+json[i].boardCode+'">'+json[i].orderCode.orderProduct[0].orderOption.productCode+'</a></td>';	<!-- ��ǰ�� -->
					/* sCont +='<td><a href="${contextPath}/ProductReviewDetail/'+json[i].boardCode+'">'; */
					/* sCont +='<img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/'+json[i].reviewImages[0].image+'"></a></td>'; */	
					sCont +='<td>'+json[i].reviewImages[0].image+'</td>';	<!-- ���� -->
					sCont +='<td><a href="${contextPath}/ProductReviewDetail/'+json[i].boardCode+'">'+json[i].title+'</a></td>';	<!-- ���� -->
					sCont +='<td>'+json[i].registDate +'</td>';	<!-- �ۼ��� -->
					sCont +='</tr>';
					
				};
				$("#reviewList").html(sCont);
			},
			error : function(request, status, error) {
				/* alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error); */
			}
		});
		pageShowHide(reviewPage);
		pageAticle(reviewPage);
	}
	
	
	var reviewPage=1;
	listDB(reviewPage);
	
	
	$(".reviewPageButton").click(function(){
		reviewPage=Number($(this).val());
		listDB(reviewPage);
	});
	$(".reviewPagejun").click(function(){
		if(reviewPage>1){
			reviewPage -=1;
			listDB(reviewPage);
		}
	});
	$(".reviewPageNext").click(function(){
		if(reviewPage<Number("${fn:length(reviewPages)}")){
			alert(reviewPage);
			reviewPage +=1;
			listDB(reviewPage);
		}
	});
});
</script>
</head>
<body>
	<p> <a href="${contextPath}/ProductReviewInsertAndUpdateForm/${product.productCode},insert,0">���� ���</a> </p>
	<table>
		<thead> 
		<tr>
			<td>��ǰ�ڵ�</td>
			<td>�ı����</td>
			<td>����</td>						
			<td>�ۼ���</td>
		</tr>
		</thead>
		<tbody id="reviewList"></tbody>
	</table>
		<button class="reviewPagejun">����</button>
		<c:forEach var="reviewPage" items="${reviewPages}">
			<button class="reviewPageButton" value="${reviewPage}">${reviewPage}</button>
		</c:forEach>
		<button class="reviewPageNext">����</button>
</body>
</html>