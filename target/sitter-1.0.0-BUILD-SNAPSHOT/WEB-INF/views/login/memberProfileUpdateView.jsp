<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/memberProfile/memberProfileUpdate.css" rel="stylesheet">

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

})       
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:import url="../common/nav.jsp"></c:import>
<body>


<div class="center">

<div class="ifsec">
<div class="sec-top">
<p>사용자 프로필 수정</p>
<hr>
</div>

<div class="sec-if">



<form action="/login/memberProfileUpdate" method="post">    

   
       
       <div class="con">
          <label class="control-label" for="user_name">이름</label>
          <input class="form-control" type="text" id="user_name" name="user_name" value="${updateprofile.user_name}" />
       </div>
   
       
       <div class="con">
          <label class="control-label" for="user_phone">핸드폰 번호</label>
          <input class="form-control" type="text" id="user_phone" name="user_phone" value="${updateprofile.user_phone}" />
       </div>
       
       
       <div class="con">
          <label class="control-label" for="user_password">비밀번호</label>
          <input class="form-control" type="password" id="user_password" name="user_password" value="${updateprofile.user_password}" />
       </div>
       
       
   
       
       <div class="btn">
          <button  type="submit" id="update" >수정하기</button>
          <button class="cancel" type="button" id="cancel">홈페이지로 이동</button>
       </div>


</form>


</div>
</div>
</div>



</body>
</html>