<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script>
function changeFC(color)
{document.getElementById("category_detail").style.backgroundColor = color;
}
</script>

<meta charset="UTF-8">
<title>Q&A 게시판</title>
</head>



<style>
	.nav-item{
		margin-left: 30px;
	}	
	.catchk #category_detail
</style>
<body>
<c:import url="../common/nav.jsp"></c:import>
<c:import url="./qnaSearch.jsp"></c:import>
<%-- 	<c:out value="${sessionScope.member}"/> --%>
	
		
		
		
		<div class="py-5" style="background-color:#F7F8FA">
		<div class="container">
		<!-- <h3 style="font-size: 23px; font-weight: 600; color: #555555;">자주 묻는 질문</h3> -->
		<!-- <div style="display: flex; overflow: scroll;"> -->
		<!-- <div style="display: flex; margin-top: 45px;  margin-bottom: 82px; flex-wrap: wrap; justify-content: space-between;"> -->
		
		<!-- <a href="">
		<div style="cursor: pointer; background-color: white; box-shadow: 0 2px 10px 0 rgb(0 0 0 / 9%);border-radius: 7px;
    display: inline-flex;justify-content: center;align-items: center;width: 145px;height: 50px;margin-bottom: 10px;margin-right: 10px;">
		<p style="font-weight: 500; font-size: 13px; letter-spacing: 0.1px; color: #555555;">산책을 무서워해요</p>
		</div>
		</a> -->
		
		
		
		
		
		<!-- </div> -->
		<!-- </div> -->
		<p id="qna_catagory_main">질문 카테고리</p>
		<div class="category">
		<a href="/qna/qnaMain"><div id="category_detail" class="catchk"><p>전체</p></div></a>
		<a href="/qna/qnaMain?keyword=%EB%B0%B0%EB%B3%80"><div id="category_detail" class="catchk" onClick="changeBTC('#95a5a6')"><p>배변</p></div></a>
		<a href="/qna/qnaMain?keyword=%EC%82%B0%EC%B1%85"><div id="category_detail" class="catchk"><p>산책</p></div></a>
		<a href="/qna/qnaMain?keyword=%EA%B3%B5%EA%B2%A9%EC%84%B1"><div id="category_detail" class="catchk"><p>공격성</p></div></a>
		<a href="/qna/qnaMain?keyword=%EC%A7%96%EC%9D%8C"><div id="category_detail" class="catchk"><p>짖음</p></div></a>
		<a href="/qna/qnaMain?keyword=%EA%B8%B0%EB%B3%B8%EC%98%88%EC%A0%88"><div id="category_detail" class="catchk"><p>기본예절</p></div></a>
		<a href="/qna/qnaMain?keyword=%EA%B8%B0%ED%83%80"><div id="category_detail" class="catchk"><p>기타</p></div></a>
		</div>
		
		</div>
		<div>
		<c:import url="./qnaList.jsp"></c:import>
		</div>
		<c:choose>
		<c:when test = "${not empty member}">
		<div style="position: fixed; bottom: 93px; right: 48px; z-index: 99999;">
			<a href="${pageContext.request.contextPath}/qna/qnaWriteView"><img src="../resources/images/qnaplus.png" width="100px;" height="100px;"></a>
		</div>
		</c:when>
		<c:when test="${not empty sitter}"/>	
		<c:otherwise>
		</c:otherwise>
		</c:choose>
		</div>
		
		
</body>
</html>