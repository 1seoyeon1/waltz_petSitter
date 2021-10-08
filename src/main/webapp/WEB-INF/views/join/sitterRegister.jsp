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
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<title>sitterRegister</title>

<style>

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

 .sitterEmailChk{
    background-color: #0066FF;
    border-radius: 8px;
    color: white;
    border: solid 0px white;
    margin-left: 38%;
	margin-bottom: 5%;
	}

 .sitterPhoneChk{
    background-color: #0066FF;
    border-radius: 8px;
    color: white;
    border: solid 0px white;
    margin-left: 38%;
}

</style>

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
				 	alert("이메일 중복확인을 먼저 진행해주세요");
				 	$("#sitter_email").focus();
				 	return false;
					}
				
			if($(".sitterPhoneChk").val() == "N"){
				 	alert("핸드폰 번호 확인을 먼저 진행해주세요");
				 	$("#sitter_phone").focus();
				 	return false;
					}
        
		});

		
})


function fn_sitterEmailChk(){

    var inputVal = $("#sitter_email").val();
    var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

	
	if($("#sitter_email").val() == "")
	{
		alert("이메일이 입력되지 않았습니다")
	}
    else if (!emailReg.test(inputVal)){
        $("#sitter_email").after(alert("이메일 형식이 아닙니다."));

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



	var text = $("#sitter_phone").val();

    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

    
	 if($("#sitter_phone").val() == '') 
		{
		  alert("핸드폰 번호가 입력되지 않았습니다");
		}

    else if (regPhone.test(text) == false) {
        alert("핸드폰 번호 형식이 아닙니다.");
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

function chkPW(){

	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

	var pw = $("#sitter_password").val();

	if(pw.length < 8 || pw.length > 16){
		  alert("8자리 ~ 16자리 이내로 입력해주세요.");
		  return false;
	 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
	}
}

 function chkPW1() {

	 var pw = $("#sitter_password").val();
	 var pw1 = $("#sitter_password1").val();

	 if(pw != pw1) {
		 	document.getElementById('checkPwd').style.display="block"; // 보이기
		 	document.getElementById('checkPwd1').style.display="none"; 
		 } else {
		 	document.getElementById('checkPwd').style.display="none";
		 	document.getElementById('checkPwd1').style.display="block";
			 }
	 }
</script>



</head>
<body>

<c:import url="../common/nav.jsp"></c:import> 

<div class="main">
      <p class="sign" align="center">훈련사 회원가입 </p>
      
      <form class="form1" action="/join/sitterRegister" method="post">
       
       
        <input class="un2" type="email" id="sitter_email" name="sitter_email" placeholder="이메일">
        <div class="display">
        <button class="sitterEmailChk" type="button" id="email-btn" onclick="fn_sitterEmailChk()" value="N">이메일 중복확인</button>				
        </div>
       
       <div class="pass_group">
        <input class="un4" type="password" id="sitter_password" name="sitter_password" placeholder="비밀번호" onchange="chkPW()">

        <input class="un4" type="password" id="sitter_password1" name="sitter_password1" placeholder="비밀번호 재확인" onchange="chkPW1()">
        <label class ="check_Pwd" id="checkPwd" style="display:none; color: red; text-align: center; margin-bottom: 6%;">동일한 암호를 입력하세요.</label>
        <label class ="check_Pwd1" id="checkPwd1" style="display:none; color: blue; text-align: center; margin-bottom: 6%;">비밀번호가 일치합니다.</label>
	   </div>
        
        
        <input class="un" type="text" id="sitter_name" name="sitter_name" placeholder="이름">
        
        
        
        
        <input class="un2" type="number" id="sitter_phone" name="sitter_phone" placeholder="핸드폰 번호">
        <div>
        <button class="sitterPhoneChk" type="button" id="phone-btn" onclick="fn_sitterPhoneChk()" value="N">핸드폰 번호 확인</button>				
        </div>       
        
        
               

         <div class="gender">
           <div class="un1">
                <input type="radio" id="sitter_gender" name="sitter_gender" value="남자" checked="checked">남자 &nbsp; &nbsp; &nbsp;
                <input type="radio" id="sitter_gender" name="sitter_gender" value="여자">여자
           </div>
         </div>	
        
        
        <div class="display">
        <button class="submit" id="submit">회원가입</button>
        <button class="cancel" type="button" id="cancel">목록으로 이동</button>		
        </div>
        
        <p class="forgot" align="center"><a href="/login/sitterLogin" id="a1">이미 회원이신가요?</a></p>
        
</form>

</div>	


		
<c:import url="../common/footer.jsp"></c:import> 
</body>
</html>