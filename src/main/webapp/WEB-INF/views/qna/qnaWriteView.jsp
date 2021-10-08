<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%--  <link href="<c:url value="/resources/css/blog/blogwrite.css"/>" rel="stylesheet">  --%> 
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/29.2.0/classic/ckeditor.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


<meta charset="UTF-8">
<title>q&a 작성</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<script src="/ckeditor/ckeditor.js"></script>
	<script>
    window.onload = function(){
       ck = CKEDITOR.replace("qna_content");
    };
    </script>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
				}
			formObj.attr("action","/qna/qnaWrite");
			formObj.attr("method", "post");
			formObj.submit();
			});
		})
		
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length; //form이름이 writeForm이고 그 안에 클래스가 chk 인것을 찾아라
			for(var i = 0; i<regForm; i++) {
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
					}
				}
		}
 	function catChk(){
		var writeForm = document.writeForm;
		if(writeForm.qna_category.value=="") {
			alert("카테고리를 선택해주세요");
			writeForm.qna_category.focus();
			return false;
			}
		}
	 
</script>

<body>
<c:import url="../common/nav.jsp"></c:import>
<div id="root">
	<div class="qnaWriteView_title">
		<p style="margin:auto;">
			Q & A 등록하기
		</p>
	</div>
	
	<section id="container">
	<div style="width: 100%; text-align:center;">
		<form name="writeForm" method="post" action="/qna/qnaWrite" onsubmit="return catChk();">
				<c:if test="${member != null}"> 
						<div class="info-input">
						<input type="text" id="blog_title" name="qna_title" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요."/>
						</div>
					
						<input type="hidden" id="user_email" name="user_email" class="chk" value="${member}" title="작성자를 입력하세요."/>
					
						<select id="qna_category" class="category-input" name="qna_category">
							<option selected value="">카테고리를 선택하세요</option>
							<option value="배변">배변</option>
							<option value="산책">산책</option>
							<option value="공격성">공격성</option>
							<option value="짖음">짖음</option>
							<option value="기본예절">기본예절</option>
							<option value="기타">기타</option>	
						</select>
						
						<!-- <div>
						 <button type="button" id="qna_category" name="qna_category" value="배변">배변</button>
						 <button type="button"  id="qna_category" name="qna_category" value="산책">산책</button>
							<button type="button" id="qna_category" name="qna_category" value="공격성">공격성</button>
							<button type="button" id="qna_category" name="qna_category" value="짖음">짖음</button>
							<button type="button" id="qna_category" name="qna_category" value="기본예절">기본예절</button>
							<button type="button" id="qna_category" name="qna_category" value="기타">기타</button>
						</div>	 -->	
						 
					<div style="padding-left:20%; padding-right:20%;">
					<textarea name="qna_content" id="qna_content" style="margin:auto;"></textarea>
				</div>
				
					
					
				<div style="padding-top:20px; padding-bottom:20px;">
                	<a class="write_btn" type="submit">작성</a>
   					<a class="list" href="/qna/qnaMain">목록</a>
				</div>
						
					</c:if>
					<div>
					 <c:if test="${member == null}">
						<p>로그인 후에 작성할 수 있습니다.</p>
					</c:if> 
					</div>
				
		
		</form>

	</div>
	</section>
	
</div>

</body>

</html>