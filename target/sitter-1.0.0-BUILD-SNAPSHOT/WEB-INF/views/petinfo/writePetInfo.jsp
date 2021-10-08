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
<title>write petinfo form</title>
</head> 
<script type="text/javascript">

$(document).ready(function(){

	$(".cancel").on("click" , function(){

		location.href="/";
		})
    
	$("#submit").on("click" , function(){

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
		});
})
</script>

<body>
<c:import url="../common/nav.jsp"></c:import>

<div class="center">

<div class="ifsec">
<div class="sec-top">
<p>펫 등록하기</p>
<hr>
</div>

<div class="sec-if">

 
    <form action="/petinfo/infowrite" method="post" enctype="multipart/form-data">
       
       <div class="con">
          <label class="control-label" for="pet_type">품종</label>
          <input class="form-control" type="text" id="pet_type" name="pet_type"/>
       </div>
       
       <div class="con">
          <label class="control-label" for="pet_age">나이 </label>
          <input class="form-control" type="text" id="pet_age" name="pet_age">
       </div>
              
       
       <div class="form-group has-feedback" id="gender-group">
				<label class="control-label" id="gen" for="user_gender">성별</label> 
				<div class="gender-select">
           &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pet_gender" value="남자" checked="checked">남자 &nbsp;&nbsp;&nbsp;
                <input type="radio" name="pet_gender" value="여자">여자
                </div>
			</div>
       
       
       <div class="con">
          <label class="control-label" for="userId">특이사항</label>
          <textarea class="form-control" id="infoWrite" name="pet_detail" maxlength="200"></textarea>
       </div>
       
       <div class="con">
          <label class="control-label" for="userId">이름</label>
          <input class="form-control" type="text" name="pet_name"/>
       </div>
       
       <div class="con">
          <label class="control-label" for="pet_image">사진</label>
          <input class="form-control" type="file" id="pet_image" name="image"/>
       </div>
       
		<input type="hidden" id="user_email" name="user_email" value="${member}"/>
			       
       
       <div class="btn">
          <button  type="submit" id="submit">펫 정 보 작 성 완 료 </button>
          <button class="cancel" id="cancel-btn" type="button">목록으로 이동</button>       
       </div>
       
       
       
 </form>


</div>
</div>
</div>

</body>
</html>