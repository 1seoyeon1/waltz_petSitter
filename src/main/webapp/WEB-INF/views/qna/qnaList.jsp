<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
</head>
<script type="text/javascript">
$(document).ready(function(){

$.ajax({
   url : '/qna/replyList' ,
   type : 'get',
   dataType : 'json',
   contentType : 'application/json; charset=UTF-8',
   success : function(json){
      console.log(json);
      $.each(json, function(idx, item){
         var qno = json[idx].qno;
         var sitter_image = '/upload/sitter_profile/'+json[idx].sitter_image;
      $('#'+qno).append("<img  width='40px', height='40px', style='border-radius:45px; margin-right:10px', src='"+sitter_image+"'/>");  
         });
      }
});
});
</script>
<style>
.prev-next{
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-bottom: 30px;	
}
</style>
<body>
<div class="container">		
	<p id="totalQna">전체글 <c:out value="${pageMaker.totalCount}" /> 개</p>
	<div>
	<section>
	<form role="form" method="get">
	
	<div class="container px-4 px-lg-5 mt-5">
	<div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-xl-2 justify-content-center;">
			
			<c:forEach items="${list}" var="list">
		<div class="col mb-5">
			
			<div class="card h-100">
				<a href="/qna/qnaReadView?qno=${list.qno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
					<div class="qna_title_content">
						<div id="qna_title">
							<img src="../resources/images/loupe.png" id="qnaimg"> 
							<p id="qna_real_title"><c:out value="${list.qna_title}" /></p>
						</div>
						<div id="qna_content">	
							<c:out value="${list.qna_content}" />	
						</div>
					</div>	
					<div class="qna_reply">
						<div id="qna_reply_tt">
							<div id="qna_reply_img_sitter">
								<div>
								<!-- <img src="/upload/sitter_profile/" id="qna_reply_sitter_img"> -->
								</div>
								<div id="qna_reply_sitter">
								<c:choose>
								<c:when test="${list.reply eq 0}">
									<p style="padding-top:10px; margin-top:0px;">답변  대기</p>
								</c:when>
								<c:when test="${list.reply eq 1}">
									<div id="${list.qno}" class="img"></div>
									<p style="margin:auto;">답변 완료</p>
									<%-- <span style="margin:auto; color: #337ab7; margin-left:5px;">  +  <c:out value="${replyTotal}"/></span> --%>
								</c:when>
								</c:choose>
								</div>
							</div>
							<div>
								<img src="../resources/images/arrow_right.png" id="qna_reply_img"/>
							</div>
						</div>	
					</div>						
				</a>
			</div>
		
		</div>
			</c:forEach>
	</div>
	</div>

	</form>
</section>
</div>
	
		<div class="prev-next">
		<c:if test="${pageMaker.prev}">
			<a href="qnaMain${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<a href="qnaMain${pageMaker.makeSearch(idx)}">${idx}&nbsp;&nbsp;&nbsp;</a>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<a href="qnaMain${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
		</c:if>
	</div>
	</div>
</body>
</html>