<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/review/review_read.css" rel="stylesheet" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정
		$("#review_update").on("click", function() {
			formObj.attr("action", "/review/updateView");
			formObj.attr("method", "get");
			formObj.submit();
			});

		// 삭제
		$("#review_delete").on("click", function() {

			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true) {

				formObj.attr("action", "/review/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			});

		// 목록
		$(".list_btn").on("click", function() {

			location.href = "/review/boardReview?page=${scri.page}"
						   +"&perPageNum=${scri.perPageNum}"
						   +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});

		})
			
			function openWin(rno){
				var url="/review/imageUpdate?rno=${read.rno}"
				var name="imageUpdate";
				var option="_blank, width=400, height=350, resizable=false";
				window.open(url,name,option);
			}
</script>
<body>
<c:import url="../common/nav.jsp"></c:import>
	<div class="content-head">
		<div style="display: flex; flex-direction: row; justify-content:center;">
			<h1 class="header"><span style="font-weight:400;">왈츠</span> 펫 시 터 후 기 </h1>
		</div>	  
	</div>
	<div>
	<section>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="rno" name="rno" value="${read.rno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}" >
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
		</form>
<div class="read-content">
	<div style="display:flex;">
		<div class="readReview">
	<div>
		<div class="imgimg"><img class="review-image" src="/resources/image/${read.r_image}"/></div>
	</div>
			<div class="user-star">
					<p class="content_title"><h1 class="title-header"><c:out value="${read.r_title}"/></h1></p>
				<div class="review-star"> 				
					<c:if test= "${read.r_rate == 0 }"> 
					<img src="/resources/star/star0.PNG"/>
					</c:if>
					<c:if test= "${read.r_rate == 1 }"> 
					<img src="/resources/star/star1.PNG"/>
					</c:if>
					<c:if test= "${read.r_rate == 2 }"> 
					<img src="/resources/star/star2.PNG"/>
					</c:if>
					<c:if test= "${read.r_rate == 3 }"> 
					<img src="/resources/star/star3.PNG"/>
					</c:if>
					<c:if test= "${read.r_rate == 4 }"> 
					<img src="/resources/star/star4.PNG"/>
					</c:if>
					<c:if test= "${read.r_rate == 5 }"> 
					<img src="/resources/star/star5.PNG"/>
					</c:if>
				</div>
			</div>
		<div class="review-use-date">
		<label for="ruse_date">이용 날짜 : <c:out value="${read.ruse_date }"/></label>
		</div>

	<div>	
	<div class="content-space"></div>
		<p class="review_content"><c:out value="${read.r_content}"/></p> 
	</div>
	<div class="review-write-date">
		<label for="rwrite_date">작성일 : <fmt:formatDate value="${read.rwrite_date}" pattern="yyyy-MM-dd"/></label>
	</div>
	<div class="review-user_email">
		<label for="user_email">작성자 아이디 : <c:out value="${read.user_email }"/></label>
	</div>
		<div class="content-space"></div>
	<div>
					<p class="who">이 후기의 펫시터가 궁금하다면 ?</p>
					<a class ="sitter_btn" href="/sitter/profileView?sitter_email=${read.sitter_email}">
					<img class="whowho1" src="/upload/sitter_profile/${read.sitter_image}"/>
					<div class="sitter_profile">${read.sitter_email} 님의 소개 페이지 </div>
					</a>
	</div>
		<div class="update_delete">
		<c:if test="${ read.user_email eq sessionScope.member}">
		<a type="button" id="review_update">글 수정</a>
		<a type="button" id="review_delete">글 삭제</a>
		<a type="button" onclick="openWin()">이미지수정</a>
		</c:if>
		</div>
			</div>
		</div>
	</div>

		<a class="goback" href="/review/boardReview"><p class="allreview"> + 전체 후기 보기</p></a>
	</section>
	
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>