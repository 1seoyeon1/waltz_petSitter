<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/login/MemberRegister.css"rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Member Register</title>

<script type="text/javascript">
	$(document).ready(function() {

		// 목록 이동
		$("#cancel").on("click", function() {
			location.href = "/";
		});

		
     				
		// 회원가입 
		$("#submit").on("click", function() {

			if ($("#user_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#user_email").focus();
				return false;
			}

			
			if ($("#user_pass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_pass").focus();
				return false;
			}

			if ($("#user_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}

			if ($("#user_phone").val() == "") {
				alert("핸드폰 번호를 입력해주세요.");
				$("#user_phone").focus();
				return false;
			}

			if ($("#user_gender").val() == "") {
				alert("성별을 체크해주세요.");
				$("#user_gender").focus();
				return false;
			}
			if($(".memberEmailChk").val() == "N"){
			 	alert("중복된 이메일을 사용할수 없습니다.");
			 	$("#user_email").focus();
			 	return false;
				}
			if($(".memberPhoneChk").val() == "N"){
			 	alert("중복된 전화번호를 사용할수 없습니다.");
			 	$("#user_phone").focus();
			 	return false;
				}
		});

	})

function fn_memberEmailChk(){
	if($("#user_email").val() == ""){
		alert("이메일이 입력되지 않았습니다.")
		}
	else{
    $.ajax({
      url : "/join/memberEmailChk",
      type : "post",
      dataType : "json",
      data : {"user_email" : $("#user_email").val()},
      success : function(data){
        if(data == 1)
        {
          $("#emailbtn").attr("value", "N");
          alert("중복된 이메일입니다.");
        }
        else if(data == 0)
        {
          $("#emailbtn").attr("value", "Y");
          $("#user_email").attr('readonly', true);
          alert("사용가능한 이메일입니다.");
        }
      }
    })
	}
  }
	
function fn_memberPhoneChk(){
	if($("#user_phone").val() == "")
		{
           alert("핸드폰 번호가 입력되지 않았습니다")
		}
	else
		{
          $.ajax({
            url : "/join/memberPhoneChk",
            type : "post",
            dataType : "json",
            data : {"user_phone" : $("#user_phone").val()},
            success : function(data){
              if(data == 1)
              {
                $("#phonebtn").attr("value", "N");
                alert("이미 사용중인 핸드폰 번호입니다ㅠ.ㅠ");
              }
              else if(data == 0)
              {
                $("#phonebtn").attr("value", "Y");
                $("#user_phone").attr("readonly", true);
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

	
	<div class="memberRegisterForm">
	
	   <img class="img" src="/resources/images/brandlogo.jpg">

		<form action="/join/memberRegister" method="post">
			<div class="form-group has-feedback" id="form-group">
				<label class="control-label" for="user_email">이메일</label> 
				<input class="form-control" type="email" id="user_email" name="user_email" />
				<button class="memberEmailChk" type="button" id="emailbtn" onclick="fn_memberEmailChk()" value="N">이메일 중복확인</button>
			</div>
			
			
			<div class="form-group has-feedback" id="form-group">
				<label class="control-label" for="user_password">비밀번호</label> <input
					class="form-control" type="password" id="user_password"
					name="user_password" />
			</div>


			<div class="form-group has-feedback" id="form-group">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name" />
			</div>


			<div class="form-group has-feedback" id="form-group">
				<label class="control-label" for="user_phone">핸드폰</label>
				<input class="form-control" type="text" id="user_phone" name="user_phone" />
			<button class="memberPhoneChk" type="button" id="phonebtn" onclick="fn_memberPhoneChk()" value="N">핸드폰 번호 확인</button>
			</div>


			<div class="form-group has-feedback" id="form-group">
				<label class="control-label" for="user_gender">성별</label> 
				<br>
           &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" id="user_gender" name="user_gender" value="남자" checked="checked">남자 &nbsp;&nbsp;&nbsp;
                <input type="radio" id="user_gender" name="user_gender" value="여자">여자
			</div>




			<div class="form-group has-feedback">
				
				<button type="submit" id="submit">회원가입</button>
				<button type="button" id="cancel">목록으로 이동</button>
				
			</div>
		</form>

</div>
</body>
</html>