<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/review/review_write.css" rel="stylesheet" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$("#cancel_btn").on("click", function() {
			event.preventDefault();
			/*
			이벤트를 취소하는 도중에 preventDefault를 호출하게되면,
			일반적으로 브라우저의 구현에 의해 처리되는 기존의 액션이 동작하지 않게되고
			그 결과 이벤트가 발생하지 않게됩니다.
			*/
			location.href = "/review/readReview?rno=${update.rno}"
						  + "&page=${scri.page}"
						  + "&perPageNum=${scri.perPageNum}"
						  + "&searchType=${scri.searchType}"
						  + "&keyword=${scri.keyword}";
			})

		$("#update_btn").on("click", function() {

			if ($("#r_title").val() == "") {
				alert("제목을 적어주세요");
				$("#r_title").focus();
				return false;
			}
			if ($("#ruse_date").val() == "") {
				alert("이용시간을 적어주세요");
				$("#ruse_date").focus();
				return false;
			}
			if ($("#r_content").val() == "") {
				alert("내용을 적어주세요.");
				$("#r_content").focus();
				return false;
			}
			if ($("#sitter_email").val() == "") {
				alert("시터 아이디를 적어주세요.");
				$("#sitter_email").focus();
				return false;
			}
			if ($("#rateChk").val() == "" || $("#rateChk").val() == 0) {
				alert("별점을 입력해주세요.");
				$("#r_rate").focus();
				return false;
			}

			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/review/update");
			formObj.attr("method", "post");
			formObj.submit();
			})
		})
		
		function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i=0; i <updateForm; i++) {
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			} 
		}

		function check1() {
			if($("#r_rate1").is(':checked')) {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", false);
				$("#r_rate3").prop("checked", false);
				$("#r_rate4").prop("checked", false);
				$("#r_rate5").prop("checked", false);
				}
			else {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", false);
				$("#r_rate3").prop("checked", false);
				$("#r_rate4").prop("checked", false);
				$("#r_rate5").prop("checked", false);
				}
	          $("#rateChk").attr("value", "1");
	}
	function check2() {
			if($("#r_rate2").is(':checked')) {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", false);
				$("#r_rate4").prop("checked", false);
				$("#r_rate5").prop("checked", false);
				}
			else{
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", false);
				$("#r_rate4").prop("checked", false);
				$("#r_rate5").prop("checked", false);
				}
	          $("#rateChk").attr("value", "2");
	}
	function check3() {
			if($("#r_rate3").is(':checked')) {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", true);
				$("#r_rate4").prop("checked", false);
				$("#r_rate5").prop("checked", false);
				}
			else {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", true);
				$("#r_rate4").prop("checked", false);
				$("#r_rate5").prop("checked", false);
				}
	          $("#rateChk").attr("value", "3");
	}
	function check4() {
			if($("#r_rate4").is(':checked')) {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", true);
				$("#r_rate4").prop("checked", true);
				$("#r_rate5").prop("checked", false);
				}
			
			else {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", true);
				$("#r_rate4").prop("checked", true);
				$("#r_rate5").prop("checked", false);
				}
	          $("#rateChk").attr("value", "4");
	}
	function check5() {
			if($("#r_rate5").is(':checked')) {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", true);
				$("#r_rate4").prop("checked", true);
				$("#r_rate5").prop("checked", true);
				}
			else {
				$("#r_rate1").prop("checked", true);
				$("#r_rate2").prop("checked", true);
				$("#r_rate3").prop("checked", true);
				$("#r_rate4").prop("checked", true);
				$("#r_rate5").prop("checked", true);
				}
	          $("#rateChk").attr("value", "5");
		}
		
</script>
<body>
<c:import url="../common/nav.jsp"></c:import>

<div id="root">
	<section id="container">
		<div class="whole-content">
		<form name="updateForm" role="form" action="/review/update" method="post" class="whole-form">
			<input type="hidden" id="rno" name="rno" value="${update.rno}" readonly="readonly"/>
			<input type="hidden" id="page" name="page" value="${scri.page}" >
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
		
	
			<div class="info-input">
			<textarea id="r_title" name="r_title" class="chk"><c:out value="${update.r_title}" /></textarea>
			</div>
			
			<input type="hidden" id="ruse_date" name="ruse_date" value="${update.ruse_date}" readonly/>
			
			<div class="info-input">
			<textarea id="r_content" name="r_content" class="chk" title="내용을 입력하세요."><c:out value="${update.r_content }" /></textarea>
			</div>
			
           	<input type="hidden" value="0" name="r_rate" id="rateChk" />
			<div class="all_star">
				<input type="checkbox" id="r_rate1" class="star" value="1" onclick="check1();" />&nbsp;&nbsp;
				<input type="checkbox" id="r_rate2" class="star" value="2" onclick="check2();" />&nbsp;&nbsp;
				<input type="checkbox" id="r_rate3" class="star" value="3" onclick="check3();" />&nbsp;&nbsp;
				<input type="checkbox" id="r_rate4" class="star" value="4" onclick="check4();" />&nbsp;&nbsp;
				<input type="checkbox" id="r_rate5" class="star" value="5" onclick="check5();" />
			</div>			
			<br/>

			<div>
			<input type="hidden" id="user_email" name="user_email" value="${member}">
			</div>
			
			<input type="hidden" id="sitter_email" name="sitter_email" value="${update.sitter_email}" readonly/>

			<div>
			<a class="write_btn" id="update_btn" type="submit">작성</a>
			<a class="list" type="button" id="cancel_btn">취소</a>
			</div>
			
		</form>
	</div>
	</section>
</div>
</body>
</html>