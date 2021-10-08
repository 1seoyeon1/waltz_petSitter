<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/petinfo/petinfolist.css"/>" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>petinfo form</title>
</head> 
<script type="text/javascript">
$(document).ready(function(){

var formObj = $("form[name='petdeleteform']");
	
/* 	// 펫 정보 수정 페이지 버튼
	$(".update_btn").on("click", function() {
		formObj.attr("action", "/petinfo/updatePetInfo");
		formObj.attr("method", "get");
		formObj.submit();
		}); */

	// 펫 정보 삭제 버튼
 	$(".delete_btn").on("click", function() {
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true) {

				formObj.attr("action", "/petinfo/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		}); 
})
</script>
<body>
<c:import url="../common/nav.jsp"></c:import>


<div class="page-top">
		<header>
		<h1 class="top-h"><c:out value="${member}"/> 님의 펫 정보</h1> 
		<h1></h1>
		</header>
</div>
		
		<div class="list">				
			<c:forEach items="${list}" var="list">
	    <div class="img-info">
	    <div class="border border-4">
		     <img class="rounded mx-auto d-block" src="/resources/petinfo/${list.pet_image}">
		</div>
<%-- 		    <form name="readForm" role="form" method="get">
    			<input type="hidden" id="pno" name="pno" value="${list.pno}" />
    		</form> --%>
		
    
    
				<div class="info">
				<div class="sit-top">
				<div class="name">				
				</div>
				</div>
				
			    <div class="sitinfo">
			    
				
				<span class="spinfo">
				<label>이름 : </label>
				 <c:out value="${list.pet_name}"/>
				</span>
				
				<span class="spinfo">
				<label>품종 : </label>
				 <c:out value="${list.pet_type}"/>
				</span>
			    
			    
				<span class="spinfo" style="width:87%">
				<label>특이사항 : </label>
				 <c:out value="${list.pet_detail}"/>
				</span>

				<span class="spinfo">
				<label>성별 : </label>
				 <c:out value="${list.pet_gender}"/>
				</span>


				<span class="spinfo">
				<label>나이 : </label>
				 <c:out value="${list.pet_age}"/>
				</span>
				</div>
				</div>
				</div>
				
				<hr size="5" color="blue"/>
		<div class="petbtn">
		<form action="/petinfo/updatePetInfo" method="get" class="petbtn">
		<input type="hidden" name="pno" value="${list.pno}">
		      <div class="form-group has-feedback">
				<button type="submit" id="update_btn">펫 정보 수정</button>
              </div>
		</form>
		<form action="/petinfo/delete" name="petdeleteform" method="post" class="petbtn">
				<input type="hidden" name="pno" value="${list.pno}">
		      <div class="form-group has-feedback">
 				<button type="button"  class="delete_btn" id="delete_btn">펫 정보 삭제</button>		      
              </div>
		</form>
		</div>
			</c:forEach>
		</div>
		
</body>
</html>