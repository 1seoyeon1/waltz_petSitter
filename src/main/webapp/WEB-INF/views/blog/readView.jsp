<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/blog/blogreadview.css"/>" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='readForm']");

      // 수정
      $(".modify-btn").on("click", function() {
         formObj.attr("action", "/blog/updateView");
         formObj.attr("method", "get");
         formObj.submit();
         });

      // 삭제
      $(".delete-btn").on("click", function() {
         
         var deleteYN = confirm("삭제하시겠습니까?");
         if(deleteYN == true) {

            formObj.attr("action", "/blog/delete");
            formObj.attr("method", "post");
            formObj.submit();
            }
         });

      // 목록
      $(".list-btn").on("click", function() {

         location.href = "/blog/list?page=${scri.page}"
                     +"&perPageNum=${scri.perPageNum}"
                     +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
         });


      // 댓글 작성
      $(".replyWrite-Btn").on("click", function() {
			if($("#reply_content").val() == ""){
				alert("댓글을 작성해주세요.");
				} else{
         var formObj = $("form[name='replyForm']");
         formObj.attr("action", "/blog/replyWrite");
         formObj.submit();
					}
         });



      // 댓글 삭제 View
      $(".replyDelete-Btn").on("click", function() {
    	  var deleteYN = confirm("삭제하시겠습니까?");
          if(deleteYN == true) {
   
                 formObj.attr("action", "/blog/replyDelete");
                 formObj.attr("method", "post");
                 formObj.submit();
                 } 
         });   
 	//비회원이 로그인 접속시
      $("#nolikebtn").on("click", function(){
    	  alert("로그인후 이용해 주세요.");
		  location.href="/login/memberLogin";
      })
      
      //좋아요 버튼
      $(".likebtn").on("click", function(){  
    	  
              $.ajax({
            	  url: '/blog/like',
            	  type: 'get',
            	  dataType: 'json',
            	  contentType: 'application/json; charset=UTF-8',
            	  data : {"likeblog_bno" : $("#likeBlog_bno").val()},
            	  success: function(data){
            		  $("#like-total").text(data.tc);
            		  if(data.rc != 0){
            			  var liked = "/resources/images/full.png"
            			  $("#dolike").attr('src', liked);
            		  }else{
            			  var liked = "/resources/images/empty.png"
            			  $("#dolike").attr('src', liked);
            		  }
            	  }
              });
          });
      })
</script>

<body>
<c:import url="../common/nav.jsp"></c:import>
<div class="container">
	<div class="row">
   <div class="col-md-8">
	<div class="blog-full-content">
	<div class="full-detail-content">
         <form name="readForm" role="form" method="post">
         <input type="hidden" id="blog_bno" name="blog_bno" value="${read.blog_bno}" />
         <input type="hidden" id="page" name="page" value="${scri.page}" >
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
         </form>
         
      <div class="blog-meta">
         <span class="blog-meta_texts"><fmt:formatDate value="${read.blog_date}" pattern="yyyy-MM-dd" /></span>
         <span class="blog-meta_separator"> | </span>
         <c:if test="${read.blog_semail != null}">
         <span class="blog-meta_texts"><c:out value="${read.blog_semail}"/></span>
      </c:if>
      <c:if test="${read.blog_memail != null}">
      <span class="blog-meta_texts"><c:out value="${read.blog_memail}"/></span>
      </c:if>
      </div>
      
      <h2 class="blog-title"><c:out value="${read.blog_title}"/></h2>
                
      <div class="blog-image">
      <c:if test="${read.blog_image eq null}">
      	<img src="/resources/images/noimg.gif">
      </c:if>
      <c:if test="${read.blog_image != null }">
          <img src="/resources/images/${read.blog_image }"/>
          </c:if>
      </div>
         
      
      <div class="form-group">
         <form method="get" name="likeForm" class="like-area">
         <input type="hidden" id="likeBlog_bno" name="likeBlog_bno" value="${read.blog_bno}" />
<%--          <c:choose>
         <c:when test="${likeResult.rc eq 0}">
         <img src="/resources/images/empty.png" id="unlike" class="likebtn" style="cursor:pointer; width: 40px;">
         </c:when>
         <c:when test="${likeResult.rc eq 1}"> --%>
         <c:if test="${sessionId != null}">
         <img src="${heart}"id="dolike" class="likebtn" style="cursor: pointer; width:40px;">
         </c:if>
         <c:if test="${sessionId eq null }">
         <img src="/resources/images/empty.png" id="nolikebtn" style="cursor: pointer; width:40px;">
         </c:if>
<%--          </c:when>
         </c:choose> --%>
         <span id="like-total"><c:out value="${likeTotal}"></c:out></span>
         </form>
         <p class="text-content">
         <c:out value="${read.blog_content}" />
         </p>
      </div>
   
   <div class="reply-relate">
   <span class="blog-comments">댓글  </span><span class="blog-comments"><c:out value="(${replyTotal})"/></span>
    <c:if test="${read.blog_category != null }">
   <span class="blog-meta_separator"> | </span>
 <span class="blog-category">카테고리 </span> <span class="blog-category">
 <c:out value="(${read.blog_category})"/>
 </span>
 </c:if>
   </div> 
   <hr>
      <!-- 댓글 -->
      <div id="reply">
            <c:forEach items="${replyList}" var="replyList">
            <div class="replylist-details">
       			<div class="blog-meta">
        				 <span class="blog-meta_texts"><c:out value=" ${replyList.reply_writer}"/></span>
     				    <span class="blog-meta_separator"> | </span>
     				    <span class="blog-meta_texts"><fmt:formatDate value="${replyList.reply_date}" pattern="yyyy-MM-dd" /></span>
   			   </div>        
                  <p>${replyList.reply_content}</p>
                  <c:if test="${replyList.reply_writer eq sessionScope.member or replyList.reply_writer eq sessionScope.sitter}">
                  <form action="/blog/replyDelete" method="post">
                  <input type="hidden" name="reply_no" value="${replyList.reply_no}">
                  <input type="hidden" name="blog_no" value="${read.blog_bno}">
                    <input type="hidden" id="page" name="page" value="${scri.page }"/>
      			   <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
        			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
        			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
                     <button type="submit" class="replyDelete-Btn">삭제</button>
                  </form>
                  </c:if>
                 </div> 
                 <br>
            </c:forEach>
      </div>
               <c:if test="${sessionScope.member eq null or sessionScope.sitter eq null}">

               </c:if>
      
      <form name="replyForm" method="post">
         <input type="hidden" id="blog_no" name="blog_no" value="${read.blog_bno}" />
         <c:if test="${sessionScope.member != null }">
        <input type="hidden" id="reply_writer" name="reply_writer" value="${sessionScope.member}">
        </c:if>
         <c:if test="${sessionScope.sitter != null }">
        <input type="hidden" id="reply_writer" name="reply_writer" value="${sessionScope.sitter}">
        </c:if>
         <input type="hidden" id="page" name="page" value="${scri.page}" >
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
         
         <div class="form-group">
            <div class="col-sm-10">
            <c:if test="${sessionScope.sitter != null}">
               <div class="reply-email"><c:out value="${sessionScope.sitter}"/></div>
         	</c:if>
         	<c:if test="${sessionScope.member != null}">
         	   <div class="reply-email"><c:out value="${sessionScope.member}" /></div>
         	</c:if>
  			<c:if test="${sessionScope.sitter == null && sessionScope.member == null}">
  			  <h4>뎃글은 로그인후 작성 하실수 있습니다.</h4>
  			</c:if>
            </div>
            <div>
               <c:if test="${sessionScope.sitter != null || sessionScope.member != null}">
             <textarea id="reply_content" name="reply_content" ></textarea>
            <button type="button" class="replyWrite-Btn rbtn">작성</button>
               </c:if>
            </div>
         </div>       
      </form>
   </div>
   </div>
   </div>
   <div class="col-6 col-md-4">
   
           
   <c:if test="${read.blog_memail eq sessionScope.member || read.blog_semail eq sessionScope.sitter}">
      <div class="widget relative-links">
      <h4 class="relative-intro">추가 기능</h4>
      <ul class="sidebar-ul">
      <li>
         <a class="modify-btn link">글 수정</a>
         </li>
         <li>
         <a class="delete-btn link">삭제</a>
         </li>
         <li>
         <a class="list-btn link">블로그 목록</a>
         </li>
         </ul>
      </div>
   </c:if>
   
    <div class="widget relative-links">
   <h4 class="relative-intro">카테고리</h4>
   <ul class="sidebar-ul">
   
   <li>
   	<a href="/blog/categorylist?blog_category=일상">일상</a>
   	 <span class="blog-meta_date"><c:out value="(${blogcat.lifestyle})"/></span> 
   </li>
   <li>
   	<a href="/blog/categorylist?blog_category=마이펫">마이펫 </a>
   	<span class="blog-meta_date"><c:out value="(${blogcat.myPet})"/></span> 
   	</li>
   	
   	<li>
   	<a href="/blog/categorylist?blog_category=상식">상식</a>
   	<span class="blog-meta_date"><c:out value="(${blogcat.knowledge})"/></span>
   	</li> 
   	
   	<li>
   	<a href="/blog/categorylist?blog_category=놀이터">놀이터</a>
   	<span class="blog-meta_date"><c:out value="(${blogcat.playground})"/></span>
   	</li>
   	
   	<li>
   	<a href="/blog/categorylist?blog_category=펫용품">펫용품</a>
   	<span class="blog-meta_date"><c:out value="(${blogcat.petItems})"/></span>
   	</li>	   	
   	
   </ul>
   </div>
   
   <div class="widget recent-links">
   <h4  class="relatve-intro">최근글</h4>
   <ul class="sidebar ul">
    <c:forEach items="${list}" var="list" end="4">
   	<li>
    <a href="/blog/readView?blog_bno=${list.blog_bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType }&keyword=${scri.keyword }">
   <c:out value="${list.blog_title}"/></a>
    </li>
   <hr class="line-break">
   </c:forEach>
   </ul>
   </div>
   </div>
 </div>
 </div>
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>