<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/login/memberlogin.css" rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript">


$(document).ready(function(){
	// 목록 이동
	$("#cancel").on("click" , function(){
		     location.href = "/";
		})
		
	$("#submit1").on("click" , function(){

		     if($("#user_email").val() == "")
			     {
                    alert("아이디를 입력해주세요.");
                    $("#user_email").focus();
                    return false;
			     }
		     if($("#user_pass").val() == "")
			     {
                    alert("비밀번호를 입력해주세요.");
                    $("#user_pass").focus();
                    return false;
			     }
		});
})
	
</script>


<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

<title>member login form</title>
</head>
<body>

<c:import url="../common/nav.jsp"></c:import> 

<div class="main">
      <p class="sign" align="center">사용자 로그인 </p>
      <form class="form1" action="/login/memberLogin" method="post">
        <input class="un " type="email" id="user_email" name="user_email" placeholder="이메일">
        <input class="pass" type="password" id="user_password" name="user_password" placeholder="비밀번호">
        <button class="submit" id="submit1">Login</button>
        <p class="forgot" align="center"><a href="/join/memberRegister">회원이 아니신가요?</a></p>
	
	
<c:if test="${loginChk eq '0' }">
	<script type="text/javascript">
	alert("회원이 아닙니다.");
	</script>
	</c:if>
	
<c:if test="${loginChk eq '1' }">
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다.");
	</script>
	</c:if>
	</form>
	</div>
	


<c:import url="../common/footer.jsp"></c:import> 
</body>

</html>