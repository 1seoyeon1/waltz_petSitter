<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterboard.css"rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
		 
	$("#searchType").change(function(){
	var val=$(this).val();
		if(val=="pu" || val=="pd"){
			$("#radiobtn").show();
			$("#radiobtn-g, .srch-input").hide();
			$("#radiobtn").css("display","grid");
			}
		else if(val=="g"){
			$("#radiobtn-g").show();
			$("#radiobtn, .srch-input").hide();
			$("#radiobtn-g").css("display","grid");
			}
		else{
			$("#radiobtn-g, #radiobtn").hide();
			$(".srch-input").show();
			}
		});
});
function getValue(){
	var chv = $("input[name='keywordr']:checked").val();
	$("input[name='keyword']").val(chv);
	}
function getgValue(){
	var chv = $("input[name='keywordg']:checked").val();
	$("input[name='keyword']").val(chv);
	}
function gorv(){
	var id=$('#idval').value;
	alert(id);
	location.href='/review/boardReview?searchType=s&sitter_email='+id;
}
</script>
<meta charset="UTF-8">
<title>Sitter Profile Board</title>
</head>
<body>
<c:import url="../common/nav.jsp"></c:import>
<div class="page-top">
<h1 class="top-h"> SITTER 모두 보기 </h1>
<p class="top-p"> 총 씨터  ${pageMaker.totalCount} 명 </p>
</div>
<form role="form" method="get">

<div class="srchpt">
<div class="searchch">
<select name="searchType" class="form-select" id="searchType" style="height:35px;">
<option value="n"<c:out value="${scri.searchType==null ? 'selected' : ''}"/> >검색</option>
<option value="e"<c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>아이디</option>
<option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>지역</option>
<option value="g"<c:out value="${scri.searchType eq 'g' ? 'selected' : ''}"/>>성별</option>
<option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
<option value="pu"<c:out value="${scri.searchType eq 'pu' ? 'selected' : ''}"/>>금액이상</option>
<option value="pd"<c:out value="${scri.searchType eq 'pd' ? 'selected' : ''}"/>>금액이하</option>
</select>
</div>

<div class="srch-input">
<img class="srch-icon" src="/upload/img/search.png">
<input type="text" autocomplete="off" name="keyword" id="keywordInput" placeholder="sitter 찾기 " value="${scri.keyword}">
</div>
<div id="radiobtn" style="display:none;" class="form-check" >
<input type="radio"  name="keywordr" id="keywordInput" value="10000" onclick="getValue()" >1만원
<input type="radio"  name="keywordr" id="keywordInput" value="30000" onclick="getValue()">3만원
<input type="radio"  name="keywordr" id="keywordInput" value="50000" onclick="getValue()">5만원
<input type="radio"  name="keywordr" id="keywordInput" value="100000" onclick="getValue()">10만원
</div>
<div id="radiobtn-g" style="display:none;" class="form-check" >
<input type="radio"  name="keywordg" id="keywordInput" value="남자" onclick="getgValue()">남자
<input type="radio"  name="keywordg" id="keywordInput" value="여자" onclick="getgValue()">여자
</div>
<img id="searchBtn" title="검색" class="srch-btn" src="/upload/img/search.png">
<img id="resetBtn" title="초기화" class="reset-btn" src="/upload/img/reset.png" onclick="location.href='/sitter/profileBoard'">
</div>

<script>
$(function(){
	$('#searchBtn').on("click",function(){
		self.location="profileBoard"+'${pageMaker.makeQuery(1)}'+"&searchType="+$("select option:selected").val()+"&keyword="+encodeURIComponent($('#keywordInput').val());
		$("#keywordInput").val('');
	});
});
</script>

<div class="list">
<c:forEach items="${profileList}" var="sblist" >

<div class="img-info">
<div class="border border-4" style="z-index: 1;">
<a href="/sitter/profileView?sitter_email=${sblist.sitter_email}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
<img class="rounded mx-auto d-block" src="/upload/sitter_profile/${sblist.sitter_image}">
</a>
</div>

<div class="info">
<div class="sit-top">
<div class="name" style="width:300px">
<p>Waltz Sitter</p>
<h2 class="sitname">
Sitter : <c:out value="${sblist.sitter_name}"/></h2>
</div>
<div class="rate" style="width:50px">
<p style="text-align: center;"> 평점 </p>
<img src="/upload/img/rate.png"><c:out value="${sblist.rate}"/>
</div>
</div>
<div class="sitinfo">
<span class="spinfo">
<label>
요  금  : 
</label>
<c:out value="${sblist.sitter_price}"/>
</span>
<span class="spinfo">
<label>
성  별  : 
</label>
<c:out value="${sblist.sitter_gender}"/>
</span>
<span class="spinfo">
<label>
지  역  : 
</label>
<c:out value="${sblist.sitter_addr}"/>
</span>
</div>
<div class="rvpt">
<c:set var="id" value="${sblist.sitter_email}"/>
<p><strong> ${sblist.sitter_email}</strong> 님의 후기가 <span class="blue"> ${sblist.count} </span> 건 있습니다.</p>
<c:if test="${sblist.count ne 0}">
<button type="button" id="btnn" onclick="location.href='/review/boardReview?searchType=s&keyword='+'${sblist.sitter_email}'">후기 보러가기 </button>
</c:if>
</div>
</div>
</div>
</c:forEach>
</div>

<div class="col-md-offset-3">
<ul class="pagination" style="margin-right: 55%">
<c:if test="${pageMaker.prev}">
<li><a href="profileBoard${pageMaker.makeSearch(pageMaker.startPage-1)}">이전</a></li></c:if>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page==idx ? 'class=info':''}"/>>
<a href="profileBoard${pageMaker.makeSearch(idx)}">${idx}</a></li></c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage >0}">
<li><a href="profileBoard${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a></li></c:if>
</ul>
</div>

</form>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>