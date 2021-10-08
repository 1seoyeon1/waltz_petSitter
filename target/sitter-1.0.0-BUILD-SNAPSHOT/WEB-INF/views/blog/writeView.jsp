<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
 <link href="<c:url value="/resources/css/blog/blogwrite.css"/>" rel="stylesheet">   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<title>게시판 글 쓰기</title>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='writeForm']");
      $(".write_btn").on("click", function(){
          if($("#blog_title").val() == "" ||  $("#blog_content").val() == ""){
			alert("제목 과 내용을 모두 입력해주세요!");
              }else{
            formObj.attr("action", "/blog/write");
            formObj.attr("method", "post");
            formObj.submit();
                  }
         });
      });
</script>
<body>
<c:import url="../common/nav.jsp"></c:import>
   <div id="root">
      <section id="container">
      <div class="whole-content">
         <form name="writeForm" method="post" action="/blog/write" enctype="multipart/form-data" class="whole-form">
         			<c:if test="${sessionScope.member != null }">
                 <input type="hidden" name="blog_email" class="chk" value="${sessionScope.member}"  />
                 </c:if>
                 <c:if test="${sessionScope.sitter != null }">
                 <input type="hidden" name="blog_email" class="chk" value="${sessionScope.sitter}" />
                  </c:if>
     
         		<div class="info-input">
                           <textarea id="blog_title" name="blog_title" class="chk" placeholder="제목을 입력하세요."></textarea>
				</div>
				<div class="info-input">
                           <textarea id="blog_content" name="blog_content" class="chk"></textarea>
				</div>
				
				<div class="filebox">
				<input class="upload-name" value="첨부파일" placeholder="첨부파일">
				<label for="file">파일찾기</label>
                          <input type="file" name="image" id ="file" class="chk" value="noimg.gif"/>
                 <div>
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
				</div>

				<div>
                           <a class="write_btn" type="submit">작성</a>
   							<a class="list" href="/blog/list">목록</a>
   				</div>
         </form>
         </div>
       </section>
   </div>
   <script type="text/javascript">
$("#file").on('change', function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
</script>
</body>
</html>