<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/review/review_main.css" rel="stylesheet" type="text/css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<title>펫 시 터 후 기 </title>

</head>
<script type="text/javascript">

$(document).ready(function() {
	var formObj = $("form[name='readForm']");

	$("#write_btn").on("click", function() {

			formObj.attr("action", "/sitter/memReserve_rq_list");
			formObj.attr("method", "get");
			formObj.submit();
	})
})
</script>
<body>
<c:import url="../common/nav.jsp"></c:import>

<div>
	<div class="content-head">
		<div style="display: flex; flex-direction: row; justify-content:center;">
			<h1 class="header"><span style="font-weight:400;">왈츠</span> 펫 시 터 후 기 </h1>
		</div>	  
	  <jsp:useBean id="now" class="java.util.Date" />
	  <c:set var="loop_flag" value="false" />
				<c:forEach items="${list5}" var="list5">
				    <c:if test="${not loop_flag }">
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
				<c:if test="${list5.rv eq 0 && list5.end_date < today && list5.last_date >= today}">
					<a style="margin-left:70%" type="button" id="write_btn" class="write_btn">작성할 후기가 있습니다. 작성하시겠습니까?</a>
				            <c:set var="loop_flag" value="true" />
				</c:if>
				</c:if>
				</c:forEach>
	</div>
	 <div class="container" style="margin-bottom: 7%"> 
	<div>
	</div>
	<section>
		<form role="form" method="get" name ="readForm">
		<div class="container px-4 px-lg-5 mt-5">
	<div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-xl-2 justify-content-center;">
				<c:forEach items="${list}" var="list">
	  <div class="col mb-5">
	  	<div class="card h-100" style="border:none">
				<div class="my-main-column">
				<div class="review-list" style="width: 52%;">
				<div class="user-review">
					<div class="review-image"><img class ="imgimg" src="/resources/image/${list.r_image}"></div>
					<div class="user-star">
					<p class="content_title"><c:out value="${list.r_title}"/></p>
					<div class="review-star"> 				
					<c:if test= "${list.r_rate == 0 }"> 
					<img src="/resources/star/star0.PNG"/>
					</c:if>
					<c:if test= "${list.r_rate == 1 }"> 
					<img src="/resources/star/star1.PNG"/>
					</c:if>
					<c:if test= "${list.r_rate == 2 }"> 
					<img src="/resources/star/star2.PNG"/>
					</c:if>
					<c:if test= "${list.r_rate == 3 }"> 
					<img src="/resources/star/star3.PNG"/>
					</c:if>
					<c:if test= "${list.r_rate == 4 }"> 
					<img src="/resources/star/star4.PNG"/>
					</c:if>
					<c:if test= "${list.r_rate == 5 }"> 
					<img src="/resources/star/star5.PNG"/>
					</c:if>
					</div>
					</div>
					<div class="review_content"><c:out value="${list.r_content }"/></div>
					<a class="read_btn" href="/review/readReview?rno=${list.rno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">내용 더 보기</a>
					<div class="review-date">작성일 : <fmt:formatDate value="${list.rwrite_date}" pattern="yyyy-MM-dd" /></div>
					<div class="content-space"></div>
					<div>
					<p class="who">이 후기의 펫시터가 궁금하다면 ?</p>
					<a class ="sitter_btn" href="/sitter/profileView?sitter_email=${list.sitter_email}">
					<img class="whowho" src="/upload/sitter_profile/${list.sitter_image}"/>
					<div class="sitter_profile">${list.sitter_email} 님의 소개 페이지 </div>
					</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
				</c:forEach>
					</div>
				</div>
			</form>
	</section>	
				<div class="col-md-offset-3" style="margin-right: 48%">
			<ul class="pagination">
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.cri.page==idx ? 'class=info':''}"/>>
						<a href="boardReview${pageMaker.makeSearch(idx)}">${idx}&nbsp;&nbsp;&nbsp;</a></li>
						</c:forEach>
						
				</ul>
		</div>
				</div>

</div>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>