<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <link href="<c:url value="/resources/css/blog/blogwrite.css"/>" rel="stylesheet">   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>게시판 수정</title>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='updateForm']");
      $(".cancel_btn").on("click", function(){
   event.preventDefault();
   location.href="/blog/readView?blog_bno=${update.blog_bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
          })
          
     $(".update_btn").on("click", function(){
         if(fn_valiChk()){
            return false;
            }
         formObj.attr("action", "/blog/update");
         formObj.attr("method", "post");
         formObj.submit();
              })
   })
   function fn_valiChk(){
   var updateForm = $("form[name='updateForm'] .chk").length;
   for(var i=0; i < updateForm; i++){
      if($(".chk").eq(i).val() == "" ||  $(".chk").eq(i).val() == null){
      alert($(".chk").eq(i).attr("title"));
      return true;
         }
      }
    }
  </script>
  
<body>
<c:import url="../common/nav.jsp"></c:import>
<div id="root">
   <section id="container">
      <form name="updateForm" role="form" method="post" action="/blog/update" class="whole-form">
      <input type="hidden" id="blog_bno" name="blog_bno" value="${update.blog_bno }"/>
         <input type="hidden" id="page" name="page" value="${scri.page }">
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }">
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType }">
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword }">


            <div class="info-input">
            <textarea id="blog_title" name="blog_title" class="chk" title="제목을 입력하세요."><c:out value="${update.blog_title}" /></textarea>
			</div>
			
         <div class="info-input">
            <textarea id="blog_content" name="blog_content" class="chk" title="내용을 입력하세요."><c:out value="${update.blog_content }" /></textarea>
		</div>
		
		<div class="filebox">
				<input class="category-input" type="text" name="blog_category" list="blogList"> 
				<label for="blog_category">카테고리</label>
				<datalist id="blogList">
					<option value="일상"/>
					<option value="마이펫"/>
					<option value="상식"/>
					<option value="놀이터"/>
					<option value="펫용품"/>
				</datalist>
				</div> 
         <div>
         <a type="submit" class="update_btn">저장</a>
         <a class="cancel_btn">취소</a>
         </div>
      </form>
   </section>
</div>
</body>
</html>