<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styleAdmin.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
	
	var contextPath = "<%=request.getContextPath()%>";
	var productCode = getParameterByName("productCode");	
	
	$('#searchBtn').click(function() {
		self.location = "productDetailMgt?" + "productCode=" + productCode + '${pageMaker2.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
	
	$('#new_btn').on("click", function(e) {
		window.open("${contextPath}/admin/product/productOrderOption?productCode=" + productCode, "PopupWin2", "width=500, height=350");
	});
		
	$.get(contextPath + "/api/orderOption/"+productCode,
		function(jsonO) {			
			var lastData = jsonO.length - 1;
			document.getElementById("styleCode").value = jsonO[lastData].styleCode;
			document.getElementById("color").value = jsonO[lastData].color;
		});	
	
});

opener.location.reload();

</script>
</head>
<style>

td.td1 {
    width: 15%;
}

.title_div {
    display: inline-block;
    margin-right: 10px;
    margin-bottom: 10px;
}

.btn_section {
    display: inline-block;
}

tbody tr:nth-child(2n) {
    background-color: #eaeaea;
}

tbody tr:nth-child(2n+1) {
    background-color: #f9f9f9;
}

ul.pageNum {
    width: 100%;
    text-align: center;
}

.search {
    width: 100%;
    text-align: center;
}

</style>
<body class="main-layout">

	<section class="adminSection">
		<div class="container-orderOption">
				<div class="title_div">
					<h1 class="mt-4">?????? ??????</h1>
				</div>
				<div>
					<table style="width: 100%; text-align: center">
						<thead>
							<tr style="background-color: lightgrey; text-align: center">
								<td style="width: 2%;">??????</td>
								<td style="width: 7%;">?????????</td>
								<td style="width: 3%;">?????????</td>
								<td style="width: 2%;">??????</td>
								<td style="width: 3%;">????????????</td>
								<td style="width: 1%;">???????????????</td>
								<td style="width: 4%;">??????</td>
								<td style="width: 4%;">????????????</td>
								<td style="width: 5%;">?????????</td>
								<td style="width: 6%;">??????????????????</td>
								<td style="width: 6%;">??????????????????</td>
							</tr>
						<thead>
						<tbody>
							<tr>
								<td>${products.productCode}</td>
								<td>${products.productName}</td>								
								<td>${products.brand.brandName}</td>								
								<td>${products.gender}</td>
								<td>${products.category.category}</td>
								<td><a href="${contextPath}/productDetail/${products.productCode}"><img src="${contextPath}/images/${products.productPost.productMainImage}" width="130" height="130"></a></td>
								<td>${products.costPrice}</td>
								<td>${products.sellPrice}</td>
								<td>${products.registDate}</td>
								<td>${products.cumulativeRegistCount}</td>
								<td>${products.cumulativeSellCount}</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="title_div">
					<h1 class="mt-4">?????? ??????</h1>
				</div>
				<div class="btn_section">
					<button type="button" id="new_btn">????????????</button>
				</div>
				<div>
					<div style="height: 290px">
					<table style="width: 100%; text-align: center">
						<thead>
							<tr style="background-color: lightgrey; text-align: center">
								<!-- <td class="td1">??????</td> -->
								<td class="td1">???????????????</td>
								<td class="td1">??????</td>
								<td class="td1">?????????</td>
								<td class="td1">????????????</td>
								<td class="td1">????????????</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderOtionList}" var="orderOtionList">
							<tr>
								<%-- <td><c:out value="${orderOtionList.productCode}" /></td> --%>
								<td>${orderOtionList.styleCode}</td>								
								<td>${orderOtionList.color}</td>								
								<td>${orderOtionList.size}</td>
								<td>${orderOtionList.stock}</td>
								<td>
									<button type="button"><a href="${contextPath}/admin/product/productOrderOptionMod?productCode=${orderOtionList.productCode}&styleCode=${orderOtionList.styleCode}&color=${orderOtionList.color}&size=${orderOtionList.size}&nowStock=${orderOtionList.stock}&totalStock=${products.cumulativeRegistCount}" onClick="window.open(this.href, '', 'width=500, height=400'); return false;">????????????</a></button>
									<button type="button"><a href="${contextPath}/admin/product/productOrderOptionDel?productCode=${orderOtionList.productCode}&styleCode=${orderOtionList.styleCode}&color=${orderOtionList.color}&size=${orderOtionList.size}&stock=${orderOtionList.stock}" onClick="if(!confirm('?????? ???????????????????')){return false;}">????????????</a></button>
								</td>
							</tr>
							</c:forEach>
						</tbody>		
					</table>
					</div>
					<ul class="pageNum">
					    <c:if test="${pageMaker.prev}">
					      <li id="page"><a href="productDetailMgt?productCode=${orderOtionList[0].productCode}&${pageMaker.makeSearch(pageMaker.startPage - 1)}">[??????]</a></li>
					    </c:if> 
					    
					    <c:if test="${!pageMaker.prev}">
					      <li id="page"><a style="color: #808080;">[??????]</a></li>
					    </c:if>
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					      <li id="page"><a href="productDetailMgt?productCode=${orderOtionList[0].productCode}&${pageMaker.makeSearch2(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					      <li id="page"><a href="productDetailMgt?productCode=${orderOtionList[0].productCode}&${pageMaker.makeSearch(pageMaker.endPage + 1)}">[??????]</a></li>
					    </c:if>
					    
					    <c:if test="${!pageMaker.next}">
					      <li id="page"><a style="color: #808080;">[??????]</a></li>
					    </c:if>
					</ul>
					
					<div class="search">
						<select name="searchType">
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>?????????</option>
							<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>???????????????</option>
							<option value="w"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>??????</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">??????</button>					    

					</div>
				</div>
			</div>		  
	</section>

	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>