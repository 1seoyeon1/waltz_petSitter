<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Q&A</title>
<c:import url="../hello/bootStrap.jsp"></c:import>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");

		//수정
	      $(".update_btn").on("click", function() {
	          formObj.attr("action", "/qna/qnaUpdateView");
	          formObj.attr("method", "get");
	          formObj.submit();
	          })

		//삭제
		$(".delete_btn").on("click", function(){
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true) {
				formObj.attr("action", "/qna/qnaDelete");
				formObj.attr("method","post");
				formObj.submit();
				}
			})

		//목록
		$(".list_btn").on("click", function(){
			location.href="/qna/qnaList?page=${scri.page}"
						 +"&perPageNum=${scri.perPageNum}"
						 +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})

		//댓글작성
		$(".replyWriteBtn").on("click",function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/qna/qnaReplyWrite");
			formObj.submit();
			});
		//댓글 수정 view
		$(".replyUpdateBtn").on("click", function(){
			location.href="/qna/qnaReplyUpdateView?qno=${read.qno}" 
						 + "&page=${scri.page}"
						 + "&perPageNum=${scri.perPageNum}"
						 + "&searchType=${srci.searchType}"
						 + "&keyword=${srci.keyword}"
						 + "&qna_rno="+$(this).attr("data-qna_rno");
			});

		//댓글 삭제 view
		$(".replyDeleteBtn").on("click",function(){
			location.href="/qna/qnaReplyDeleteView?qno=${read.qno}" 
				 + "&page=${scri.page}"
				 + "&perPageNum=${scri.perPageNum}"
				 + "&searchType=${srci.searchType}"
				 + "&keyword=${srci.keyword}"
				 + "&qna_rno="+$(this).attr("data-qna_rno");
			});
		})
</script>
<style>
body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
}
</style>
<body>
<c:import url="../common/nav.jsp"></c:import>
<c:import url="./qnaSearch.jsp"></c:import>
	<section id="container">
	<div class="qnaReadView">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="qno" name="qno" value="${read.qno}"/>
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		</form>
		
				
		<div class="qnaReadCategory" ><p id="qnaReadCategory"><c:out value="[${read.qna_category}] 카테고리"/></p>
		
		<!-- <button type="button" class="list_btn">  -->
		 <a href="/qna/qnaMain">
						
						 <p id="qnalist">목록으로 돌아가기 ></p></a>
					<!-- 	 </button>  -->
		
		</div>
		
		
		<div id="question">
			<!-- <label for="qna_title">제목</label> -->
			<div id="qnaReadTitlediv"> 
			<div id="qnaReadTitle"> 
			<img src="../resources/images/loupe.png" id="qnaimg"> 
			<p id="qnaReadTitle" ><c:out value="${read.qna_title}" /></p>
			</div>
			<div id="qnaReadTitleWriter">
			<c:out value="${read.user_email}"/>
			<fmt:formatDate value="${read.qna_date}" pattern="yyyy-MM-dd"/>
			</div>
		</div>
		<div id="qnaReadContent">
		<p>
			<c:out value="${read.qna_content}"/>
			
		</div>
		<br/>
		<div class="qnaReadCategory">
		<p id="qnaReadCategory">
		<c:out value="${read.qna_category}"/>
		</p>
		</div>
		
		
		<div >
		<c:if test="${member eq read.user_email}">
			<button type="button" class="update_btn">수정</button>
			<button type="button" class="delete_btn">삭제</button>
		</c:if>
			
		</div>
		</div>
		<!-- 댓글 -->
		<div id="reply">
				<c:forEach items="${replyList}" var="replyList">

		<div id="qnaReadTitlediv">
		<div id="qnaReadTitle">
		<img src="/upload/sitter_profile/${replyList.sitter_image}" id="sitterimg"> 
		<p id="qnaReadTitle"> ${replyList.sitter_email} 님의 답변 </p>
		</div>
		<div id="qnaReadTitleWriter">
		<fmt:formatDate value="${replyList.qna_reply_date}" pattern="yyyy-MM-dd"/>
		</div>
						</div>
						<p id="qnaReadContent">${replyList.qna_reply_content}</p>
						<div>
							<c:if test="${sitter eq replyList.sitter_email}">
							<button type="button" class="replyUpdateBtn btn btn-warning" data-qna_rno="${replyList.qna_rno}">수정</button>
							<button type="button" class="replyDeleteBtn btn btn-danger" data-qna_rno="${replyList.qna_rno}">삭제</button>
							</c:if>
						</div>
				
				</c:forEach>
			
	
		</div>
		<hr/>
		<form name="replyForm" method="post">
			<input type="hidden" id="qno" name="qno" value="${read.qno}"/>
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			
			<c:if test="${not empty sitter}">
			
			<div>
				<div>
				<img src="/upload/sitter_profile/${qnaimage}" id="sitterimg"/>		
				<input type="text" id="sitter_email" value="${sitter}" name="sitter_email"/>
				</div>
				<div>
				<input type="text" id="qna_reply_content" name="qna_reply_content" />
				</div>
				
			</div>
			
			<div>
				<div>
					<button type="button" class="replyWriteBtn">작성</button>
				</div>
			<div>
			</c:if>
			</div>
		</form>
		</div>
		</div>
	</section>
	<hr />


</body>
</html>