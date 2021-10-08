<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/login/sitterRegister.css"rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function(){

	// 목록 이동
	$("#cancel").on("click" , function(){

		     location.href = "/";
        
		})

    
	$("#submit").on("click" , function(){

		     if($("#sitter_email").val() == "")
			     {
                    alert("이메일을 입력해주세요.");
                    $("#sitter_email").focus();
                    return false;
			     }
		     
		     if($("#sitter_pass").val() == "")
			     {
                    alert("비밀번호를 입력해주세요.");
                    $("#sitter_pass").focus();
                    return false;
			     }
		     
		     if($("#sitter_name").val() == "")
			     {
                    alert("성명을 입력해주세요.");
                    $("#sitter_name").focus();
                    return false;
			     }
        
		     
		     if($("#sitter_phone").val() == "")
			     {
                    alert("핸드폰 번호를 입력해주세요.");
                    $("#sitter_phone").focus();
                    return false;
			     }
        
		     
		     if($("#sitter_gender").val() == "")
			     {
                    alert("성별을 체크해주세요.");
                    $("#sitter_gender").focus();
                    return false;
			     }

		     if($(".sitterEmailChk").val() == "N"){
				 	alert("중복된 이메일을 사용할수 없습니다.");
				 	$("#sitter_email").focus();
				 	return false;
					}
				
			if($(".sitterPhoneChk").val() == "N"){
				 	alert("중복된 전화번호를 사용할수 없습니다.");
				 	$("#sitter_phone").focus();
				 	return false;
					}
        
		});

		
})


function fn_sitterEmailChk(){
	if($("#sitter_email").val() == "")
	{
		alert("이메일이 입력되지 않았습니다")
	}
	else
    {  
       
    $.ajax({
      url : "/join/sitterEmailChk",
      type : "post",
      dataType : "json",
      data : {"sitter_email" : $("#sitter_email").val()},
      success : function(data){
        if(data == 1)
        {
          alert("중복된 이메일입니다.");
        }
        else if(data == 0)
        {
          $(".sitterEmailChk").attr("value", "Y");
          $("#sitter_email").attr("readonly", true);
          alert("사용가능한 이메일입니다.");
        }
      }
    })
    }  
  }

function fn_sitterPhoneChk(){
	if($("#sitter_phone").val() == "")
		{
		  alert("핸드폰 번호가 입력되지 않았습니다");
		}
	else
		{
  
    $.ajax({
      url : "/join/sitterPhoneChk",
      type : "post",
      dataType : "json",
      data : {"sitter_phone" : $("#sitter_phone").val()},
      success : function(data){
    	  if(data == 1)
          {
            alert("이미 사용중인 핸드폰 번호입니다ㅠ.ㅠ");
          }
          else if(data == 0)
          {
            $(".sitterPhoneChk").attr("value", "Y");
            $("#sitter_phone").attr("readonly", true);
            alert("사용가능한 핸드폰 번호입니다 *.*");
          }
        }
      })
		}
    }

</script>



</head>
<body>
<%-- <c:import url="../hello/nav.jsp"></c:import> --%>




	<div class="sitterRegisterForm">
	
	   <img class="img" src="/resources/images/brandlogo.jpg">


 
    <form action="/join/sitterRegister" method="post">
       
       <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_email">이메일</label>
          <input class="form-control" type="email" id="sitter_email" name="sitter_email"/>
          <button class="sitterEmailChk" type="button" id="emailbtn" onclick="fn_sitterEmailChk()" value="N">EMAIL 중복확인</button>
       </div>
       
       <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_name">성명</label>
          <input class="form-control" type="text" id="sitter_name" name="sitter_name"/>
       </div>
       
       <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_password">비밀번호</label>
          <input class="form-control" type="password" id="sitter_password" name="sitter_password"/>
       </div>
       
       
       <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_phone">핸드폰</label>
          <input class="form-control" type="text" id="sitter_phone" name="sitter_phone"/>
          <button class="sitterPhoneChk" type="button" id="phonebtn" onclick="fn_sitterPhoneChk()" value="N">핸드폰 번호 확인</button>
       </div>
       
       
       <div class="form-group has-feedback" id="form-group">
          <label class="control-label" for="sitter_gender">성별</label>
           <br>
           &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" id="sitter_gender" name="sitter_gender" value="남자" checked="checked">남자 &nbsp;&nbsp;&nbsp;
          <input type="radio" id="sitter_gender" name="sitter_gender" value="여자" >여자
       </div>
       
                
       
       
       <div class="form-group has-feedback">
          <button type="submit" id="submit">회원가입</button>
          <button id="cancel" type="button">목록으로 이동</button>       
       </div>
 
    
 </form>
 
</div>

</body>
</html>