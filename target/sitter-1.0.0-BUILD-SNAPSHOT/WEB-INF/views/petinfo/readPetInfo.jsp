<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>petinfo form</title>
</head> 

<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[name='readForm']");
	
	// 펫 정보 수정 페이지 버튼
	$(".update_btn").on("click", function() {
		formObj.attr("action", "/petinfo/updatePetInfo");
		formObj.attr("method", "get");
		formObj.submit();
		});

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

		<header><c:out value="${member}"/> 님의 펫 정보 </header>
		
 <section id="container">
    <form name="readForm" role="form" method="post">
    	<input type="hidden" id="pno" name="pno" value="${read.pno}" />
    </form>
    
    
       <div class="form-group has-feedback">
          <label class="control-label" for="pet_type">품종</label>
          <input class="form-control" type="text" id="pet_type" name="pet_type" value="${read.pet_type}" readonly="readonly"/>
       </div>
       
       <div class="form-group has-feedback">
          <label class="control-label" for="pet_age">성별</label>
          <div>
          <input  type="text" id="pet_age" name="pet_age" value="${read.pet_age}" readonly="readonly"/>
          </div>
       </div>
       
       <div class="form-group has-feedback">
          <label class="control-label" for="pet_detail">특이사항</label>
          <textarea class="form-control" id="pet_detail" name="pet_detail" readonly="readonly"><c:out value="${read.pet_detail }"/></textarea>
       </div>
       
       <div class="form-group has-feedback">
          <label class="control-label" for="pet_name">이름</label>
          <input class="form-control" type="text" id="pet_name" name="pet_name" readonly="readonly" value="${read.pet_name }">
       </div>
       
       <div class="form-group has-feedback">
          <label class="control-label" for="pet_image">사진</label>
			<img src="/resources/petinfo/${read.pet_image}"/>
       </div>
       
       <div class="form-group has-feedback">
				<button type="button" class="update_btn">펫 정보 수정</button>
				<button type="button" class="delete_btn">펫 정보 삭제</button>
       </div>
</section>
</body>
</html>