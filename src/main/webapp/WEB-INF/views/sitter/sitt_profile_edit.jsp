<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitteredit.css"rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".cancelbtn").on("click",function(){
		location.href="/sitter/profileView?sitter_email=${profileEdit.sitter_email}";
			});
})
</script>
<meta charset="UTF-8">
<title>Sitter Profile Edit</title>
</head>
<body>
<c:import url="../common/nav.jsp"></c:import>
<div class="page-top">
<h1 class="top-h">프로필 수정 페이지</h1>
<p><span style="font-size : 17px; font-weight : 600; color :  #1890FF;">${profileEdit.sitter_email}&nbsp;</span><span> 님 정보 수정 페이지</span></p> 
</div>
<div class="edtpt">

<form name="viewForm" role="form" action="/sitter/profileEdit" method="post" >
<div class="ifsec">
<div class="sec-top">
<p>프로필 정보</p>
<hr>
</div>
<div class="sec-if">
<div class="con">
<label for="sitter_name">이름</label>
<input type="hidden" id="sitter_email" name="sitter_email" value="${profileEdit.sitter_email}">
<input type="text" id="sitter_name" name="sitter_name" value="${profileEdit.sitter_name}" >
</div>
<div class="con">
<label for="sitter_gender">성별</label>
<input type="text" id="sitter_gender" name="sitter_gender" value="${profileEdit.sitter_gender}" readonly>
</div>
<div class="con">
<label for="sitter_addr">지역</label>
<input style="width : 210px;" type="text" id="sample5_address" name="sitter_addr" placeholder="주소" value="${profileEdit.sitter_addr}">
<input style="width: 70px;font-size: 13px;" type="button" id="sambtn" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
</div>
<div class="con">
<label for="sitter_price">요금</label>
<input type="number" id="sitter_price" name="sitter_price" step="500" value="${profileEdit.sitter_price}" />원
</div>
<div class="con">
<label for="sitter_phone">전화번호</label>
<input type="text" id="sitter_phone" name="sitter_phone" value="${profileEdit.sitter_phone}" />
</div>
<div class="con" style="display:flex; align-items:flex-start;">
<label for="sitter_exp">경력</label>
<textarea id="sitter_exp" name="sitter_exp"><c:out value="${profileEdit.sitter_exp}"/></textarea>
</div>
<div class="con" style="display:flex; align-items:flex-start;">
<label for="sitter_intro">자기소개</label>
<textarea id="sitter_intro" name="sitter_intro"><c:out value="${profileEdit.sitter_intro}"/></textarea>
</div>
<div class="btn">
	<button type="submit" class="sub">저장</button>
	<button type="button" class="cancelbtn" onclick="location.href='/sitter/profileView?sitter_email=${profileEdit.sitter_email}'">취소</button>
</div>
</div>
</div>
</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1807e8ae240d702dcb6050c5664fbef8&libraries=services"></script>
<script>
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                });
            }
        }).open();
    }
</script>

<c:import url="../common/footer.jsp"></c:import>
</body>
</html>