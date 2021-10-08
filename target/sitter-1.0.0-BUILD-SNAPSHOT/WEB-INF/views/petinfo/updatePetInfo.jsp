<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/petinfo/petinfo.css"/>" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>petinfo UpdateForm</title>
</head>


<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='readForm']");

	
	$(".cancel").on("click" , function(){

		     location.href = "/petinfo/petInfo?pno=${update.pno}";
		})
		
     $(".update_btn").on("click", function() {

    	    if($("#pet_type").val() == "")
		     {
               alert("품종을 입력해주세요.");
               $("#pet_type").focus();
               return false;
		     }
	     
	     if($("#pet_gender").val() == "")
		     {
               alert("애완동물의 입력해주세요.");
               $("#pet_gender").focus();
               return false;
		     }
	     
	     if($("#pet_detail").val() == "")
		     {
               alert("한줄이여도 좋아요 ㅠ.ㅠ 특이사항을 적어주세요");
               $("#pet_detail").focus();
               return false;
		     }
	     
	     if($("#pet_name").val() == "")
		     {
               alert("이름을 입력해주세요.");
               $("#pet_name").focus();
               return false;
		     }
	     
	     if($("#pet_image").val() == "")
		     {
               alert("사진을 등록해주세요!!");
               $("#pet_image").focus();
               return false;
		     }
	     
	     if($("#user_email").val() == "")
		     {
               alert("주인님의 이메일을 등록해주세요!!");
               $("#user_email").focus();
               return false;
		     }
	     
 		formObj.attr("action", "/petinfo/update");
 		formObj.attr("method", "post");
 		formObj.submit();	
          })
	})

			function openWin(pno){
		var url="/petinfo/updatePetImage?pno=${update.pno}";
		var name="imageUpdate";
		var option="_blank, width=400, height=350, resizable=false";
		window.open(url,name,option);
	}      
</script>
<body>
<c:import url="../common/nav.jsp"></c:import>
<div class="center">

	<div class="ifsec">
	<div class="sec-top">
	<p>펫 등록하기</p>
	</div>
			<div class="sec-if">
			
		
			<form name="updateForm" role="form" action="/petinfo/update" method="post">
			<input type="hidden" name="pet_gender" value="${update.pet_gender}">
			<div class="con"></div>
			<input type="hidden" id="pno" name="pno" value="${update.pno}"/>
			<div class="image-wrap">	
			<img class="rounded mx-auto d-block" src="/resources/petinfo/${update.pet_image}"/>
			<button type="button" id="image-edit" onclick="openWin()">이미지수정</button>
			</div>
			<hr>
			<div class="con">
			<label for="pet_name">이름</label>
			<input type="text" id="pet_name" name="pet_name" value="${update.pet_name}"/>	
			</div>
			<div class="con">
			<label for="pet_type">품종</label>
			<input type="text" id="pet_type" name="pet_type" value="${update.pet_type}"/>	
			</div>
			<div class="con">
			<label for="pet_age">나이</label>
			<input type="text" id="pet_age" name="pet_age" value="${update.pet_age}"/>	
			</div>

			<div class="con">
			<label for="pet_detail" id="detail-label">내용</label>
			<textarea id="detailWrite" name="pet_detail"><c:out value="${update.pet_detail}"/></textarea>
			</div>

			<div class="btn">
				<button type="submit" class="update_btn" >저장</button>
				<button type="button" class="cancel" id="cancel-btn">취소</button>
			</div>
			</form>
			</div>
		</div>
		</div>
</body>
</html>