<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/memberProfile/memberProfileView.css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript">

$(document).ready(function(){
    // 취소
    $(".cancel").on("click", function(){

           location.href = "/";

        })
        


     // 수정 버튼을 누르면 값을 가지고 수정페이지로 넘어감
        $("#update").on("click" , function(){

                 location.href = "memberProfileUpdateView";
            })
	
     
     // 삭제 버튼을 누르면 값을 가지고 삭제페이지로 넘어감
        $("#delete").on("click" , function(){
        
                                
                 location.href = "memberDeleteView";

            })
	
     
	
})

</script>

<meta charset="UTF-8">
<title>Member Profile</title>
</head>
<body>
<c:import url="../common/nav.jsp"></c:import>

<div class="center">

<div class="ifsec">
<div class="sec-top">
<p>사용자 프로필 정보</p>
<hr>
</div>

<div class="sec-if">
       
       
       <div class="con">
          <label class="control-label" for="user_email">이메일</label>
          <input class="form-control" type="text" id="user_email" name="user_email" value="${mprofile.user_email}" readonly="readonly"/>
       </div>
       
       
       
       
       <div class="con">
          <label class="control-label" for="user_name">이름</label>
          <input class="form-control" type="text" id="user_name" name="user_name" value="${mprofile.user_name}" readonly="readonly"/>
       </div>
   
       
       <div class="con">
          <label class="control-label" for="user_phone">핸드폰 번호</label>
          <input class="form-control" type="text" id="user_phone" name="user_phone" value="${mprofile.user_phone}" readonly="readonly"/>
       </div>
   
       
       <div class="btn">
          <button  type="button" id="update" >수정하기</button>
          <button  type="button"  id="delete">회원 탈퇴</button>
          <button class="cancel" type="button" id="cancel">홈페이지로 이동</button>       
       </div>

</div>

</div>

</div>

</body>
</html>