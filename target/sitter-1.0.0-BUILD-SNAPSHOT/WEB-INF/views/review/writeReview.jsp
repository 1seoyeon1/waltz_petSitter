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
<title> 후 기 글 쓰 기 p a g e </title>

</head>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function() {

		if ($("#r_title").val() == "") {
			alert("제목을 적어주세요");
			$("#r_title").focus();
			return false;
		}
		if ($("#r_content").val() == "") {
			alert("내용을 적어주세요.");
			$("#r_content").focus();
			return false;
		}
		if ($("#rateChk").val() == "" || $("#rateChk").val() == 0) {
			alert("별점을 입력해주세요.");
			$("#r_rate").focus();
			return false;
		}
		if ($("#file").val() == "") {
	          $("#file").attr("value", "noimg.gif");
			}
/*		if ($("#file").val() == "") {
			alert("사진을 넣어주세요");
			$("#image").focus();
			return false;
		}
*/		if(fn_valiChk()) {
			return false;
			}
		formObj.attr("action", "/review/writeReview");
		formObj.attr("method" ,"post");
		formObj.submit();		
	});
})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		// 폼이름이 writeForm이고 .chk.length에 의미는 .chk가 몇개있는지 찾는것이다.
		for(var i=0; i <regForm; i++) {
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
		<form name="writeForm" method="post" action="/review/writeReview" enctype="multipart/form-data" class="whole-form">
	
			<div class="info-input">
			<textarea id="r_title" name="r_title" class="chk" placeholder="제목을 입력하세요."></textarea>
			</div>
			
			<div class="info-input">
			<textarea id="r_content" name="r_content" class="chk" title="내용을 입력하세요."></textarea>
			</div>
			
           	<input type="hidden" value="0" name="r_rate" id="rateChk" />
			<div class="all_star">
				<input type="checkbox" id="r_rate1" class="star" value="1" onclick="check1();" />&nbsp;&nbsp;
				<input type="checkbox" id="r_rate2" class="star" value="2" onclick="check2();"/>&nbsp;&nbsp;
				<input type="checkbox" id="r_rate3" class="star" value="3" onclick="check3();"/>&nbsp;&nbsp;
				<input type="checkbox" id="r_rate4" class="star" value="4" onclick="check4();"/>&nbsp;&nbsp;
				<input type="checkbox" id="r_rate5" class="star" value="5" onclick="check5();"/>
			</div>			

			<div class="filebox">
			<input class="upload-name" value="첨부파일" placeholder="첨부파일">
			<label for="file">이미지</label>
			<input type="file" name="image" id = "file" class="chk" />
			</div>
			
			<c:forEach items="${list2}" var="list2">
			
			<input type="hidden" name="reno" id="reno" value="${list2.reno}">
			<input type="hidden" id="ruse_date" name="ruse_date" value="${list2.start_date} ~ ${list2.end_date}"readonly/>
			
			<br/>
			<input type="hidden" id="sitter_email" name="sitter_email" value="${list2.sitter_email }" readonly/>
			
			</c:forEach>
			<input type="hidden" id="user_email" name="user_email" value="${member}">
			<div>
			<a class="write_btn" type="submit">작성</a>
			<a class="list" href="/sitter/memReserve_rq_list">목록</a>
			</div>
		</form>
	</div>
	</section>	
</div>
<script type="text/javascript">
$("#file").on('change', function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
</script>
</body>
</html>