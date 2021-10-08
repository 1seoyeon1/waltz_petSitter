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
		
	$("#submit").on("click" , function(){

		     if($("#sitter_email").val() == "")
			     {
                    alert("아이디를 입력해주세요.");
                    $("#sitter_email").focus();
                    return false;
			     }
		     if($("#sitter_pass").val() == "")
			     {
                    alert("비밀번호를 입력해주세요.");
                    $("#sitter_pass").focus();
                    return false;
			     }
		});
})
</script>


<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<meta charset="UTF-8">


<title>sitter login form</title>
</head>
<body>

       

<form action="/login/sitterLogin" method="post">
    <div class="page-container">
        
            
      <div class="login-form-left-side">
            
      <img class="img" src="/resources/images/brandlogo.jpg">
      
        <h1>훈련사 전용</h1>
                
          <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_email">이메일</label>
          <input class="form-control" type="email" id="sitter_email" name="sitter_email"/>
       </div>
       
    
       <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_password">비밀번호</label>
          <input class="form-control" type="password" id="sitter_password" name="sitter_password"/>
       </div>
                
                
       <div class="form-group has-feedback" id="margin">
          <button  type="submit" id="submit">로그인</button>
          <button  type="button" id="cancel">취소</button>       
       </div>
                
                                                
                
            </div>
        </div>
    
    </form>
    
    <c:if test="${loginChk eq '0' }">
	<script type="text/javascript">
	alert("회원이 아닙니다.");
	</script>
	</c:if>
</body>

</html>