<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
		    <jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
					<table style="width: 90%; text-align: center">
						<tr>
							<td colspan="7" class="td_title"><h1 class="mt-4">리뷰게시판</h1></td>
						</tr>			
						<tr style="background-color: lightgrey; text-align: center">
							<td>리뷰번호</td>
							<td>리뷰상품코드</td>
							<td>리뷰상품명</td>
							<td>제목</td>					
							<td>아이디</td>					
							<td>작성일</td>
						</tr>
						<tr>
							<c:forEach items="${reviewList}" var="reviewList">
							<tr>
								<td>${reviewList.boardCode}</td>
								<td>${reviewList.productCode}</td>
								<td>${reviewList.productName}</td>
								<td><a href="reviewDetail?boardCode=${reviewList.boardCode}"><c:out value="${reviewList.title}" /></a></td>
								<td>${reviewList.memberId}</td>
								<td>${reviewList.registDate}</td>
							</tr>
							</c:forEach>
						</tr>
					</table>
					<div>
						<ul class="pageNum">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="review${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="review${pageMaker.makeSearch(idx)}">[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="review${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if> 
						</ul>
						
						<div class="search">
						    <select name="searchType">
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						       <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						
						    <button id="searchBtn" type="button">검색</button>
						    
						    <script  type="text/javascript">
						      $(function(){
						        $('#searchBtn').click(function() {
						          self.location = "review" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						        });
						      });   
						    </script>
						</div>						
					</div>
		        </div>		        
		    </div>		    
		</div>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>