<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/memberDelete/memberDelete.css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function(){
    // 취소
    $("#cancel").on("click", function(){

           location.href = "/";

        })
     
     // 삭제 버튼을 누르면 값을 가지고 삭제페이지로 넘어감
        $("#delete").on("click" , function(){
        
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
<p>사용자 프로필 삭제</p>
<hr>
</div>

<div class="sec-if">

<form action="/login/memberDeleteViewForm" method="post">



       <div class="con">
          <label>이메일</label>
          <input type="email" id="user_email" name="user_email" value="${member}" readonly/>
       </div>
       
       <div class="con">
          <label>비밀번호</label>
          <input type="password" id="user_password" name="user_password"/>
       </div>




<div class="btns">
  <button type="submit" value="삭제" id="delete">삭제</button>
  <button type="reset" id="cancel" value="취소">취소</button>
</div>

</form>


</div>
</div>
</div>


<c:if test="${lucky eq '0'}">
  <script type="text/javascript">
    alert("탈퇴 실패 이메일 또는 비밀번호를 확인해주세요");
  </script>
</c:if>



</body>
</html>