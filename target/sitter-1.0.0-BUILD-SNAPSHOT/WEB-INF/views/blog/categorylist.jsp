<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
      
<script type="text/javascript">
const blogWrite = function(){
	location.href="/blog/writeView";
}
</script>
<link href="<c:url value="/resources/css/blog/bloglist.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body><c:import url="../common/nav.jsp"></c:import>
<div class="container">


<section id="container">
<div class="container">
   <div class="whole row">

   <div class="col-md-8">
   <c:forEach items="${catList}" var="list">
   
   <div class="col-md-12 col-sm-12 col-xs-12 col-xxs-12 cb ">
   <div class="blog-post">
   <div class="blog-post_image-wrap">
    <c:if test="${list.blog_image eq null }">
   <img class="list-images" src="/resources/images/noimg.gif"/>
   </c:if>
   <c:if test="${list.blog_image != null }">
   <img class="list-images" src="/resources/images/${ list.blog_image}"/>
   </c:if>
   </div>
   <div class="blog-post_text-content">
   <div class="blog-meta">
   <span class="blog-meta_date"><fmt:formatDate value="${list.blog_date}" pattern="yyyy-MM-dd"/></span>
   <span class="blog-meta_separator"> | </span>
	<span class="blog-meta_date"><c:out value="${ list.blog_email}"/></span>
   </div>
        <h3><a class="tag" href="/blog/readView?blog_bno=${list.blog_bno}">
  <c:out value="${list.blog_title}"/></a></h3>
    <a class="tag" href="/blog/readView?blog_bno=${list.blog_bno}">
    read more
    </a>
   </div>
   </div>
  </div>
   </c:forEach>
   </div>
   
   
   <div class="col-6 col-md-4">
   
   <div class="widget blog-write">
   <h4 id="blog write-page">
<c:if test="${sessionScope.member != null or sessionScope.sitter != null}">
<a name="writeView" style="cursor:pointer;color:#4267B2;"onclick="blogWrite()">글쓰기</a>
</c:if>
   </h4>
   </div>
 
 <div class="widget" id="blog-list">
 <a href="/blog/list" >블로그 목록</a>
 </div>
  
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
    <c:forEach items="${catList}" var="list" end="4">
   	<li>
    <a href="/blog/readView?blog_bno=${list.blog_bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType }&keyword=${scri.keyword }">
   <c:out value="${list.blog_title}"/></a>
    </li>
   <hr class="line-break">
   </c:forEach>
   </ul>
   </div>
    
   <div class="widget search-area">
   <input type="text" name="keyword" id="keywordInput" value="${scri.keyword }" class="search-text"/>
<button id="searchBtn" type="button" class="btn btn-default">검색</button>
   </div>
   
   </div>
   </div>
</div>
<div class="col-md-offset-3">
   <ul class="pagination">
   <c:if test ="${pageMaker.prev }">
   <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
   </c:if>
   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
   <li<c:out value="${pageMaker.cri.page == idx ? 'class=info': '' }"/>>
   <a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
   </c:forEach>
   <c:if test="${pageMaker.next&& pageMaker.endPage > 0 }">
   <li> <a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
   </c:if>
   </ul>
</div>
</section>
</div>
<script>
$(function(){
   $('#searchBtn').click(function(){
      self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + "t"+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
      });
});
</script>
</body>
</html>