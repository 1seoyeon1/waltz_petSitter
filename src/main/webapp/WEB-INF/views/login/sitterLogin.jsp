<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/login/sitterlogin.css"rel="stylesheet">
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

		     if($("#sitter_email").val() == "")
			     {
                    alert("아이디를 입력해주세요.");
                    $("#sitter_email").focus();
                    return false;
			     }
		     if($("#sitter_password").val() == "")
			     {
                    alert("비밀번호를 입력해주세요.");
                    $("#sitter_password").focus();
                    return false;
			     }
		});
})
</script>


<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<meta charset="UTF-8">

    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />



<title>sitter login form</title>
</head>
<body>

<c:import url="../common/nav.jsp"></c:import> 

<div class="main">
      <p class="sign" align="center">훈련사 로그인 </p>
      <form class="form1" action="/login/sitterLogin" method="post">
        <input class="un " type="email" id="sitter_email" name="sitter_email" placeholder="이메일">
        <input class="pass" type="password" id="sitter_password" name="sitter_password" placeholder="비밀번호">
        <button class="submit" id="submit1">Login</button>
        <p class="forgot" align="center"><a href="/join/sitterRegister">회원이 아니신가요?</a></p>
	
	
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