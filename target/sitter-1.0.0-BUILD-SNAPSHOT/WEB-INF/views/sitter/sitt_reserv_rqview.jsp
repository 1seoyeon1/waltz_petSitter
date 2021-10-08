<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterrqview.css"rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formm = $("form[name='rqView']");
	$(".rej_rq").on("click",function(){
		if(confirm('이 작업은 취소할 수 없습니다. 정말 거절하시겠습니까?')==true){
		formm.attr("action","/sitter/rqReject");
		formm.attr("method","get");
		formm.submit();
			} return;
		});

	$(".sub_rq").on("click",function(){
		if(confirm('이 작업은 취소할 수 없습니다. 수락하시겠습니까?')==true){
			formm.attr("action","/sitter/rqAccept");
			formm.attr("method","GET");
			formm.submit();
			} return;
			});
})
</script>
<meta charset="UTF-8">
<title>예약요청 내용보기</title>
</head>
<body>
<c:import url="../hello/nav.jsp"></c:import>
<div class="page-top">
<h1> 요청 내용 보기 </h1>
</div>
<div class="rqview">

<div class="conpt">
<c:if test="${rqView.chk eq 0}">
<button id="btn" type="button" class="sub_rq">수락</button>
<button id="btn" type="button" class="rej_rq">거절</button>
</c:if>
<button id="btn" type="button" class="back" onclick="javascript:history.go(-1)">뒤로</button>
<form name="rqView" role="form">
<div>
<input type="hidden" id="sitter_email" name="sitter_email" value="${rqView.sitter_email}">
<input type="hidden" id="reno" name="reno" value="${rqView.reno}">
<div class="con">
<label>발신자</label>
<input type="text" id="user_email" name="user_email" value="${rqView.user_email}" readonly>
</div>
<div class="con">
<label>제목</label>
<input type="text" id="subject" name="subject" value="${rqView.subject}" readonly>
</div>
<div class="con-date">
<div class="con">
<label>예약일자</label>
</div>
<div class="con">
<label>날짜 </label><input type="text" id="start_ate" name="start_date" value="${rqView.start_date}" readonly> ~
<input type="text" id="end_date" name="end_date" value="${rqView.end_date}" readonly>
</div>
<div class="con">
<label>시간 </label> 
<c:if test="${rqView.all_day eq 0}">
<input type="text" id="st_time" name="st_time" value="${rqView.st_time}" readonly> ~
<input type="text" id="ed_time" name="ed_time" value="${rqView.ed_time}" readonly>
</c:if>
<c:if test="${rqView.all_day eq 1}">
<input type="text" readonly value="하루 종일">
</c:if>
</div>
</div>
<div class="con">
<label>내용</label>
<textarea id="rq_memo" name="rq_memo" readonly><c:out  value="${rqView.memo}"/></textarea>
</div>

<div class="petpt">

<div>
<c:forEach items="${petinfo}" var="petinfo">
<div class="line">
<label class="ptlb">펫 정보</label>
</div>
<div class="petdt">
<div class="pet-img">
<div class="img-pt"><img class="img" src="/resources/petinfo/${petinfo.pet_image}"></div>
</div>
<div class="pet-info">
<div class="con"><label>품종 </label> <input type="text" value="${petinfo.pet_type}"></div>
<div class="con"><label>나이 </label> <input type="text" value="${petinfo.pet_age}"></div>
<div class="con"><label>성별 </label> <input type="text" value="${petinfo.pet_gender}"></div>
<div class="con"><label>특이사항</label><textarea rows = "5" cols = "55"><c:out value="${petinfo.pet_detail}"/></textarea></div>
</div>
</div>
</c:forEach>
</div>
</div>

</div>
</form>
</div>
</div>
</body>
</html>